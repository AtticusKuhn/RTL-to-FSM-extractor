module {
  hw.module @mbx_fsm(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    // sv: mbx_fsm.sv:30-35
    // State encodings: MbxIdle=0, MbxWrite=1, MbxWaitFinalWord=2, MbxRead=3, MbxError=4(100b), MbxSysAbortHost=5(101b)
    // Note: Signed arithmetic in MLIR represents 4 as -4 (3'b100) and 5 as -3 (3'b101).
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %MbxWaitFinalWord = hw.constant 2 : i3
    %MbxError = hw.constant -4 : i3
    %MbxSysAbortHost = hw.constant -3 : i3
    %MbxRead = hw.constant 3 : i3
    %MbxWrite = hw.constant 1 : i3
    %MbxIdle = hw.constant 0 : i3

    // sv: mbx_fsm.sv:41-48
    // State register for the mailbox finite-state machine.
    %ctrl_state_q = hw.instance "aff_ctrl_state_q" @prim_flop(clk: %clk: !seq.clock, rst_ni: %rst_ni: i1, d_i: %ctrl_state_d: i3) -> (q_o: i3) {sv.namehint = "ctrl_state_logic"}

    // sv: mbx_fsm.sv:57
    // assign mbx_idle = (ctrl_state_q == MbxIdle);
    %is_mbx_idle = comb.icmp eq %ctrl_state_q, %MbxIdle {sv.namehint = "mbx_idle"} : i3

    // sv: mbx_fsm.sv:58
    // assign mbx_empty_o = mbx_idle & mbx_range_valid_i;
    %mbx_empty_o_val = comb.and %is_mbx_idle, %mbx_range_valid_i : i1

    // sv: mbx_fsm.sv:59
    // assign mbx_write_o = (ctrl_state_q == MbxWrite);
    %mbx_write_o_val = comb.icmp eq %ctrl_state_q, %MbxWrite : i3

    // sv: mbx_fsm.sv:60
    // assign mbx_read_o = (ctrl_state_q == MbxRead);
    %mbx_read_o_val = comb.icmp eq %ctrl_state_q, %MbxRead : i3

    // sv: mbx_fsm.sv:61
    // assign mbx_sys_abort_o = (ctrl_state_q == MbxSysAbortHost);
    %mbx_sys_abort_o_val = comb.icmp eq %ctrl_state_q, %MbxSysAbortHost : i3

    // sv: mbx_fsm.sv:63
    // assign mbx_irq_abort_o = (ctrl_state_q != MbxSysAbortHost) && (ctrl_state_d == MbxSysAbortHost);
    %not_in_sys_abort = comb.icmp ne %ctrl_state_q, %MbxSysAbortHost : i3
    %d_is_sys_abort = comb.icmp eq %ctrl_state_d, %MbxSysAbortHost : i3
    %mbx_irq_abort_o_val = comb.and %not_in_sys_abort, %d_is_sys_abort : i1

    // sv: mbx_fsm.sv:65
    // assign mbx_irq_ready_o = (ctrl_state_q != MbxRead) && (ctrl_state_d == MbxRead);
    %not_in_read = comb.icmp ne %ctrl_state_q, %MbxRead : i3
    %d_is_read = comb.icmp eq %ctrl_state_d, %MbxRead : i3
    %mbx_irq_ready_o_val = comb.and %not_in_read, %d_is_read : i1

    // sv: mbx_fsm.sv:68-71
    // Logic specialized for CfgOmbx = 1
    // assign ombx_set_ready = mbx_idle & mbx_range_valid_i & writer_close_mbx_i;
    %ombx_set_ready = comb.and %is_mbx_idle, %mbx_range_valid_i, %writer_close_mbx_i {sv.namehint = "ombx_set_ready"} : i1

    // sv: mbx_fsm.sv:75-78
    // Logic specialized for CfgOmbx = 1
    // assign ombx_clear_ready = mbx_error_set_i | sysif_control_abort_set_i | hostif_abort_ack_i | (mbx_read_o & sys_read_all_i);
    %read_and_all_read = comb.and %mbx_read_o_val, %sys_read_all_i : i1
    %ombx_clear_ready = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %read_and_all_read : i1

    // sv: mbx_fsm.sv:80
    // Logic specialized for CfgOmbx = 1
    // assign mbx_ready_update_o = ombx_set_ready | ombx_clear_ready;
    %mbx_ready_update_o_val = comb.or %ombx_set_ready, %ombx_clear_ready : i1

    // sv: mbx_fsm.sv:81
    // assign mbx_ready_o = !ombx_clear_ready;
    %mbx_ready_o_val = comb.xor %ombx_clear_ready, %true : i1

    // This block of combinational logic implements the state transition logic from the `always_comb`
    // block in `mbx_fsm.sv:83-162`. The `unique case` statement has been synthesized and flattened
    // into a large tree of multiplexers and other logic gates. The structure prioritizes
    // `hostif_abort_ack_i` first, followed by conditions within each state.
    // The logic is heavily optimized and does not map one-to-one with the source code's structure,
    // but the resulting behavior for calculating the next state (`ctrl_state_d`) and the state
    // error flag (`mbx_state_error_o`) is identical.

    // sv: mbx_fsm.sv:94 (and others)
    // Conditions for checking the current state.
    %is_idle_state = comb.icmp ceq %ctrl_state_q, %MbxIdle : i3
    %idle_range_valid_and_close = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
    %is_write_state = comb.icmp ceq %ctrl_state_q, %MbxWrite : i3
    %is_wait_state = comb.icmp ceq %ctrl_state_q, %MbxWaitFinalWord : i3
    %is_read_state = comb.icmp ceq %ctrl_state_q, %MbxRead : i3

    // sv: mbx_fsm.sv:128, 149
    // Intermediate logic for state transitions out of MbxWaitFinalWord and MbxRead.
    %wait_or_read_transition_cond = comb.mux %is_wait_state, %writer_last_word_written_i, %sys_read_all_i : i1
    %wait_or_read_next_state = comb.mux %is_wait_state, %MbxRead, %MbxIdle : i3

    // sv: mbx_fsm.sv:106, 118, 129, 145, 155
    // Logic for handling error and system abort conditions, which have high priority.
    %is_error_state = comb.icmp ceq %ctrl_state_q, %MbxError : i3
    %no_error_set = comb.xor %mbx_error_set_i, %true : i1
    %cond_idle_and_no_error = comb.and %is_idle_state, %no_error_set : i1
    %not_idle_state = comb.xor %is_idle_state, %true : i1
    %not_write_state = comb.xor %is_write_state, %true : i1
    %not_wait_state = comb.xor %is_wait_state, %true : i1
    %not_read_state = comb.xor %is_read_state, %true : i1
    %is_default_state_part1 = comb.and %not_read_state, %not_wait_state, %not_write_state, %not_idle_state, %is_error_state : i1
    %default_or_idle_no_error = comb.or %is_default_state_part1, %cond_idle_and_no_error : i1
    %mux_on_default_or_idle = comb.mux %default_or_idle_no_error, %sysif_control_abort_set_i, %wait_or_read_transition_cond : i1
    %next_state_on_default_or_idle = comb.mux %default_or_idle_no_error, %MbxSysAbortHost, %wait_or_read_next_state : i3
    %not_cond_idle_and_no_error = comb.xor %cond_idle_and_no_error, %true : i1
    %not_idle_range_close = comb.xor %idle_range_valid_and_close, %true : i1
    %idle_transition_logic_cond = comb.or %is_default_state_part1, %not_cond_idle_and_no_error, %not_idle_range_close : i1
    %idle_transition_logic_state = comb.mux %idle_transition_logic_cond, %ctrl_state_q, %MbxRead : i3

    // sv: mbx_fsm.sv:90-162 (continued synthesis)
    // Further combination of state transition logic.
    %is_sys_abort_state = comb.icmp ceq %ctrl_state_q, %MbxSysAbortHost : i3
    %next_state_if_sys_abort = comb.mux %is_sys_abort_state, %ctrl_state_q, %MbxIdle : i3
    %not_sys_abort_state = comb.xor %is_sys_abort_state, %true : i1
    %no_host_abort_ack = comb.xor %hostif_abort_ack_i, %true : i1
    %no_ack_and_not_idle = comb.and %not_idle_state, %no_host_abort_ack : i1
    %no_ack_and_not_idle_write = comb.and %not_write_state, %no_ack_and_not_idle : i1
    %no_ack_and_not_idle_write_wait = comb.and %not_wait_state, %no_ack_and_not_idle_write : i1
    %is_read_and_valid_path = comb.and %is_read_state, %no_ack_and_not_idle_write_wait : i1
    %is_wait_and_valid_path = comb.and %is_wait_state, %no_ack_and_not_idle_write : i1
    %is_read_or_wait_path = comb.or %is_read_and_valid_path, %is_wait_and_valid_path : i1
    %no_error_and_read_or_wait = comb.and %no_error_set, %is_read_or_wait_path : i1
    %sys_abort_in_read_or_wait = comb.and %no_error_and_read_or_wait, %sysif_control_abort_set_i : i1
    %next_state_on_sys_abort = comb.mux %sys_abort_in_read_or_wait, %MbxSysAbortHost, %next_state_if_sys_abort : i3
    %not_sys_abort_in_read_or_wait = comb.xor %sys_abort_in_read_or_wait, %true : i1
    %error_in_read_or_wait = comb.and %is_read_or_wait_path, %mbx_error_set_i : i1
    %next_state_on_error = comb.mux %error_in_read_or_wait, %MbxError, %next_state_on_sys_abort : i3
    %not_error_in_read_or_wait = comb.xor %error_in_read_or_wait, %true : i1

    // sv: mbx_fsm.sv:117-124 (MbxWrite state logic)
    %next_state_write_wait = comb.concat %c1_i2, %writer_last_word_written_i : i2, i1
    %is_write_and_no_ack = comb.and %is_write_state, %no_ack_and_not_idle : i1
    %no_error_and_write = comb.and %no_error_set, %is_write_and_no_ack : i1
    %no_sys_abort = comb.xor %sysif_control_abort_set_i, %true : i1
    %cond_no_abort_no_error_write = comb.and %no_sys_abort, %no_error_and_write : i1
    %cond_write_close = comb.and %writer_close_mbx_i, %cond_no_abort_no_error_write : i1
    %next_state_after_write = comb.mux %cond_write_close, %next_state_write_wait, %next_state_on_error : i3
    %not_cond_write_close = comb.xor %cond_write_close, %true : i1
    %sys_abort_in_write = comb.and %cond_no_abort_no_error_write, %sysif_control_abort_set_i : i1
    %next_state_on_sys_abort_write = comb.mux %sys_abort_in_write, %MbxSysAbortHost, %next_state_after_write : i3
    %not_sys_abort_in_write = comb.xor %sys_abort_in_write, %true : i1
    %error_in_write = comb.and %is_write_and_no_ack, %mbx_error_set_i : i1
    %next_state_on_error_write = comb.mux %error_in_write, %MbxError, %next_state_on_sys_abort_write : i3
    %not_error_in_write = comb.xor %error_in_write, %true : i1

    // sv: mbx_fsm.sv:94-110 (MbxIdle state logic and others)
    %mux_logic1 = comb.mux %mux_on_default_or_idle, %next_state_on_default_or_idle, %idle_transition_logic_state : i3
    %is_idle_and_no_ack = comb.and %is_idle_state, %no_host_abort_ack : i1
    %no_sys_abort_and_path = comb.and %no_sys_abort, %no_error_and_read_or_wait : i1
    %no_error_and_idle = comb.and %no_error_set, %is_idle_and_no_ack : i1
    %is_default_state_part2 = comb.and %is_error_state, %not_read_state, %no_ack_and_not_idle_write_wait : i1
    %combined_cond1 = comb.or %no_sys_abort_and_path, %no_error_and_idle, %is_default_state_part2 : i1
    %mux_logic2 = comb.mux %combined_cond1, %mux_logic1, %next_state_on_error_write : i3
    %not_combined_cond1 = comb.xor %combined_cond1, %true : i1
    %error_in_idle = comb.and %is_idle_and_no_ack, %mbx_error_set_i : i1
    %next_state_on_error_idle = comb.mux %error_in_idle, %MbxError, %mux_logic2 : i3
    %not_error_in_idle = comb.xor %error_in_idle, %true : i1

    // sv: mbx_fsm.sv:90-92
    // Top-level priority mux for `hostif_abort_ack_i`, which resets state to Idle.
    %case_logic_d = comb.mux %hostif_abort_ack_i, %MbxIdle, %next_state_on_error_idle : i3

    // sv: mbx_fsm.sv:84, 120
    // This logic handles the case where the FSM remains in its current state.
    // It specifically isolates the condition for staying in MbxWrite when no other transition is taken.
    %not_writer_close = comb.xor %writer_close_mbx_i, %true : i1
    %stay_in_write_state_cond = comb.and %cond_no_abort_no_error_write, %not_writer_close : i1
    %ctrl_state_d = comb.mux %stay_in_write_state_cond, %ctrl_state_q, %case_logic_d : i3

    // sv: mbx_fsm.sv:160-161
    // `mbx_state_error_o` is asserted if the FSM enters an unreachable `default` state.
    // This logic checks if none of the valid transition conditions were met for any known state.
    %not_stay_in_write_state_cond = comb.xor %stay_in_write_state_cond, %true : i1
    %mbx_state_error_o_val = comb.and %not_stay_in_write_state_cond, %no_host_abort_ack, %not_error_in_idle, %not_combined_cond1, %not_error_in_write, %not_sys_abort_in_write, %not_cond_write_close, %not_error_in_read_or_wait, %not_sys_abort_in_read_or_wait, %not_sys_abort_state : i1

    // sv: mbx_fsm.sv:58-65, 80-81, 161
    // Final output assignments.
    hw.output %mbx_empty_o_val, %mbx_write_o_val, %mbx_read_o_val, %mbx_sys_abort_o_val, %mbx_ready_update_o_val, %mbx_ready_o_val, %mbx_irq_ready_o_val, %mbx_irq_abort_o_val, %mbx_state_error_o_val : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  hw.module private @prim_flop(in %clk : !seq.clock, in %rst_ni : i1, in %d_i : i3, out q_o : i3) {
    %true = hw.constant true
    %MbxIdle = hw.constant 0 : i3
    %rst_val = comb.xor %rst_ni, %true : i1
    %q_o = seq.compreg %d_i, %clk reset %rst_val, %MbxIdle : i3
    hw.output %q_o : i3
  }
}
