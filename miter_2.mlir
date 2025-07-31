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
  hw.module @mbx_fsm_manual(in %in1 : i1, in %in2 : i1, in %in3 : i1, in %in4 : i1, in %in5 : i1, in %in6 : i1, in %in7 : i1, in %in8 : i1, out out0 : i1, out out1 : i1, out out2 : i1, out out3 : i1, out out4 : i1, out out5 : i1, out out6 : i1, out out7 : i1, out out8 : i1, in %clk : !seq.clock, in %rst : i1) {
 %false = hw.constant false
  %true = hw.constant true
    %c0_i2 = hw.constant 0 : i2
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %0 = seq.initial() {
      %c-1_i2_11 = hw.constant -1 : i2
      seq.yield %c-1_i2_11 : i2
    } : () -> !seq.immutable<i2>
    %state_reg = seq.compreg sym @state_reg %210, %clk reset %rst, %c-1_i2 initial %0 : i2  
    %true_0 = hw.constant true
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
    %1 = comb.or %in3, %in4, %in2 : i1
    %2 = comb.xor %1, %true_0 : i1
    %3 = comb.icmp eq %state_reg, %c0_i2 : i2
    %4 = comb.mux %3, %false_1, %false_2 : i1
    %5 = comb.mux %3, %false_1, %false_3 : i1
    %6 = comb.mux %3, %false_1, %false_4 : i1
    %7 = comb.mux %3, %true_0, %false_5 : i1
    %8 = comb.mux %3, %1, %false_6 : i1
    %9 = comb.mux %3, %2, %false_7 : i1
    %10 = comb.mux %3, %false_1, %false_8 : i1
    %11 = comb.mux %3, %false_1, %false_9 : i1
    %12 = comb.mux %3, %false_1, %false_10 : i1
    %13 = comb.icmp eq %state_reg, %c0_i2 : i2
    %14 = comb.xor %in2, %true_0 : i1
    %15 = comb.icmp eq %state_reg, %c0_i2 : i2
    %16 = comb.icmp eq %state_reg, %c0_i2 : i2
    %17 = comb.mux %16, %c0_i2, %state_reg : i2
    %18 = comb.mux %in2, %c-1_i2, %c0_i2 : i2
    %19 = comb.and %in2, %15 : i1
    %20 = comb.mux %15, %18, %17 : i2
    %21 = comb.mux %14, %c0_i2, %18 : i2
    %22 = comb.and %14, %13 : i1
    %23 = comb.mux %13, %21, %20 : i2
    %24 = comb.or %in3, %in4, %in2 : i1
    %25 = comb.xor %24, %true_0 : i1
    %26 = comb.xor %in2, %true_0 : i1
    %27 = comb.and %26, %26, %in4 : i1
    %28 = comb.icmp eq %state_reg, %c1_i2 : i2
    %29 = comb.mux %28, %false_1, %4 : i1
    %30 = comb.mux %28, %false_1, %5 : i1
    %31 = comb.mux %28, %false_1, %6 : i1
    %32 = comb.mux %28, %false_1, %7 : i1
    %33 = comb.mux %28, %24, %8 : i1
    %34 = comb.mux %28, %25, %9 : i1
    %35 = comb.mux %28, %false_1, %10 : i1
    %36 = comb.mux %28, %27, %11 : i1
    %37 = comb.mux %28, %false_1, %12 : i1
    %38 = comb.icmp eq %state_reg, %c1_i2 : i2
    %39 = comb.xor %in2, %true_0 : i1
    %40 = comb.and %39, %39, %in4 : i1
    %41 = comb.icmp eq %state_reg, %c1_i2 : i2
    %42 = comb.xor %in2, %true_0 : i1
    %43 = comb.xor %in4, %true_0 : i1
    %44 = comb.and %42, %42, %43 : i1
    %45 = comb.icmp eq %state_reg, %c1_i2 : i2
    %46 = comb.icmp eq %state_reg, %c1_i2 : i2
    %47 = comb.mux %46, %c1_i2, %23 : i2
    %48 = comb.mux %in2, %c-1_i2, %c1_i2 : i2
    %49 = comb.and %in2, %45 : i1
    %50 = comb.mux %45, %48, %47 : i2
    %51 = comb.mux %44, %c1_i2, %48 : i2
    %52 = comb.and %44, %41 : i1
    %53 = comb.mux %41, %51, %50 : i2
    %54 = comb.mux %40, %c0_i2, %51 : i2
    %55 = comb.and %40, %38 : i1
    %56 = comb.mux %38, %54, %53 : i2
    %57 = comb.or %in3, %in4, %in2, %in5 : i1
    %58 = comb.xor %57, %true_0 : i1
    %59 = comb.xor %in3, %true_0 : i1
    %60 = comb.xor %in2, %true_0 : i1
    %61 = comb.and %59, %60 : i1
    %62 = comb.and %61, %in4 : i1
    %63 = comb.xor %62, %true_0 : i1
    %64 = comb.and %60, %in3 : i1
    %65 = comb.xor %64, %true_0 : i1
    %66 = comb.xor %in4, %true_0 : i1
    %67 = comb.and %66, %61 : i1
    %68 = comb.xor %67, %true_0 : i1
    %69 = comb.and %60, %68, %65, %63 : i1
    %70 = comb.and %60, %68, %65, %62 : i1
    %71 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %72 = comb.mux %71, %false_1, %29 : i1
    %73 = comb.mux %71, %false_1, %30 : i1
    %74 = comb.mux %71, %true_0, %31 : i1
    %75 = comb.mux %71, %false_1, %32 : i1
    %76 = comb.mux %71, %57, %33 : i1
    %77 = comb.mux %71, %58, %34 : i1
    %78 = comb.mux %71, %false_1, %35 : i1
    %79 = comb.mux %71, %70, %36 : i1
    %80 = comb.mux %71, %69, %37 : i1
    %81 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %82 = comb.xor %in3, %true_0 : i1
    %83 = comb.xor %in2, %true_0 : i1
    %84 = comb.and %82, %83 : i1
    %85 = comb.and %83, %in3 : i1
    %86 = comb.xor %in4, %true_0 : i1
    %87 = comb.and %86, %84 : i1
    %88 = comb.xor %85, %true_0 : i1
    %89 = comb.xor %87, %true_0 : i1
    %90 = comb.and %83, %89, %88, %84, %in4 : i1
    %91 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %92 = comb.xor %in3, %true_0 : i1
    %93 = comb.xor %in2, %true_0 : i1
    %94 = comb.xor %in4, %true_0 : i1
    %95 = comb.and %94, %92, %93 : i1
    %96 = comb.xor %95, %true_0 : i1
    %97 = comb.and %93, %96, %93, %in3 : i1
    %98 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %99 = comb.xor %in3, %true_0 : i1
    %100 = comb.xor %in2, %true_0 : i1
    %101 = comb.xor %in4, %true_0 : i1
    %102 = comb.xor %in5, %true_0 : i1
    %103 = comb.and %100, %101, %99, %100, %102 : i1
    %104 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %105 = comb.xor %in3, %true_0 : i1
    %106 = comb.xor %in2, %true_0 : i1
    %107 = comb.and %105, %106 : i1
    %108 = comb.and %107, %in4 : i1
    %109 = comb.and %106, %in3 : i1
    %110 = comb.xor %in4, %true_0 : i1
    %111 = comb.and %110, %107 : i1
    %112 = comb.xor %108, %true_0 : i1
    %113 = comb.xor %109, %true_0 : i1
    %114 = comb.and %113, %112 : i1
    %115 = comb.mux %111, %in5, %114 : i1
    %116 = comb.or %in2, %115 : i1
    %117 = comb.icmp eq %state_reg, %c-2_i2 : i2
    %118 = comb.mux %117, %c-2_i2, %56 : i2
    %119 = comb.mux %116, %c-1_i2, %c-2_i2 : i2
    %120 = comb.and %116, %104 : i1
    %121 = comb.mux %104, %119, %118 : i2
    %122 = comb.mux %103, %c-2_i2, %119 : i2
    %123 = comb.and %103, %98 : i1
    %124 = comb.mux %98, %122, %121 : i2
    %125 = comb.mux %97, %c1_i2, %122 : i2
    %126 = comb.and %97, %91 : i1
    %127 = comb.mux %91, %125, %124 : i2
    %128 = comb.mux %90, %c0_i2, %125 : i2
    %129 = comb.and %90, %81 : i1
    %130 = comb.mux %81, %128, %127 : i2
    %131 = comb.and %in1, %in6 {sv.namehint = "ombx_set_ready"} : i1
    %132 = comb.or %in3, %in4, %in2 : i1
    %133 = comb.or %131, %132 : i1
    %134 = comb.xor %132, %true_0 : i1
    %135 = comb.and %in1, %in6 : i1
    %136 = comb.xor %in3, %true_0 : i1
    %137 = comb.mux %136, %in4, %in5 : i1
    %138 = comb.xor %135, %true_0 : i1
    %139 = comb.or %in3, %138 : i1
    %140 = comb.xor %in2, %true_0 : i1
    %141 = comb.and %136, %140 : i1
    %142 = comb.xor %141, %true_0 : i1
    %143 = comb.and %140, %in3 : i1
    %144 = comb.xor %143, %true_0 : i1
    %145 = comb.and %140, %144, %142 : i1
    %146 = comb.and %140, %144, %141, %137 : i1
    %147 = comb.xor %139, %true_0 : i1
    %148 = comb.xor %137, %true_0 : i1
    %149 = comb.and %140, %144, %141, %148, %147 : i1
    %150 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %151 = comb.mux %150, %in1, %72 : i1
    %152 = comb.mux %150, %false_1, %73 : i1
    %153 = comb.mux %150, %false_1, %74 : i1
    %154 = comb.mux %150, %false_1, %75 : i1
    %155 = comb.mux %150, %133, %76 : i1
    %156 = comb.mux %150, %134, %77 : i1
    %157 = comb.mux %150, %149, %78 : i1
    %158 = comb.mux %150, %146, %79 : i1
    %159 = comb.mux %150, %145, %80 : i1
    %160 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %161 = comb.xor %in3, %true_0 : i1
    %162 = comb.mux %161, %in4, %in5 : i1
    %163 = comb.xor %in2, %true_0 : i1
    %164 = comb.and %163, %in3 : i1
    %165 = comb.xor %164, %true_0 : i1
    %166 = comb.and %163, %165, %161, %163, %162 : i1
    %167 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %168 = comb.xor %in2, %true_0 : i1
    %169 = comb.and %168, %168, %in3 : i1
    %170 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %171 = comb.and %in1, %in6 : i1
    %172 = comb.xor %in3, %true_0 : i1
    %173 = comb.mux %172, %in4, %in5 : i1
    %174 = comb.xor %171, %true_0 : i1
    %175 = comb.or %in3, %174 : i1
    %176 = comb.xor %in2, %true_0 : i1
    %177 = comb.and %176, %in3 : i1
    %178 = comb.xor %175, %true_0 : i1
    %179 = comb.xor %173, %true_0 : i1
    %180 = comb.xor %177, %true_0 : i1
    %181 = comb.and %176, %180, %172, %176, %179, %178 : i1
    %182 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %183 = comb.and %in1, %in6 : i1
    %184 = comb.xor %in3, %true_0 : i1
    %185 = comb.mux %184, %in4, %in5 : i1
    %186 = comb.xor %183, %true_0 : i1
    %187 = comb.xor %in2, %true_0 : i1
    %188 = comb.and %184, %187 : i1
    %189 = comb.and %187, %in3 : i1
    %190 = comb.xor %185, %true_0 : i1
    %191 = comb.and %190, %186 : i1
    %192 = comb.xor %188, %true_0 : i1
    %193 = comb.or %192, %191, %in3 : i1
    %194 = comb.xor %189, %true_0 : i1
    %195 = comb.and %194, %193 : i1
    %196 = comb.or %in2, %195 : i1
    %197 = comb.icmp eq %state_reg, %c-1_i2 : i2
    %198 = comb.mux %197, %c-1_i2, %130 : i2
    %199 = comb.mux %196, %c-1_i2, %c-1_i2 : i2
    %200 = comb.and %196, %182 : i1
    %201 = comb.mux %182, %199, %198 : i2
    %202 = comb.mux %181, %c-2_i2, %199 : i2
    %203 = comb.and %181, %170 : i1
    %204 = comb.mux %170, %202, %201 : i2
    %205 = comb.mux %169, %c1_i2, %202 : i2
    %206 = comb.and %169, %167 : i1
    %207 = comb.mux %167, %205, %204 : i2
    %208 = comb.mux %166, %c0_i2, %205 : i2
    %209 = comb.and %166, %160 : i1
    %210 = comb.mux %160, %208, %207 : i2
    hw.output %151, %152, %153, %154, %155, %156, %157, %158, %159 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }

 hw.module @miter ( in %clk: !seq.clock, in %rst : i1,  in %d0: i1, in %d1: i1, in %d2: i1, in %d3: i1, in %d4: i1, in %d5: i1, in %d6: i1, in %d7: i1) {
    // %rst = hw.constant false
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
        in1: %d0: i1, in2: %d1: i1, in3: %d2: i1, in4: %d3: i1,
        in5: %d4: i1, in6: %d5: i1, in7: %d6: i1, in8: %d7: i1,
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
