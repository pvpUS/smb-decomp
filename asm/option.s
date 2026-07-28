# id: 11
# version: 1
# nameoffset: 0x157, size: 0x1C
# section table: 0x40, size: 0x88
# imp table: 0x136C8
# relocs offset: 0xE240
# _prolog:     1:0x0
# _epilog:     1:0x9C
# _unresolved: 1:0xE4
# num sections: 17
.include "macros.inc"
.global lbl_0000C230
.global lbl_0000C270
.global lbl_0000C348
.global lbl_0000C368
.global lbl_0000C370
.global lbl_0000C380
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0000C15C	flags: 1
# offset: 0x0000C224	length: 0x00000004	flags: 0
# offset: 0x0000C228	length: 0x00000004	flags: 0
# offset: 0x0000C230	length: 0x00000410	flags: 0
# offset: 0x0000C640	length: 0x00001C00	flags: 0
# offset: 0x10000000	length: 0x00006F40	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x00000000	length: 0x00000000	flags: 0
# 2
.section .ctors
    # 0xC224
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xC228
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8
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
