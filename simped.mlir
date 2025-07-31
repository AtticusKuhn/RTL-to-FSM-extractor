module {
  hw.module @mbx_fsm(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %true = hw.constant true
    %0 = comb.icmp eq %17, %c-3_i3 : i3
    %1 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %sys_read_all_i : i1
    %2 = comb.xor %1, %true : i1
    %3 = comb.xor %mbx_error_set_i, %true : i1
    %4 = comb.xor %hostif_abort_ack_i, %true : i1
    %5 = comb.and %3, %4 : i1
    %6 = comb.and %5, %sysif_control_abort_set_i : i1
    %7 = comb.mux %6, %c-3_i3, %c0_i3 : i3
    %8 = comb.xor %6, %true : i1
    %9 = comb.and %4, %mbx_error_set_i : i1
    %10 = comb.mux %9, %c-4_i3, %7 : i3
    %11 = comb.xor %9, %true : i1
    %12 = comb.xor %sysif_control_abort_set_i, %true : i1
    %13 = comb.mux %sys_read_all_i, %c0_i3, %c3_i3 : i3
    %14 = comb.and %12, %5 : i1
    %15 = comb.mux %14, %13, %10 : i3
    %16 = comb.xor %14, %true : i1
    %17 = comb.mux %hostif_abort_ack_i, %c0_i3, %15 : i3
    %18 = comb.icmp eq %17, %c3_i3 : i3
    verif.assume %18 : i1
    %19 = comb.and %4, %16, %11, %8 : i1
    hw.output %false, %false, %true, %false, %1, %2, %false, %0, %19 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  hw.module private @prim_flop(in %clk : !seq.clock, in %rst_ni : i1, in %d_i : i3, out q_o : i3) {
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %0 = comb.xor %rst_ni, %true : i1
    %1 = seq.initial() {
      %c0_i3_0 = hw.constant 0 : i3
      seq.yield %c0_i3_0 : i3
    } : () -> !seq.immutable<i3>
    %q_o = seq.compreg %d_i, %clk reset %0, %c0_i3 initial %1 : i3  
    hw.output %q_o : i3
  }
}

