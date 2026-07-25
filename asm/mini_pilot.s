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
# exported so the split-out .text (now in the .c) can link against these:
.global lbl_0000BE80
.global lbl_0000BEB0
.global lbl_0000BEB4
.global lbl_0000BEE0
.global lbl_0000BFD0
.global lbl_0000BFE0
.global lbl_0000BFE8
.global lbl_0000C010
.global lbl_0000C030
.global lbl_0000C2A8
.global lbl_0000C2C8
.global lbl_0000C2F0
.global lbl_0000C348
.global lbl_0000C358
.global lbl_0000C360
.global lbl_0000C3C0
.global lbl_0000C3C8
.global lbl_0000C3CC
.global lbl_0000C430
.global lbl_0000C548
.global lbl_0000C5B8
.global lbl_0000C5C0
.global lbl_0000C690
.global lbl_0000C6D8
.global lbl_0000C740
.global lbl_0000C748
.global lbl_0000C7BC
.global lbl_0000C7CC
.global lbl_0000C7EC
.global lbl_0000C88C
.global lbl_0000CB0C
.global lbl_0000CBCC
.global lbl_0000CCF8
.global lbl_0000D1C8
.global lbl_0000D218
.global lbl_0000D2E8
.global lbl_0000D300
.global lbl_0000D314
.global lbl_0000D320
.global lbl_0000D324
.global lbl_0000D328
.global lbl_0000D338
.global lbl_0000D360
.global lbl_0000D368
.global lbl_0000D3A0
.global lbl_10000000
.global lbl_10000004
.global lbl_10000018
.global lbl_1000001E
.global lbl_10000020
.global lbl_10000034
.global lbl_10000038
.global lbl_1000003C
.global lbl_10000040
.global lbl_10000044
.global lbl_10000054
.global lbl_1000005C
.global lbl_10000064
.global lbl_10000066
.global lbl_10000068
.global lbl_10000074
.global lbl_10000078
.global lbl_10000087
.global lbl_10000088
.global lbl_1000008A
.global lbl_1000008C
.global lbl_10000090
.global lbl_10000098
.global lbl_100000A8
.global lbl_100000B0
.global lbl_100000B8
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
    # 0xBEE0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte lbl_0000CBD8
    .4byte lbl_0000CC20
    .4byte lbl_0000CC68
    .4byte lbl_0000CCB0
    .4byte lbl_0000CCC0
    .4byte lbl_0000CCD0
    .4byte 0x5A5A3C00
    .4byte lbl_0000CBD8
    .4byte lbl_0000CC20
    .4byte lbl_0000CC68
    .4byte lbl_0000CCB0
    .4byte lbl_0000CCC0
    .4byte lbl_0000CCD0
    .4byte 0x1E1E1700
    .4byte 0x0010000F
    .4byte 0x00110000
    .4byte 0x000D0009
    .4byte 0x000E000A
    .4byte 0x000B000C
    .4byte 0x00060002
    .4byte 0x00070003
    .4byte 0x00040005
    .4byte 0x40180BFB
    .4byte 0x15B573EB
    .4byte 0x402E025A
    .4byte 0xEE631F8A
    .4byte 0x40A77000
    .4byte 0x00000000
    .4byte 0x4095E000
    .4byte 0x00000000
    .4byte 0x3FEF3333
    .4byte 0x33333333
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x40518000
    .4byte 0x00000000
    .4byte 0x435C0000
    .4byte 0x43340000
    .4byte 0x41D80000
    .4byte 0x41166666
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x402C0000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
lbl_0000BFD0:
    # 0xBFD0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000BFE0:
    # 0xBFE0
    .4byte 0x40580000
    .4byte 0x00000000
lbl_0000BFE8:
    # 0xBFE8
    .4byte 0x3FC1C71C
    .4byte 0x71C71C72
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3EED097B
    .4byte 0x00000000
    .4byte 0x3FA18EEC
    .4byte 0xAF953EDB
lbl_0000C010:
    # 0xC010
    .4byte 0x402AAAAA
    .4byte 0xAAAAAAAA
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x3E75C28F
    .4byte 0x3CA3D70A
    .4byte 0x3D8F5C29
lbl_0000C030:
    # 0xC030
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43138000
    .4byte 0x43C54000
    .4byte 0x42480000
    .4byte 0x469C4000
    .4byte 0x43C80000
    .4byte 0x3E19999A
    .4byte 0x3DCCCCCD
    .4byte 0x41700000
    .4byte 0x3F97B425
    .4byte 0xED097B42
    .4byte 0x0013000B
    .4byte 0x00210003
    .4byte 0x00110017
    .4byte 0x000F000D
    .4byte 0x00150023
    .4byte 0x0012000A
    .4byte 0x00240002
    .4byte 0x00100016
    .4byte 0x000E000C
    .4byte 0x00140022
    .4byte 0x0018001D
    .4byte 0x001A0004
    .4byte 0x001F001C
    .4byte 0x0019001E
    .4byte 0x0020001B
    .4byte 0x00000000
    .4byte 0x40F5F900
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x3FA99999
    .4byte 0x9999999A
    .4byte 0x3FE34395
    .4byte 0x810624DD
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
    .4byte 0x42400000
    .4byte 0x43240000
    .4byte 0x3C03126F
    .4byte 0xBE19999A
    .4byte 0x00000000
    .4byte 0x42C80000
    .4byte 0xC32A0000
    .4byte 0x00000000
    .4byte 0x42C80000
    .4byte 0xC4098000
    .4byte 0x00740075
    .4byte 0x00760000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x40711111
    .4byte 0x11111111
    .4byte 0xC2FA0000
    .4byte 0x41C80000
    .4byte 0x3F911111
    .4byte 0x11111111
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x3E99999A
    .4byte 0x3F733333
    .4byte 0x3EE66666
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0xBFC99999
    .4byte 0x9999999A
    .4byte 0x3FB7B425
    .4byte 0xED097B42
    .4byte 0xC0140000
    .4byte 0x00000000
    .4byte 0xC04E0000
    .4byte 0x00000000
    .4byte 0x3FEF5C28
    .4byte 0xF5C28F5C
    .4byte 0x3FEE6666
    .4byte 0x66666666
    .4byte 0x3FECCCCC
    .4byte 0xCCCCCCCD
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x3FD99999
    .4byte 0x9999999A
    .4byte 0xBE0E38E4
    .4byte 0x3991A2B4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0xC004CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xC018CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xBFF00000
    .4byte 0x00000000
    .4byte 0x3FEF851E
    .4byte 0xB851EB85
    .4byte 0x409C2000
    .4byte 0x00000000
    .4byte 0x40350000
    .4byte 0x00000000
    .4byte 0x40B38800
    .4byte 0x00000000
    .4byte 0x40790000
    .4byte 0x00000000
    .4byte 0x407B8000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0xBBB2674F
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x3F91EB85
    .4byte 0x1EB851EC
    .4byte 0x40A5E000
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0x3F14F8B5
    .4byte 0x88E368F1
    .4byte 0x3FEEB851
    .4byte 0xEB851EB8
    .4byte 0x34000000
    .4byte 0x00000000
    .4byte 0xBFE4CCCC
    .4byte 0xCCCCCCCD
    .4byte 0xBFE99999
    .4byte 0x9999999A
    .4byte 0x40390000
    .4byte 0x00000000
    .4byte 0x3F86872B
    .4byte 0x020C49BA
    .4byte 0x3F40624D
    .4byte 0xD2F1A9FC
    .4byte 0x3F666666
    .4byte 0x3E0F5C29
    .4byte 0x3CF5C28F
    .4byte 0x00000000
lbl_0000C2A8:
    # 0xC2A8
    .4byte 0x3FD38E38
    .4byte 0xE38E38E3
    .4byte 0x3F711111
    .4byte 0x11111111
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
lbl_0000C2C8:
    # 0xC2C8
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x34000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
lbl_0000C2F0:
    # 0xC2F0
    .4byte 0x43300000
    .4byte 0x80000000
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
    # 0xC3C0
    .4byte 0x43300000
    .4byte 0x80000000
lbl_0000C3C8:
    # 0xC3C8
    .4byte 0x43480000
lbl_0000C3CC:
    # 0xC3CC
    .4byte 0x432A0000
    .4byte 0x40320000
    .4byte 0x00000000
    .4byte 0x40420000
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte 0x40200000
    .4byte 0x00000000
    .4byte 0x40520000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x402E0000
    .4byte 0x00000000
    .4byte 0x404B8000
    .4byte 0x00000000
    .4byte 0x4060C708
    .4byte 0xFCDDC046
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FD00000
    .4byte 0x00000000
    .4byte 0x3E800000
    .4byte 0x00000000
lbl_0000C430:
    # 0xC430
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x40330000
    .4byte 0x00000000
    .4byte 0x0B250B23
    .4byte 0x0B260B24
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x3DF5C28F
    .4byte 0x00000000
    .4byte 0x4061A000
    .4byte 0x00000000
    .4byte 0x3FE68F5C
    .4byte 0x28F5C28F
    .4byte 0xC0100000
    .4byte 0x00000000
    .4byte 0xC0800000
    .4byte 0x00000000
    .4byte 0x40220000
    .4byte 0x00000000
    .4byte 0x41980000
    .4byte 0x00000000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3E266666
    .4byte 0x41100000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x40530000
    .4byte 0x00000000
    .4byte 0x40626000
    .4byte 0x00000000
    .4byte 0x40508000
    .4byte 0x00000000
    .4byte 0x40300000
    .4byte 0x00000000
    .4byte 0x40612000
    .4byte 0x00000000
    .4byte 0x404D0000
    .4byte 0x00000000
    .4byte 0x408F4000
    .4byte 0x00000000
    .4byte 0x3F9EB851
    .4byte 0xEB851EB8
    .4byte 0x40260000
    .4byte 0x00000000
    .4byte 0x40504000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3F59999A
    .4byte 0x00000000
    .4byte 0x404B0000
    .4byte 0x00000000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40418000
    .4byte 0x00000000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
lbl_0000C548:
    # 0xC548
    .4byte 0x43A00000
    .4byte 0x43C40000
    .4byte 0x424C0000
    .4byte 0x40B00000
    .4byte 0x43080000
    .4byte 0x43BE0000
    .4byte 0x3FB55555
    .asciz "UUUU@x@"
    .balign 4
    .4byte 0x00000000
    .4byte 0xC0372AAA
    .4byte 0xAAAAAAAB
    .4byte 0x40280000
    .4byte 0x00000000
    .4byte 0x4016AAAA
    .4byte 0xAAAAAAAB
    .4byte 0x40480000
    .4byte 0x00000000
    .4byte 0x3FA00000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40604000
    .4byte 0x00000000
    .4byte 0x405F4000
    .4byte 0x00000000
    .4byte 0x437F0000
    .4byte 0x3D8F5C29
lbl_0000C5B8:
    # 0xC5B8
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000C5C0:
    # 0xC5C0
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x40890000
    .4byte 0x00000000
    .4byte 0xC0380000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
    .4byte 0x42920000
    .4byte 0x3F900000
    .4byte 0x42960000
    .4byte 0x429A0000
    .4byte 0x3DA3D70A
    .4byte 0x3DB851EC
    .4byte 0x3F333333
    .4byte 0x3F51EB85
    .4byte 0x43380000
    .4byte 0x43C30000
    .4byte 0x421C0000
    .4byte 0x40A00000
    .4byte 0x40360000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x403A0000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x0B1D0B1B
    .4byte 0x0B1E0B1C
    .4byte 0x42A00000
    .4byte 0x40C00000
    .4byte 0x41C00000
    .4byte 0x42380000
    .4byte 0x42140000
    .4byte 0x43E28000
    .4byte 0x423C0000
    .4byte 0x43D30000
    .4byte 0x43DA0000
    .4byte 0x43CF8000
    .4byte 0x43D40000
    .4byte 0x433E0000
    .4byte 0x43200000
    .4byte 0x42D00000
    .4byte 0x45000000
    .4byte 0x42680000
    .4byte 0x42280000
    .4byte 0x42300000
    .4byte 0x42840000
    .4byte 0x42CE0000
    .4byte 0x41C80000
    .4byte 0x40478000
    .4byte 0x00000000
lbl_0000C690:
    # 0xC690
    .4byte 0x00000000
    .4byte 0x3F7AE148
    .4byte 0xBDCCCCCD
    .4byte 0x3E99999A
    .4byte 0x3A83126F
    .4byte 0x3F8147AE
    .4byte 0x42700000
    .4byte 0x3C888889
    .4byte 0x3F800000
    .4byte 0x447A0000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x3FC00000
    .4byte 0x46FFFE00
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x3F000000
    .4byte 0x3F666666
lbl_0000C6D8:
    # 0xC6D8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x43660000
    .4byte 0x3F7FBE77
    .4byte 0x3C23D70A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x40E66666
    .4byte 0x3ECCCCCD
    .4byte 0x3FE66666
    .4byte 0x3F333333
    .4byte 0x3D23D70A
    .4byte 0x3E800000
    .4byte 0xBF800000
    .4byte 0x3E3851EC
    .4byte 0xBF000000
    .4byte 0x43580000
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3CA3D70A
    .4byte 0x3F4CCCCD
    .4byte 0x40A00000

# 5
.section .data
.balign 8
lbl_0000C740:
    # 0xC740
    .4byte 0x00970098
    .4byte 0x00990000
lbl_0000C748:
    # 0xC748
    .4byte _prolog + 0xF4C
    .4byte _prolog + 0x10FC
    .4byte _prolog + 0x1468
    .4byte _prolog + 0x1508
    .4byte _prolog + 0x16BC
    .4byte _prolog + 0x1A38
    .4byte _prolog + 0x1AE4
    .4byte _prolog + 0x22EC
    .4byte _prolog + 0x2338
    .4byte _prolog + 0x1C14
    .4byte _prolog + 0x1D10
    .4byte _prolog + 0x2400
    .4byte _prolog + 0x246C
    .4byte _prolog + 0x25EC
    .4byte _prolog + 0x27C0
    .4byte _prolog + 0x295C
    .4byte _prolog + 0x2A18
    .4byte _prolog + 0x2B48
    .4byte _prolog + 0x2C54
    .4byte _prolog + 0x2D34
    .4byte _prolog + 0x2DC4
    .4byte _prolog + 0x2DE4
    .4byte _prolog + 0x2F24
    .4byte _prolog + 0x31C8
    .4byte _prolog + 0x32A4
    .4byte _prolog + 0x34E8
    .4byte _prolog + 0x3790
    .4byte _prolog + 0x3804
    .4byte _prolog + 0x3A00
lbl_0000C7BC:
    # 0xC7BC
    .4byte _prolog + 0x4ED8
    .4byte _prolog + 0x4F38
    .4byte _prolog + 0x4F74
    .4byte _prolog + 0x4FCC
lbl_0000C7CC:
    # 0xC7CC
    .asciz "RELOCATION MINI_PILOT LOADED"
    .balign 4
lbl_0000C7EC:
    # 0xC7EC
    .asciz "RELOCATION MINI_PILOT PURGED"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .balign 4
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .balign 4
    .asciz "mini_pilot.c"
    .balign 4
    .4byte 0x0A000000
lbl_0000C88C:
    # 0xC88C
    .4byte 0x40B9999A
    .4byte 0x42580000
    .4byte 0x438F0000
    .4byte 0x00000000
    .4byte 0xC0B9999A
    .4byte 0x42580000
    .4byte 0x438F0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x423B999A
    .4byte 0x438F0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42480000
    .4byte 0x428C0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x428C0000
    .4byte 0x43110000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x43480000
    .4byte 0x00020000
    .4byte 0xC1700000
    .4byte 0x4278CCCD
    .4byte 0x43987333
    .4byte 0x00020000
    .4byte 0x41700000
    .4byte 0x4278CCCD
    .4byte 0x43987333
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000C91C:
    # 0xC91C
    .4byte 0x00000000
    .4byte 0x42480000
    .4byte 0xC3A50000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x42140000
    .4byte 0xC3C08000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x422C0000
    .4byte 0xC3FC8000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x420C0000
    .4byte 0xC4150000
    .4byte 0x00020000
    .4byte 0xC29C0000
    .4byte 0x41F00000
    .4byte 0xC3928000
    .4byte 0x00020000
    .4byte 0x429C0000
    .4byte 0x41F00000
    .4byte 0xC3928000
    .4byte 0x00020000
    .4byte 0xC2A00000
    .4byte 0x41F00000
    .4byte 0xC40FC000
    .4byte 0x00020000
    .4byte 0x42A00000
    .4byte 0x41F00000
    .4byte 0xC40FC000
    .4byte 0x00020000
    .4byte 0xC1D00000
    .4byte 0x41900000
    .4byte 0xC41C4000
    .4byte 0x00020000
    .4byte 0x41D00000
    .4byte 0x41900000
    .4byte 0xC41C4000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000C9CC:
    # 0xC9CC
    .4byte 0xC2C80000
    .4byte 0x42700000
    .4byte 0x42960000
    .4byte 0x00020000
    .4byte 0x42C80000
    .4byte 0x42700000
    .4byte 0x42960000
    .4byte 0x00020000
    .4byte 0xC32C0000
    .4byte 0x42700000
    .4byte 0xC2820000
    .4byte 0x00020000
    .4byte 0x432C0000
    .4byte 0x42700000
    .4byte 0xC2820000
    .4byte 0x00020000
    .4byte 0xC36A0000
    .4byte 0x420C0000
    .4byte 0xC3F48000
    .4byte 0x00020000
    .4byte 0x436A0000
    .4byte 0x420C0000
    .4byte 0xC3F48000
    .4byte 0x00020000
    .4byte 0xC3160000
    .4byte 0x41F00000
    .4byte 0xC4080000
    .4byte 0x00020000
    .4byte 0x43160000
    .4byte 0x41F00000
    .4byte 0xC4080000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000CA5C:
    # 0xCA5C
    .4byte 0xC3390000
    .4byte 0x42680000
    .4byte 0x42380000
    .4byte 0x00020000
    .4byte 0x43390000
    .4byte 0x42680000
    .4byte 0x42380000
    .4byte 0x00020000
    .4byte 0xC3A90000
    .4byte 0x425C0000
    .4byte 0xC3070000
    .4byte 0x00020000
    .4byte 0x43A90000
    .4byte 0x425C0000
    .4byte 0xC3070000
    .4byte 0x00020000
    .4byte 0xC3B20000
    .4byte 0x42200000
    .4byte 0xC3C58000
    .4byte 0x00020000
    .4byte 0x43B20000
    .4byte 0x42200000
    .4byte 0xC3C58000
    .4byte 0x00020000
    .4byte 0xC3878000
    .4byte 0x42480000
    .4byte 0xC3E10000
    .4byte 0x00020000
    .4byte 0x43878000
    .4byte 0x42480000
    .4byte 0xC3E10000
    .4byte 0x00020000
    .4byte 0xC3358000
    .4byte 0x423C0000
    .4byte 0xC3FD0000
    .4byte 0x00020000
    .4byte 0x43358000
    .4byte 0x423C0000
    .4byte 0xC3FD0000
    .4byte 0x00020000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xFFFF0000
lbl_0000CB0C:
    # 0xCB0C
    .4byte lbl_0000C91C
    .4byte lbl_0000C9CC
    .4byte lbl_0000CA5C
lbl_0000CB18:
    # 0xCB18
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3480000
    .4byte 0x43480000
    .4byte 0x19000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3E10000
    .4byte 0x43160000
    .4byte 0x14000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4228000
    .4byte 0x43020000
    .4byte 0x0E000000
lbl_0000CB54:
    # 0xCB54
    .4byte 0xC3AF0000
    .4byte 0x41700000
    .4byte 0xC3C80000
    .4byte 0x43480000
    .4byte 0x19000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3C80000
    .4byte 0x43480000
    .4byte 0x1B000000
    .4byte 0x43AF0000
    .4byte 0x41700000
    .4byte 0xC3C70000
    .4byte 0x43480000
    .4byte 0x19000000
lbl_0000CB90:
    # 0xCB90
    .4byte 0xC3F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x43160000
    .4byte 0x17000000
    .4byte 0x43F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x43160000
    .4byte 0x17000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4160000
    .4byte 0x43160000
    .4byte 0x0F000000
lbl_0000CBCC:
    # 0xCBCC
    .4byte lbl_0000CB18
    .4byte lbl_0000CB54
    .4byte lbl_0000CB90
lbl_0000CBD8:
    # 0xCBD8
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3480000
    .4byte 0x42A00000
    .4byte 0x42A00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3E10000
    .4byte 0x41F00000
    .4byte 0x41F00000
    .4byte 0x03000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4228000
    .4byte 0x41C00000
    .4byte 0x420C0000
    .4byte 0x00000000
lbl_0000CC20:
    # 0xCC20
    .4byte 0xC3AF0000
    .4byte 0x41B00000
    .4byte 0xC3C80000
    .4byte 0x42440000
    .4byte 0x42440000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC3C80000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x43AF0000
    .4byte 0x41A80000
    .4byte 0xC3C70000
    .4byte 0x42700000
    .4byte 0x42700000
    .4byte 0x00000000
lbl_0000CC68:
    # 0xCC68
    .4byte 0xC3F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x42200000
    .4byte 0x42200000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x41200000
    .4byte 0xC39D8000
    .4byte 0x42200000
    .4byte 0x42200000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xC4160000
    .4byte 0x41200000
    .4byte 0x41200000
    .4byte 0x00000000
lbl_0000CCB0:
    # 0xCCB0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00010101
    .4byte 0x01020202
lbl_0000CCC0:
    # 0xCCC0
    .4byte 0x00000000
    .4byte 0x00000101
    .4byte 0x01010101
    .4byte 0x02020202
lbl_0000CCD0:
    # 0xCCD0
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x01010101
    .4byte 0x01010202
    .asciz "USE ITEM?"
    .balign 4
    .4byte 0x59455300
    .4byte 0x4E4F0000
    .4byte 0x00000000
lbl_0000CCF8:
    # 0xCCF8
    .4byte _prolog + 0x6D6C
    .4byte _prolog + 0x6EC4
    .4byte _prolog + 0x7374
    .4byte _prolog + 0x7950
    .4byte _prolog + 0x7D24
    .4byte _prolog + 0x7DFC
    .4byte _prolog + 0x7E00
    .4byte _prolog + 0x7E28
lbl_0000CD18:
    # 0xCD18
    .4byte 0x00000000
    .4byte 0x42140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CD48:
    # 0xCD48
    .4byte 0x00000000
    .4byte 0x42100000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41700000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CD78:
    # 0xCD78
    .4byte 0x00000000
    .4byte 0xC30A0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC4178000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CDA8:
    # 0xCDA8
    .4byte 0x00000000
    .4byte 0x4144CCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x40D00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CDD8:
    # 0xCDD8
    .4byte 0x00000000
    .4byte 0x3FB33333
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x40D66666
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE08:
    # 0xCE08
    .4byte 0x00000000
    .4byte 0xC3330000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC41D2CCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE38:
    # 0xCE38
    .4byte lbl_0000CD18
    .4byte lbl_0000CD48
    .4byte lbl_0000CD78
lbl_0000CE44:
    # 0xCE44
    .4byte lbl_0000CDA8
    .4byte lbl_0000CDD8
    .4byte lbl_0000CE08
lbl_0000CE50:
    # 0xCE50
    .4byte 0x00000000
    .4byte 0x43D00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x41D80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3AC8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CE90:
    # 0xCE90
    .4byte 0x00000000
    .4byte 0x41C80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x41B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x42140000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CED0:
    # 0xCED0
    .4byte 0x00000000
    .4byte 0xC3B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC3A18000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3A88000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF10:
    # 0xCF10
    .4byte 0x00000000
    .4byte 0x43AD8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC09CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3B00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF50:
    # 0xCF50
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CF90:
    # 0xCF90
    .4byte 0x00000000
    .4byte 0xC3C30000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC3C98CCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3C98000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000CFD0:
    # 0xCFD0
    .4byte lbl_0000CE50
    .4byte lbl_0000CE90
    .4byte lbl_0000CED0
lbl_0000CFDC:
    # 0xCFDC
    .4byte lbl_0000CF10
    .4byte lbl_0000CF50
    .4byte lbl_0000CF90
lbl_0000CFE8:
    # 0xCFE8
    .4byte 0x00000000
    .4byte 0x43E98000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3E70000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D028:
    # 0xD028
    .4byte 0x00000000
    .4byte 0x41B80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0x415CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x41C80000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43147DF4
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D068:
    # 0xD068
    .4byte 0x00000000
    .4byte 0xC3868000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC4104000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3830000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C66A1D
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D0A8:
    # 0xD0A8
    .4byte 0x00000000
    .4byte 0x43F08000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC0400000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC3EF8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D0E8:
    # 0xD0E8
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC1100000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43138000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D128:
    # 0xD128
    .4byte 0x00000000
    .4byte 0xC39C8000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000000F0
    .4byte 0xC4188000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0xC39CD99A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x43C4E9BA
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D168:
    # 0xD168
    .4byte lbl_0000CFE8
    .4byte lbl_0000D028
    .4byte lbl_0000D068
lbl_0000D174:
    # 0xD174
    .4byte lbl_0000D0A8
    .4byte lbl_0000D0E8
    .4byte lbl_0000D128
    .4byte lbl_0000CE38
    .4byte lbl_0000CFD0
    .4byte lbl_0000D168
    .4byte lbl_0000CE44
    .4byte lbl_0000CFDC
    .4byte lbl_0000D174
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001A4
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x000001E0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0000D1C8:
    # 0xD1C8
    .4byte 0x00260027
    .4byte 0x00280029
    .4byte 0x002A002B
    .4byte 0x002C002D
    .4byte 0x002E002F
    .4byte 0x00300031
    .4byte 0x00320033
    .4byte 0x00340035
    .4byte 0x00360037
    .4byte 0x00380039
    .4byte 0x003A003B
    .4byte 0x003C003D
    .4byte 0x003E003F
    .4byte 0x00400041
    .4byte 0x00420043
    .4byte 0x00440045
    .4byte 0x00460047
    .4byte 0x00480049
    .4byte 0x004A004B
    .4byte 0x004C0000
lbl_0000D218:
    # 0xD218
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3480000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4228000
    .4byte 0x3F4CCCCD
    .4byte 0xC3480000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F19999A
    .4byte 0x43480000
    .4byte 0x00000000
    .4byte 0xC3E10000
    .4byte 0x3F19999A
lbl_0000D268:
    # 0xD268
    .4byte 0xC3AF0000
    .4byte 0x00000000
    .4byte 0xC3C80000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3C80000
    .4byte 0x3F4CCCCD
    .4byte 0x43AF0000
    .4byte 0x00000000
    .4byte 0xC3C70000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4228000
    .4byte 0x3F19999A
