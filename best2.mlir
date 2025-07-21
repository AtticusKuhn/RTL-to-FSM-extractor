module {
  hw.module @mbx_fsm_auto(in %clk : !seq.clock, out mbx_write_o : i1) {
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %0 = seq.compreg %c0_i3, %clk reset %false, %c0_i3 : i3  
    %1 = comb.icmp eq %0, %c1_i3 : i3
    hw.output %1 : i1
  }
  hw.module @miter(in %clk : !seq.clock) {
    %auto_fsm.mbx_write_o = hw.instance "auto_fsm" @mbx_fsm_auto(clk: %clk: !seq.clock) -> (mbx_write_o: i1)
    verif.assert %auto_fsm.mbx_write_o : i1
    hw.output
  }
}
