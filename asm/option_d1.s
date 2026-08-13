# option data segment 1 -- rodata continuation after a carved hole
.include "macros.inc"
.global lbl_0000C230
.global lbl_0000C270
.global lbl_0000C348
.global lbl_0000C368
.global lbl_0000C370
.global lbl_0000C380

.section .rodata
.balign 8
lbl_0000C230:
    # 0xC230
    .4byte 0x54000000
    .4byte 0x3B3B0000
    .4byte 0x00540000
    .4byte 0xC53B0000
    .4byte 0xAC000000
    .4byte 0xC5C50000
    .4byte 0x00AC0000
    .4byte 0x3BC50000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x3FD9999A
    .4byte 0x3C23D70A
lbl_0000C270:
    # 0xC270
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0xFF0000FF
    .4byte 0x0000FFFF
    .4byte 0xFFFF00FF
    .4byte 0x00FF00FF
    .4byte 0x000000FF
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41C00000
    .4byte 0x43A00000
    .4byte 0x40E00000
    .4byte 0x43160000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x43700000
    .4byte 0x41000000
    .4byte 0x3F800000
    .4byte 0x3DCCCCCD
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x40733EB8
    .4byte 0x51EB851F
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
lbl_0000C348:
    # 0xC348
    .4byte 0x00000000
    .4byte 0x4370199A
    .4byte 0x461C4000
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
    .4byte 0x42700000
    .4byte 0x43FF0000
    .4byte 0x43DC0000
lbl_0000C368:
    # 0xC368
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000C370:
    # 0xC370
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FECCCCC
    .4byte 0xCCCCCCCD
lbl_0000C380:

# anchor: lbl_0000C4B0's 8 bytes are the unsigned int->float magic,
# now emitted by src/option_30.c.o's literal pool.  A C object cannot
# name a pool entry, and no asm object can define a symbol inside
# another object's contiguous section -- so name it by offset from the
# alias that ends THIS segment.  0xC4B0 - 0xC380 = 0x130.
.global lbl_0000C4B0
.set lbl_0000C4B0, lbl_0000C380 + 0x130
