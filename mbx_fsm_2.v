module mbx_fsm (
	clk_i,
	rst_ni,
	mbx_range_valid_i,
	hostif_abort_ack_i,
	mbx_error_set_i,
	sysif_control_abort_set_i,
	sys_read_all_i,
	writer_close_mbx_i,
	writer_last_word_written_i,
	writer_write_valid_i,
	mbx_empty_o,
	mbx_write_o,
	mbx_read_o,
	mbx_sys_abort_o,
	mbx_ready_update_o,
	mbx_ready_o,
	mbx_irq_ready_o,
	mbx_irq_abort_o,
	mbx_state_error_o
);
	reg _sv2v_0;
	parameter [0:0] CfgOmbx = 1'b1;
	input wire clk_i;
	input wire rst_ni;
	input wire mbx_range_valid_i;
	input wire hostif_abort_ack_i;
	input wire mbx_error_set_i;
	input wire sysif_control_abort_set_i;
	input wire sys_read_all_i;
	input wire writer_close_mbx_i;
	input wire writer_last_word_written_i;
	input wire writer_write_valid_i;
	output wire mbx_empty_o;
	output wire mbx_write_o;
	output wire mbx_read_o;
	output wire mbx_sys_abort_o;
	output wire mbx_ready_update_o;
	output wire mbx_ready_o;
	output wire mbx_irq_ready_o;
	output wire mbx_irq_abort_o;
	output reg mbx_state_error_o;
	wire [2:0] ctrl_state_q;
	reg [2:0] ctrl_state_d;
	reg [2:0] ctrl_state_logic;
	assign ctrl_state_q = ctrl_state_logic;
// module prim_flop (
//         clk_i,
//         rst_ni,
//         d_i,
//         q_o
// );
//         parameter signed [31:0] Width = 1;
//         parameter [Width - 1:0] ResetValue = 0;
//         input clk_i;
//         input rst_ni;
//         input [Width - 1:0] d_i;
//         output reg [Width - 1:0] q_o;
//         always @(posedge clk_i or negedge rst_ni)
//                 if (!rst_ni)
//                         q_o <= ResetValue;
//                 else
//                         q_o <= d_i;
// endmodule
        // input clk_i;
        // input rst_ni;
        // input [2:0] d_i;
        // output reg [2:0] q_o;
	// prim_flop #(
	// 	.Width(3),
	// 	.ResetValue(3'b000)
	// ) aff_ctrl_state_q(
	// 	.clk_i(clk_i),
	// 	.rst_ni(rst_ni),
	// 	.d_i(ctrl_state_d),
	// 	.q_o(ctrl_state_logic)
	// );
	wire mbx_idle;
	assign mbx_idle = ctrl_state_q == 3'b000;
	assign mbx_empty_o = mbx_idle & mbx_range_valid_i;
	assign mbx_write_o = ctrl_state_q == 3'b001;
	assign mbx_read_o = ctrl_state_q == 3'b011;
	assign mbx_sys_abort_o = ctrl_state_q == 3'b101;
	assign mbx_irq_abort_o = (ctrl_state_q != 3'b101) && (ctrl_state_d == 3'b101);
	assign mbx_irq_ready_o = (ctrl_state_q != 3'b011) && (ctrl_state_d == 3'b011);
	wire ombx_set_ready;
	wire ombx_clear_ready;
	assign ombx_set_ready = ((CfgOmbx & mbx_idle) & mbx_range_valid_i) & writer_close_mbx_i;
	assign ombx_clear_ready = CfgOmbx & (((mbx_error_set_i | sysif_control_abort_set_i) | hostif_abort_ack_i) | (mbx_read_o & sys_read_all_i));
	assign mbx_ready_update_o = CfgOmbx & (ombx_set_ready | ombx_clear_ready);
	assign mbx_ready_o = !ombx_clear_ready;
    always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
		  ctrl_state_logic <= 3'b000;
		else
		  ctrl_state_logic <= ctrl_state_d;



	always @(*) begin
		if (_sv2v_0)
			;
		ctrl_state_d = ctrl_state_q;
		mbx_state_error_o = 1'b0;
		if (hostif_abort_ack_i)
			ctrl_state_d = 3'b000;
		else
			(* full_case, parallel_case *)
			case (ctrl_state_q)
				3'b000: begin
					if (CfgOmbx) begin
						if (mbx_range_valid_i & writer_close_mbx_i)
							ctrl_state_d = 3'b011;
					end
					else if (mbx_range_valid_i & writer_write_valid_i)
						ctrl_state_d = 3'b001;
					if (mbx_error_set_i)
						ctrl_state_d = 3'b100;
					else if (sysif_control_abort_set_i)
						ctrl_state_d = 3'b101;
				end
				3'b001:
					if (mbx_error_set_i)
						ctrl_state_d = 3'b100;
					else if (sysif_control_abort_set_i)
						ctrl_state_d = 3'b101;
					else if (writer_close_mbx_i) begin
						if (writer_last_word_written_i)
							ctrl_state_d = 3'b011;
						else
							ctrl_state_d = 3'b010;
					end
				3'b010:
					if (mbx_error_set_i)
						ctrl_state_d = 3'b100;
					else if (sysif_control_abort_set_i)
						ctrl_state_d = 3'b101;
					else if (writer_last_word_written_i)
						ctrl_state_d = 3'b011;
				3'b011:
					if (mbx_error_set_i)
						ctrl_state_d = 3'b100;
					else if (sysif_control_abort_set_i)
						ctrl_state_d = 3'b101;
					else if (sys_read_all_i)
						ctrl_state_d = 3'b000;
				3'b100:
					if (sysif_control_abort_set_i)
						ctrl_state_d = 3'b101;
				3'b101:
					;
				default: begin
					ctrl_state_d = 3'b000;
					mbx_state_error_o = 1'b1;
				end
			endcase
	end
	initial _sv2v_0 = 0;
endmodule
