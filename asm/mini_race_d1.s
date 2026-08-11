# mini_race data segment 1 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_00013B40
.global lbl_00013B50
.global lbl_00013B58
.global lbl_00013BAC
.global lbl_00013BD0
.global lbl_00013BF8
.global lbl_00013C48
.global lbl_00013C4C
.global lbl_00013C50
.global lbl_00013C70

.section .rodata
.balign 8
lbl_00013B18:
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00013B40:
    # 0x13B40
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00013B50:
    # 0x13B50
    .4byte 0x3FE99999
    .4byte 0x9999999A
lbl_00013B58:
    # 0x13B58
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x40800000
    .4byte 0x00000000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0x3E99999A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x45AAA800
    .4byte 0x42700000
    .4byte 0x3F7EB852
lbl_00013BAC:
    # 0x13BAC
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0400000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00013BD0:
    # 0x13BD0
    .4byte 0x00000000
    .4byte 0x43C80000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3FA11111
    .4byte 0x11111111
    .4byte 0x3F800000
    .4byte 0x3E0E38E4
    .4byte 0x3A83126F
    .4byte 0x40000000
lbl_00013BF8:
    # 0x13BF8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x00540055
    .4byte 0x00560057
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43700000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x41F00000
    .4byte 0x42A00000
    .4byte 0xFFFF0013
    .4byte 0x0010000D
    .4byte 0x0011000F
    .4byte 0x000E000C
    .4byte 0x0012000B
    .4byte 0x3C23D70A
    .4byte 0x3F333333
    .4byte 0x00000000
lbl_00013C48:
    # 0x13C48
    .4byte 0x43A00000
lbl_00013C4C:
    # 0x13C4C
    .4byte 0x43700000
lbl_00013C50:
    # 0x13C50
    .4byte 0x3F800000
    .4byte 0x3D4CCCCD
    .4byte 0x3C888889
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x40800000
    .4byte 0x42100000
    .4byte 0x42000000
lbl_00013C70:
