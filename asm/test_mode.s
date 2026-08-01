# id: 10
# version: 1
# nameoffset: 0x138, size: 0x1F
# section table: 0x40, size: 0x90
# imp table: 0x1EC0D
# relocs offset: 0x15B05
# _prolog:     1:0x0
# _epilog:     1:0x48
# _unresolved: 1:0x8C
# num sections: 18
.include "macros.inc"
.global lbl_0000FE78
.global lbl_0000FEC8
.global lbl_0000FED0
.global lbl_0000FF00
.global lbl_0000FF78
.global lbl_00010070
.global lbl_00010078
.global lbl_00010080
.global lbl_000100A8
.global lbl_000100D8
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000FD9C	flags: 1
# offset: 0x0000FE6C	length: 0x00000004	flags: 0
# offset: 0x0000FE70	length: 0x00000004	flags: 0
# offset: 0x0000FE78	length: 0x00000434	flags: 0
# offset: 0x000102B0	length: 0x00005855	flags: 0
# offset: 0x10000000	length: 0x00003CC6	flags: 0
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
    # 0xFE6C
#    .4byte 0x00000000

# 3
.section .dtors
    # 0xFE70
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8
.balign 8
lbl_0000FE78:
    # 0xFE78
    .4byte 0x405FC000
    .4byte 0x00000000
    .4byte 0x3FE96041
    .4byte 0x89374BC7
    .4byte 0x3FF0CCCC
    .4byte 0xCCCCCCCD
    .4byte 0x40C00000
    .4byte 0x00000000
    .4byte 0x4061110E
    .4byte 0x56041893
    .4byte 0x3FED0624
    .4byte 0xDD2F1AA0
    .4byte 0x3FE7E76C
    .4byte 0x8B439581
    .4byte 0x3FEBA5E3
    .4byte 0x53F7CED9
    .4byte 0x40700000
    .4byte 0x00000000
    .4byte 0x400BAC08
    .4byte 0x3126E979
lbl_0000FEC8:
    # 0xFEC8
    .4byte 0x43300000
    .4byte 0x00000000
lbl_0000FED0:
    # 0xFED0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x00000000
    .4byte 0x426FFC40
    .4byte 0x3FAAAAAB
    .4byte 0x3DCCCCCD
    .4byte 0x469C4000
    .4byte 0xBF2646E2
    .4byte 0x3F000000
    .4byte 0x3F5DB3D8
    .4byte 0xBF58C69A
    .4byte 0x3F2294F3
lbl_0000FF00:
    # 0xFF00
    .4byte 0xBF800000
    .4byte 0x3F58C69A
    .4byte 0xBF2294F3
    .4byte 0xFFFFFFFF
    .4byte 0x43B40000
    .4byte 0x41200000
    .4byte 0xC1000000
    .4byte 0x40200000
    .4byte 0x3FA00000
    .4byte 0xC1900000
    .4byte 0x3F400000
    .4byte 0x41240000
    .4byte 0x3F800000
    .4byte 0x3E000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FB99999
    .4byte 0x9999999A
    .4byte 0x437F0000
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x41000000
    .4byte 0x41800000
    .4byte 0x43960000
    .4byte 0x43F00000
    .4byte 0x43480000
lbl_0000FF78:
    # 0xFF78
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3EC28F5C
    .4byte 0x00000000
    .4byte 0x3FC00000
    .4byte 0x3E99999A
    .4byte lbl_000130A4
    .4byte lbl_000130B4
    .4byte lbl_000130BC
    .4byte lbl_000130C4
    .4byte 0x3F4A36E2
    .4byte 0xEB1C432D
    .4byte 0x3F50624D
    .4byte 0xD2F1A9FC
    .4byte 0x40080000
    .4byte 0x00000000
    .4byte 0x40400000
    .4byte 0x00000000
    .4byte 0x3F947AE1
    .4byte 0x47AE147B
    .4byte 0x3CF5C28F
    .4byte 0x3CA3D70A
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x41A00000
    .4byte 0xFFFFFF32
    .4byte 0x64646432
    .4byte 0x3ECCCCCD
    .4byte 0xFFFFFFFF
    .4byte 0x43160000
    .4byte 0x42B40000
    .4byte 0x437A0000
    .4byte 0x3F7FBE77
    .4byte 0xFFFFFF32
    .4byte 0x64646432
    .4byte 0xFF0000FF
    .4byte 0x00FF00FF
    .4byte 0x0000FFFF
    .4byte 0x3F99999A
    .4byte 0xC1200000
    .4byte 0x3F4CCCCD
    .4byte 0x3E4CCCCD
    .4byte 0x3D4CCCCD
    .4byte 0x40A00000
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x3FE028F5
    .4byte 0xC28F5C29
    .4byte 0x40840000
    .4byte 0x00000000
    .4byte 0x407C0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x43C80000
lbl_00010070:
    # 0x10070
    .4byte 0x40838000
    .4byte 0x00000000
lbl_00010078:
    # 0x10078
    .4byte 0x407D0000
    .4byte 0x00000000
lbl_00010080:
    # 0x10080
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0xBF800000
    .4byte 0x3F800000
    .4byte 0x42960000
    .4byte 0x3F818000
    .4byte 0x40B57B24
    .4byte 0x3DCCCCCD
    .4byte 0x47C35000
    .4byte 0x43800000
lbl_000100A8:
    # 0x100A8
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0xFFFFFFFF
    .4byte 0x3F8E38E4
    .4byte 0xBD638E40
    .4byte 0xBF000000
    .4byte 0x3F000000
    .4byte 0x3D000000
    .4byte 0x3E000000
    .4byte 0x437F0000
    .4byte 0x3D800000
    .4byte 0x3D924925
lbl_000100D8:
