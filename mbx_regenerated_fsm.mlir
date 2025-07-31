module {
  %false = hw.constant false
  %true = hw.constant true
  fsm.machine @mbx_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    fsm.state @state_5 output {
      %0 = comb.or %arg3, %arg4, %arg2 : i1
      %1 = comb.xor %0, %true : i1
      fsm.output %false, %false, %false, %true, %0, %1, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %0 = comb.xor %arg2, %true : i1
        fsm.return %0
      }
      fsm.transition @state_0 guard {
        fsm.return %arg2
      }
    }
    fsm.state @state_4 output {
      %0 = comb.or %arg3, %arg4, %arg2 : i1
      %1 = comb.xor %0, %true : i1
      %2 = comb.xor %arg2, %true : i1
      %3 = comb.and %2, %2, %arg4 : i1
      fsm.output %false, %false, %false, %false, %0, %1, %false, %3, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %0, %0, %arg4 : i1
        fsm.return %1
      }
      fsm.transition @state_4 guard {
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.xor %arg4, %true : i1
        %2 = comb.and %0, %0, %1 : i1
        fsm.return %2
      }
      fsm.transition @state_0 guard {
        fsm.return %arg2
      }
    }
    fsm.state @state_3 output {
      %0 = comb.or %arg3, %arg4, %arg2, %arg5 : i1
      %1 = comb.xor %0, %true : i1
      %2 = comb.xor %arg3, %true : i1
      %3 = comb.xor %arg2, %true : i1
      %4 = comb.and %2, %3 : i1
      %5 = comb.and %4, %arg4 : i1
      %6 = comb.xor %5, %true : i1
      %7 = comb.and %3, %arg3 : i1
      %8 = comb.xor %7, %true : i1
      %9 = comb.xor %arg4, %true : i1
      %10 = comb.and %9, %4 : i1
      %11 = comb.xor %10, %true : i1
      %12 = comb.and %3, %11, %8, %6 : i1
      %13 = comb.and %3, %11, %8, %5 : i1
      fsm.output %false, %false, %true, %false, %0, %1, %false, %13, %12 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.and %1, %arg3 : i1
        %4 = comb.xor %arg4, %true : i1
        %5 = comb.and %4, %2 : i1
        %6 = comb.xor %3, %true : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.and %1, %7, %6, %2, %arg4 : i1
        fsm.return %8
      }
      fsm.transition @state_4 guard {
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg4, %true : i1
        %3 = comb.and %2, %0, %1 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.and %1, %4, %1, %arg3 : i1
        fsm.return %5
      }
      fsm.transition @state_3 guard {
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg4, %true : i1
        %3 = comb.xor %arg5, %true : i1
        %4 = comb.and %1, %2, %0, %1, %3 : i1
        fsm.return %4
      }
      fsm.transition @state_0 guard {
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.and %2, %arg4 : i1
        %4 = comb.and %1, %arg3 : i1
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.and %5, %2 : i1
        %7 = comb.xor %3, %true : i1
        %8 = comb.xor %4, %true : i1
        %9 = comb.and %8, %7 : i1
        %10 = comb.mux %6, %arg5, %9 : i1
        %11 = comb.or %arg2, %10 : i1
        fsm.return %11
      }
    }
    fsm.state @state_0 output {
      %0 = comb.and %arg1, %arg6 {sv.namehint = "ombx_set_ready"} : i1
      %1 = comb.or %arg3, %arg4, %arg2 : i1
      %2 = comb.or %0, %1 : i1
      %3 = comb.xor %1, %true : i1
      %4 = comb.and %arg1, %arg6 : i1
      %5 = comb.xor %arg3, %true : i1
      %6 = comb.mux %5, %arg4, %arg5 : i1
      %7 = comb.xor %4, %true : i1
      %8 = comb.or %arg3, %7 : i1
      %9 = comb.xor %arg2, %true : i1
      %10 = comb.and %5, %9 : i1
      %11 = comb.xor %10, %true : i1
      %12 = comb.and %9, %arg3 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.and %9, %13, %11 : i1
      %15 = comb.and %9, %13, %10, %6 : i1
      %16 = comb.xor %8, %true : i1
      %17 = comb.xor %6, %true : i1
      %18 = comb.and %9, %13, %10, %17, %16 : i1
      fsm.output %arg1, %false, %false, %false, %2, %3, %18, %15, %14 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.mux %0, %arg4, %arg5 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %2, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.and %2, %4, %0, %2, %1 : i1
        fsm.return %5
      }
      fsm.transition @state_4 guard {
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %0, %0, %arg3 : i1
        fsm.return %1
      }
      fsm.transition @state_3 guard {
        %0 = comb.and %arg1, %arg6 : i1
        %1 = comb.xor %arg3, %true : i1
        %2 = comb.mux %1, %arg4, %arg5 : i1
        %3 = comb.xor %0, %true : i1
        %4 = comb.or %arg3, %3 : i1
        %5 = comb.xor %arg2, %true : i1
        %6 = comb.and %5, %arg3 : i1
        %7 = comb.xor %4, %true : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %6, %true : i1
        %10 = comb.and %5, %9, %1, %5, %8, %7 : i1
        fsm.return %10
      }
      fsm.transition @state_0 guard {
        %0 = comb.and %arg1, %arg6 : i1
        %1 = comb.xor %arg3, %true : i1
        %2 = comb.mux %1, %arg4, %arg5 : i1
        %3 = comb.xor %0, %true : i1
        %4 = comb.xor %arg2, %true : i1
        %5 = comb.and %1, %4 : i1
        %6 = comb.and %4, %arg3 : i1
        %7 = comb.xor %2, %true : i1
        %8 = comb.and %7, %3 : i1
        %9 = comb.xor %5, %true : i1
        %10 = comb.or %9, %8, %arg3 : i1
        %11 = comb.xor %6, %true : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.or %arg2, %12 : i1
        fsm.return %13
      }
    }
  }
}

