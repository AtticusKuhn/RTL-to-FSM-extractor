module {
  llvm.func @printf(!llvm.ptr, ...)
  func.func @mbx_fsm_auto(%arg0: !smt.bv<1>, %arg1: !smt.bv<1>, %arg2: !smt.bv<1>, %arg3: !smt.bv<1>, %arg4: !smt.bv<1>, %arg5: !smt.bv<1>, %arg6: !smt.bv<1>, %arg7: !smt.bv<1>, %arg8: !smt.bv<1>, %arg9: !smt.bv<1>, %arg10: !smt.bv<3>) -> (!smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>) {
    %c1_bv3 = smt.bv.constant #smt.bv<1> : !smt.bv<3>
    %c0_bv3 = smt.bv.constant #smt.bv<0> : !smt.bv<3>
    %c0_bv1 = smt.bv.constant #smt.bv<0> : !smt.bv<1>
    %0 = smt.eq %arg10, %c1_bv3 : !smt.bv<3>
    %1 = builtin.unrealized_conversion_cast %0 : !smt.bool to i1
    %2 = builtin.unrealized_conversion_cast %1 : i1 to !smt.bv<1>
    return %c0_bv1, %2, %c0_bv1, %c0_bv1, %c0_bv1, %c0_bv1, %c0_bv1, %c0_bv1, %c0_bv1, %c0_bv3 : !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>
  }
  func.func @miter() {
    %0 = llvm.mlir.addressof @resultString_1 : !llvm.ptr
    %1 = llvm.mlir.addressof @resultString_0 : !llvm.ptr
    %2 = smt.solver() : () -> i1 {
      %c-1_bv1 = smt.bv.constant #smt.bv<-1> : !smt.bv<1>
      %true = arith.constant true
      %false = arith.constant false
      %c30_i32 = arith.constant 30 : i32
      %c1_i32 = arith.constant 1 : i32
      %c0_i32 = arith.constant 0 : i32
      %c0_bv3 = smt.bv.constant #smt.bv<0> : !smt.bv<3>
      %4 = func.call @bmc_init() : () -> !smt.bv<1>
      smt.push 1
      %5 = smt.declare_fun : !smt.bv<1>
      %6 = smt.declare_fun : !smt.bv<1>
      %7 = smt.declare_fun : !smt.bv<1>
      %8 = smt.declare_fun : !smt.bv<1>
      %9 = smt.declare_fun : !smt.bv<1>
      %10 = smt.declare_fun : !smt.bv<1>
      %11 = smt.declare_fun : !smt.bv<1>
      %12 = smt.declare_fun : !smt.bv<1>
      %13:11 = scf.for %arg0 = %c0_i32 to %c30_i32 step %c1_i32 iter_args(%arg1 = %4, %arg2 = %5, %arg3 = %6, %arg4 = %7, %arg5 = %8, %arg6 = %9, %arg7 = %10, %arg8 = %11, %arg9 = %12, %arg10 = %c0_bv3, %arg11 = %false) -> (!smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>, i1)  : i32 {
        smt.pop 1
        smt.push 1
        %15 = func.call @bmc_circuit(%arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10) : (!smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>) -> !smt.bv<3>
        %16 = smt.check sat {
          smt.yield %true : i1
        } unknown {
          smt.yield %true : i1
        } unsat {
          smt.yield %false : i1
        } -> i1
        %17 = arith.ori %16, %arg11 : i1
        %18 = func.call @bmc_loop(%arg1) : (!smt.bv<1>) -> !smt.bv<1>
        %19 = smt.declare_fun : !smt.bv<1>
        %20 = smt.declare_fun : !smt.bv<1>
        %21 = smt.declare_fun : !smt.bv<1>
        %22 = smt.declare_fun : !smt.bv<1>
        %23 = smt.declare_fun : !smt.bv<1>
        %24 = smt.declare_fun : !smt.bv<1>
        %25 = smt.declare_fun : !smt.bv<1>
        %26 = smt.declare_fun : !smt.bv<1>
        %27 = smt.bv.not %arg1 : !smt.bv<1>
        %28 = smt.bv.and %27, %18 : !smt.bv<1>
        %29 = smt.eq %28, %c-1_bv1 : !smt.bv<1>
        %30 = smt.ite %29, %15, %arg10 : !smt.bv<3>
        scf.yield %18, %19, %20, %21, %22, %23, %24, %25, %26, %30, %17 : !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>, i1
      }
      %14 = arith.xori %13#10, %true : i1
      smt.yield %14 : i1
    }
    %3 = llvm.select %2, %1, %0 : i1, !llvm.ptr
    llvm.call @printf(%3) vararg(!llvm.func<void (ptr, ...)>) : (!llvm.ptr) -> ()
    return
  }
  llvm.mlir.global private constant @resultString_0("Bound reached with no violations!\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global private constant @resultString_1("Assertion can be violated!\0A\00") {addr_space = 0 : i32}
  func.func @bmc_init() -> !smt.bv<1> {
    %c0_bv1 = smt.bv.constant #smt.bv<0> : !smt.bv<1>
    return %c0_bv1 : !smt.bv<1>
  }
  func.func @bmc_loop(%arg0: !smt.bv<1>) -> !smt.bv<1> {
    %c-1_bv1 = smt.bv.constant #smt.bv<-1> : !smt.bv<1>
    %0 = smt.bv.xor %arg0, %c-1_bv1 : !smt.bv<1>
    return %0 : !smt.bv<1>
  }
  func.func @bmc_circuit(%arg0: !smt.bv<1>, %arg1: !smt.bv<1>, %arg2: !smt.bv<1>, %arg3: !smt.bv<1>, %arg4: !smt.bv<1>, %arg5: !smt.bv<1>, %arg6: !smt.bv<1>, %arg7: !smt.bv<1>, %arg8: !smt.bv<1>, %arg9: !smt.bv<3>) -> !smt.bv<3> {
    %c-1_bv1 = smt.bv.constant #smt.bv<-1> : !smt.bv<1>
    %c0_bv1 = smt.bv.constant #smt.bv<0> : !smt.bv<1>
    %0:10 = call @mbx_fsm_auto(%arg0, %c0_bv1, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9) : (!smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>) -> (!smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<1>, !smt.bv<3>)
    %1 = smt.bv.or %0#1, %c0_bv1 : !smt.bv<1>
    %2 = smt.bv.or %1, %c0_bv1 : !smt.bv<1>
    %3 = smt.bv.or %2, %c0_bv1 : !smt.bv<1>
    %4 = smt.bv.or %3, %c0_bv1 : !smt.bv<1>
    %5 = smt.bv.or %4, %c0_bv1 : !smt.bv<1>
    %6 = smt.bv.or %5, %c0_bv1 : !smt.bv<1>
    %7 = smt.bv.or %6, %c0_bv1 : !smt.bv<1>
    %8 = smt.bv.or %7, %c0_bv1 : !smt.bv<1>
    %9 = smt.eq %8, %c-1_bv1 : !smt.bv<1>
    %10 = smt.not %9
    smt.assert %10
    return %0#9 : !smt.bv<3>
  }
}
