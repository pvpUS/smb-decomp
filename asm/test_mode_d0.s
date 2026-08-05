# test_mode data segment 0 -- rodata continuation after a carved hole
# The hole at 0x100A8 is the UNSIGNED int->float magic, filled by
# src/test_mode_68.c (lbl_00009A0C).
.include "macros.inc"
.global lbl_000100D8

.section .rodata
.balign 8
lbl_000100B0:
    .4byte 0xFFFFFFFF
    .4byte 0x3F8E38E4
    .4byte 0xBD638E40
    .4byte 0xBF000000
    .4byte 0x3F000000
    .4byte 0x3D000000
    .4byte 0x3E000000
    .4byte 0x437F0000
    .4byte 0x3D800000
    .4byte 0x3D924925
lbl_000100D8:
