hw.module private @prim_flop(in %clk_i : !seq.clock, in %rst_ni : i1, in %d_i : i3, out q_o : i3) {
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %1 = comb.xor %rst_ni, %true : i1
    %init = seq.initial() {
      %c0_i3_14 = hw.constant 0 : i3
      seq.yield %c0_i3_14 : i3
    } : () -> !seq.immutable<i3>
    %2 = seq.compreg sym @x0 %d_i, %clk_i reset %1, %c0_i3 initial %init : i3
    hw.output %2 : i3
}
