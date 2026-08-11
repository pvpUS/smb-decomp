# id: 3
# version: 1
# nameoffset: 0x3C, size: 0x23
# section table: 0x40, size: 0x90
# imp table: 0x1AD16
# relocs offset: 0x15F9E
# _prolog:     1:0x0
# _epilog:     1:0x70
# _unresolved: 1:0xAC
# num sections: 18
.include "macros.inc"
.global lbl_00013680
.global lbl_000136A4
.global lbl_000136C0
.global lbl_000136C8
.global lbl_000136D0
.global lbl_000136D8
.global lbl_000136E0
.global lbl_00013738
.global lbl_0001373C
.global lbl_00013740
.global lbl_00013748
.global lbl_00013760
.global lbl_000137B8
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x000135A4	flags: 1
# offset: 0x00013674	length: 0x00000004	flags: 0
# offset: 0x00013678	length: 0x00000004	flags: 0
# offset: 0x00013680	length: 0x00000A84	flags: 0
# offset: 0x00014108	length: 0x00001E96	flags: 0
# offset: 0x10000000	length: 0x00001B28	flags: 0
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
    # 0x13674
#    .4byte 0x00000000

# 3


.section .dtors
    # 0x13678
#    .4byte 0x00000000

# 4





.section .rodata
.balign 8
.balign 8
lbl_00013680:
    # 0x13680
    .4byte _prolog + 0x114AC
    .4byte _prolog + 0x114F8
    .4byte _prolog + 0x11588
    .4byte _prolog + 0x117A0
    .4byte _prolog + 0x117EC
    .4byte _prolog + 0x11808
    .4byte _prolog + 0x1180C
    .4byte 0xBF800000
    .4byte 0x00000000
lbl_000136A4:
    # 0x136A4
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_000136C0:
    # 0x136C0
    .4byte 0x42C80000
    .4byte 0x00000000
lbl_000136C8:
    # 0x136C8
    .4byte 0x43300000
    .4byte 0x80000000
lbl_000136D0:
    # 0x136D0
    .4byte 0x40590000
    .4byte 0x00000000
lbl_000136D8:
    # 0x136D8
    .4byte 0x3FF00000
    .4byte 0x00000000
lbl_000136E0:
    # 0x136E0
    .4byte 0x3D3DA130
    .4byte 0x3F800000
    .4byte 0xBDCCCCCD
    .4byte 0x41B66666
    .4byte 0x429ACCCD
    .4byte 0x41680000
    .4byte 0x3C23D70A
    .4byte 0x461C4000
    .4byte 0x400DA12F
    .4byte 0x6C000000
    .4byte 0x41A80000
    .4byte 0x00000000
    .4byte 0x4042C000
    .4byte 0x00000000
    .4byte 0x3E800000
    .4byte 0x41200000
    .4byte 0x40A00000
    .4byte 0x42BE0000
    .4byte 0xC2C80000
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
lbl_00013738:
    # 0x13738
    .4byte 0x447A0000
lbl_0001373C:
    # 0x1373C
    .4byte 0x42700000
lbl_00013740:
    # 0x13740
    .4byte 0x3F866666
    .4byte 0x47C35000
lbl_00013748:
    # 0x13748
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FC33333
    .4byte 0x33333333
    .4byte 0x3FF00000
    .4byte 0x00000000
lbl_00013760:
    # 0x13760
    .4byte 0x3F800000
    .4byte 0x47FFFF80
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x44100000
    .4byte 0x3F000000
    .4byte 0x447A0000
    .4byte 0x42B40000
    .4byte 0x42C80000
    .4byte 0x3F7F3B64
    .4byte 0xBF800000
    .4byte 0x00000000
lbl_000137B8:
