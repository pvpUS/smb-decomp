# id: 1
# version: 1
# nameoffset: 0x0, size: 0x1D
# section table: 0x40, size: 0x90
# imp table: 0x1EE11
# relocs offset: 0x17499
# _prolog:     1:0x0
# _epilog:     1:0x88
# _unresolved: 1:0xB8
# num sections: 18
.include "macros.inc"
.global lbl_00011B68
.global lbl_00011BC0
.global lbl_00011BC8
.global lbl_00011BD4
.global lbl_00011C40
.global lbl_00011CB0
.global lbl_00011CB8
.global lbl_00011D00
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x00011A90	flags: 1
# offset: 0x00011B60	length: 0x00000004	flags: 0
# offset: 0x00011B64	length: 0x00000004	flags: 0
# offset: 0x00011B68	length: 0x00000614	flags: 0
# offset: 0x00012180	length: 0x00005319	flags: 0
# offset: 0x10000000	length: 0x00000A18	flags: 0
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
    # 0x11B60
#    .4byte 0x00000000

# 3
.section .dtors
    # 0x11B64
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8
.balign 8
lbl_00011B68:
    # 0x11B68
    .4byte 0x85888687
    .4byte 0x838A0000
    .4byte 0x0000008F
    .4byte 0x00000090
    .4byte 0x00000091
    .4byte 0x3E800000
    .4byte 0x4043A000
    .4byte 0x00000000
    .4byte 0x43400000
    .4byte 0x430E0000
    .4byte 0x3D8F5C29
    .4byte 0x42140000
    .4byte 0x41E00000
    .4byte 0x433C0000
    .4byte 0x42C00000
    .4byte 0x42900000
    .4byte 0x43480000
    .4byte 0x43160000
    .4byte 0x432C0000
    .4byte 0x43000000
    .4byte 0x42700000
    .4byte 0x42300000
lbl_00011BC0:
    # 0x11BC0
    .4byte 0x43300000
    .4byte 0x80000000
lbl_00011BC8:
    # 0x11BC8
    .4byte 0x00000000
    .4byte 0xBDF5C28F
    .4byte 0x00000000
lbl_00011BD4:
    # 0x11BD4
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x40530000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40596000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x40448000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
    .4byte 0x405DC000
    .4byte 0x00000000
    .4byte 0x4063C000
    .4byte 0x00000000
    .4byte 0x4070C000
    .4byte 0x00000000
    .4byte 0x40550000
    .4byte 0x00000000
    .4byte 0x40500000
    .4byte 0x00000000
lbl_00011C40:
    # 0x11C40
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x4074A000
    .4byte 0x00000000
    .4byte 0x40180000
    .4byte 0x00000000
    .4byte 0x405B0000
    .4byte 0x00000000
    .4byte 0x406A4000
    .4byte 0x00000000
    .4byte 0x40710000
    .4byte 0x00000000
    .4byte 0x40670000
    .4byte 0x00000000
    .4byte 0x4076A000
    .4byte 0x00000000
    .4byte 0x40756000
    .4byte 0x00000000
    .4byte 0x4062C000
    .4byte 0x00000000
    .4byte 0x40798000
    .4byte 0x00000000
    .4byte 0x407DA000
    .4byte 0x00000000
    .4byte 0x461B7800
    .4byte 0x44200000
    .4byte 0x43F00000
    .4byte 0x00000000
lbl_00011CB0:
    # 0x11CB0
    .4byte 0x3FB99999
    .4byte 0x9999999A
lbl_00011CB8:
    # 0x11CB8
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x437F0000
    .4byte 0x43A00000
    .4byte 0x4370199A
    .4byte 0x461C4000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x3FF570A3
    .4byte 0xD70A3D71
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x461AB000
    .4byte 0x3DCCCCCD
    .4byte 0x3F4CCCCD
    .4byte 0x3D4CCCCD
    .4byte 0x3F666666
    .4byte 0x00000000
lbl_00011D00:
