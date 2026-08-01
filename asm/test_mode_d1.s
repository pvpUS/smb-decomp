# test_mode data segment 1 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_00010118
.global lbl_00010124
.global lbl_00010148

.section .rodata
.balign 8
lbl_000100E0:
    .4byte 0xFFFFFFFF
    .4byte 0x43B40000
    .4byte 0xC2C80000
    .4byte 0xC0A00000
    .4byte 0x40A00000
    .4byte 0x41A00000
    .4byte 0x40000000
    .4byte 0x3BA3D70A
    .4byte 0xFFFFFFFF
    .4byte 0x42000000
    .4byte 0x42DF0000
    .4byte 0x3E800000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
lbl_00010118:
    # 0x10118
    .4byte 0x41200000
    .4byte 0x42C80000
    .4byte 0x40A00000
lbl_00010124:
    # 0x10124
    .4byte 0x3C23D70A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3ACCCCCD
    .4byte 0x3B088889
lbl_00010148:
