module {
  hw.module @mbx_fsm(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %true_0 = hw.constant true
    %c0_i3_1 = hw.constant 0 : i3
    %0 = comb.xor %rst_ni, %true_0 : i1
    %1 = seq.initial() {
      %c0_i3_2 = hw.constant 0 : i3
      seq.yield %c0_i3_2 : i3
    } : () -> !seq.immutable<i3>
    %aff_ctrl_state_q2Fq_o = seq.compreg name "aff_ctrl_state_q/q_o" %85, %clk reset %0, %c0_i3_1 initial %1 : i3  
    %2 = comb.icmp eq %aff_ctrl_state_q2Fq_o, %c0_i3 {sv.namehint = "mbx_idle"} : i3
    %3 = comb.and %2, %mbx_range_valid_i : i1
    %4 = comb.icmp eq %aff_ctrl_state_q2Fq_o, %c1_i3 : i3
    %5 = comb.icmp eq %aff_ctrl_state_q2Fq_o, %c3_i3 : i3
    %6 = comb.icmp eq %aff_ctrl_state_q2Fq_o, %c-3_i3 : i3
    %7 = comb.icmp ne %aff_ctrl_state_q2Fq_o, %c-3_i3 : i3
    %8 = comb.icmp eq %85, %c-3_i3 : i3
    %9 = comb.and %7, %8 : i1
    %10 = comb.icmp ne %aff_ctrl_state_q2Fq_o, %c3_i3 : i3
    %11 = comb.icmp eq %85, %c3_i3 : i3
    %12 = comb.and %10, %11 : i1
    %13 = comb.and %2, %mbx_range_valid_i, %writer_close_mbx_i {sv.namehint = "ombx_set_ready"} : i1
    %14 = comb.and %5, %sys_read_all_i : i1
    %15 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %14 : i1
    %16 = comb.or %13, %15 : i1
    %17 = comb.xor %15, %true : i1
    %18 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c0_i3 : i3
    %19 = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
    %20 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c1_i3 : i3
    %21 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c2_i3 : i3
    %22 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c3_i3 : i3
    %23 = comb.mux %21, %writer_last_word_written_i, %sys_read_all_i : i1
    %24 = comb.mux %21, %c3_i3, %c0_i3 : i3
    %25 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c-4_i3 : i3
    %26 = comb.xor %mbx_error_set_i, %true : i1
    %27 = comb.and %18, %26 : i1
    %28 = comb.xor %18, %true : i1
    %29 = comb.xor %20, %true : i1
    %30 = comb.xor %21, %true : i1
    %31 = comb.xor %22, %true : i1
    %32 = comb.and %31, %30, %29, %28, %25 : i1
    %33 = comb.or %32, %27 : i1
    %34 = comb.mux %33, %sysif_control_abort_set_i, %23 : i1
    %35 = comb.mux %33, %c-3_i3, %24 : i3
    %36 = comb.xor %27, %true : i1
    %37 = comb.xor %19, %true : i1
    %38 = comb.or %32, %36, %37 : i1
    %39 = comb.mux %38, %aff_ctrl_state_q2Fq_o, %c3_i3 : i3
    %40 = comb.icmp ceq %aff_ctrl_state_q2Fq_o, %c-3_i3 : i3
    %41 = comb.mux %40, %aff_ctrl_state_q2Fq_o, %c0_i3 : i3
    %42 = comb.xor %40, %true : i1
    %43 = comb.xor %hostif_abort_ack_i, %true : i1
    %44 = comb.and %28, %43 : i1
    %45 = comb.and %29, %44 : i1
    %46 = comb.and %30, %45 : i1
    %47 = comb.and %22, %46 : i1
    %48 = comb.and %21, %45 : i1
    %49 = comb.or %47, %48 : i1
    %50 = comb.and %26, %49 : i1
    %51 = comb.and %50, %sysif_control_abort_set_i : i1
    %52 = comb.mux %51, %c-3_i3, %41 : i3
    %53 = comb.xor %51, %true : i1
    %54 = comb.and %49, %mbx_error_set_i : i1
    %55 = comb.mux %54, %c-4_i3, %52 : i3
    %56 = comb.xor %54, %true : i1
    %57 = comb.concat %c1_i2, %writer_last_word_written_i : i2, i1
    %58 = comb.and %20, %44 : i1
    %59 = comb.and %26, %58 : i1
    %60 = comb.xor %sysif_control_abort_set_i, %true : i1
    %61 = comb.and %60, %59 : i1
    %62 = comb.and %writer_close_mbx_i, %61 : i1
    %63 = comb.mux %62, %57, %55 : i3
    %64 = comb.xor %62, %true : i1
    %65 = comb.and %59, %sysif_control_abort_set_i : i1
    %66 = comb.mux %65, %c-3_i3, %63 : i3
    %67 = comb.xor %65, %true : i1
    %68 = comb.and %58, %mbx_error_set_i : i1
    %69 = comb.mux %68, %c-4_i3, %66 : i3
    %70 = comb.xor %68, %true : i1
    %71 = comb.mux %34, %35, %39 : i3
    %72 = comb.and %18, %43 : i1
    %73 = comb.and %60, %50 : i1
    %74 = comb.and %26, %72 : i1
    %75 = comb.and %25, %31, %46 : i1
    %76 = comb.or %73, %74, %75 : i1
    %77 = comb.mux %76, %71, %69 : i3
    %78 = comb.xor %76, %true : i1
    %79 = comb.and %72, %mbx_error_set_i : i1
    %80 = comb.mux %79, %c-4_i3, %77 : i3
    %81 = comb.xor %79, %true : i1
    %82 = comb.mux %hostif_abort_ack_i, %c0_i3, %80 : i3
    %83 = comb.xor %writer_close_mbx_i, %true : i1
    %84 = comb.and %61, %83 : i1
    %85 = comb.mux %84, %aff_ctrl_state_q2Fq_o, %82 : i3
    %86 = comb.xor %84, %true : i1
    %87 = comb.and %86, %43, %81, %78, %70, %67, %64, %56, %53, %42 : i1
    hw.output %3, %4, %5, %6, %16, %17, %12, %9, %87 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

