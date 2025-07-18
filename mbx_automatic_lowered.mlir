module {
  hw.module @mbx_fsm(in %clk_i : i1, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %aff_ctrl_state_q.q_o = hw.instance "aff_ctrl_state_q" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %83: i3) -> (q_o: i3) {sv.namehint = "ctrl_state_logic"}
    %0 = comb.icmp eq %aff_ctrl_state_q.q_o, %c0_i3 {sv.namehint = "mbx_idle"} : i3
    %1 = comb.and %0, %mbx_range_valid_i : i1
    %2 = comb.icmp eq %aff_ctrl_state_q.q_o, %c1_i3 : i3
    %3 = comb.icmp eq %aff_ctrl_state_q.q_o, %c3_i3 : i3
    %4 = comb.icmp eq %aff_ctrl_state_q.q_o, %c-3_i3 : i3
    %5 = comb.icmp ne %aff_ctrl_state_q.q_o, %c-3_i3 : i3
    %6 = comb.icmp eq %83, %c-3_i3 : i3
    %7 = comb.and %5, %6 : i1
    %8 = comb.icmp ne %aff_ctrl_state_q.q_o, %c3_i3 : i3
    %9 = comb.icmp eq %83, %c3_i3 : i3
    %10 = comb.and %8, %9 : i1
    %11 = comb.and %0, %mbx_range_valid_i, %writer_close_mbx_i {sv.namehint = "ombx_set_ready"} : i1
    %12 = comb.and %3, %sys_read_all_i : i1
    %13 = comb.or %mbx_error_set_i, %sysif_control_abort_set_i, %hostif_abort_ack_i, %12 : i1
    %14 = comb.or %11, %13 : i1
    %15 = comb.xor %13, %true : i1
    %16 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c0_i3 : i3
    %17 = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
    %18 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c1_i3 : i3
    %19 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c2_i3 : i3
    %20 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c3_i3 : i3
    %21 = comb.mux %19, %writer_last_word_written_i, %sys_read_all_i : i1
    %22 = comb.mux %19, %c3_i3, %c0_i3 : i3
    %23 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c-4_i3 : i3
    %24 = comb.xor %mbx_error_set_i, %true : i1
    %25 = comb.and %16, %24 : i1
    %26 = comb.xor %16, %true : i1
    %27 = comb.xor %18, %true : i1
    %28 = comb.xor %19, %true : i1
    %29 = comb.xor %20, %true : i1
    %30 = comb.and %29, %28, %27, %26, %23 : i1
    %31 = comb.or %30, %25 : i1
    %32 = comb.mux %31, %sysif_control_abort_set_i, %21 : i1
    %33 = comb.mux %31, %c-3_i3, %22 : i3
    %34 = comb.xor %25, %true : i1
    %35 = comb.xor %17, %true : i1
    %36 = comb.or %30, %34, %35 : i1
    %37 = comb.mux %36, %aff_ctrl_state_q.q_o, %c3_i3 : i3
    %38 = comb.icmp ceq %aff_ctrl_state_q.q_o, %c-3_i3 : i3
    %39 = comb.mux %38, %aff_ctrl_state_q.q_o, %c0_i3 : i3
    %40 = comb.xor %38, %true : i1
    %41 = comb.xor %hostif_abort_ack_i, %true : i1
    %42 = comb.and %26, %41 : i1
    %43 = comb.and %27, %42 : i1
    %44 = comb.and %28, %43 : i1
    %45 = comb.and %20, %44 : i1
    %46 = comb.and %19, %43 : i1
    %47 = comb.or %45, %46 : i1
    %48 = comb.and %24, %47 : i1
    %49 = comb.and %48, %sysif_control_abort_set_i : i1
    %50 = comb.mux %49, %c-3_i3, %39 : i3
    %51 = comb.xor %49, %true : i1
    %52 = comb.and %47, %mbx_error_set_i : i1
    %53 = comb.mux %52, %c-4_i3, %50 : i3
    %54 = comb.xor %52, %true : i1
    %55 = comb.concat %c1_i2, %writer_last_word_written_i : i2, i1
    %56 = comb.and %18, %42 : i1
    %57 = comb.and %24, %56 : i1
    %58 = comb.xor %sysif_control_abort_set_i, %true : i1
    %59 = comb.and %58, %57 : i1
    %60 = comb.and %writer_close_mbx_i, %59 : i1
    %61 = comb.mux %60, %55, %53 : i3
    %62 = comb.xor %60, %true : i1
    %63 = comb.and %57, %sysif_control_abort_set_i : i1
    %64 = comb.mux %63, %c-3_i3, %61 : i3
    %65 = comb.xor %63, %true : i1
    %66 = comb.and %56, %mbx_error_set_i : i1
    %67 = comb.mux %66, %c-4_i3, %64 : i3
    %68 = comb.xor %66, %true : i1
    %69 = comb.mux %32, %33, %37 : i3
    %70 = comb.and %16, %41 : i1
    %71 = comb.and %58, %48 : i1
    %72 = comb.and %24, %70 : i1
    %73 = comb.and %23, %29, %44 : i1
    %74 = comb.or %71, %72, %73 : i1
    %75 = comb.mux %74, %69, %67 : i3
    %76 = comb.xor %74, %true : i1
    %77 = comb.and %70, %mbx_error_set_i : i1
    %78 = comb.mux %77, %c-4_i3, %75 : i3
    %79 = comb.xor %77, %true : i1
    %80 = comb.mux %hostif_abort_ack_i, %c0_i3, %78 : i3
    %81 = comb.xor %writer_close_mbx_i, %true : i1
    %82 = comb.and %59, %81 : i1
    %83 = comb.mux %82, %aff_ctrl_state_q.q_o, %80 : i3
    %84 = comb.xor %82, %true : i1
    %85 = comb.and %84, %41, %79, %76, %68, %65, %62, %54, %51, %40 : i1
    hw.output %1, %2, %3, %4, %14, %15, %10, %7, %85 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  hw.module private @prim_flop(in %clk_i : i1, in %rst_ni : i1, in %d_i : i3, out q_o : i3) {
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %c0_i3 : i3
    hw.output %q_o : i3
  }
}
