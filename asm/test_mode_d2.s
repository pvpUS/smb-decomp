# test_mode data segment 2 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_00010150
.global lbl_00010170

.section .rodata
.balign 8
lbl_00010150:
    # 0x10150
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43800000
    .4byte 0x3F800000
    .4byte 0x426FFC40
    .4byte 0x3FAAAAAB
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
lbl_00010170:
