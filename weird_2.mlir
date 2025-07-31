module {
  %false = hw.constant false
  fsm.machine @mbx_fsm(%arg0: !seq.clock, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    fsm.state @state_0 output {
      fsm.output %arg2, %false, %false, %false, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    }
  }
}