lbl_0000D2A8:
    # 0xD2A8
    .4byte 0xC3F00000
    .4byte 0x00000000
    .4byte 0xC39D8000
    .4byte 0x3F4CCCCD
    .4byte 0x43F00000
    .4byte 0x00000000
    .4byte 0xC39D8000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC3960000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC4160000
    .4byte 0x3F4CCCCD
lbl_0000D2E8:
    # 0xD2E8
    .4byte lbl_0000D218
    .4byte 0x00050000
    .4byte lbl_0000D268
    .4byte 0x00040000
    .4byte lbl_0000D2A8
    .4byte 0x00040000
lbl_0000D300:
    # 0xD300
    .4byte 0x0B3B0B05
    .4byte 0x0B290B2A
    .4byte 0x0B2E0000
    .4byte 0x0B2C0B2D
    .4byte 0x0B2B0000
lbl_0000D314:
    # 0xD314
    .asciz "%3d X %d"
    .balign 4
lbl_0000D320:
    # 0xD320
    .4byte 0x25640000
lbl_0000D324:
    # 0xD324
    .4byte 0x25326400
lbl_0000D328:
    # 0xD328
    .4byte 0x25356400
    .4byte 0x32303000
    .4byte 0x31303000
    .4byte 0x30000000
lbl_0000D338:
    # 0xD338
    .4byte 0x25336400
    .4byte 0x25643A00
    .asciz "FINAL"
    .balign 4
    .asciz "ROUND"
    .balign 4
    .asciz "ROUND %d"
    .balign 4
    .4byte 0x25645000
lbl_0000D360:
    # 0xD360
    .asciz "MISS"
    .balign 4
lbl_0000D368:
    # 0xD368
    .asciz "CLOSE BALL AND LAND"
    .balign 4
    .asciz "PRESS"
    .balign 4
    .asciz "BUTTON"
    .balign 4
    .4byte 0x33000000
    .4byte 0x32000000
    .4byte 0x31300000
    .4byte 0x31320000
    .4byte 0x00000000
lbl_0000D3A0:
    # 0xD3A0
    .4byte 0x00000092
    .4byte 0x0000009A
    .4byte 0x0000009B
    .4byte 0x0000009C
    .4byte 0x0000009D
    .4byte 0x0000009E
    .4byte 0x0000009F
    .4byte 0x000000A0
    .4byte 0x000000A1
    .4byte 0x00000093
    .4byte 0x00000094
    .4byte 0x00000095
    .4byte 0x00000096
    .4byte 0x00000097
    .4byte 0x00000098
    .4byte 0x00000099

# 6
.section .bss
lbl_10000000:
    .skip 0x4
lbl_10000004:
    .skip 0x14
lbl_10000018:
    .skip 0x6
lbl_1000001E:
    .skip 0x2
lbl_10000020:
    .skip 0x14
lbl_10000034:
    .skip 0x4
lbl_10000038:
    .skip 0x4
lbl_1000003C:
    .skip 0x4
lbl_10000040:
    .skip 0x4
lbl_10000044:
    .skip 0x10
lbl_10000054:
    .skip 0x8
lbl_1000005C:
    .skip 0x8
lbl_10000064:
    .skip 0x2
lbl_10000066:
    .skip 0x2
lbl_10000068:
    .skip 0xC
lbl_10000074:
    .skip 0x4
lbl_10000078:
    .skip 0xF
lbl_10000087:
    .skip 0x1
lbl_10000088:
    .skip 0x2
lbl_1000008A:
    .skip 0x2
lbl_1000008C:
    .skip 0x4
lbl_10000090:
    .skip 0x8
lbl_10000098:
    .skip 0x10
lbl_100000A8:
    .skip 0x8
lbl_100000B0:
    .skip 0x8
lbl_100000B8:
    .skip 0xC

