module {
  hw.module @mbx_fsm(in %in0 : i1, in %in1 : i1, in %in2 : i1, in %in3 : i1, in %in4 : i1, in %in5 : i1, in %in6 : i1, in %in7 : i1, in %in8 : i1, out out0 : i1, out out1 : i1, out out2 : i1, out out3 : i1, out out4 : i1, out out5 : i1, out out6 : i1, out out7 : i1, out out8 : i1, in %clk : !seq.clock, in %rst : i1) {
    %c0_i3 = hw.constant 0 : i3
    %c1_i3 = hw.constant 1 : i3
    %c2_i3 = hw.constant 2 : i3
    %c3_i3 = hw.constant 3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-3_i3 = hw.constant -3 : i3
    %0 = seq.initial() {
      %c0_i3_13 = hw.constant 0 : i3
      seq.yield %c0_i3_13 : i3
    } : () -> !seq.immutable<i3>
    %state_reg = seq.compreg sym @state_reg %249, %clk reset %rst, %c0_i3 initial %0 : i3  
    %true = hw.constant true
    %false = hw.constant false
    %false_0 = hw.constant false
    %false_1 = hw.constant false
    %false_2 = hw.constant false
    %false_3 = hw.constant false
    %false_4 = hw.constant false
    %false_5 = hw.constant false
    %false_6 = hw.constant false
    %false_7 = hw.constant false
    %false_8 = hw.constant false
    %1 = comb.and %true, %in1 : i1
    %false_9 = hw.constant false
    %false_10 = hw.constant false
    %false_11 = hw.constant false
    %2 = comb.and %in0, %in1, %in6 : i1
    %3 = comb.and %in0, %in3 : i1
    %4 = comb.or %2, %3 : i1
    %5 = comb.icmp eq %3, %false : i1
    %6 = comb.and %in3, %false : i1
    %7 = comb.or %in4, %6 : i1
    %8 = comb.and %7, %true : i1
    %9 = comb.and %in0, %in1, %in6 : i1
    %10 = comb.and %in0, %in1, %in8 : i1
    %11 = comb.icmp eq %in0, %false : i1
    %12 = comb.and %11, %10 : i1
    %13 = comb.or %9, %12 : i1
    %14 = comb.and %13, %true : i1
    %false_12 = hw.constant false
    %15 = comb.icmp eq %state_reg, %c0_i3 : i3
    %16 = comb.mux %15, %1, %false_0 : i1
    %17 = comb.mux %15, %false_9, %false_1 : i1
    %18 = comb.mux %15, %false_10, %false_2 : i1
    %19 = comb.mux %15, %false_11, %false_3 : i1
    %20 = comb.mux %15, %4, %false_4 : i1
    %21 = comb.mux %15, %5, %false_5 : i1
    %22 = comb.mux %15, %14, %false_6 : i1
    %23 = comb.mux %15, %8, %false_7 : i1
    %24 = comb.mux %15, %false_12, %false_8 : i1
    %25 = comb.icmp eq %state_reg, %c0_i3 : i3
    %26 = comb.icmp eq %state_reg, %c0_i3 : i3
    %27 = comb.icmp eq %in2, %false : i1
    %28 = comb.and %27, %in3 : i1
    %29 = comb.icmp eq %state_reg, %c0_i3 : i3
    %30 = comb.icmp eq %in2, %false : i1
    %31 = comb.icmp eq %in3, %false : i1
    %32 = comb.and %30, %31, %in4 : i1
    %33 = comb.icmp eq %state_reg, %c0_i3 : i3
    %34 = comb.icmp eq %in2, %false : i1
    %35 = comb.and %in3, %in4 : i1
    %36 = comb.icmp eq %35, %false : i1
    %37 = comb.and %in0, %in1, %in6 : i1
    %38 = comb.and %34, %36, %37 : i1
    %39 = comb.icmp eq %state_reg, %c0_i3 : i3
    %40 = comb.icmp eq %in2, %false : i1
    %41 = comb.and %in3, %in4 : i1
    %42 = comb.icmp eq %41, %false : i1
    %43 = comb.icmp eq %in0, %false : i1
    %44 = comb.and %43, %in1, %in8 : i1
    %45 = comb.and %40, %42, %44 : i1
    %46 = comb.icmp eq %state_reg, %c0_i3 : i3
    %47 = comb.icmp eq %state_reg, %c0_i3 : i3
    %48 = comb.mux %47, %c0_i3, %state_reg : i3
    %49 = comb.mux %true, %c0_i3, %c0_i3 : i3
    %50 = comb.and %true, %46 : i1
    %51 = comb.mux %46, %49, %48 : i3
    %52 = comb.mux %45, %c1_i3, %49 : i3
    %53 = comb.and %45, %39 : i1
    %54 = comb.mux %39, %52, %51 : i3
    %55 = comb.mux %38, %c3_i3, %52 : i3
    %56 = comb.and %38, %33 : i1
    %57 = comb.mux %33, %55, %54 : i3
    %58 = comb.mux %32, %c-3_i3, %55 : i3
    %59 = comb.and %32, %29 : i1
    %60 = comb.mux %29, %58, %57 : i3
    %61 = comb.mux %28, %c-4_i3, %58 : i3
    %62 = comb.and %28, %26 : i1
    %63 = comb.mux %26, %61, %60 : i3
    %64 = comb.mux %in2, %c0_i3, %61 : i3
    %65 = comb.and %in2, %25 : i1
    %66 = comb.mux %25, %64, %63 : i3
    %67 = comb.icmp eq %state_reg, %c1_i3 : i3
    %68 = comb.mux %67, %false, %16 : i1
    %69 = comb.mux %67, %true, %17 : i1
    %70 = comb.mux %67, %false, %18 : i1
    %71 = comb.mux %67, %false, %19 : i1
    %72 = comb.mux %67, %false, %20 : i1
    %73 = comb.mux %67, %true, %21 : i1
    %74 = comb.mux %67, %false, %22 : i1
    %75 = comb.mux %67, %false, %23 : i1
    %76 = comb.mux %67, %false, %24 : i1
    %77 = comb.icmp eq %state_reg, %c1_i3 : i3
    %78 = comb.icmp eq %state_reg, %c1_i3 : i3
    %79 = comb.icmp eq %in2, %false : i1
    %80 = comb.and %79, %in3 : i1
    %81 = comb.icmp eq %state_reg, %c1_i3 : i3
    %82 = comb.icmp eq %in2, %false : i1
    %83 = comb.icmp eq %in3, %false : i1
    %84 = comb.and %82, %83, %in4 : i1
    %85 = comb.icmp eq %state_reg, %c1_i3 : i3
    %86 = comb.icmp eq %in2, %false : i1
    %87 = comb.icmp eq %in3, %false : i1
    %88 = comb.icmp eq %in4, %false : i1
    %89 = comb.and %in6, %in7 : i1
    %90 = comb.and %86, %87, %88, %89 : i1
    %91 = comb.icmp eq %state_reg, %c1_i3 : i3
    %92 = comb.icmp eq %in2, %false : i1
    %93 = comb.icmp eq %in3, %false : i1
    %94 = comb.icmp eq %in4, %false : i1
    %95 = comb.icmp eq %in7, %false : i1
    %96 = comb.and %in6, %95 : i1
    %97 = comb.and %92, %93, %94, %96 : i1
    %98 = comb.icmp eq %state_reg, %c1_i3 : i3
    %99 = comb.icmp eq %state_reg, %c1_i3 : i3
    %100 = comb.mux %99, %c1_i3, %66 : i3
    %101 = comb.mux %true, %c1_i3, %c1_i3 : i3
    %102 = comb.and %true, %98 : i1
    %103 = comb.mux %98, %101, %100 : i3
    %104 = comb.mux %97, %c2_i3, %101 : i3
    %105 = comb.and %97, %91 : i1
    %106 = comb.mux %91, %104, %103 : i3
    %107 = comb.mux %90, %c3_i3, %104 : i3
    %108 = comb.and %90, %85 : i1
    %109 = comb.mux %85, %107, %106 : i3
    %110 = comb.mux %84, %c-3_i3, %107 : i3
    %111 = comb.and %84, %81 : i1
    %112 = comb.mux %81, %110, %109 : i3
    %113 = comb.mux %80, %c-4_i3, %110 : i3
    %114 = comb.and %80, %78 : i1
    %115 = comb.mux %78, %113, %112 : i3
    %116 = comb.mux %in2, %c0_i3, %113 : i3
    %117 = comb.and %in2, %77 : i1
    %118 = comb.mux %77, %116, %115 : i3
    %119 = comb.icmp eq %state_reg, %c2_i3 : i3
    %120 = comb.mux %119, %false, %68 : i1
    %121 = comb.mux %119, %false, %69 : i1
    %122 = comb.mux %119, %false, %70 : i1
    %123 = comb.mux %119, %false, %71 : i1
    %124 = comb.mux %119, %false, %72 : i1
    %125 = comb.mux %119, %true, %73 : i1
    %126 = comb.mux %119, %false, %74 : i1
    %127 = comb.mux %119, %false, %75 : i1
    %128 = comb.mux %119, %false, %76 : i1
    %129 = comb.icmp eq %state_reg, %c2_i3 : i3
    %130 = comb.icmp eq %state_reg, %c2_i3 : i3
    %131 = comb.icmp eq %in2, %false : i1
    %132 = comb.and %131, %in3 : i1
    %133 = comb.icmp eq %state_reg, %c2_i3 : i3
    %134 = comb.icmp eq %in2, %false : i1
    %135 = comb.icmp eq %in3, %false : i1
    %136 = comb.and %134, %135, %in4 : i1
    %137 = comb.icmp eq %state_reg, %c2_i3 : i3
    %138 = comb.icmp eq %in2, %false : i1
    %139 = comb.icmp eq %in3, %false : i1
    %140 = comb.icmp eq %in4, %false : i1
    %141 = comb.and %138, %139, %140, %in7 : i1
    %142 = comb.icmp eq %state_reg, %c2_i3 : i3
    %143 = comb.icmp eq %state_reg, %c2_i3 : i3
    %144 = comb.mux %143, %c2_i3, %118 : i3
    %145 = comb.mux %true, %c2_i3, %c2_i3 : i3
    %146 = comb.and %true, %142 : i1
    %147 = comb.mux %142, %145, %144 : i3
    %148 = comb.mux %141, %c3_i3, %145 : i3
    %149 = comb.and %141, %137 : i1
    %150 = comb.mux %137, %148, %147 : i3
    %151 = comb.mux %136, %c-3_i3, %148 : i3
    %152 = comb.and %136, %133 : i1
    %153 = comb.mux %133, %151, %150 : i3
    %154 = comb.mux %132, %c-4_i3, %151 : i3
    %155 = comb.and %132, %130 : i1
    %156 = comb.mux %130, %154, %153 : i3
    %157 = comb.mux %in2, %c0_i3, %154 : i3
    %158 = comb.and %in2, %129 : i1
    %159 = comb.mux %129, %157, %156 : i3
    %160 = comb.and %in0, %in3 : i1
    %161 = comb.and %in0, %160 : i1
    %162 = comb.icmp eq %160, %false : i1
    %163 = comb.icmp eq %state_reg, %c3_i3 : i3
    %164 = comb.mux %163, %false, %120 : i1
    %165 = comb.mux %163, %false, %121 : i1
    %166 = comb.mux %163, %true, %122 : i1
    %167 = comb.mux %163, %false, %123 : i1
    %168 = comb.mux %163, %161, %124 : i1
    %169 = comb.mux %163, %162, %125 : i1
    %170 = comb.mux %163, %false, %126 : i1
    %171 = comb.mux %163, %false, %127 : i1
    %172 = comb.mux %163, %false, %128 : i1
    %173 = comb.icmp eq %state_reg, %c3_i3 : i3
    %174 = comb.icmp eq %state_reg, %c3_i3 : i3
    %175 = comb.icmp eq %in2, %false : i1
    %176 = comb.and %175, %in3 : i1
    %177 = comb.icmp eq %state_reg, %c3_i3 : i3
    %178 = comb.icmp eq %in2, %false : i1
    %179 = comb.icmp eq %in3, %false : i1
    %180 = comb.and %178, %179, %in4 : i1
    %181 = comb.icmp eq %state_reg, %c3_i3 : i3
    %182 = comb.icmp eq %in2, %false : i1
    %183 = comb.icmp eq %in3, %false : i1
    %184 = comb.icmp eq %in4, %false : i1
    %185 = comb.and %182, %183, %184, %in5 : i1
    %186 = comb.icmp eq %state_reg, %c3_i3 : i3
    %187 = comb.icmp eq %state_reg, %c3_i3 : i3
    %188 = comb.mux %187, %c3_i3, %159 : i3
    %189 = comb.mux %true, %c3_i3, %c3_i3 : i3
    %190 = comb.and %true, %186 : i1
    %191 = comb.mux %186, %189, %188 : i3
    %192 = comb.mux %185, %c0_i3, %189 : i3
    %193 = comb.and %185, %181 : i1
    %194 = comb.mux %181, %192, %191 : i3
    %195 = comb.mux %180, %c-3_i3, %192 : i3
    %196 = comb.and %180, %177 : i1
    %197 = comb.mux %177, %195, %194 : i3
    %198 = comb.mux %176, %c-4_i3, %195 : i3
    %199 = comb.and %176, %174 : i1
    %200 = comb.mux %174, %198, %197 : i3
    %201 = comb.mux %in2, %c0_i3, %198 : i3
    %202 = comb.and %in2, %173 : i1
    %203 = comb.mux %173, %201, %200 : i3
    %204 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %205 = comb.mux %204, %false, %164 : i1
    %206 = comb.mux %204, %false, %165 : i1
    %207 = comb.mux %204, %false, %166 : i1
    %208 = comb.mux %204, %false, %167 : i1
    %209 = comb.mux %204, %false, %168 : i1
    %210 = comb.mux %204, %false, %169 : i1
    %211 = comb.mux %204, %false, %170 : i1
    %212 = comb.mux %204, %false, %171 : i1
    %213 = comb.mux %204, %false, %172 : i1
    %214 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %215 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %216 = comb.icmp eq %in2, %false : i1
    %217 = comb.and %216, %in4 : i1
    %218 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %219 = comb.icmp eq %state_reg, %c-4_i3 : i3
    %220 = comb.mux %219, %c-4_i3, %203 : i3
    %221 = comb.mux %true, %c-4_i3, %c-4_i3 : i3
    %222 = comb.and %true, %218 : i1
    %223 = comb.mux %218, %221, %220 : i3
    %224 = comb.mux %217, %c-3_i3, %221 : i3
    %225 = comb.and %217, %215 : i1
    %226 = comb.mux %215, %224, %223 : i3
    %227 = comb.mux %in2, %c0_i3, %224 : i3
    %228 = comb.and %in2, %214 : i1
    %229 = comb.mux %214, %227, %226 : i3
    %230 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %231 = comb.mux %230, %false, %205 : i1
    %232 = comb.mux %230, %false, %206 : i1
    %233 = comb.mux %230, %false, %207 : i1
    %234 = comb.mux %230, %true, %208 : i1
    %235 = comb.mux %230, %false, %209 : i1
    %236 = comb.mux %230, %false, %210 : i1
    %237 = comb.mux %230, %false, %211 : i1
    %238 = comb.mux %230, %false, %212 : i1
    %239 = comb.mux %230, %false, %213 : i1
    %240 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %241 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %242 = comb.icmp eq %state_reg, %c-3_i3 : i3
    %243 = comb.mux %242, %c-3_i3, %229 : i3
    %244 = comb.mux %true, %c-3_i3, %c-3_i3 : i3
    %245 = comb.and %true, %241 : i1
    %246 = comb.mux %241, %244, %243 : i3
    %247 = comb.mux %in2, %c0_i3, %244 : i3
    %248 = comb.and %in2, %240 : i1
    %249 = comb.mux %240, %247, %246 : i3
    hw.output %231, %232, %233, %234, %235, %236, %237, %238, %239 : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

