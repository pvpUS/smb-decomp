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
.global lbl_00013884
.global lbl_000138E0
.global lbl_000138E8
.global lbl_00013A14
.global lbl_00013A18
.global lbl_00013A9C
.global lbl_00013AA0
.global lbl_00013B08
.global lbl_00013B10
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
    # 0x137B8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
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
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3B86594B
    .4byte 0x3A83126F
    .4byte 0x3FC00000
lbl_00013884:
    # 0x13884
    .4byte 0x0130012F
    .4byte 0x012E012C
    .4byte 0x3F7851EC
    .4byte 0x3E84C8DF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
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
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40A00000
lbl_000138E0:
    # 0x138E0
    .4byte 0x0130012F
    .4byte 0x012E012C
lbl_000138E8:
    # 0x138E8
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F666666
    .4byte 0x42200000
    .4byte 0x00000000
    .4byte 0x40280000
    .4byte 0x00000000
    .4byte 0x46FFFE00
    .4byte 0x00000000
    .4byte 0x3F811111
    .4byte 0x11111111
    .4byte 0x40000000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x40800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41F00000
    .4byte 0x3E800000
    .4byte 0x41700000
    .4byte 0x41200000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3C23D70A
    .4byte 0x43FA0000
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x43960000
    .4byte 0x43580000
    .4byte 0x42DC0000
    .4byte 0x45FFF800
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E8F5C29
    .4byte 0x3F31C71D
    .4byte 0x00000000
    .4byte 0x40390000
    .4byte 0x00000000
    .4byte 0x40590000
    .4byte 0x00000000
    .4byte 0x3D4CCCCD
    .4byte 0x0000003A
    .4byte 0x0000003B
    .4byte 0x0000003F
    .4byte 0x00000053
    .4byte 0x00000054
    .4byte 0x00000055
    .4byte 0x00000056
    .4byte 0x00000057
    .4byte 0x3C06594B
    .4byte 0x3C1374BC
    .4byte 0x3EC97B42
    .4byte 0x42700000
    .4byte 0x0000003A
    .4byte 0x0000003B
    .4byte 0x0000003F
    .4byte 0x00000053
    .4byte 0x00000054
    .4byte 0x00000055
    .4byte 0x00000056
    .4byte 0x00000057
    .4byte 0x00000000
    .4byte 0x3FD33333
    .4byte 0x33333333
    .4byte 0xC47A0000
    .4byte 0xBA03126F
    .4byte 0x3B102DE0
lbl_00013A14:
    # 0x13A14
    .4byte 0x3DCCCCCD
lbl_00013A18:
    # 0x13A18
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x41000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x41100000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x44610000
    .4byte 0x00000000
    .4byte 0x3FB11111
    .4byte 0x11111111
    .4byte 0x3FB00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
    .4byte 0x40800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xBF800000
lbl_00013A9C:
    # 0x13A9C
    .4byte 0x3F4CCCCD
lbl_00013AA0:
    # 0x13AA0
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x34000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3E800000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
    .4byte 0x3EAAAAAB
    .4byte 0x40400000
lbl_00013B08:
    # 0x13B08
    .4byte 0x3F800000
    .4byte 0x00000000
lbl_00013B10:
    # 0x13B10
    .4byte 0x43300000
    .4byte 0x80000000
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
