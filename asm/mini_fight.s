# id: 5
# version: 1
# nameoffset: 0x85, size: 0x24
# section table: 0x40, size: 0x88
# imp table: 0x25621
# relocs offset: 0x1DC21
# _prolog:     1:0x0
# _epilog:     1:0x5C
# _unresolved: 1:0x9C
# num sections: 17
.include "macros.inc"
.global lbl_0001BF80
.global lbl_0001C010
.global lbl_0001C048
.global lbl_0001C060
.global lbl_0001C068
.global lbl_0001C0A0
.global lbl_0001C108
.global lbl_0001C10C
.global lbl_0001C128
.global lbl_0001C138
.global lbl_0001C140
.global lbl_0001C178
.global lbl_0001C218
.global lbl_0001C238
.global lbl_0001C244
.global lbl_0001C24C
.global lbl_0001C25C
.global lbl_0001C260
.global lbl_0001C268
.global lbl_0001C270
.global lbl_0001C2D8
.global lbl_0001C308
.global lbl_0001C320
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0001BEB0	flags: 1
# offset: 0x0001BF78	length: 0x00000004	flags: 0
# offset: 0x0001BF7C	length: 0x00000004	flags: 0
# offset: 0x0001BF80	length: 0x00000998	flags: 0
# offset: 0x0001C918	length: 0x00001309	flags: 0
# offset: 0x10000000	length: 0x00019570	flags: 0
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
    # 0x1BF78
#    .4byte 0x00000000

# 3

.section .dtors
    # 0x1BF7C
#    .4byte 0x00000000

# 4



.section .rodata
.balign 8
lbl_0001BF80:
    # 0x1BF80
    .4byte 0x3F400000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FB11111
    .4byte 0x11111111
    .4byte 0x3FE00000
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0x00000000
    .4byte 0x3C03126F
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3CF5C28F
    .4byte 0x3D4CCCCD
    .4byte 0xBFF80000
    .4byte 0x00000000
    .4byte 0x3DCCCCCD
    .4byte 0x00000000
    .4byte 0x3F847AE1
    .4byte 0x47AE147B
    .4byte 0x3F000000
    .4byte 0x3C83126F
    .4byte 0x3F4CCCCD
    .4byte 0x3B83126F
    .4byte 0x3F333333
    .4byte 0x3E4CCCCD
    .4byte 0xBF000000
    .4byte 0x3D75C28F
    .4byte 0x41F00000
    .4byte 0x3F19999A
    .4byte 0x3F59999A
    .4byte 0x3E800000
lbl_0001C010:
    # 0x1C010
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0xBF99999A
    .4byte 0x3B2B1CBE
    .4byte 0x43000000
    .4byte 0x46FFFE00
    .4byte 0x42960000
    .4byte 0x3E000000
    .4byte 0x40200000
    .4byte 0x00000000
    .4byte 0x3F947AE1
    .4byte 0x40000000
    .4byte 0x42700000
    .4byte 0x00000000
lbl_0001C048:
    # 0x1C048
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3C23D70A
    .4byte 0x41400000
    .4byte 0x3DAAAAAB
    .4byte 0xBFC00000
lbl_0001C060:
    # 0x1C060
    .4byte 0xBE4CCCCD
    .4byte 0x41200000
lbl_0001C068:
    # 0x1C068
    .4byte 0x00000000
    .4byte 0xBF99999A
    .4byte 0x3F800000
    .4byte 0x00000000
    .4byte 0x3F947AE1
    .4byte 0x40000000
    .4byte 0x42700000
    .4byte 0x3E4CCCCD
    .4byte 0x3F000000
    .4byte 0x40C00000
    .4byte 0x47000000
    .4byte 0x3FC00000
    .4byte 0x41F00000
    .4byte 0x46FFFE00
lbl_0001C0A0:
    # 0x1C0A0
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x40400000
    .4byte 0x3DAAAAAB
    .4byte 0x3F400000
    .4byte 0x3CEA0EA1
    .4byte 0x3DCCCCCD
    .4byte 0x3F7851EC
    .4byte 0xBC449BA6
    .4byte 0x3FB50481
    .4byte 0x3F666666
    .4byte 0xBF800000
    .4byte 0x3CCCCCCD
    .4byte 0xBD4CCCCD
    .4byte 0x3F733333
    .4byte 0xBCCCCCCD
    .4byte 0xC3000000
    .4byte 0x3E19999A
    .4byte 0x3F8CCCCD
    .4byte 0xBC4CCCCD
    .4byte 0x47800000
    .4byte 0x3F4CCCCD
    .4byte 0x46000000
    .4byte 0x3D4CCCCD
    .4byte 0x40000000
    .4byte 0x00000000
lbl_0001C108:
    # 0x1C108
    .4byte 0x00000000
