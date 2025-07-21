fsm.machine @mbx_fsm(
    // Control Inputs
    %mbx_range_valid_i: i1, %hostif_abort_ack_i: i1, %mbx_error_set_i: i1,
    %sysif_control_abort_set_i: i1, %sys_read_all_i: i1, %writer_close_mbx_i: i1,
    %writer_last_word_written_i: i1, %writer_write_valid_i: i1
) -> (
    // Outputs
    i1, i1, i1, i1, i1, i1, i1, i1, i1
    // mbx_empty_o, mbx_write_o, mbx_read_o, mbx_sys_abort_o, mbx_ready_update_o,
    // mbx_ready_o, mbx_irq_ready_o, mbx_irq_abort_o, mbx_state_error_o
) attributes {initialState = "MbxIdle"} {
    %true = hw.constant true
    %false = hw.constant false
    %cfg_ombx = hw.constant 1 : i1

    // --- State: MbxIdle ---
    fsm.state @MbxIdle output {
        %mbx_idle_o = hw.constant true
        %mbx_write_o = hw.constant false
        %mbx_wait_final_word_o = hw.constant false
        %mbx_read_o = hw.constant false
        %mbx_error_o = hw.constant false
        %mbx_sys_abort_host_o = hw.constant false

        %not_mbx_sys_abort_host_o = comb.not %mbx_sys_abort_host_o
        %next_mbx_sys_abort_host = comb.and %not_hostif_ack_i, %

        %mbx_empty_o = comb.and %mbx_idle_o, %mbx_range_valid_i
        %mbx_irq_abort_o = comb.and %not_mbx_sys_abort_o, %mbx_sys_abort_host
        %mbx_irq_ready_o = comb.and %not_mbx_read_o, %next_mbx_sys_abort_host
       fsm.output %mbx_empty_o, %mbx_write_o, %mbx_read_o, %mbx_sys_abort_o, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o, %mbx_irq_abort_o, %mbx_state_error_o : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard {
            fsm.return %hostif_abort_ack_i
        }

        fsm.transition @MbxError guard {
           fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            fsm.return %guard
        }

        fsm.transition @MbxRead guard {
    fsm.return %guard
        }
        fsm.transition @MbxWrite guard {
    fsm.return %guard
        }

        fsm.transition @MbxIdle guard {
            fsm.return %true // This will be simplified by a verifier/compiler
        }
    }

    fsm.state @MbxWrite output {
        fsm.output %false, %true, %false, %false, %false, %true, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            fsm.return %guard
        }
        fsm.transition @MbxRead guard {
            fsm.return %guard
        }
        fsm.transition @MbxWaitFinalWord guard {
            fsm.return %guard
        }
        fsm.transition @MbxWrite guard { fsm.return %true }
    }

    fsm.state @MbxWaitFinalWord output {
        fsm.output %false, %false, %false, %false, %false, %true, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            fsm.return %guard
        }
        fsm.transition @MbxRead guard {
            fsm.return %guard
        }
        fsm.transition @MbxWaitFinalWord guard { fsm.return %true }
    }

    fsm.state @MbxRead output {
        fsm.output %false, %false, %true, %false, %ready_update, %ready_o, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            fsm.return %guard
        }
        fsm.transition @MbxIdle guard {
            fsm.return %guard
        }
        fsm.transition @MbxRead guard { fsm.return %true }
    }

    fsm.state @MbxError output {
        fsm.output %false, %false, %false, %false, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxSysAbortHost guard {
            fsm.return %guard
        }
        fsm.transition @MbxError guard { fsm.return %true }
    }

    fsm.state @MbxSysAbortHost output {
        fsm.output %false, %false, %false, %true, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxSysAbortHost guard { fsm.return %true }
    }
}
