module {
  hw.module @mbx_fsm_auto(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %0 = seq.initial() {
      %c0_i3_1 = hw.constant 0 : i3
      seq.yield %c0_i3_1 : i3
    } : () -> !seq.immutable<i3>
    %1 = seq.compreg sym @i_dont_know_what_does_this_do %c0_i3_0, %clk reset %false, %c0_i3 initial %0 : i3  
    %2 = comb.icmp eq %1, %c1_i3 : i3
    %c0_i3_0 = hw.constant 0 : i3
    hw.output %false, %2, %false, %false, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  hw.module @miter(in %clk : !seq.clock, in %d0 : i1, in %d1 : i1, in %d2 : i1, in %d3 : i1, in %d4 : i1, in %d5 : i1, in %d6 : i1, in %d7 : i1) {
    %false = hw.constant false
    %auto_fsm.mbx_empty_o, %auto_fsm.mbx_write_o, %auto_fsm.mbx_read_o, %auto_fsm.mbx_sys_abort_o, %auto_fsm.mbx_ready_update_o, %auto_fsm.mbx_ready_o, %auto_fsm.mbx_irq_ready_o, %auto_fsm.mbx_irq_abort_o, %auto_fsm.mbx_state_error_o = hw.instance "auto_fsm" @mbx_fsm_auto(clk: %clk: !seq.clock, rst_ni: %false: i1, mbx_range_valid_i: %d0: i1, hostif_abort_ack_i: %d1: i1, mbx_error_set_i: %d2: i1, sysif_control_abort_set_i: %d3: i1, sys_read_all_i: %d4: i1, writer_close_mbx_i: %d5: i1, writer_last_word_written_i: %d6: i1, writer_write_valid_i: %d7: i1) -> (mbx_empty_o: i1, mbx_write_o: i1, mbx_read_o: i1, mbx_sys_abort_o: i1, mbx_ready_update_o: i1, mbx_ready_o: i1, mbx_irq_ready_o: i1, mbx_irq_abort_o: i1, mbx_state_error_o: i1)
    %0 = comb.or %false, %false, %auto_fsm.mbx_write_o, %false, %false, %false, %false, %false, %false : i1
    verif.assert %0 : i1
    hw.output
  }
}
