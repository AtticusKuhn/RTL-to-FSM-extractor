#!/usr/bin/env sh

circt-opt --convert-fsm-to-core manual.mlir -o mbx_manual_lowered.mlir
circt-verilog ../opentitan/hw/ip/mbx/rtl/mbx_fsm.sv -I ../opentitan/hw/ip/prim/rtl/  -y ../opentitan/hw/ip/prim_generic/rtl -o mbx_automatic_lowered.mlir
python3 make_verif.py
circt-opt --hw-flatten-modules miter_2.mlir > flattened_miter.mlir
circt-opt flattened_miter.mlir
circt-bmc flattened_miter.mlir --module=miter -b 10 --shared-libs=/usr/lib/x86_64-linux-gnu/libz3.so --print-solver-output
