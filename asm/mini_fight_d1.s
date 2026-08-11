# mini_fight data segment 1 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_0001C330
.global lbl_0001C348
.global lbl_0001C3C0

.section .rodata
.balign 8
lbl_0001C328:
    .4byte 0x3F800000
    .4byte 0x3FE00000
lbl_0001C330:
    # 0x1C330
    .4byte 0xC4FA0000
    .4byte 0x3FC00000
    .4byte 0x3F400000
    .4byte 0x3F000000
    .4byte 0x40C00000
    .4byte 0x00000000
lbl_0001C348:
    # 0x1C348
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x41700000
    .4byte 0x42340000
    .4byte 0x00000000
lbl_0001C3C0:
