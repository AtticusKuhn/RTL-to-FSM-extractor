#!/usr/bin/env sh

circt-opt --convert-fsm-to-core mbx.mlir -o mbx_manual_lowered.mlir
circt-verilog ../opentitan/hw/ip/mbx/rtl/mbx_fsm.sv -I ../opentitan/hw/ip/prim/rtl/  -y ../opentitan/hw/ip/prim_generic/rtl -o mbx_automatic_lowered.mlir
python3 make_verif.py
circt-opt --hw-flatten-modules miter_2.mlir > flattened_miter.mlir
circt-opt miter_2.mlir
circt-bmc miter_2.mlir --module=miter -b 15
