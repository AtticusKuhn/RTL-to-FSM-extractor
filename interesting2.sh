#!/bin/bash

# ! circt-bmc $1 --module=miter -b 15 --mlir-timing --shared-libs=/usr/lib/x86_64-linux-gnu/libz3.so &> err.log
! circt-opt --convert-fsm-to-core $1 -o mbx_manual_lowered.mlir &> err.log

grep -qi "operation destroyed but still has uses" err.log

exit $?
