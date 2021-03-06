# RUN: llvm-mc %s -triple=riscv32 -mattr=+c,+f -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 -mattr=+c,+f < %s \
# RUN:     | llvm-objdump -mattr=+c,+f -riscv-no-aliases -d -r - \
# RUN:     | FileCheck -check-prefixes=CHECK-OBJ,CHECK-ASM-AND-OBJ %s
#
# RUN: not llvm-mc -triple riscv32 -mattr=+c \
# RUN:     -riscv-no-aliases -show-encoding < %s 2>&1 \
# RUN:     | FileCheck -check-prefixes=CHECK-NO-EXT %s
# RUN: not llvm-mc -triple riscv32 \
# RUN:     -riscv-no-aliases -show-encoding < %s 2>&1 \
# RUN:     | FileCheck -check-prefixes=CHECK-NO-EXT %s
# RUN: not llvm-mc -triple riscv64 -mattr=+c,+f \
# RUN:     -riscv-no-aliases -show-encoding < %s 2>&1 \
# RUN:     | FileCheck -check-prefixes=CHECK-NO-EXT %s

# FIXME: error messages for rv64fc are misleading

# CHECK-ASM-AND-OBJ: c.flwsp  fs0, 252(sp)
# CHECK-ASM: encoding: [0x7e,0x74]
# CHECK-NO-EXT:  error: instruction use requires an option to be enabled
c.flwsp  fs0, 252(sp)
# CHECK-ASM-AND-OBJ: c.fswsp  fa7, 252(sp)
# CHECK-ASM: encoding: [0xc6,0xff]
# CHECK-NO-EXT:  error: instruction use requires an option to be enabled
c.fswsp  fa7, 252(sp)

# CHECK-ASM-AND-OBJ: c.flw  fa3, 124(a5)
# CHECK-ASM: encoding: [0xf4,0x7f]
# CHECK-NO-EXT:  error: instruction use requires an option to be enabled
c.flw  fa3, 124(a5)
# CHECK-ASM-AND-OBJ: c.fsw  fa2, 124(a1)
# CHECK-ASM: encoding: [0xf0,0xfd]
# CHECK-NO-EXT:  error: instruction use requires an option to be enabled
c.fsw  fa2, 124(a1)
