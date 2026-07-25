# id: 6
# version: 1
# nameoffset: 0xA9, size: 0x24
# section table: 0x40, size: 0x90
# imp table: 0x11CF0
# relocs offset: 0xD3E0
# _prolog:     1:0x0
# _epilog:     1:0x50
# _unresolved: 1:0x7C
# num sections: 18
.include "macros.inc"
.global lbl_0000BE80
.global lbl_0000BEB0
.global lbl_0000BEB4
.global lbl_0000BEE0
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000BDA4	flags: 1
# offset: 0x0000BE74	length: 0x00000004	flags: 0
# offset: 0x0000BE78	length: 0x00000004	flags: 0
# offset: 0x0000BE80	length: 0x000008BC	flags: 0
# offset: 0x0000C740	length: 0x00000CA0	flags: 0
# offset: 0x10000000	length: 0x000000C4	flags: 0
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
# offset: 0x00000000	length: 0x00000000	flags: 0
# 2
.section .ctors
    # 0xBE74
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xBE78
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8
.balign 8
lbl_0000BE80:
    # 0xBE80
    .4byte 0x003A003B
    .4byte 0x003F0053
    .4byte 0x00540055
    .4byte 0x00560057
    .4byte 0x02000201
    .4byte 0x02020203
    .4byte 0x02040205
    .4byte 0x02060207
    .4byte 0x02080209
    .4byte 0x020A020B
    .4byte 0x020C020D
    .4byte 0x020E0000
lbl_0000BEB0:
    # 0xBEB0
    .4byte 0x00000000
lbl_0000BEB4:
    # 0xBEB4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0x3FA11111
    .4byte 0x11111111
    .4byte 0x3FBBBBBB
    .4byte 0xBBBBBBBC
    .4byte 0x46FFFE00
    .4byte 0x00000000
lbl_0000BEE0:
