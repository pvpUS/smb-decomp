# mini_pilot data segment 2 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_0000C348
.global lbl_0000C358
.global lbl_0000C360
.global lbl_0000C3C0

.section .rodata
.balign 8
lbl_0000C2F8:
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x3FA47AE1
    .4byte 0x47AE147B
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x431D0000
    .4byte 0x43C3C000
    .4byte 0x43180000
    .4byte 0x43C10000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x407E0000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x00000000
    .4byte 0x3FF33333
    .4byte 0x33333333
    #.balign 4
lbl_0000C348:
    # 0xC348
    .4byte _prolog + 0x80B4
    .4byte _prolog + 0x80C8
    .4byte _prolog + 0x8164
    .4byte _prolog + 0x81EC
lbl_0000C358:
    # 0xC358
    .4byte 0x3FE00000
    .4byte 0x00000000
lbl_0000C360:
    # 0xC360
    .4byte 0x41900000
    .4byte 0x43040000
    .4byte 0x3DE147AE
    .4byte 0x41700000
    .4byte 0x41800000
    .4byte 0x41200000
    .4byte 0x3F000000
    .4byte 0x3EA66666
    .4byte 0x42A80000
    .4byte 0x42200000
    .4byte 0x43920000
    .4byte 0x41400000
    .4byte 0x43E20000
    .4byte 0x42400000
    .4byte 0x43760000
    .4byte 0x44040000
    .4byte 0x4075E000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x43C20000
    .4byte 0x3F800000
    .4byte 0x43070000
    .4byte 0x43570000
lbl_0000C3C0:
