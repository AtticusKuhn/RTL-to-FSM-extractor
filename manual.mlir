module {
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
    %false = hw.constant false
    %true = hw.constant true
    %true_0 = hw.constant true
    %nwtier_last_word_written = comb.xor %writer_last_word_written_i, %true : i1
    // %next_mbx_sys_abort_host = fsm.variable "next_mbx_sys_abort_host" {initValue = false} : i1
    // %next_mbx_read = fsm.variable "next_mbx_read" {initValue = false} : i1
    %nhostif_abort_ack_i = comb.xor %hostif_abort_ack_i, %true : i1
    %nmbx_error_set_i = comb.xor %hostif_abort_ack_i, %true : i1
    %nsys_read_all_i = comb.xor %sys_read_all_i, %true : i1
    %nmbx_sysif_control_abort_set_i = comb.xor %sysif_control_abort_set_i, %true : i1
    %false_1 = hw.constant false
    fsm.state @MbxIdle output {
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.and %true_2, %mbx_range_valid_i : i1
      %2 = comb.xor %false_5, %true : i1
      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i, %nmbx_error_set_i, %sysif_control_abort_set_i : i1
      %next_mbx_read = comb.and %nhostif_abort_ack_i, %mbx_range_valid_i, %writer_close_mbx_i, %nmbx_error_set_i, %nmbx_sysif_control_abort_set_i : i1

      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %next_mbx_read, %true : i1 // Or just use %next_mbx_read
      %5 = comb.and %true_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %false_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %1, %false_3, %false_4, %false_5, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o_val, %3, %false_1 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxError guard {
        fsm.return %mbx_error_set_i
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %sysif_control_abort_set_i
      }
      fsm.transition @MbxRead guard {
        %1 = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
        fsm.return %1
      }
    }
    fsm.state @MbxWrite output {
      %false_2 = hw.constant false
      %true_3 = hw.constant true
      %false_4 = hw.constant false
      %false_5 = hw.constant false

      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i, %nmbx_error_set_i, %sysif_control_abort_set_i : i1
      %next_mbx_read = comb.and %nhostif_abort_ack_i,  %nmbx_error_set_i, %nmbx_sysif_control_abort_set_i, %writer_close_mbx_i, %writer_last_word_written_i : i1
      %1 = comb.and %false_2, %mbx_range_valid_i : i1
      %2 = comb.xor %false_5, %true : i1
      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %false_4, %next_mbx_read : i1
      %5 = comb.and %false_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %false_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %false, %true_3, %false, %false, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o_val, %3, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxError guard {
        fsm.return %mbx_error_set_i
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %sysif_control_abort_set_i
      }
      fsm.transition @MbxRead guard {
        %1 = comb.and %writer_close_mbx_i, %writer_last_word_written_i : i1
        fsm.return %1
      }
      fsm.transition @MbxWaitFinalWord guard {
        %1 = comb.and %writer_close_mbx_i, %nwtier_last_word_written : i1
        fsm.return %1
      }
      fsm.transition @MbxWrite
    }
    fsm.state @MbxWaitFinalWord output {
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i, %nmbx_error_set_i, %sysif_control_abort_set_i : i1
      %next_mbx_read = comb.and %nhostif_abort_ack_i,  %nmbx_error_set_i, %nmbx_sysif_control_abort_set_i, %writer_last_word_written_i : i1
      %1 = comb.and %false_2, %mbx_range_valid_i : i1
      %2 = comb.xor %false_5, %true : i1
      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %false_4, %next_mbx_read : i1
      %5 = comb.and %false_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %false_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %false, %false, %false, %false, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o_val, %3, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxError guard {
        fsm.return %mbx_error_set_i
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %sysif_control_abort_set_i
      }
      fsm.transition @MbxRead guard {
        fsm.return %writer_last_word_written_i
      }
      fsm.transition @MbxWaitFinalWord
    }
    fsm.state @MbxRead output {
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i, %nmbx_error_set_i, %sysif_control_abort_set_i : i1
      %next_mbx_read = comb.and %nhostif_abort_ack_i,  %nmbx_error_set_i, %nmbx_sysif_control_abort_set_i, %nsys_read_all_i: i1
      %1 = comb.and %false_2, %mbx_range_valid_i : i1
      %2 = comb.xor %false_5, %true : i1
      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %true_4, %next_mbx_read : i1
      %5 = comb.and %false_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %true_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %false, %false, %true_4, %false, %mbx_ready_update_o, %mbx_ready_o, %mbx_irq_ready_o_val, %3, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxError guard {
        fsm.return %mbx_error_set_i
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %sysif_control_abort_set_i
      }
      fsm.transition @MbxIdle guard {
        fsm.return %sys_read_all_i
      }
      fsm.transition @MbxRead
    }
    fsm.state @MbxError output {
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i, %sysif_control_abort_set_i : i1
      %next_mbx_read = hw.constant false
      %1 = comb.and %false_2, %mbx_range_valid_i : i1
      %2 = comb.xor %false_5, %true : i1
      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %false_4, %next_mbx_read : i1
      %5 = comb.and %false_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %false_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %false, %false, %false, %false, %mbx_ready_update_o, %mbx_ready_o, %false, %3, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxSysAbortHost guard {
        fsm.return %sysif_control_abort_set_i
      }
      fsm.transition @MbxError
    }
    fsm.state @MbxSysAbortHost output {
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %next_mbx_sys_abort_host = comb.and %nhostif_abort_ack_i : i1
      %next_mbx_read = hw.constant false
      %1 = comb.and %false_2, %mbx_range_valid_i : i1
      %2 = comb.xor %true_5, %true : i1
      %3 = comb.and %2, %next_mbx_sys_abort_host : i1
      %mbx_irq_ready_o_val = comb.and %false_4, %next_mbx_read : i1
      %5 = comb.and %false_2, %mbx_range_valid_i, %writer_close_mbx_i : i1
      %6 = comb.and %false_4, %sys_read_all_i : i1
      %7 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %6 : i1
      %mbx_ready_update_o = comb.or %5, %7 : i1
      %mbx_ready_o = comb.xor %7, %true : i1
      fsm.output %false, %false, %false, %true_5, %mbx_ready_update_o, %mbx_ready_o, %false, %false, %false : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @MbxIdle guard {
        fsm.return %hostif_abort_ack_i
      }
      fsm.transition @MbxSysAbortHost
    }
  }
}

