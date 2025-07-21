module {
  fsm.machine @mbx_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "MbxIdle"} {
    %false = hw.constant false
    %true = hw.constant true
    %true_0 = hw.constant true
    fsm.state @MbxIdle output {
      %0 = comb.and %arg0, %true : i1
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %1 = comb.and %true_0, %arg0, %arg5 : i1
      %2 = comb.or %arg2, %arg3, %arg1 : i1
      %3 = comb.and %true_0, %2 : i1
      %4 = comb.or %1, %3 : i1
      %5 = comb.and %true_0, %4 : i1
      %6 = comb.xor %3, %true : i1
      %7 = comb.xor %arg1, %true : i1
      %8 = comb.xor %arg2, %true : i1
      %9 = comb.xor %arg3, %true : i1
      %10 = comb.and %7, %8, %9 : i1
      %11 = comb.and %10, %true_0, %arg0, %arg5 : i1
      %12 = comb.and %true, %11 : i1
      %13 = comb.and %7, %8, %arg3 : i1
      %14 = comb.and %true, %13 : i1
      %15 = comb.and %true, %false : i1
      fsm.output %0, %false_1, %false_2, %false_3, %5, %6, %12, %14, %15 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %arg1
      }
      fsm.transition @MbxError guard {
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        fsm.return %1
      }
      fsm.transition @MbxSysAbortHost guard {
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %0, %1, %arg3 : i1
        fsm.return %2
      }
      fsm.transition @MbxRead guard {
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %2 : i1
        %4 = comb.and %3, %true_0, %arg0, %arg5 : i1
        fsm.return %4
      }
      fsm.transition @MbxWrite guard {
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.xor %true_0, %true : i1
        %4 = comb.and %0, %1, %2 : i1
        %5 = comb.and %4, %3, %arg0, %arg7 : i1
        fsm.return %5
      }
      fsm.transition @MbxIdle guard {
        fsm.return %true
      }
    }
    fsm.state @MbxWrite output {
      %0 = comb.and %true, %true : i1
      %1 = comb.or %arg2, %arg3, %arg1 : i1
      %2 = comb.and %true_0, %1 : i1
      %3 = comb.and %true_0, %2 : i1
      %4 = comb.xor %2, %true : i1
      %5 = comb.xor %arg1, %true : i1
      %6 = comb.xor %arg2, %true : i1
      %7 = comb.xor %arg3, %true : i1
      %8 = comb.and %5, %6, %7 : i1
      %9 = comb.and %8, %arg5, %arg6 : i1
      %10 = comb.and %true, %9 : i1
      %11 = comb.and %5, %6, %arg3 : i1
      %12 = comb.and %true, %11 : i1
      fsm.output %false, %0, %false, %false, %3, %4, %10, %12, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        fsm.return %arg1
      }
      fsm.transition @MbxError guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %arg2 : i1
        fsm.return %3
      }
      fsm.transition @MbxSysAbortHost guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %arg3 : i1
        fsm.return %3
      }
      fsm.transition @MbxRead guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %2 : i1
        %4 = comb.and %3, %arg5, %arg6 : i1
        fsm.return %4
      }
      fsm.transition @MbxWaitFinalWord guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.xor %arg6, %true : i1
        %4 = comb.and %0, %1, %2 : i1
        %5 = comb.and %4, %arg5, %3 : i1
        fsm.return %5
      }
      fsm.transition @MbxWrite guard {
        fsm.return %true
      }
    }
    fsm.state @MbxWaitFinalWord output {
      %0 = comb.or %arg2, %arg3, %arg1 : i1
      %1 = comb.and %true_0, %0 : i1
      %2 = comb.and %true_0, %1 : i1
      %3 = comb.xor %1, %true : i1
      %4 = comb.xor %arg1, %true : i1
      %5 = comb.xor %arg2, %true : i1
      %6 = comb.xor %arg3, %true : i1
      %7 = comb.and %4, %5, %6 : i1
      %8 = comb.and %7, %arg6 : i1
      %9 = comb.and %true, %8 : i1
      %10 = comb.and %4, %5, %arg3 : i1
      %11 = comb.and %true, %10 : i1
      fsm.output %false, %false, %false, %false, %2, %3, %9, %11, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %arg1
      }
      fsm.transition @MbxError guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %arg2 : i1
        fsm.return %3
      }
      fsm.transition @MbxSysAbortHost guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %arg3 : i1
        fsm.return %3
      }
      fsm.transition @MbxRead guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %2 : i1
        %4 = comb.and %3, %arg6 : i1
        fsm.return %4
      }
      fsm.transition @MbxWaitFinalWord guard {
        fsm.return %true
      }
    }
    fsm.state @MbxRead output {
      %0 = comb.and %true, %true : i1
      %1 = comb.and %0, %arg4 : i1
      %2 = comb.or %arg2, %arg3, %arg1, %1 : i1
      %3 = comb.and %true_0, %2 : i1
      %4 = comb.and %true_0, %3 : i1
      %5 = comb.xor %3, %true : i1
      %6 = comb.xor %arg1, %true : i1
      %7 = comb.xor %arg2, %true : i1
      %8 = comb.and %6, %7, %arg3 : i1
      %9 = comb.and %true, %8 : i1
      fsm.output %false, %false, %0, %false, %4, %5, %false, %9, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %arg1
      }
      fsm.transition @MbxError guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %arg2 : i1
        fsm.return %3
      }
      fsm.transition @MbxSysAbortHost guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %arg3 : i1
        fsm.return %3
      }
      fsm.transition @MbxIdle guard {
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.xor %arg2, %true : i1
      %2 = comb.xor %arg3, %true : i1
        %3 = comb.and %0, %1, %2 : i1
        %4 = comb.and %3, %arg4 : i1
        fsm.return %4
      }
      fsm.transition @MbxRead guard {
        fsm.return %true
      }
    }
    fsm.state @MbxError output {
      %0 = comb.or %arg2, %arg3, %arg1 : i1
      %1 = comb.and %true_0, %0 : i1
      %2 = comb.and %true_0, %1 : i1
      %3 = comb.xor %1, %true : i1
      %4 = comb.xor %arg1, %true : i1
      %5 = comb.and %4, %arg3 : i1
      %6 = comb.and %true, %5 : i1
      fsm.output %false, %false, %false, %false, %2, %3, %false, %6, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %arg1
      }
      fsm.transition @MbxSysAbortHost guard {
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg3 : i1
        fsm.return %1
      }
      fsm.transition @MbxError guard {
        fsm.return %true
      }
    }
    fsm.state @MbxSysAbortHost output {
      %0 = comb.and %true, %true : i1
      %1 = comb.or %arg2, %arg3, %arg1 : i1
      %2 = comb.and %true_0, %1 : i1
      %3 = comb.and %true_0, %2 : i1
      %4 = comb.xor %2, %true : i1
      fsm.output %false, %false, %false, %0, %3, %4, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %arg1
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %true
      }
    }
  }
}

