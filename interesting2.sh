#!/bin/bash

# ! circt-bmc $1 --module=miter -b 15 --mlir-timing --shared-libs=/usr/lib/x86_64-linux-gnu/libz3.so &> err.log
! circt-opt --sccp $1 &> err.log

grep -qi "PLEASE submit a bug report" err.log

exit $?
