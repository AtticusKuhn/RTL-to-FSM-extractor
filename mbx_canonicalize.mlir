module {
  hw.module @mbx_fsm(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %0 = comb.icmp eq %22, %c-3_i3 : i3
    %1 = comb.icmp eq %22, %c3_i3 : i3
    %2 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %3 = comb.xor %2, %true : i1
    %4 = comb.xor %mbx_error_set_i, %true : i1
    %5 = comb.xor %hostif_abort_ack_i, %true : i1
    %6 = comb.concat %c1_i2, %writer_last_word_written_i : i2, i1
    %7 = comb.and %4, %5 : i1
    %8 = comb.xor %sysif_control_abort_set_i, %true : i1
    %9 = comb.and %8, %7 : i1
    %10 = comb.and %writer_close_mbx_i, %9 : i1
    %11 = comb.mux %10, %6, %c0_i3 : i3
    %12 = comb.xor %10, %true : i1
    %13 = comb.and %7, %sysif_control_abort_set_i : i1
    %14 = comb.mux %13, %c-3_i3, %11 : i3
    %15 = comb.xor %13, %true : i1
    %16 = comb.and %5, %mbx_error_set_i : i1
    %17 = comb.mux %16, %c-4_i3, %14 : i3
    %18 = comb.xor %16, %true : i1
    %19 = comb.mux %hostif_abort_ack_i, %c0_i3, %17 : i3
    %20 = comb.xor %writer_close_mbx_i, %true : i1
    %21 = comb.and %9, %20 : i1
    %22 = comb.mux %21, %c1_i3, %19 : i3
    %23 = comb.xor %21, %true : i1
    %24 = comb.and %23, %5, %18, %15, %12 : i1
    hw.output %false, %true, %false, %false, %2, %3, %1, %0, %24 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

