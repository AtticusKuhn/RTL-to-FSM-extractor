module {
  hw.module @wrong(in %arg1 : i1, in %arg2 : i1, in %arg3 : i1, in %arg4 : i1, in %arg5 : i1, in %arg6 : i1, out out1 : i1) {
    %c0_i2 = hw.constant 0 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c-2_i3 = hw.constant -2 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
    %c1_i3 = hw.constant 1 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c2_i3 = hw.constant 2 : i3
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %true = hw.constant true
    %0 = comb.and %arg1, %arg6 : i1
    %1 = comb.xor %arg3, %true : i1
    %2 = comb.mux %1, %arg4, %arg5 : i1
    %3 = comb.mux %1, %c-3_i3, %c0_i3 : i3
    %4 = comb.xor %0, %true : i1
    %5 = comb.or %arg3, %4 : i1
    %6 = comb.mux %5, %c0_i3, %c3_i3 : i3
    %7 = comb.xor %arg2, %true : i1
    %8 = comb.mux %2, %3, %6 : i3
    %9 = comb.or %arg3, %arg2 : i1
    %10 = comb.mux %9, %c0_i3, %8 : i3
    %11 = comb.and %7, %arg3 : i1
    %12 = comb.mux %11, %c-4_i3, %10 : i3
    %13 = comb.mux %arg2, %c0_i3, %12 : i3
    %14 = comb.icmp eq %13, %c1_i3 : i3
    hw.output %14 : i1
  }
  hw.module @miter(in %arg1 : i1, in %arg2 : i1, in %arg3 : i1, in %arg4 : i1, in %arg5 : i1, in %arg6 : i1) {
    %wrong.out1 = hw.instance "wrong" @wrong(arg1: %arg1: i1, arg2: %arg2: i1, arg3: %arg3: i1, arg4: %arg4: i1, arg5: %arg5: i1, arg6: %arg6: i1) -> (out1: i1)
    %true = hw.constant true
    %0 = comb.xor %wrong.out1, %true : i1
    verif.assert %0 : i1
    hw.output
  }
}

