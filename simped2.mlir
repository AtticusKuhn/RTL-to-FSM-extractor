module {
  hw.module @mbx_fsm(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %false = hw.constant false
    %c0_i3 = hw.constant 0 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %true = hw.constant true
    %0 = comb.icmp eq %21, %c-3_i3 : i3
    %1 = comb.icmp eq %21, %c3_i3 : i3
    %2 = comb.and %mbx_range_valid_i, %writer_close_mbx_i {sv.namehint = "ombx_set_ready"} : i1
    %3 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %4 = comb.or %2, %3 : i1
    %5 = comb.xor %3, %true : i1
    %6 = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
    %7 = comb.xor %mbx_error_set_i, %true : i1
    %8 = comb.mux %7, %sysif_control_abort_set_i, %sys_read_all_i : i1
    %9 = comb.mux %7, %c-3_i3, %c0_i3 : i3
    %10 = comb.xor %6, %true : i1
    %11 = comb.or %mbx_error_set_i, %10 : i1
    %12 = comb.mux %11, %c0_i3, %c3_i3 : i3
    %13 = comb.xor %hostif_abort_ack_i, %true : i1
    %14 = comb.mux %8, %9, %12 : i3
    %15 = comb.and %7, %13 : i1
    %16 = comb.mux %15, %14, %c0_i3 : i3
    %17 = comb.xor %15, %true : i1
    %18 = comb.and %13, %mbx_error_set_i : i1
    %19 = comb.mux %18, %c-4_i3, %16 : i3
    %20 = comb.xor %18, %true : i1
    %21 = comb.mux %hostif_abort_ack_i, %c0_i3, %19 : i3
    %22 = comb.icmp eq %21, %c0_i3 : i3
    // verif.assume %22 : i1
    verif.assert %22 : i1
    %23 = comb.and %13, %20, %17 : i1
    hw.output %mbx_range_valid_i, %false, %false, %false, %4, %5, %1, %0, %23 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

