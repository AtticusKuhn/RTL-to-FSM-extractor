module {
  %false = hw.constant false
  %true = hw.constant true
  fsm.machine @mbx_fsm(%arg0: i1) -> i1 attributes {initialState = "state_0"} {
    fsm.state @state_0 output {
      fsm.output %false : i1
    } transitions {
      fsm.transition @state_1 guard {
        fsm.return %false
      }
    }
    fsm.state @state_1 output {
      fsm.output %true : i1
    } transitions {
      fsm.transition @state_0 guard {
        fsm.return %true
      }
    }
  }
}
