# id: 7
# version: 1
# nameoffset: 0xCD, size: 0x23
# section table: 0x40, size: 0x88
# imp table: 0x347B8
# relocs offset: 0x2A9F0
# _prolog:     1:0x84
# _epilog:     1:0xDC
# _unresolved: 1:0x108
# num sections: 17
.include "macros.inc"
.global lbl_000260F0
.global lbl_00026118
.global lbl_00026158
.global lbl_000261E8
.global lbl_000261F0
.global lbl_000262F0
.global lbl_00026378
.global lbl_00026380
.global lbl_00026390
.global lbl_000263B0
.global lbl_000264A8
.global lbl_000264C8
.global lbl_000264E0
.global lbl_00026510
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0002601C	flags: 1
# offset: 0x000260E4	length: 0x00000004	flags: 0
# offset: 0x000260E8	length: 0x00000004	flags: 0
# offset: 0x000260F0	length: 0x000009C0	flags: 0
# offset: 0x00026AB0	length: 0x00003F40	flags: 0
# offset: 0x10000000	length: 0x000002D0	flags: 0
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
    # 0x260E4
#    .4byte 0x00000000

# 3
.section .dtors
    # 0x260E8
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8
.balign 8
lbl_000260F0:
    # 0x260F0
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F466666
    .4byte 0x3E666666
    .4byte 0x3E933333
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x461C4000
lbl_00026118:
    # 0x26118
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x40440000
    .4byte 0x00000000
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x38D1B717
    .4byte 0x00000000
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
lbl_00026158:
    # 0x26158
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0xB3D6BF95
    .4byte 0x00000000
    .4byte 0x3FE99999
    .4byte 0x9999999A
    .4byte 0x40040000
    .4byte 0x00000000
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x40390000
    .4byte 0x00000000
    .4byte 0x46000000
    .4byte 0x447A0000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x3FC99999
    .4byte 0x9999999A
    .4byte 0x40568000
    .4byte 0x00000000
    .4byte 0x40152492
    .4byte 0x49249249
    .4byte 0x401C0000
    .4byte 0x00000000
    .4byte 0x40A248DB
    .4byte 0x6DB6DB6E
    .4byte 0x42FE0000
    .4byte 0x40000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x3FF4CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
lbl_000261E8:
    # 0x261E8
    .4byte 0x43300000
    .4byte 0x00000000
lbl_000261F0:
    # 0x261F0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x42700000
    .4byte 0x00000000
    .4byte 0x3FBEB851
    .4byte 0xEB851EB8
    .4byte 0x3DCCCCCD
    .4byte 0x3ECCCCCD
    .4byte 0x43DC0000
    .4byte 0x43D70000
    .4byte 0x477FFF00
    .4byte 0x42100000
    .4byte 0x47000000
    .4byte 0x41C80000
    .4byte 0x43A00000
    .4byte 0x40400000
    .4byte 0x42900000
    .4byte 0x43700000
    .4byte 0x42C00000
    .4byte 0x42000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x42D00000
    .4byte 0x43100000
    .4byte 0x43C40000
    .4byte 0x43E80000
    .4byte 0x43300000
    .4byte 0x43880000
    .4byte 0xBF800000
    .4byte 0x3F19999A
    .4byte 0xBF000000
    .4byte 0x3FC00000
    .4byte 0x41F00000
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0x42200000
    .4byte 0x3F333333
    .4byte 0x42480000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x4062C000
    .4byte 0x00000000
    .4byte 0xC0740000
    .4byte 0x00000000
    .4byte 0x44200000
    .4byte 0x00000000
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x43340000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3F747AE1
    .4byte 0x47AE147B
    .4byte 0x3FE279A6
    .4byte 0xB50B0F28
    .4byte 0xBD75C28F
    .4byte 0x3EB851EC
    .4byte 0x411FD70A
    .4byte 0x461C3C00
lbl_000262F0:
    # 0x262F0
    .4byte 0x40200000
    .4byte 0x00000000
    .4byte 0x3FDD70A3
    .4byte 0xD70A3D71
    .4byte 0x3FDAE147
    .4byte 0xAE147AE1
    .4byte 0x3E800000
    .4byte 0x3E333333
    .4byte 0x3ECBC6A8
    .4byte 0x3F7C6A7F
    .4byte 0x3EAF1AA0
    .4byte 0x41A00000
    .4byte 0x437F0000
    .4byte 0x00000000
    .4byte 0x406FE000
    .4byte 0x00000000
    .4byte 0x42A00000
    .4byte 0x42C80000
    .4byte 0x42F00000
    .4byte 0x41100000
    .4byte 0x3EA3D70A
    .4byte 0x40800000
    .4byte 0x41700000
    .4byte 0x41000000
    .4byte 0x41200000
    .4byte 0x41880000
    .4byte 0x40E00000
    .4byte 0x41E00000
    .4byte 0x40F00000
    .4byte 0x00000000
    .4byte 0x3FF80000
    .4byte 0x00000000
    .4byte 0x43C80000
    .4byte 0xBED1EB85
lbl_00026378:
    # 0x26378
    .4byte 0x42C80000
    .4byte 0x00000000
lbl_00026380:
    # 0x26380
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
lbl_00026390:
    # 0x26390
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x34000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
lbl_000263B0:
    # 0x263B0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3FF75C28
    .4byte 0xF5C28F5C
    .4byte 0x40220000
    .4byte 0x00000000
    .4byte 0x41100000
    .4byte 0x00000000
    .4byte 0x40240000
    .4byte 0x00000000
    .4byte 0x403E0000
    .4byte 0x00000000
    .4byte 0x404E0000
    .4byte 0x00000000
    .4byte 0x40100000
    .4byte 0x00000000
    .4byte 0x3FD00000
    .4byte 0x00000000
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x402E0000
    .4byte 0x00000000
    .4byte 0x40340000
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x3FF33333
    .4byte 0x33333333
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0x3FF80000
    .4byte 0x00000000
    .4byte 0x40540000
    .4byte 0x00000000
    .4byte 0x41F00000
    .4byte 0x00000000
    .4byte 0x40490000
    .4byte 0x00000000
    .4byte 0x46800000
    .4byte 0x42B40000
    .4byte 0xC6800000
    .4byte 0x39E903BA
    .4byte 0x3ECCCC46
    .4byte 0x00000000
    .4byte 0x408C2000
    .4byte 0x00000000
    .4byte 0x44610000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x407C2000
    .4byte 0x00000000
    .4byte 0x41A00000
    .4byte 0x00000000
    .4byte 0x40140000
    .4byte 0x00000000
    .4byte 0x40040000
    .4byte 0x00000000
    .4byte 0x47000000
    .4byte 0x43E10000
lbl_000264A8:
    # 0x264A8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
lbl_000264C8:
    # 0x264C8
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40380000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xB22BCC77
lbl_000264E0:
    # 0x264E0
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0xB3D6BF95
    .4byte 0x3F800000
    .4byte 0x3DCCCCCD
    .4byte 0x3E99999A
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x3FC63A1A
    .4byte 0x7C9CCD6F
    .4byte 0x3F747AE1
    .4byte 0x47AE147B
lbl_00026510:
