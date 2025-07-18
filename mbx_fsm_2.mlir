module {
  hw.module @mbx_fsm(in %clk_i : i1, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %0 = llhd.constant_time <0ns, 1d, 0e>
    %1 = llhd.constant_time <0ns, 0d, 1e>
    %c0_i32 = hw.constant 0 : i32
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %false = hw.constant false
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %_sv2v_0 = llhd.sig %false : i1
    %2 = llhd.prb %_sv2v_0 : !hw.inout<i1>
    %clk_i_0 = llhd.sig name "clk_i" %false : i1
    %3 = llhd.prb %clk_i_0 : !hw.inout<i1>
    %rst_ni_1 = llhd.sig name "rst_ni" %false : i1
    %4 = llhd.prb %rst_ni_1 : !hw.inout<i1>
    %mbx_range_valid_i_2 = llhd.sig name "mbx_range_valid_i" %false : i1
    %5 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
    %hostif_abort_ack_i_3 = llhd.sig name "hostif_abort_ack_i" %false : i1
    %6 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
    %mbx_error_set_i_4 = llhd.sig name "mbx_error_set_i" %false : i1
    %7 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
    %sysif_control_abort_set_i_5 = llhd.sig name "sysif_control_abort_set_i" %false : i1
    %8 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
    %sys_read_all_i_6 = llhd.sig name "sys_read_all_i" %false : i1
    %9 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
    %writer_close_mbx_i_7 = llhd.sig name "writer_close_mbx_i" %false : i1
    %10 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
    %writer_last_word_written_i_8 = llhd.sig name "writer_last_word_written_i" %false : i1
    %11 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
    %writer_write_valid_i_9 = llhd.sig name "writer_write_valid_i" %false : i1
    %12 = llhd.prb %writer_write_valid_i_9 : !hw.inout<i1>
    %mbx_state_error_o = llhd.sig %false : i1
    %ctrl_state_q = llhd.sig %c0_i3 : i3
    %13 = llhd.prb %ctrl_state_q : !hw.inout<i3>
    %ctrl_state_d = llhd.sig %c0_i3 : i3
    %ctrl_state_logic = llhd.sig %c0_i3 : i3
    %14 = llhd.prb %ctrl_state_logic : !hw.inout<i3>
    llhd.drv %ctrl_state_q, %14 after %1 : !hw.inout<i3>
    %15 = llhd.prb %ctrl_state_q : !hw.inout<i3>
    %16 = comb.icmp eq %15, %c0_i3 {sv.namehint = "mbx_idle"} : i3
    %17 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
    %18 = comb.and %16, %17 : i1
    %19 = comb.icmp eq %15, %c1_i3 : i3
    %20 = comb.icmp eq %15, %c3_i3 : i3
    %21 = comb.icmp eq %15, %c-3_i3 : i3
    %22 = comb.icmp ne %15, %c-3_i3 : i3
    %23 = llhd.prb %ctrl_state_d : !hw.inout<i3>
    %24 = comb.icmp eq %23, %c-3_i3 : i3
    %25 = comb.and %22, %24 : i1
    %26 = comb.icmp ne %15, %c3_i3 : i3
    %27 = comb.icmp eq %23, %c3_i3 : i3
    %28 = comb.and %26, %27 : i1
    %29 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
    %30 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
    %31 = comb.and %16, %29, %30 {sv.namehint = "ombx_set_ready"} : i1
    %32 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
    %33 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
    %34 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
    %35 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
    %36 = comb.and %20, %35 : i1
    %37 = comb.or %32, %33, %34, %36 : i1
    %38 = comb.or %31, %37 : i1
    %39 = comb.xor %37, %true : i1
    llhd.process {
      cf.br ^bb1
    ^bb1:  // 4 preds: ^bb0, ^bb2, ^bb4, ^bb5
      %41 = llhd.prb %clk_i_0 : !hw.inout<i1>
      %42 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      llhd.wait (%3, %4 : i1, i1), ^bb2
    ^bb2:  // pred: ^bb1
      %43 = llhd.prb %clk_i_0 : !hw.inout<i1>
      %44 = comb.xor bin %41, %true : i1
      %45 = comb.and bin %44, %43 : i1
      %46 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      %47 = comb.xor bin %46, %true : i1
      %48 = comb.and bin %42, %47 : i1
      %49 = comb.or bin %45, %48 : i1
      cf.cond_br %49, ^bb3, ^bb1
    ^bb3:  // pred: ^bb2
      %50 = llhd.prb %rst_ni_1 : !hw.inout<i1>
      %51 = comb.xor %50, %true : i1
      cf.cond_br %51, ^bb4, ^bb5
    ^bb4:  // pred: ^bb3
      llhd.drv %ctrl_state_logic, %c0_i3 after %0 : !hw.inout<i3>
      cf.br ^bb1
    ^bb5:  // pred: ^bb3
      %52 = llhd.prb %ctrl_state_d : !hw.inout<i3>
      llhd.drv %ctrl_state_logic, %52 after %0 : !hw.inout<i3>
      cf.br ^bb1
    }
    llhd.process {
      cf.br ^bb1
    ^bb1:  // 23 preds: ^bb0, ^bb2, ^bb4, ^bb9, ^bb10, ^bb11, ^bb14, ^bb16, ^bb17, ^bb19, ^bb20, ^bb23, ^bb25, ^bb26, ^bb27, ^bb30, ^bb32, ^bb33, ^bb34, ^bb36, ^bb37, ^bb38, ^bb39
      %41 = llhd.prb %_sv2v_0 : !hw.inout<i1>
      %42 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      %43 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
      %44 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
      %45 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      %46 = llhd.prb %writer_write_valid_i_9 : !hw.inout<i1>
      %47 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      %48 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      %49 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      %50 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
      llhd.wait (%2, %13, %6, %5, %10, %12, %7, %8, %11, %9 : i1, i3, i1, i1, i1, i1, i1, i1, i1, i1), ^bb2
    ^bb2:  // pred: ^bb1
      %51 = llhd.prb %_sv2v_0 : !hw.inout<i1>
      %52 = comb.icmp bin ne %41, %51 : i1
      %53 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      %54 = comb.icmp bin ne %42, %53 : i3
      %55 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
      %56 = comb.icmp bin ne %43, %55 : i1
      %57 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
      %58 = comb.icmp bin ne %44, %57 : i1
      %59 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      %60 = comb.icmp bin ne %45, %59 : i1
      %61 = llhd.prb %writer_write_valid_i_9 : !hw.inout<i1>
      %62 = comb.icmp bin ne %46, %61 : i1
      %63 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      %64 = comb.icmp bin ne %47, %63 : i1
      %65 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      %66 = comb.icmp bin ne %48, %65 : i1
      %67 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      %68 = comb.icmp bin ne %49, %67 : i1
      %69 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
      %70 = comb.icmp bin ne %50, %69 : i1
      %71 = comb.or bin %52, %54, %56, %58, %60, %62, %64, %66, %68, %70 : i1
      cf.cond_br %71, ^bb3, ^bb1
    ^bb3:  // pred: ^bb2
      %72 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      llhd.drv %ctrl_state_d, %72 after %1 : !hw.inout<i3>
      llhd.drv %mbx_state_error_o, %false after %1 : !hw.inout<i1>
      %73 = llhd.prb %hostif_abort_ack_i_3 : !hw.inout<i1>
      cf.cond_br %73, ^bb4, ^bb5
    ^bb4:  // pred: ^bb3
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb5:  // pred: ^bb3
      %74 = llhd.prb %ctrl_state_q : !hw.inout<i3>
      %75 = comb.icmp ceq %74, %c0_i3 : i3
      cf.cond_br %75, ^bb6, ^bb12
    ^bb6:  // pred: ^bb5
      %76 = llhd.prb %mbx_range_valid_i_2 : !hw.inout<i1>
      %77 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      %78 = comb.and %76, %77 : i1
      cf.cond_br %78, ^bb7, ^bb8
    ^bb7:  // pred: ^bb6
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb8
    ^bb8:  // 2 preds: ^bb6, ^bb7
      %79 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %79, ^bb9, ^bb10
    ^bb9:  // pred: ^bb8
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb10:  // pred: ^bb8
      %80 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %80, ^bb11, ^bb1
    ^bb11:  // pred: ^bb10
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb12:  // pred: ^bb5
      %81 = comb.icmp ceq %74, %c1_i3 : i3
      cf.cond_br %81, ^bb13, ^bb21
    ^bb13:  // pred: ^bb12
      %82 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %82, ^bb14, ^bb15
    ^bb14:  // pred: ^bb13
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb15:  // pred: ^bb13
      %83 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %83, ^bb16, ^bb17
    ^bb16:  // pred: ^bb15
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb17:  // pred: ^bb15
      %84 = llhd.prb %writer_close_mbx_i_7 : !hw.inout<i1>
      cf.cond_br %84, ^bb18, ^bb1
    ^bb18:  // pred: ^bb17
      %85 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      cf.cond_br %85, ^bb19, ^bb20
    ^bb19:  // pred: ^bb18
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb20:  // pred: ^bb18
      llhd.drv %ctrl_state_d, %c2_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb21:  // pred: ^bb12
      %86 = comb.icmp ceq %74, %c2_i3 : i3
      cf.cond_br %86, ^bb22, ^bb28
    ^bb22:  // pred: ^bb21
      %87 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %87, ^bb23, ^bb24
    ^bb23:  // pred: ^bb22
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb24:  // pred: ^bb22
      %88 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %88, ^bb25, ^bb26
    ^bb25:  // pred: ^bb24
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb26:  // pred: ^bb24
      %89 = llhd.prb %writer_last_word_written_i_8 : !hw.inout<i1>
      cf.cond_br %89, ^bb27, ^bb1
    ^bb27:  // pred: ^bb26
      llhd.drv %ctrl_state_d, %c3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb28:  // pred: ^bb21
      %90 = comb.icmp ceq %74, %c3_i3 : i3
      cf.cond_br %90, ^bb29, ^bb35
    ^bb29:  // pred: ^bb28
      %91 = llhd.prb %mbx_error_set_i_4 : !hw.inout<i1>
      cf.cond_br %91, ^bb30, ^bb31
    ^bb30:  // pred: ^bb29
      llhd.drv %ctrl_state_d, %c-4_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb31:  // pred: ^bb29
      %92 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %92, ^bb32, ^bb33
    ^bb32:  // pred: ^bb31
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb33:  // pred: ^bb31
      %93 = llhd.prb %sys_read_all_i_6 : !hw.inout<i1>
      cf.cond_br %93, ^bb34, ^bb1
    ^bb34:  // pred: ^bb33
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb35:  // pred: ^bb28
      %94 = comb.icmp ceq %74, %c-4_i3 : i3
      cf.cond_br %94, ^bb36, ^bb38
    ^bb36:  // pred: ^bb35
      %95 = llhd.prb %sysif_control_abort_set_i_5 : !hw.inout<i1>
      cf.cond_br %95, ^bb37, ^bb1
    ^bb37:  // pred: ^bb36
      llhd.drv %ctrl_state_d, %c-3_i3 after %1 : !hw.inout<i3>
      cf.br ^bb1
    ^bb38:  // pred: ^bb35
      %96 = comb.icmp ceq %74, %c-3_i3 : i3
      cf.cond_br %96, ^bb1, ^bb39
    ^bb39:  // pred: ^bb38
      llhd.drv %ctrl_state_d, %c0_i3 after %1 : !hw.inout<i3>
      llhd.drv %mbx_state_error_o, %true after %1 : !hw.inout<i1>
      cf.br ^bb1
    }
    llhd.process {
      %41 = comb.extract %c0_i32 from 0 : (i32) -> i1
      llhd.drv %_sv2v_0, %41 after %1 : !hw.inout<i1>
      llhd.halt
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
    %40 = llhd.prb %mbx_state_error_o : !hw.inout<i1>
    hw.output %18, %19, %20, %21, %38, %39, %28, %25, %40 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}
