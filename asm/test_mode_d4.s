# test_mode data segment 4 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_000101E0
.global lbl_000101EC
.global lbl_000101FC
.global lbl_00010278

.section .rodata
.balign 8
lbl_000101C0:
    .4byte 0x3F7EB852
    .4byte 0xBC83126F
    .4byte 0xC3700000
    .4byte 0x43960000
    .4byte 0x43700000
    .4byte 0x40800000
    .4byte 0xC0800000
    .4byte 0xC3CFD89A
lbl_000101E0:
    # 0x101E0
    .4byte 0x46800000
    .4byte 0x3ECCCCCD
    .4byte 0x3EC28F5C
lbl_000101EC:
    # 0x101EC
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x41200000
    .4byte 0x42C80000
lbl_000101FC:
    # 0x101FC
    .4byte 0x00000000
    .4byte 0x00000005
    .4byte 0x00000005
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x00000010
    .4byte 0x00000008
    .4byte 0x00000020
    .4byte 0x00000006
    .4byte 0x00000009
    .4byte 0x00000010
    .4byte 0x00000018
    .4byte 0x00000004
    .4byte 0x00000006
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte 0x00000004
    .4byte 0x00000010
    .4byte 0x00000012
    .4byte 0x0000000A
    .4byte 0x0000000C
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0xBE99999A
    .4byte 0xBF800000
    .4byte 0x3FC00000
    .4byte 0x3E4CCCCD
    .4byte 0x43360B61
    .4byte 0x3DF5C28F
    .4byte 0xBDF5C28F
lbl_00010278:
