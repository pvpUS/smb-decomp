# test_mode data segment 3 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_000101B8

.section .rodata
.balign 8
lbl_00010178:
    .4byte 0xBF2646E2
    .4byte 0x3F000000
    .4byte 0x3F5DB3D8
    .4byte 0x3E800000
    .4byte 0xBF000000
    .4byte 0xBF4511A3
    .4byte 0x3F13CD3A
    .4byte 0xBF800000
    .4byte 0x3F4511A3
    .4byte 0x41200000
    .4byte 0xBF13CD3A
    .4byte 0x44200000
    .4byte 0x47000000
    .4byte 0x43F00000
    .4byte 0x41800000
    .4byte 0x40000000
lbl_000101B8:
