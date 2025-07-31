def trim(s):
    # Trim the outer 'module { ... }' wrapper to extract the inner content.
    return "\n".join(s.strip().split("\n")[1:-1])

with open("mbx_automatic_lowered.mlir", "r") as f:
  # Rename the module to avoid name collision.
  mbx_automatic_lowered = trim(f.read()).replace("@mbx_fsm", "@mbx_fsm_auto").replace("ceq", "eq")

with open("mbx_manual_lowered.mlir", "r") as f:
  # Rename the module to avoid name collision.
  mbx_manual_lowered = trim(f.read()).replace("@mbx_fsm", "@mbx_fsm_manual")

# The miter module will serve as the top-level entity for verification.
# It will instantiate both FSM versions and compare their outputs.
miter_circuit = """
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
"""

# --- Write the Final MLIR File ---

with open("miter_2.mlir", "w") as f:
    f.write("module {\n")
    f.write(mbx_automatic_lowered + "\n")
    f.write(mbx_manual_lowered + "\n")
    f.write(miter_circuit + "\n")
    f.write("}\n")

print("Successfully generated miter_2.mlir.")
