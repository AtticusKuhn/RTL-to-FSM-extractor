module {
  hw.module @mbx_fsm_auto(in %clk : !seq.clock,  out mbx_write_o : i1) {
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %1 = seq.compreg  %c0_i3_0, %clk reset %false, %c0_i3 initial : i3
    %2 = comb.icmp eq %1, %c1_i3 : i3
    %c0_i3_0 = hw.constant 0 : i3
    hw.output %2 : i1
  }
  hw.module @miter(in %clk : !seq.clock) {
    %false = hw.constant false
    %auto_fsm.mbx_write_o  = hw.instance "auto_fsm" @mbx_fsm_auto(clk: %clk: !seq.clock) -> (mbx_write_o: i1)
    %0 = comb.or %false, %auto_fsm.mbx_write_o : i1
    verif.assert %0 : i1
    hw.output
  }
}
