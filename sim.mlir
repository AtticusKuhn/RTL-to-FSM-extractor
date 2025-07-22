  hw.module @mbx_fsm(in %in0 : i1, in %in1 : i1, in %in2 : i1, in %in3 : i1, in %in4 : i1, in %in5 : i1, in %in6 : i1, in %in7 : i1, out out0 : i1, out out1 : i1, out out2 : i1, out out3 : i1, out out4 : i1, out out5 : i1, out out6 : i1, out out7 : i1, out out8 : i1, in %clk : !seq.clock, in %rst : i1) {
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
    %135 = comb.and %true_25, %131 : i1
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

func.func @entry() {
  %high = seq.const_clock high
  %low = seq.const_clock low
  %c1 = hw.constant 1 : i1
  %c0 = hw.constant 0 : i1
  arc.sim.instantiate @mbx_fsm as %model {
    arc.sim.set_input %model, "clk" = %high : !seq.clock, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "rst" = %c0 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in0" = %c1 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in1" = %c0 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in2" = %c1 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in3" = %c0 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in4" = %c0 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in5" = %c1 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in6" = %c0 : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.set_input %model, "in7" = %c0 : i1, !arc.sim.instance<@mbx_fsm>


    %out01 = arc.sim.get_port %model, "out0" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_empty_o", %out01 : i1
    %out11 = arc.sim.get_port %model, "out1" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_write_o", %out11 : i1
    %out21 = arc.sim.get_port %model, "out2" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_read_o", %out21 : i1
    %out31 = arc.sim.get_port %model, "out3" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_sys_abort_o", %out31 : i1
    %out41 = arc.sim.get_port %model, "out4" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_update_o", %out41 : i1
    %out51 = arc.sim.get_port %model, "out5" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_o", %out51 : i1
    %out61 = arc.sim.get_port %model, "out6" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_ready_o", %out61 : i1
    %out71 = arc.sim.get_port %model, "out7" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_abort_o", %out71 : i1
    %out81 = arc.sim.get_port %model, "out8" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_state_error_o", %out81 : i1

    arc.sim.step %model : !arc.sim.instance<@mbx_fsm>

    %out02 = arc.sim.get_port %model, "out0" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_empty_o", %out02 : i1
    %out12 = arc.sim.get_port %model, "out1" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_write_o", %out12 : i1
    %out22 = arc.sim.get_port %model, "out2" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_read_o", %out22 : i1
    %out32 = arc.sim.get_port %model, "out3" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_sys_abort_o", %out32 : i1
    %out42 = arc.sim.get_port %model, "out4" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_update_o", %out42 : i1
    %out52 = arc.sim.get_port %model, "out5" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_o", %out52 : i1
    %out62 = arc.sim.get_port %model, "out6" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_ready_o", %out62 : i1
    %out72 = arc.sim.get_port %model, "out7" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_abort_o", %out72 : i1
    %out82 = arc.sim.get_port %model, "out8" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_state_error_o", %out82 : i1

    arc.sim.set_input %model, "clk" = %low : !seq.clock, !arc.sim.instance<@mbx_fsm>
    arc.sim.step %model : !arc.sim.instance<@mbx_fsm>

    %out03 = arc.sim.get_port %model, "out0" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_empty_o", %out03 : i1
    %out13 = arc.sim.get_port %model, "out1" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_write_o", %out13 : i1
    %out23 = arc.sim.get_port %model, "out2" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_read_o", %out23 : i1
    %out33 = arc.sim.get_port %model, "out3" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_sys_abort_o", %out33 : i1
    %out43 = arc.sim.get_port %model, "out4" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_update_o", %out43 : i1
    %out53 = arc.sim.get_port %model, "out5" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_ready_o", %out53 : i1
    %out63 = arc.sim.get_port %model, "out6" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_ready_o", %out63 : i1
    %out73 = arc.sim.get_port %model, "out7" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_irq_abort_o", %out73 : i1
    %out83 = arc.sim.get_port %model, "out8" : i1, !arc.sim.instance<@mbx_fsm>
    arc.sim.emit "mbx_state_error_o", %out83 : i1


  }
  return
}
