module {
  hw.module @mbx_fsm_auto(in %clk : !seq.clock, in %rst_ni : i1, in %mbx_range_valid_i : i1, in %hostif_abort_ack_i : i1, in %mbx_error_set_i : i1, in %sysif_control_abort_set_i : i1, in %sys_read_all_i : i1, in %writer_close_mbx_i : i1, in %writer_last_word_written_i : i1, in %writer_write_valid_i : i1, out mbx_empty_o : i1, out mbx_write_o : i1, out mbx_read_o : i1, out mbx_sys_abort_o : i1, out mbx_ready_update_o : i1, out mbx_ready_o : i1, out mbx_irq_ready_o : i1, out mbx_irq_abort_o : i1, out mbx_state_error_o : i1) {
    %c1_i2 = hw.constant 1 : i2
    %true = hw.constant true
    %c2_i3 = hw.constant 2 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c3_i3 = hw.constant 3 : i3
    %c1_i3 = hw.constant 1 : i3
    %c0_i3 = hw.constant 0 : i3
    %aff_ctrl_state_q.q_o = hw.instance "aff_ctrl_state_q" @prim_flop(clk: %clk: !seq.clock, rst_ni: %rst_ni: i1, d_i: %83: i3) -> (q_o: i3) {sv.namehint = "ctrl_state_logic"}
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
    %16 = comb.icmp eq %aff_ctrl_state_q.q_o, %c0_i3 : i3
    %17 = comb.and %mbx_range_valid_i, %writer_close_mbx_i : i1
    %18 = comb.icmp eq %aff_ctrl_state_q.q_o, %c1_i3 : i3
    %19 = comb.icmp eq %aff_ctrl_state_q.q_o, %c2_i3 : i3
    %20 = comb.icmp eq %aff_ctrl_state_q.q_o, %c3_i3 : i3
    %21 = comb.mux %19, %writer_last_word_written_i, %sys_read_all_i : i1
    %22 = comb.mux %19, %c3_i3, %c0_i3 : i3
    %23 = comb.icmp eq %aff_ctrl_state_q.q_o, %c-4_i3 : i3
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
    %38 = comb.icmp eq %aff_ctrl_state_q.q_o, %c-3_i3 : i3
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
  hw.module private @prim_flop(in %clk : !seq.clock, in %rst_ni : i1, in %d_i : i3, out q_o : i3) {
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %1 = comb.xor %rst_ni, %true : i1
    %init = seq.initial() {
      %c0_i3_1 = hw.constant 0 : i3
      seq.yield %c0_i3_1 : i3
    } : () -> !seq.immutable<i3>
    %q_o = seq.compreg %d_i, %clk reset %1, %c0_i3 initial %init : i3
    hw.output %q_o : i3
  }
  hw.module @mbx_fsm_manual(in %in0 : i1, in %in1 : i1, in %in2 : i1, in %in3 : i1, in %in4 : i1, in %in5 : i1, in %in6 : i1, in %in7 : i1, out out0 : i1, out out1 : i1, out out2 : i1, out out3 : i1, out out4 : i1, out out5 : i1, out out6 : i1, out out7 : i1, out out8 : i1, in %clk : !seq.clock, in %rst : i1) {
    %c0_i3 = hw.constant 0 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %0 = seq.initial() {
      %c0_i3_37 = hw.constant 0 : i3
      seq.yield %c0_i3_37 : i3
    } : () -> !seq.immutable<i3>
    %state_reg = seq.compreg sym @state_reg %224, %clk reset %rst, %c0_i3 initial %0 : i3  
    %false = hw.constant false
    %true = hw.constant true
    %true_0 = hw.constant true
    %1 = comb.xor %in6, %true : i1
    %2 = comb.xor %in1, %true : i1
    %3 = comb.xor %in2, %true : i1
    %4 = comb.xor %in4, %true : i1
    %5 = comb.xor %in3, %true : i1
    %false_1 = hw.constant false
    %false_2 = hw.constant false
    %false_3 = hw.constant false
    %false_4 = hw.constant false
    %false_5 = hw.constant false
    %false_6 = hw.constant false
    %false_7 = hw.constant false
    %false_8 = hw.constant false
    %false_9 = hw.constant false
    %false_10 = hw.constant false
    %true_11 = hw.constant true
    %false_12 = hw.constant false
    %false_13 = hw.constant false
    %false_14 = hw.constant false
    %6 = comb.and %true_11, %in0 : i1
    %7 = comb.xor %false_14, %true : i1
    %8 = comb.and %2, %3, %in3 : i1
    %9 = comb.and %2, %in0, %in5, %3, %5 : i1
    %10 = comb.and %7, %8 : i1
    %11 = comb.and %9, %true : i1
    %12 = comb.and %true_11, %in0, %in5 : i1
    %13 = comb.and %false_13, %in4 : i1
    %14 = comb.or %in2, %in3, %in1, %13 : i1
    %15 = comb.or %12, %14 : i1
    %16 = comb.xor %14, %true : i1
    %17 = comb.icmp eq %state_reg, %c0_i3 : i3
    %18 = comb.mux %17, %6, %false_2 : i1
    %19 = comb.mux %17, %false_12, %false_3 : i1
    %20 = comb.mux %17, %false_13, %false_4 : i1
    %21 = comb.mux %17, %false_14, %false_5 : i1
    %22 = comb.mux %17, %15, %false_6 : i1
    %23 = comb.mux %17, %16, %false_7 : i1
    %24 = comb.mux %17, %11, %false_8 : i1
    %25 = comb.mux %17, %10, %false_9 : i1
    %26 = comb.mux %17, %false_1, %false_10 : i1
    %27 = comb.icmp eq %state_reg, %c0_i3 : i3
    %28 = comb.icmp eq %state_reg, %c0_i3 : i3
    %29 = comb.icmp eq %state_reg, %c0_i3 : i3
    %30 = comb.icmp eq %state_reg, %c0_i3 : i3
    %31 = comb.and %in0, %in5 : i1
    %32 = comb.icmp eq %state_reg, %c0_i3 : i3
    %33 = comb.mux %32, %c0_i3, %state_reg : i3
    %34 = comb.mux %31, %c3_i3, %c0_i3 : i3
    %35 = comb.and %31, %30 : i1
    %36 = comb.mux %30, %34, %33 : i3
    %37 = comb.mux %in3, %c-3_i3, %34 : i3
    %38 = comb.and %in3, %29 : i1
    %39 = comb.mux %29, %37, %36 : i3
    %40 = comb.mux %in2, %c-4_i3, %37 : i3
    %41 = comb.and %in2, %28 : i1
    %42 = comb.mux %28, %40, %39 : i3
    %43 = comb.mux %in1, %c0_i3, %40 : i3
    %44 = comb.and %in1, %27 : i1
    %45 = comb.mux %27, %43, %42 : i3
    %false_15 = hw.constant false
    %true_16 = hw.constant true
    %false_17 = hw.constant false
    %false_18 = hw.constant false
    %46 = comb.and %2, %3, %in3 : i1
    %47 = comb.and %2, %3, %5, %in5, %in6 : i1
    %48 = comb.and %false_15, %in0 : i1
    %49 = comb.xor %false_18, %true : i1
    %50 = comb.and %49, %46 : i1
    %51 = comb.and %false_17, %47 : i1
    %52 = comb.and %false_15, %in0, %in5 : i1
    %53 = comb.and %false_17, %in4 : i1
    %54 = comb.or %in2, %in3, %in1, %53 : i1
    %55 = comb.or %52, %54 : i1
    %56 = comb.xor %54, %true : i1
    %57 = comb.icmp eq %state_reg, %c1_i3 : i3
    %58 = comb.mux %57, %false, %18 : i1
    %59 = comb.mux %57, %true_16, %19 : i1
    %60 = comb.mux %57, %false, %20 : i1
    %61 = comb.mux %57, %false, %21 : i1
    %62 = comb.mux %57, %55, %22 : i1
    %63 = comb.mux %57, %56, %23 : i1
    %64 = comb.mux %57, %51, %24 : i1
    %65 = comb.mux %57, %50, %25 : i1
    %66 = comb.mux %57, %false, %26 : i1
    %67 = comb.icmp eq %state_reg, %c1_i3 : i3
    %68 = comb.icmp eq %state_reg, %c1_i3 : i3
    %69 = comb.icmp eq %state_reg, %c1_i3 : i3
    %70 = comb.icmp eq %state_reg, %c1_i3 : i3
    %71 = comb.and %in5, %in6 : i1
    %72 = comb.icmp eq %state_reg, %c1_i3 : i3
    %73 = comb.and %in5, %1 : i1
    %74 = comb.icmp eq %state_reg, %c1_i3 : i3
    %75 = comb.mux %74, %c1_i3, %45 : i3
    %76 = comb.mux %73, %c2_i3, %c1_i3 : i3
    %77 = comb.and %73, %72 : i1
    %78 = comb.mux %72, %76, %75 : i3
    %79 = comb.mux %71, %c3_i3, %76 : i3
    %80 = comb.and %71, %70 : i1
    %81 = comb.mux %70, %79, %78 : i3
    %82 = comb.mux %in3, %c-3_i3, %79 : i3
    %83 = comb.and %in3, %69 : i1
    %84 = comb.mux %69, %82, %81 : i3
    %85 = comb.mux %in2, %c-4_i3, %82 : i3
    %86 = comb.and %in2, %68 : i1
    %87 = comb.mux %68, %85, %84 : i3
    %88 = comb.mux %in1, %c0_i3, %85 : i3
    %89 = comb.and %in1, %67 : i1
    %90 = comb.mux %67, %88, %87 : i3
    %false_19 = hw.constant false
    %false_20 = hw.constant false
    %false_21 = hw.constant false
    %false_22 = hw.constant false
    %91 = comb.and %2, %3, %in3 : i1
    %92 = comb.and %2, %3, %5, %in6 : i1
    %93 = comb.and %false_19, %in0 : i1
    %94 = comb.xor %false_22, %true : i1
    %95 = comb.and %94, %91 : i1
    %96 = comb.and %false_21, %92 : i1
    %97 = comb.and %false_19, %in0, %in5 : i1
    %98 = comb.and %false_21, %in4 : i1
    %99 = comb.or %in2, %in3, %in1, %98 : i1
    %100 = comb.or %97, %99 : i1
    %101 = comb.xor %99, %true : i1
    %102 = comb.icmp eq %state_reg, %c2_i3 : i3
    %103 = comb.mux %102, %false, %58 : i1
    %104 = comb.mux %102, %false, %59 : i1
    %105 = comb.mux %102, %false, %60 : i1
    %106 = comb.mux %102, %false, %61 : i1
    %107 = comb.mux %102, %100, %62 : i1
    %108 = comb.mux %102, %101, %63 : i1
    %109 = comb.mux %102, %96, %64 : i1
    %110 = comb.mux %102, %95, %65 : i1
    %111 = comb.mux %102, %false, %66 : i1
    %112 = comb.icmp eq %state_reg, %c2_i3 : i3
    %113 = comb.icmp eq %state_reg, %c2_i3 : i3
    %114 = comb.icmp eq %state_reg, %c2_i3 : i3
    %115 = comb.icmp eq %state_reg, %c2_i3 : i3
    %116 = comb.icmp eq %state_reg, %c2_i3 : i3
    %117 = comb.mux %116, %c2_i3, %90 : i3
    %118 = comb.mux %in6, %c3_i3, %c2_i3 : i3
    %119 = comb.and %in6, %115 : i1
    %120 = comb.mux %115, %118, %117 : i3
    %121 = comb.mux %in3, %c-3_i3, %118 : i3
    %122 = comb.and %in3, %114 : i1
    %123 = comb.mux %114, %121, %120 : i3
    %124 = comb.mux %in2, %c-4_i3, %121 : i3
    %125 = comb.and %in2, %113 : i1
    %126 = comb.mux %113, %124, %123 : i3
    %127 = comb.mux %in1, %c0_i3, %124 : i3
    %128 = comb.and %in1, %112 : i1
    %129 = comb.mux %112, %127, %126 : i3
    %false_23 = hw.constant false
    %false_24 = hw.constant false
    %true_25 = hw.constant true
    %false_26 = hw.constant false
    %130 = comb.and %2, %3, %in3 : i1
    %131 = comb.and %2, %3, %5, %4 : i1
    %132 = comb.and %false_23, %in0 : i1
    %133 = comb.xor %false_26, %true : i1
    %134 = comb.and %133, %130 : i1
    %135 = comb.and %false, %131 : i1
    %136 = comb.and %false_23, %in0, %in5 : i1
    %137 = comb.and %true_25, %in4 : i1
    %138 = comb.or %in2, %in3, %in1, %137 : i1
    %139 = comb.or %136, %138 : i1
    %140 = comb.xor %138, %true : i1
    %141 = comb.icmp eq %state_reg, %c3_i3 : i3
    %142 = comb.mux %141, %false, %103 : i1
    %143 = comb.mux %141, %false, %104 : i1
    %144 = comb.mux %141, %true_25, %105 : i1
    %145 = comb.mux %141, %false, %106 : i1
    %146 = comb.mux %141, %139, %107 : i1
    %147 = comb.mux %141, %140, %108 : i1
    %148 = comb.mux %141, %135, %109 : i1
    %149 = comb.mux %141, %134, %110 : i1
    %150 = comb.mux %141, %false, %111 : i1
    %151 = comb.icmp eq %state_reg, %c3_i3 : i3
    %152 = comb.icmp eq %state_reg, %c3_i3 : i3
    %153 = comb.icmp eq %state_reg, %c3_i3 : i3
    %154 = comb.icmp eq %state_reg, %c3_i3 : i3
    %155 = comb.icmp eq %state_reg, %c3_i3 : i3
    %156 = comb.mux %155, %c3_i3, %129 : i3
    %157 = comb.mux %in4, %c0_i3, %c3_i3 : i3
    %158 = comb.and %in4, %154 : i1
    %159 = comb.mux %154, %157, %156 : i3
    %160 = comb.mux %in3, %c-3_i3, %157 : i3
    %161 = comb.and %in3, %153 : i1
    %162 = comb.mux %153, %160, %159 : i3
    %163 = comb.mux %in2, %c-4_i3, %160 : i3
    %164 = comb.and %in2, %152 : i1
    %165 = comb.mux %152, %163, %162 : i3
    %166 = comb.mux %in1, %c0_i3, %163 : i3
    %167 = comb.and %in1, %151 : i1
    %168 = comb.mux %151, %166, %165 : i3
    %false_27 = hw.constant false
    %false_28 = hw.constant false
    %false_29 = hw.constant false
    %false_30 = hw.constant false
    %169 = comb.and %2, %in3 : i1
    %false_31 = hw.constant false
    %170 = comb.and %false_27, %in0 : i1
    %171 = comb.xor %false_30, %true : i1
    %172 = comb.and %171, %169 : i1
    %173 = comb.and %false_29, %false_31 : i1
    %174 = comb.and %false_27, %in0, %in5 : i1
    %175 = comb.and %false_29, %in4 : i1
    %176 = comb.or %in2, %in3, %in1, %175 : i1
    %177 = comb.or %174, %176 : i1
    %178 = comb.xor %176, %true : i1
    %179 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %180 = comb.mux %179, %false, %142 : i1
    %181 = comb.mux %179, %false, %143 : i1
    %182 = comb.mux %179, %false, %144 : i1
    %183 = comb.mux %179, %false, %145 : i1
    %184 = comb.mux %179, %177, %146 : i1
    %185 = comb.mux %179, %178, %147 : i1
    %186 = comb.mux %179, %false, %148 : i1
    %187 = comb.mux %179, %172, %149 : i1
    %188 = comb.mux %179, %false, %150 : i1
    %189 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %190 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %191 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %192 = comb.mux %191, %c-4_i3, %168 : i3
    %193 = comb.mux %in3, %c-3_i3, %c-4_i3 : i3
    %194 = comb.and %in3, %190 : i1
    %195 = comb.mux %190, %193, %192 : i3
    %196 = comb.mux %in1, %c0_i3, %193 : i3
    %197 = comb.and %in1, %189 : i1
    %198 = comb.mux %189, %196, %195 : i3
    %false_32 = hw.constant false
    %false_33 = hw.constant false
    %false_34 = hw.constant false
    %true_35 = hw.constant true
    %199 = comb.and %2 : i1
    %false_36 = hw.constant false
    %200 = comb.and %false_32, %in0 : i1
    %201 = comb.xor %true_35, %true : i1
    %202 = comb.and %201, %199 : i1
    %203 = comb.and %false_34, %false_36 : i1
    %204 = comb.and %false_32, %in0, %in5 : i1
    %205 = comb.and %false_34, %in4 : i1
    %206 = comb.or %in2, %in3, %in1, %205 : i1
    %207 = comb.or %204, %206 : i1
    %208 = comb.xor %206, %true : i1
    %209 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %210 = comb.mux %209, %false, %180 : i1
    %211 = comb.mux %209, %false, %181 : i1
    %212 = comb.mux %209, %false, %182 : i1
    %213 = comb.mux %209, %true_35, %183 : i1
    %214 = comb.mux %209, %207, %184 : i1
    %215 = comb.mux %209, %208, %185 : i1
    %216 = comb.mux %209, %false, %186 : i1
    %217 = comb.mux %209, %false, %187 : i1
    %218 = comb.mux %209, %false, %188 : i1
    %219 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %220 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %221 = comb.mux %220, %c-3_i3, %198 : i3
    %222 = comb.mux %in1, %c0_i3, %c-3_i3 : i3
    %223 = comb.and %in1, %219 : i1
    %224 = comb.mux %219, %222, %221 : i3
    hw.output %210, %211, %212, %213, %214, %215, %216, %217, %218 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }

 hw.module @miter ( in %clk: !seq.clock,  in %d0: i1, in %d1: i1, in %d2: i1, in %d3: i1, in %d4: i1, in %d5: i1, in %d6: i1, in %d7: i1) {
    %rst = hw.constant false
    %true = hw.constant true
    %rst_ni = comb.xor %rst, %true : i1

    %ao1, %ao2, %ao3, %ao4, %ao5, %ao6, %ao7, %ao8, %ao9 = hw.instance "auto_fsm" @mbx_fsm_auto(
        clk: %clk: !seq.clock, rst_ni: %rst_ni: i1,
        mbx_range_valid_i: %d0: i1, hostif_abort_ack_i: %d1: i1,
        mbx_error_set_i: %d2: i1, sysif_control_abort_set_i: %d3: i1,
        sys_read_all_i: %d4: i1, writer_close_mbx_i: %d5: i1,
        writer_last_word_written_i: %d6: i1, writer_write_valid_i: %d7: i1
      ) -> (mbx_empty_o : i1, mbx_write_o : i1, mbx_read_o : i1, mbx_sys_abort_o : i1, mbx_ready_update_o : i1, mbx_ready_o : i1, mbx_irq_ready_o : i1, mbx_irq_abort_o : i1, mbx_state_error_o : i1)

    %mo1, %mo2, %mo3, %mo4, %mo5, %mo6, %mo7, %mo8, %mo9= hw.instance "manual_fsm" @mbx_fsm_manual(
        in0: %d0: i1, in1: %d1: i1, in2: %d2: i1, in3: %d3: i1,
        in4: %d4: i1, in5: %d5: i1, in6: %d6: i1, in7: %d7: i1,
        clk: %clk: !seq.clock, rst: %rst: i1
      ) -> ( out0 : i1, out1 : i1, out2 : i1, out3 : i1, out4 : i1, out5 : i1, out6 : i1, out7 : i1, out8 : i1)


    %eq1 = comb.icmp eq %ao1, %mo1 : i1
    %eq2 = comb.icmp eq %ao2, %mo2 : i1
    %eq3 = comb.icmp eq %ao3, %mo3 : i1
    %eq4 = comb.icmp eq %ao4, %mo4 : i1
    %eq5 = comb.icmp eq %ao5, %mo5 : i1
    %eq6 = comb.icmp eq %ao6, %mo6 : i1
    %eq7 = comb.icmp eq %ao7, %mo7 : i1
    %eq8 = comb.icmp eq %ao8, %mo8 : i1
    %eq9 = comb.icmp eq %ao9, %mo9 : i1


    //verif.assert %eq1 : i1
    // verif.assert %eq2 : i1
    //verif.assert %eq3 : i1
    //verif.assert %eq4 : i1
    //verif.assert %eq5 : i1
    //verif.assert %eq6 : i1
    //verif.assert %eq7 : i1 // can be violated
    // verif.assert %eq8 : i1
    //verif.assert %eq9 : i1
    %outputs_are_equal = comb.and %eq1, %eq2, %eq3, %eq4, %eq5, %eq6, %eq7, %eq8, %eq9 : i1
    verif.assert %outputs_are_equal : i1
    hw.output
  }

}
