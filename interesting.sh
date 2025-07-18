#!/bin/bash

! circt-bmc $1 --module=miter -b 15 --mlir-timing --shared-libs=/usr/lib/x86_64-linux-gnu/libz3.so &> err.log

grep -q "operator is applied to arguments of the wrong sort" err.log

exit $?
