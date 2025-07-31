module {
  hw.module @mbx_fsm(in %clk : !seq.clock, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o :
i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %true = hw.constant true
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %0 = verif.symbolic_value : i1
    %1 = verif.symbolic_value : i1
    %2 = verif.symbolic_value : i1
    %3 = verif.symbolic_value : i1
    %4 = comb.icmp eq %21, %c-3_i3 : i3
    %5 = comb.or %1, %2, %0, %3 : i1
    %6 = comb.xor %5, %true : i1
    %7 = comb.xor %1, %true : i1
    %8 = comb.xor %0, %true : i1
    %9 = comb.and %7, %8 : i1
    %10 = comb.and %9, %2 : i1
    %11 = comb.mux %10, %c-3_i3, %c0_i3 : i3
    %12 = comb.xor %10, %true : i1
    %13 = comb.and %8, %1 : i1
    %14 = comb.mux %13, %c-4_i3, %11 : i3
    %15 = comb.xor %13, %true : i1
    %16 = comb.xor %2, %true : i1
    %17 = comb.mux %3, %c0_i3, %c3_i3 : i3
    %18 = comb.and %16, %9 : i1
    %19 = comb.mux %18, %17, %14 : i3
    %20 = comb.xor %18, %true : i1
    // %0 = false, %19 = 3
    %21 = comb.mux %0, %c0_i3, %19 : i3
    // %21 = 3
    %22 = comb.icmp eq %21, %c3_i3 : i3
    verif.assume %22 : i1
    %23 = comb.and %8, %20, %15, %12 : i1
    hw.output %false, %false, %true, %false, %5, %6, %false, %4, %23 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
