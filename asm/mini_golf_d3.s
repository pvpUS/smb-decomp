# mini_golf data segment 3 -- rodata continuation after a carved hole
#
# RUN 17 carve.  The 8 bytes at 0x266F8 are the SIGNED int->float magic
# double 0x43300000_80000000.  They are now emitted by the merged
# src/mini_golf_58.c TU (_58.._62), which sits between this object and
# asm/mini_golf_d5.s in SOURCES.  lbl_000266F8 stays here as a zero-size
# trailing label so the still-asm users keep resolving to 0x266F8.
.include "macros.inc"
.global lbl_000266F8

.section .rodata
.balign 8
lbl_000266A8:
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x477FFF00
    .4byte 0x42100000
    .4byte 0x47000000
    .4byte 0x41C80000
    .4byte 0x43A00000
    .4byte 0x42900000
    .4byte 0x43700000
    .4byte 0x42C00000
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x40040000
    .4byte 0x00000000
    .4byte 0x42000000
    .4byte 0x00000000
    .4byte 0x401C0000
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
lbl_000266F8:
