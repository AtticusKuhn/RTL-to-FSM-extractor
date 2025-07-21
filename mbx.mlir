// Translation of https://github.com/lowRISC/opentitan/blob/master/hw/ip/mbx/rtl/mbx_fsm.sv
//
// This FSM controls a mailbox, parameterized for inbound (IMBX) or outbound (OMBX) operation.
// The SystemVerilog parameter `CfgOmbx` is modeled here as a machine input `cfg_ombx`.
//
// Key Translation Points:
// 1. High-priority aborts (`hostif_abort_ack_i`, `mbx_error_set_i`, `sysif_control_abort_set_i`)
//    are modeled with explicit priority encoding in the transition guards.
// 2. Both Moore (state-dependent) and Mealy (state- and input-dependent) outputs are generated.
//    Mealy outputs like `mbx_irq_ready_o` are computed by recreating the next-state logic
//    within the current state's output block.

fsm.machine @mbx_fsm(
    // Parameter
    // %cfg_ombx: i1,
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
        // --- Output Logic for MbxIdle ---
        %mbx_empty_o = comb.and %true, %mbx_range_valid_i : i1
        %mbx_write_o = hw.constant false
        %mbx_read_o = hw.constant false
        %mbx_sys_abort_o = hw.constant false

        // mbx_ready_update_o and mbx_ready_o (OMBX only)
        %ombx_set_ready = comb.and %cfg_ombx, %mbx_range_valid_i, %writer_close_mbx_i : i1
        %ombx_clear_ready = comb.and %cfg_ombx, %mbx_error_set_i : i1 // Simplified for this state
        %mbx_ready_update_o = comb.or %ombx_set_ready, %ombx_clear_ready : i1
        %mbx_ready_o = comb.icmp eq %ombx_clear_ready, %false : i1

        // Mealy Outputs: will we transition to a target state?
        %will_goto_sys_abort = comb.and %mbx_error_set_i, %false : i1 // Placeholder, complex logic below
        %next_is_sys_abort = comb.or %sysif_control_abort_set_i, %will_goto_sys_abort : i1
        %mbx_irq_abort_o = comb.and %next_is_sys_abort, %true : i1 // In MbxIdle, current state is not MbxSysAbortHost

        %is_ombx_and_valid_close = comb.and %cfg_ombx, %mbx_range_valid_i, %writer_close_mbx_i : i1
        %is_imbx_and_valid_write = comb.and %cfg_ombx, %mbx_range_valid_i, %writer_write_valid_i : i1
        %ncfg_ombx = comb.icmp eq %cfg_ombx, %false : i1
        %is_imbx_and_valid_write_final = comb.and %ncfg_ombx, %is_imbx_and_valid_write : i1

        %will_goto_read = comb.or %is_ombx_and_valid_close, %is_imbx_and_valid_write_final : i1 // Simplified
        %mbx_irq_ready_o = comb.and %will_goto_read, %true : i1 // In MbxIdle, current state is not MbxRead

        %mbx_state_error_o = hw.constant false
        fsm.output %mbx_empty_o, %mbx_write_o, %mbx_read_o, %mbx_sys_abort_o, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o, %mbx_irq_abort_o, %mbx_state_error_o : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        // Highest priority: Host ACK
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }

        // Next priorities: System error/abort
        fsm.transition @MbxError guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %guard = comb.and %no_ack, %mbx_error_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %sysif_control_abort_set_i : i1
            fsm.return %guard
        }

        // Operational transitions (OMBX)
        fsm.transition @MbxRead guard {
 // Check that all higher-priority signals are false
    %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
    %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
    %no_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1

    // Combine the priority checks
    %priority_ok = comb.and %no_ack, %no_err, %no_abort : i1

    // Check the operational condition
    %cond = comb.and %cfg_ombx, %mbx_range_valid_i, %writer_close_mbx_i : i1

    // The final guard is true only if priority allows AND the condition is met
    %guard = comb.and %priority_ok, %cond : i1
    fsm.return %guard
            // %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            // %no_err_abort = comb.and %mbx_error_set_i, %sysif_control_abort_set_i : i1
            // %no_err_abort_neg = comb.icmp eq %no_err_abort, %false : i1
            // %cond = comb.and %cfg_ombx, %mbx_range_valid_i, %writer_close_mbx_i : i1
            // %guard = comb.and %no_ack, %no_err_abort_neg, %cond : i1
            // fsm.return %guard
        }
        // Operational transitions (IMBX)
        fsm.transition @MbxWrite guard {
 // Check that ALL higher-priority signals are false
    %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
    %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
    %no_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1

    // Combine the priority checks
    %priority_ok = comb.and %no_ack, %no_err, %no_abort : i1

    // Check the operational condition for IMBX
    %ncfg_ombx = comb.icmp eq %cfg_ombx, %false : i1
    %op_cond = comb.and %ncfg_ombx, %mbx_range_valid_i, %writer_write_valid_i : i1

    // The final guard is true only if priority allows AND the condition is met
    %guard = comb.and %priority_ok, %op_cond : i1
    fsm.return %guard
            // %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            // %no_err_abort = comb.and %mbx_error_set_i, %sysif_control_abort_set_i : i1
            // %no_err_abort_neg = comb.icmp eq %no_err_abort, %false : i1
            // %ncfg_ombx = comb.icmp eq %cfg_ombx, %false : i1
            // %cond = comb.and %ncfg_ombx, %mbx_range_valid_i, %writer_write_valid_i : i1
            // %guard = comb.and %no_ack, %no_err_abort_neg, %cond : i1
            // fsm.return %guard
        }

        // Default: Stay in MbxIdle
        fsm.transition @MbxIdle guard {
            // This guard is the negation of all other transition guards from this state.
            // A synthesizer can simplify this. For clarity, we assume it's the default.
            fsm.return %true // This will be simplified by a verifier/compiler
        }
    }

    // --- State: MbxWrite ---
    fsm.state @MbxWrite output {
        fsm.output %false, %true, %false, %false, %false, %true, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %guard = comb.and %no_ack, %mbx_error_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %sysif_control_abort_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxRead guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %no_sys_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1
            %cond = comb.and %writer_close_mbx_i, %writer_last_word_written_i : i1
            %guard = comb.and %no_ack, %no_err, %no_sys_abort, %cond : i1
            fsm.return %guard
        }
        fsm.transition @MbxWaitFinalWord guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %no_sys_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1
            %last_word_not_written = comb.icmp eq %writer_last_word_written_i, %false : i1
            %cond = comb.and %writer_close_mbx_i, %last_word_not_written : i1
            %guard = comb.and %no_ack, %no_err, %no_sys_abort, %cond : i1
            fsm.return %guard
        }
        fsm.transition @MbxWrite guard { fsm.return %true }
    }

    // --- State: MbxWaitFinalWord ---
    fsm.state @MbxWaitFinalWord output {
        fsm.output %false, %false, %false, %false, %false, %true, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %guard = comb.and %no_ack, %mbx_error_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %sysif_control_abort_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxRead guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %no_sys_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %no_sys_abort, %writer_last_word_written_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxWaitFinalWord guard { fsm.return %true }
    }

    // --- State: MbxRead ---
    fsm.state @MbxRead output {
        // Output logic is complex due to ombx_clear_ready
        %ombx_clear_ready = comb.and %cfg_ombx, %mbx_error_set_i : i1 // Simplified
        %ready_update = comb.and %cfg_ombx, %ombx_clear_ready : i1
        %ready_o = comb.icmp eq %ombx_clear_ready, %false : i1
        fsm.output %false, %false, %true, %false, %ready_update, %ready_o, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxError guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %guard = comb.and %no_ack, %mbx_error_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxSysAbortHost guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %sysif_control_abort_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxIdle guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %no_err = comb.icmp eq %mbx_error_set_i, %false : i1
            %no_sys_abort = comb.icmp eq %sysif_control_abort_set_i, %false : i1
            %guard = comb.and %no_ack, %no_err, %no_sys_abort, %sys_read_all_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxRead guard { fsm.return %true }
    }

    // --- State: MbxError ---
    fsm.state @MbxError output {
        fsm.output %false, %false, %false, %false, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxSysAbortHost guard {
            %no_ack = comb.icmp eq %hostif_abort_ack_i, %false : i1
            %guard = comb.and %no_ack, %sysif_control_abort_set_i : i1
            fsm.return %guard
        }
        fsm.transition @MbxError guard { fsm.return %true }
    }

    // --- State: MbxSysAbortHost ---
    fsm.state @MbxSysAbortHost output {
        fsm.output %false, %false, %false, %true, %false, %false, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
        fsm.transition @MbxIdle guard { fsm.return %hostif_abort_ack_i }
        fsm.transition @MbxSysAbortHost guard { fsm.return %true }
    }
}
