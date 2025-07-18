module {
  hw.module @mbx_fsm(in %clk_i : i1, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %0 = llhd.constant_time <0ns, 1d, 0e>
    %1 = llhd.constant_time <0ns, 0d, 1e>
    %false = hw.constant false
    %true = hw.constant true
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %clk_i_0 = llhd.sig name "clk_i" %false : i1
    %2 = llhd.prb %clk_i_0 : !hw.inout<i1>
    %rst_ni_1 = llhd.sig name "rst_ni" %false : i1
    %3 = llhd.prb %rst_ni_1 : !hw.inout<i1>
    %mbx_range_valid_i_2 = llhd.sig name "mbx_range_valid_i" %false : i1
    %hostif_abort_ack_i_3 = llhd.sig name "hostif_abort_ack_i" %false : i1
    %mbx_error_set_i_4 = llhd.sig name "mbx_error_set_i" %false : i1
    %sysif_control_abort_set_i_5 = llhd.sig name "sysif_control_abort_set_i" %false : i1
    %sys_read_all_i_6 = llhd.sig name "sys_read_all_i" %false : i1
    %writer_close_mbx_i_7 = llhd.sig name "writer_close_mbx_i" %false : i1
    %writer_last_word_written_i_8 = llhd.sig name "writer_last_word_written_i" %false : i1
    %writer_write_valid_i_9 = llhd.sig name "writer_write_valid_i" %false : i1
    %mbx_state_error_o = llhd.sig %false : i1
    %ctrl_state_q = llhd.sig %c0_i3 : i3
    %ctrl_state_d = llhd.sig %c0_i3 : i3
    %ctrl_state_logic = llhd.sig %c0_i3 : i3
    %4 = llhd.prb %ctrl_state_logic : !hw.inout<i3>
    llhd.drv %ctrl_state_q, %4 after %1 : !hw.inout<i3>
    llhd.process {
      cf.br ^bb1
    ^bb1:  // 4 preds: ^bb0, ^bb2, ^bb4, ^bb5
      %36 = llhd.prb %clk_i_0 : !hw.inout<i1>
      %37 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      llhd.wait (%2, %3 : i1, i1), ^bb2
    ^bb2:  // pred: ^bb1
      %38 = llhd.prb %clk_i_0 : !hw.inout<i1>
      %39 = comb.xor bin %36, %true : i1
      %40 = comb.and bin %39, %38 : i1
      %41 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      %42 = comb.xor bin %41, %true : i1
      %43 = comb.and bin %37, %42 : i1
      %44 = comb.or bin %40, %43 : i1
      cf.cond_br %44, ^bb3, ^bb1
    ^bb3:  // pred: ^bb2
      %45 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      %46 = comb.xor %45, %true : i1
      cf.cond_br %46, ^bb4, ^bb5
    ^bb4:  // pred: ^bb3
      llhd.drv %ctrl_state_logic, %c0_i3 after %0 : !hw.inout<i3>
      cf.br ^bb1
    ^bb5:  // pred: ^bb3
      %47 = llhd.prb %ctrl_state_d : !hw.inout<i3>
      llhd.drv %ctrl_state_logic, %47 after %0 : !hw.inout<i3>
      cf.br ^bb1
    }
    %5 = llhd.prb %ctrl_state_q : !hw.inout<i3>
    %6 = comb.icmp eq %5, %c0_i3 {sv.namehint = "mbx_idle"} : i3
    %7 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
    %8 = comb.and %6, %7 : i1
    %9 = comb.icmp eq %5, %c1_i3 : i3
    %10 = comb.icmp eq %5, %c3_i3 : i3
    %11 = comb.icmp eq %5, %c-3_i3 : i3
    %12 = comb.icmp ne %5, %c-3_i3 : i3
    %13 = llhd.prb %ctrl_state_d : !hw.inout<i3>
    %14 = comb.icmp eq %13, %c-3_i3 : i3
    %15 = comb.and %12, %14 : i1
    %16 = comb.icmp ne %5, %c3_i3 : i3
    %17 = comb.icmp eq %13, %c3_i3 : i3
    %18 = comb.and %16, %17 : i1
    %19 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
    %20 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
    %21 = comb.and %6, %19, %20 {sv.namehint = "ombx_set_ready"} : i1
    %22 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
    %23 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
    %24 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
    %25 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
    %26 = comb.and %10, %25 : i1
    %27 = comb.or %22, %23, %24, %26 : i1
    %28 = comb.or %21, %27 : i1
    %29 = comb.xor %27, %true : i1
    %30 = llhd.prb %ctrl_state_q : !hw.inout<i3>
    %31 = llhd.prb %ctrl_state_d : !hw.inout<i3>
    %32 = llhd.prb %mbx_state_error_o : !hw.inout<i1>
    %33 = llhd.prb %writer_write_valid_i_9 : !hw.inout<i1>
    %34 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
    llhd.process {
      cf.br ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb38
      %36 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      llhd.drv %ctrl_state_d, %36 after %1 : !hw.inout<i3>
      llhd.drv %mbx_state_error_o, %false after %1 : !hw.inout<i1>
      %37 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
      cf.cond_br %37, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb3:  // pred: ^bb1
      %38 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      %39 = comb.icmp ceq %38, %c0_i3 : i3
      cf.cond_br %39, ^bb4, ^bb10
    ^bb4:  // pred: ^bb3
      %40 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
      %41 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      %42 = comb.and %40, %41 : i1
      cf.cond_br %42, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb6
    ^bb6:  // 2 preds: ^bb4, ^bb5
      %43 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %43, ^bb7, ^bb8
    ^bb7:  // pred: ^bb6
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb8:  // pred: ^bb6
      %44 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %44, ^bb9, ^bb38
    ^bb9:  // pred: ^bb8
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb10:  // pred: ^bb3
      %45 = comb.icmp ceq %38, %c1_i3 : i3
      cf.cond_br %45, ^bb11, ^bb19
    ^bb11:  // pred: ^bb10
      %46 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %46, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb13:  // pred: ^bb11
      %47 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %47, ^bb14, ^bb15
    ^bb14:  // pred: ^bb13
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb15:  // pred: ^bb13
      %48 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      cf.cond_br %48, ^bb16, ^bb38
    ^bb16:  // pred: ^bb15
      %49 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      cf.cond_br %49, ^bb17, ^bb18
    ^bb17:  // pred: ^bb16
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb18:  // pred: ^bb16
      llhd.drv %ctrl_state_d, %c2_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb19:  // pred: ^bb10
      %50 = comb.icmp ceq %38, %c2_i3 : i3
      cf.cond_br %50, ^bb20, ^bb26
    ^bb20:  // pred: ^bb19
      %51 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %51, ^bb21, ^bb22
    ^bb21:  // pred: ^bb20
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb22:  // pred: ^bb20
      %52 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %52, ^bb23, ^bb24
    ^bb23:  // pred: ^bb22
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb24:  // pred: ^bb22
      %53 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      cf.cond_br %53, ^bb25, ^bb38
    ^bb25:  // pred: ^bb24
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb26:  // pred: ^bb19
      %54 = comb.icmp ceq %38, %c3_i3 : i3
      cf.cond_br %54, ^bb27, ^bb33
    ^bb27:  // pred: ^bb26
      %55 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %55, ^bb28, ^bb29
    ^bb28:  // pred: ^bb27
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb29:  // pred: ^bb27
      %56 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %56, ^bb30, ^bb31
    ^bb30:  // pred: ^bb29
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb31:  // pred: ^bb29
      %57 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
      cf.cond_br %57, ^bb32, ^bb38
    ^bb32:  // pred: ^bb31
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb33:  // pred: ^bb26
      %58 = comb.icmp ceq %38, %c-4_i3 : i3
      cf.cond_br %58, ^bb34, ^bb36
    ^bb34:  // pred: ^bb33
      %59 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %59, ^bb35, ^bb38
    ^bb35:  // pred: ^bb34
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb38
    ^bb36:  // pred: ^bb33
      %60 = comb.icmp ceq %38, %c-3_i3 : i3
      cf.cond_br %60, ^bb38, ^bb37
    ^bb37:  // pred: ^bb36
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      llhd.drv %mbx_state_error_o, %true after %1 : !hw.inout<i1>
      cf.br ^bb38
    ^bb38:  // 21 preds: ^bb2, ^bb7, ^bb8, ^bb9, ^bb12, ^bb14, ^bb15, ^bb17, ^bb18, ^bb21, ^bb23, ^bb24, ^bb25, ^bb28, ^bb30, ^bb31, ^bb32, ^bb34, ^bb35, ^bb36, ^bb37
      llhd.wait (%30, %31, %32, %24, %19, %20, %22, %23, %33, %34, %25 : i3, i3, i1, i1, i1, i1, i1, i1, i1, i1, i1), ^bb1
    }
    llhd.drv %clk_i_0, %clk_i after %1 : !hw.inout<i1>
    llhd.drv %rst_ni_1, %rst_ni after %1 : !hw.inout<i1>
    llhd.drv %mbx_range_valid_i_2, %mbx_range_valid_i after %1 : !hw.inout<i1>
    llhd.drv %hostif_abort_ack_i_3, %hostif_abort_ack_i after %1 : !hw.inout<i1>
    llhd.drv %mbx_error_set_i_4, %mbx_error_set_i after %1 : !hw.inout<i1>
    llhd.drv %sysif_control_abort_set_i_5, %sysif_control_abort_set_i after %1 : !hw.inout<i1>
    llhd.drv %sys_read_all_i_6, %sys_read_all_i after %1 : !hw.inout<i1>
    llhd.drv %writer_close_mbx_i_7, %writer_close_mbx_i after %1 : !hw.inout<i1>
    llhd.drv %writer_last_word_written_i_8, %writer_last_word_written_i after %1 : !hw.inout<i1>
    llhd.drv %writer_write_valid_i_9, %writer_write_valid_i after %1 : !hw.inout<i1>
    %35 = llhd.prb %mbx_state_error_o : !hw.inout<i1>
    hw.output %8, %9, %10, %11, %28, %29, %18, %15, %35 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