lbl_0001C10C:
    # 0x1C10C
    .4byte 0x3F800000
    .4byte 0x3EC00000
    .4byte 0x40000000
    .4byte 0x3F000000
    .4byte 0x3E800000
    .4byte 0x46FFFE00
    .4byte 0x3D4CCCCD
lbl_0001C128:
    # 0x1C128
    .4byte 0x3FC00000
    .4byte 0x3B2B1CBE
    .4byte 0x43000000
    .4byte 0x3E99999A
lbl_0001C138:
    # 0x1C138
    .4byte 0x43300000
    .4byte 0x80000000
lbl_0001C140:
    # 0x1C140
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x40C00000
    .4byte 0xBD03126F
    .4byte 0x3DCCCCCD
    .4byte 0x3F75C28F
    .4byte 0xBC03126F
    .4byte 0x3F7AE148
    .4byte 0xBD4CCCCD
    .4byte 0x3F666666
    .4byte 0x43800000
    .4byte 0x3BFC0FC1
    .4byte 0x3C7C0FC1
lbl_0001C178:
    # 0x1C178
    .4byte 0x3F866666
    .4byte 0xBDCCCCCD
    .4byte 0x41200000
    .4byte 0xC0000000
    .4byte 0x42700000
    .4byte 0x43700000
    .4byte 0x47C00000
    .4byte 0x00000000
    .4byte 0xC0000000
    .4byte 0x00000000
    .4byte 0x41800000
    .4byte 0x44180000
    .4byte 0x43D40000
    .4byte 0x00000000
    .4byte 0x40740000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
    .4byte 0x40F00000
    .4byte 0x3D888889
    .4byte 0x3FC47AE1
    .4byte 0x55555555
    .4byte 0x3FF00000
    .4byte 0x00000000
    .4byte 0x3FA00000
    .4byte 0x43C00000
    .4byte 0x44400000
    .4byte 0x3CA3D70A
    .4byte 0x3CCCCCCD
    .4byte 0x3F59999A
    .4byte 0xBF800000
    .4byte 0xBF733333
    .4byte 0x45800000
    .4byte 0x3E428F5C
    .4byte 0x41700000
    .4byte 0x44000000
    .4byte 0x42340000
    .4byte 0x3F4CCCCD
    .4byte 0xC4800000
    .4byte 0x41F00000
lbl_0001C218:
    # 0x1C218
    .4byte 0x45C00000
    .4byte 0x3E000000
    .4byte 0x41A00000
    .4byte 0x41400000
    .4byte 0x3F400000
    .4byte 0x3E333333
    .4byte 0x3F8147AE
    .4byte 0x3E19999A
lbl_0001C238:
    # 0x1C238
    .4byte 0x3F800000
    .4byte 0x3E4CCCCD
    .4byte 0x3FA66666
lbl_0001C244:
    # 0x1C244
    .4byte 0x00000000
    .4byte 0x3EE66666
lbl_0001C24C:
    # 0x1C24C
    .4byte 0x40000000
    .4byte 0x3F000000
    .4byte 0x3F4CCCCD
    .4byte 0x3FC00000
lbl_0001C25C:
    # 0x1C25C
    .4byte 0x43C80000
lbl_0001C260:
    # 0x1C260
    .4byte 0x4060E000
    .4byte 0x00000000
lbl_0001C268:
    # 0x1C268
    .4byte 0x403E0000
    .4byte 0x00000000
lbl_0001C270:
    # 0x1C270
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0xBF800000
    .4byte 0x3F19999A
    .4byte 0x3F266666
    .4byte 0xC0700000
    .4byte 0x3E19999A
    .4byte 0xBF000000
    .4byte 0x40880000
    .4byte 0x3F99999A
    .4byte 0xBD4CCCCD
    .4byte 0x45800000
    .4byte 0x46FFFE00
    .4byte 0x3DCCCCCD
    .4byte 0xBDCCCCCD
    .4byte 0x3F666666
    .4byte 0x3F75C28F
    .4byte 0xC375C28F
    .4byte 0xC4800000
    .4byte 0x3E800000
    .4byte 0x3D4CCCCD
    .4byte 0x3B004020
    .4byte 0x43000000
    .4byte 0x3F8CCCCD
    .4byte 0xBF8CCCCD
    .4byte 0x3F400000
lbl_0001C2D8:
    # 0x1C2D8
    .4byte 0x43300000
    .4byte 0x00000000
    .4byte 0x3CCCCCCD
    .4byte 0x3D99999A
    .4byte 0x3FA00000
    .4byte 0x42C00000
    .4byte 0x40400000
    .4byte 0x420C0000
    .4byte 0x43100000
    .4byte 0x3EAAAAAB
    .4byte 0x44000000
    .4byte 0x00000000
lbl_0001C308:
    # 0x1C308
    .4byte 0x3F733333
    .4byte 0x3D3851EC
    .4byte 0xBFC00000
    .4byte 0x3D4CCCCD
    .4byte 0x46FFFE00
    .4byte 0x00000000
lbl_0001C320:
