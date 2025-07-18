def trim(s):
    # Trim the outer 'module { ... }' wrapper to extract the inner content.
    return "\n".join(s.split("\n")[1:-1])

# --- Read and Prepare the Module Definitions ---

with open("mbx_automatic_lowered.mlir", "r") as f:
  # Rename the module to avoid name collision.
  mbx_automatic_lowered = trim(f.read()).replace("@mbx_fsm", "@mbx_fsm_auto")

with open("mbx_manual_lowered.mlir", "r") as f:
  # Rename the module to avoid name collision.
  mbx_manual_lowered = trim(f.read()).replace("@mbx_fsm", "@mbx_fsm_manual")

# --- Define the Miter Circuit in MLIR ---

# The miter module will serve as the top-level entity for verification.
# It will instantiate both FSM versions and compare their outputs.
miter_circuit = """
  // Miter Top Module: A circuit to check for functional equivalence.
  hw.module @miter(
      // --- Inputs for both modules ---
      // We take the superset of inputs from the 'auto' version.
      in %clk: !seq.clock,
      in %rst: i1, // Using active-high reset convention for the miter.
      in %d0: i1, in %d1: i1, in %d2: i1, in %d3: i1,
      in %d4: i1, in %d5: i1, in %d6: i1, in %d7: i1,
      in %d8: i1, in %d9: i1) {

    %true = hw.constant true

    // --- 1. Instantiate the Automatic FSM ---
    // We need to adapt our miter's clock and reset to what this module expects.
    %clk_i1 = seq.from_clock %clk : i1 // Convert !seq.clock to i1
    %rst_ni = comb.xor %rst, %true : i1 // Convert active-high reset to active-low

    %auto_outs = hw.instance "auto_fsm" @mbx_fsm_auto(
        clk_i: %clk_i1: i1, rst_ni: %rst_ni: i1,
        mbx_range_valid_i: %d0: i1, hostif_abort_ack_i: %d1: i1,
        mbx_error_set_i: %d2: i1, sysif_control_abort_set_i: %d3: i1,
        sys_read_all_i: %d4: i1, writer_close_mbx_i: %d5: i1,
        writer_last_word_written_i: %d6: i1, writer_write_valid_i: %d7: i1,
        // NOTE: These inputs are not connected to the manual FSM.
        // This is based on the assumption from the interface mismatch.
        // The original source MLIR had more inputs/outputs than the manual one.
        // It's likely that these are derived from different sources.
        // Let's assume the first 8 inputs correspond for this example.
        // The original `mbx_automatic_lowered.mlir` has 9 outputs, but the module signature
        // indicates 10 inputs besides clock and reset. We will map d8 and d9 to unused
        // inputs to satisfy the signature if needed, but the provided MLIR has
        // 10 data inputs. So let's map d0..d9. It seems there was a miscount
        // in your original module signature, but this should be robust.
        // We will only connect d0..d7 to the manual version.
        // A deeper look shows the last two inputs were not present in the manual one.
        // Let's check the automatic module signature again.
        // It has 10 inputs plus clk/rst. Let's provide them.
        // The number of outputs is 9 for both.
        %d8: i1, %d9: i1
      ) -> (o0: i1, o1: i1, o2: i1, o3: i1, o4: i1, o5: i1, o6: i1, o7: i1, o8: i1)

    // --- 2. Instantiate the Manual FSM ---
    // This module uses the miter's clock and reset directly.
    // We only connect the first 8 inputs as per its signature.
    %manual_outs = hw.instance "manual_fsm" @mbx_fsm_manual(
        in0: %d0: i1, in1: %d1: i1, in2: %d2: i1, in3: %d3: i1,
        in4: %d4: i1, in5: %d5: i1, in6: %d6: i1, in7: %d7: i1,
        clk: %clk: !seq.clock, rst: %rst: i1
      ) -> (o0: i1, o1: i1, o2: i1, o3: i1, o4: i1, o5: i1, o6: i1, o7: i1, o8: i1)


    // --- 3. Compare All Outputs ---
    // XOR each pair of corresponding outputs. The result is 1 if they differ.
    %diff0 = comb.xor %auto_outs.o0, %manual_outs.o0 : i1
    %diff1 = comb.xor %auto_outs.o1, %manual_outs.o1 : i1
    %diff2 = comb.xor %auto_outs.o2, %manual_outs.o2 : i1
    %diff3 = comb.xor %auto_outs.o3, %manual_outs.o3 : i1
    %diff4 = comb.xor %auto_outs.o4, %manual_outs.o4 : i1
    %diff5 = comb.xor %auto_outs.o5, %manual_outs.o5 : i1
    %diff6 = comb.xor %auto_outs.o6, %manual_outs.o6 : i1
    %diff7 = comb.xor %auto_outs.o7, %manual_outs.o7 : i1
    %diff8 = comb.xor %auto_outs.o8, %manual_outs.o8 : i1

    // OR all differences together. If this is 1, an error occurred.
    %any_diff = comb.or %diff0, %diff1, %diff2, %diff3, %diff4, %diff5, %diff6, %diff7, %diff8 : i1

    // --- 4. Assert Equivalence ---
    // We want to assert that 'any_diff' is always 0.
    // Since verif.assert checks for 1, we assert (NOT any_diff).
    %outputs_are_equal = comb.xor %any_diff, %true : i1
    verif.assert %outputs_are_equal : i1
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
