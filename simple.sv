// A simple Mealy FSM to detect the sequence '101'
module sequence_detector (
    input  wire clk,
    input  wire reset,
    input  wire data_in,
    output wire sequence_detected
);

    // 1. State Definitions
    // Using `localparam` for state encoding makes the code readable and maintainable.
    // We need 3 states, so we require 2 bits to represent them.
    localparam [1:0] IDLE   = 2'b00;
    localparam [1:0] GOT_1  = 2'b01;
    localparam [1:0] GOT_10 = 2'b10;
    // Note: 2'b11 is an unused state.

    // 2. State Variables
    // `current_state` holds the state of the FSM at the present moment.
    // `next_state` is the temporary variable for where we will go on the next clock edge.
    reg [1:0] current_state, next_state;

    // PROCESS 1: The State Register (Synchronous Memory)
    // This is the heart of the FSM's memory. It updates the state only on the
    // positive edge of the clock, making the design synchronous and predictable.
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE; // Asynchronous reset to a known state
        end else begin
            current_state <= next_state; // On a clock edge, commit to the next state
        end
    end

    // PROCESS 2: The Next-State Logic (Combinational Brain)
    // This block is purely combinational. It looks at the current situation
    // (`current_state` and `data_in`) and decides the future (`next_state`).
    // A `case` statement is the perfect tool for this.
    always @(*) begin
        // By default, we assume the state doesn't change. This helps prevent
        // unintentional latches if a condition is missed.
        next_state = current_state;

        case (current_state)
            IDLE: begin
                if (data_in == 1'b1) begin
                    next_state = GOT_1;
                end else begin
                    next_state = IDLE;
                end
            end

            GOT_1: begin
                if (data_in == 1'b0) begin
                    next_state = GOT_10;
                end else begin
                    // We received another '1'. This could be the start of a new
                    // sequence, so we stay in GOT_1.
                    next_state = GOT_1;
                end
            end

            GOT_10: begin
                if (data_in == 1'b1) begin
                    // SUCCESS! We found '101'.
                    // Now, where to go? If the input is a '1', it could be the start of
                    // the *next* sequence. So we go to GOT_1. This handles
                    // overlapping sequences like '10101'.
                    next_state = GOT_1;
                end else begin
                    // The sequence broke. Go back to idle.
                    next_state = IDLE;
                end
            end

            default: begin
                // For any unused or illegal states, safely return to IDLE.
                next_state = IDLE;
            end
        endcase
    end

    // PROCESS 3: The Output Logic (Combinational Voice)
    // For our Mealy machine, the output depends on the current state AND the input.
    // The sequence is detected only when we are in state GOT_10 and the input is 1.
    // An `assign` statement is the most concise way to express this.
    assign sequence_detected = (current_state == GOT_10) && (data_in == 1'b1);

endmodule
