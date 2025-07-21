// Translation of OpenTitan's `mbx_fsm.sv` to the CIRCT fsm dialect.
//
// This FSM controls the state of a single mailbox, which can be configured
// as an inbound (IMBX) or outbound (OMBX) mailbox. The logic handles writing,
// reading, error conditions, and system-initiated aborts.
//
fsm.machine @mbx_fsm(
  // Inputs from Verilog module
  %mbx_range_valid_i: i1,
  %hostif_abort_ack_i: i1,
  %mbx_error_set_i: i1,
  %sysif_control_abort_set_i: i1,
  %sys_read_all_i: i1,
  %writer_close_mbx_i: i1,
  %writer_last_word_written_i: i1,
  %writer_write_valid_i: i1
) -> (
  // Outputs from Verilog module
  i1, // mbx_empty_o
  i1, // mbx_write_o
  i1, // mbx_read_o
  i1, // mbx_sys_abort_o
  i1, // mbx_ready_update_o
  i1, // mbx_ready_o
  i1, // mbx_irq_ready_o
  i1, // mbx_irq_abort_o
  i1  // mbx_state_error_o
) attributes {initialState = "MbxIdle"} {
  // Define constants for convenience
  %c0 = hw.constant false
  %c1 = hw.constant true
  %CfgOmbx = hw.constant 1 : i1

  // --- State: MbxIdle ---
  // The mailbox is waiting for a transaction to begin.
  fsm.state @MbxIdle output {
    // Output Logic for MbxIdle
    %mbx_empty_o = comb.and %mbx_range_valid_i, %c1 : i1
    %mbx_write_o = hw.constant false
    %mbx_read_o = hw.constant false
    %mbx_sys_abort_o = hw.constant false

    // Ready bit logic
    %ombx_set_ready = comb.and %CfgOmbx, %mbx_range_valid_i, %writer_close_mbx_i : i1
    %clear_conds = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %clear_conds : i1
    %ready_or = comb.or %ombx_set_ready, %ombx_clear_ready : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ready_or : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1 // Negation

    // IRQ Logic (based on transitions out of this state)
    // Condition for transition to MbxRead
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1
    %base_cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
    %cond_to_read = comb.and %base_cond, %CfgOmbx, %mbx_range_valid_i, %writer_close_mbx_i : i1
    %mbx_irq_ready_o = comb.and %c1, %cond_to_read : i1

    // Condition for transition to MbxSysAbortHost
    %cond_to_sysabort = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
    %mbx_irq_abort_o = comb.and %c1, %cond_to_sysabort : i1

    %mbx_state_error_o = comb.and %c1, %c0 : i1
    fsm.output %mbx_empty_o, %mbx_write_o, %mbx_read_o, %mbx_sys_abort_o, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o, %mbx_irq_abort_o, %mbx_state_error_o : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    // Transition priority is determined by order.
    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxError guard {
      %cond0 = comb.xor %hostif_abort_ack_i, %c1 : i1
      %cond1 = comb.and %cond0, %mbx_error_set_i : i1
      fsm.return %cond1
    }
    fsm.transition @MbxSysAbortHost guard {
      %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
      %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
      %cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
      fsm.return %cond
    }
    fsm.transition @MbxRead guard {
      %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
      %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
      %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1
      %base_cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
      %cond = comb.and %base_cond, %CfgOmbx, %mbx_range_valid_i, %writer_close_mbx_i : i1
      fsm.return %cond
    }
    fsm.transition @MbxWrite guard {
      %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
      %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
      %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1
      %n_CfgOmbx = comb.xor %CfgOmbx, %c1 : i1
      %base_cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
      %cond = comb.and %base_cond, %n_CfgOmbx, %mbx_range_valid_i, %writer_write_valid_i : i1
      fsm.return %cond
    }
    fsm.transition @MbxIdle guard { fsm.return %c1 } // Default self-loop
  }

  // --- State: MbxWrite ---
  // Inbound mailbox is being written by the system. Not applicable for Outbound.
  fsm.state @MbxWrite output {
    %mbx_write_o = comb.and %c1, %c1 : i1
    %ombx_clear_ready_cond = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %ombx_clear_ready_cond : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ombx_clear_ready : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1

    // IRQ Logic
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1
    %base_cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
    %cond_to_read = comb.and %base_cond, %writer_close_mbx_i, %writer_last_word_written_i : i1
    %mbx_irq_ready_o = comb.and %c1, %cond_to_read : i1

    %cond_to_sysabort = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
    %mbx_irq_abort_o = comb.and %c1, %cond_to_sysabort : i1

    fsm.output %c0, %mbx_write_o, %c0, %c0, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o, %mbx_irq_abort_o, %c0 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1

    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxError guard {
                   %cond = comb.and %n_hostif_abort_ack, %mbx_error_set_i : i1
                   fsm.return %cond
    }
    fsm.transition @MbxSysAbortHost guard {
                   %cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
                   fsm.return %cond
    }
    fsm.transition @MbxRead guard {
      %base = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
      %cond = comb.and %base, %writer_close_mbx_i, %writer_last_word_written_i : i1
      fsm.return %cond
    }
    fsm.transition @MbxWaitFinalWord guard {
      %n_writer_last_word = comb.xor %writer_last_word_written_i, %c1 : i1
      %base = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
      %cond = comb.and %base, %writer_close_mbx_i, %n_writer_last_word : i1
      fsm.return %cond
    }
    fsm.transition @MbxWrite guard { fsm.return %c1 }
  }

  // --- State: MbxWaitFinalWord ---
  // Waiting for the final word after writer has signaled close.
  fsm.state @MbxWaitFinalWord output {
    %ombx_clear_ready_cond = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %ombx_clear_ready_cond : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ombx_clear_ready : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1

    // IRQ Logic
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1
    %base_cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
    %cond_to_read = comb.and %base_cond, %writer_last_word_written_i : i1
    %mbx_irq_ready_o = comb.and %c1, %cond_to_read : i1

    %cond_to_sysabort = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
    %mbx_irq_abort_o = comb.and %c1, %cond_to_sysabort : i1

    fsm.output %c0, %c0, %c0, %c0, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o, %mbx_irq_abort_o, %c0 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1

    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxError guard {
                   %cond = comb.and %n_hostif_abort_ack, %mbx_error_set_i : i1
                   fsm.return %cond
    }
    fsm.transition @MbxSysAbortHost guard {
                   %cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
                   fsm.return %cond
    }
    fsm.transition @MbxRead guard {
        %base = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
        %cond = comb.and %base, %writer_last_word_written_i : i1
        fsm.return %cond
    }
    fsm.transition @MbxWaitFinalWord guard { fsm.return %c1 }
  }

  // --- State: MbxRead ---
  // Mailbox is filled and ready to be read.
  fsm.state @MbxRead output {
    %mbx_read_o = comb.and %c1, %c1 : i1

    // Ready bit logic
    %read_all = comb.and %mbx_read_o, %sys_read_all_i : i1
    %clear_conds = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %read_all : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %clear_conds : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ombx_clear_ready : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1

    // IRQ Logic
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %cond_to_sysabort = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
    %mbx_irq_abort_o = comb.and %c1, %cond_to_sysabort : i1

    fsm.output %c0, %c0, %mbx_read_o, %c0, %mbx_ready_update_o, %mbx_ready_o, %c0, %mbx_irq_abort_o, %c0 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %n_mbx_error_set = comb.xor %mbx_error_set_i, %c1 : i1
    %n_sysif_control_abort_set = comb.xor %sysif_control_abort_set_i, %c1 : i1

    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxError guard {
       %cond = comb.and %n_hostif_abort_ack, %mbx_error_set_i : i1
       fsm.return %cond
    }
    fsm.transition @MbxSysAbortHost guard {
       %cond = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %sysif_control_abort_set_i : i1
       fsm.return %cond
    }
    fsm.transition @MbxIdle guard {
      %base = comb.and %n_hostif_abort_ack, %n_mbx_error_set, %n_sysif_control_abort_set : i1
      %cond = comb.and %base, %sys_read_all_i : i1
      fsm.return %cond
    }
    fsm.transition @MbxRead guard { fsm.return %c1 }
  }

  // --- State: MbxError ---
  // An error has occurred. Waiting for abort.
  fsm.state @MbxError output {
    %clear_conds = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %clear_conds : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ombx_clear_ready : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1

    // IRQ Logic
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    %cond_to_sysabort = comb.and %n_hostif_abort_ack, %sysif_control_abort_set_i : i1
    %mbx_irq_abort_o = comb.and %c1, %cond_to_sysabort : i1

    fsm.output %c0, %c0, %c0, %c0, %mbx_ready_update_o, %mbx_ready_o, %c0, %mbx_irq_abort_o, %c0 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    %n_hostif_abort_ack = comb.xor %hostif_abort_ack_i, %c1 : i1
    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxSysAbortHost guard {
                   %cond = comb.and %n_hostif_abort_ack, %sysif_control_abort_set_i : i1
                   fsm.return %cond }
    fsm.transition @MbxError guard { fsm.return %c1 }
  }

  // --- State: MbxSysAbortHost ---
  // System has requested an abort. Waiting for host acknowledgement.
  fsm.state @MbxSysAbortHost output {
    %mbx_sys_abort_o = comb.and %c1, %c1 : i1
    %clear_conds = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i : i1
    %ombx_clear_ready = comb.and %CfgOmbx, %clear_conds : i1
    %mbx_ready_update_o = comb.and %CfgOmbx, %ombx_clear_ready : i1
    %mbx_ready_o = comb.xor %ombx_clear_ready, %c1 : i1

    fsm.output %c0, %c0, %c0, %mbx_sys_abort_o, %mbx_ready_update_o, %mbx_ready_o, %c0, %c0, %c0 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  } transitions {
    fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
    fsm.transition @MbxSysAbortHost guard { fsm.return %c1 }
  }
}
