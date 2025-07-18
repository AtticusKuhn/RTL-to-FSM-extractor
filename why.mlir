// expected-error @below {{modules with multiple clocks not yet supported}}
hw.module @works(in %clk0: !seq.clock, in %in: i32, out out: i32) {
  %1 = seq.compreg sym @x0 %in, %clk0 : i32
  %2 = hw.constant 1 : i1
  verif.assert %2 : i1
  hw.output %1 : i32
}

// -----

// hw.module @breaks(in %clk_i1: i1, in %in: i32, out out: i32) {
//   %clk = seq.to_clock %clk_i1
//   // expected-error @below {{only clocks directly given as block arguments are supported}}
//   // %1 = seq.compreg %in, %clk : i32
//   hw.output %1 : i32
// }
