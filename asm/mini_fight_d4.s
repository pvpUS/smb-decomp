# mini_fight data segment 4 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_0001C628
.global lbl_0001C640
.global lbl_0001C648

.section .rodata
.balign 8
lbl_0001C600:
    .4byte 0x3FF80000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3FC80000
    .4byte 0x00000000
    .4byte 0x3FD00000
    .4byte 0x00000000
lbl_0001C628:
    # 0x1C628
    .4byte 0x42C00000
    .4byte 0xC2900000
    .4byte 0x3E4CCCCD
    .4byte 0xC25C0000
    .4byte 0x3E428F5C
    .4byte 0xC0800000
lbl_0001C640:
    # 0x1C640
    .4byte 0x3F800000
    .4byte 0x3E800000
lbl_0001C648:
