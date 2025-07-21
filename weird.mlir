module {
  fsm.machine @mbx_fsm() -> () attributes {initialState = "State1"} {
    fsm.state @State1 output {
      fsm.output
    }
    fsm.state @State2 output {
      fsm.output
    } transitions {
      %false = hw.constant false
      fsm.transition @State1 guard {
        fsm.return %false
      }
    }
  }
}
