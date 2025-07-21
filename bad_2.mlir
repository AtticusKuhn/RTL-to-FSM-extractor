module {
  fsm.machine @mbx_fsm() -> () attributes {initialState = "State1"} {
    fsm.state @State1 output {
      fsm.output
    }
    fsm.state @State2 output {
      fsm.output
    } transitions {
      fsm.transition @State1 action
    }
  }
}
