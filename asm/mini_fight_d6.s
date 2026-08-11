# mini_fight data segment 6 -- rodata, data continuation after a carved hole
.include "macros.inc"
.global lbl_0001C7D8
.global lbl_0001C7E8
.global lbl_0001C888
.global lbl_0001C88C
.global lbl_0001C8A8
.global lbl_0001D8B0
.global lbl_0001D9A0
.global lbl_0001D9A8
.global lbl_0001D9B0
.global lbl_0001D9B8
.global lbl_0001D9CC
.global lbl_0001DB4C
.global lbl_0001DBC0
.global lbl_0001DC14
.global lbl_10000000
.global lbl_1000008C
.global lbl_10000118
.global lbl_10017518
.global lbl_10017520
.global lbl_10017578
.global lbl_10017664
.global lbl_10017DC8
.global lbl_10017E98
.global lbl_100188E0
.global lbl_100188E8
.global lbl_10018900
.global lbl_10018920
.global lbl_10018C6C
.global lbl_10018CFC
.global lbl_10018D00
.global lbl_10018FD0
.global lbl_10018FD4
.global lbl_10019040

.section .rodata
.balign 8
lbl_0001C768:
    .4byte 0x422CCCCD
    .4byte 0x43600000
    .4byte 0x3F8CCCCD
    .4byte 0x42F00000
    .4byte 0x42E10000
    .4byte 0x3F19999A
    .4byte 0x40F00000
    .4byte 0x00000000
    .4byte 0x40549999
    .4byte 0x72000000
    .4byte 0x40459999
    .4byte 0xA8000000
    .4byte 0x40599999
    .4byte 0x96000000
    .4byte 0x403CCCCC
    .4byte 0xD4000000
    .4byte 0x42733333
    .4byte 0x00000000
    .4byte 0x4055FFFF
    .4byte 0xFB800000
    .4byte 0x420CCCCD
    .4byte 0xC2480000
    .4byte 0xC1000000
    .4byte 0x00000000
    .4byte 0x40720000
    .4byte 0x00000000
    .4byte 0x406A0000
    .4byte 0x00000000
lbl_0001C7D8:
    # 0x1C7D8
    .4byte 0x00000000
    .4byte 0x41200000
    .4byte 0x46FFFE00
    .4byte 0x46400000
lbl_0001C7E8:
    # 0x1C7E8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0x3F800000
    .4byte 0x3C888889
    .4byte 0x40000000
    .4byte 0x3E800000
    .4byte 0x3FC00000
    .4byte 0x3D888889
    .4byte 0x40400000
    .4byte 0x3FAAAAAB
    .4byte 0x3F333333
    .4byte 0xBF400000
    .4byte 0x3D088889
    .4byte 0x3DCCCCCD
    .4byte 0x3F75C28F
    .4byte 0xBF4CCCCD
    .4byte 0x3F70A3D7
    .4byte 0xBE23D70A
    .4byte 0x3F666666
    .4byte 0xBF000000
    .4byte 0xBECCCCCD
    .4byte 0xC34F0000
    .4byte 0x40A00000
    .4byte 0x45000000
    .4byte 0x3F000000
    .4byte 0x41F00000
    .4byte 0x3F59999A
    .4byte 0xC61C4000
    .4byte 0xBDCD013B
    .4byte 0x41C80000
    .4byte 0xC1800000
    .4byte 0x46800000
    .4byte 0x00000000
    .4byte 0x42C80000
    .4byte 0x469C4000
    .4byte 0x3D4CCCCD
    .4byte 0x461C4000
    .4byte 0x40800000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
lbl_0001C888:
    # 0x1C888
    .4byte 0x42700000
lbl_0001C88C:
    # 0x1C88C
    .4byte 0xC2700000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0xBF4CCCCD
    .4byte 0x3C23D70A
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
lbl_0001C8A8:
    # 0x1C8A8
    .4byte 0x43300000
    .4byte 0x80000000
    .4byte 0xC61C4000
    .4byte 0x461C4000
    .4byte 0x40A8A3D7
    .4byte 0x40400000
    .4byte 0x40D33333
    .4byte 0x3ECCCCCD
    .4byte 0x41400000
    .4byte 0x41B1999A
    .4byte 0x3E800000
    .4byte 0x3F666666
    .4byte 0x3F000000
    .4byte 0x3D888889
    .4byte 0xC0000000
    .4byte 0x3C83E426
    .4byte 0x41C00000
    .4byte 0x42526666
    .4byte 0x40066666
    .4byte 0x41700000
    .4byte 0x3F122D0E
    .4byte 0x3F8A3D71
    .4byte 0x406A3D71
    .4byte 0x400C28F6
    .4byte 0x40EE6666
    .4byte 0x41F00000
    .4byte 0x3FC00000
    .4byte 0x46FFFE00

# 5



.section .data
lbl_0001D8B0:
    # 0x1D8B0
    .4byte 0x00FE01A4
lbl_0001D8B4:
    # 0x1D8B4
    .4byte 0x00B601A4
    .4byte 0x014801A4
lbl_0001D8BC:
    # 0x1D8BC
    .4byte 0x006C01A4
    .4byte 0x00FE01A4
    .4byte 0x019001A4
lbl_0001D8C8:
    # 0x1D8C8
    .4byte 0x002401A4
    .4byte 0x00B601A4
    .4byte 0x014801A4
    .4byte 0x01DA01A4
    .4byte lbl_0001D8B0
    .4byte lbl_0001D8B4
    .4byte lbl_0001D8BC
    .4byte lbl_0001D8C8
    .4byte 0x0056FFF4
    .4byte 0x004AFFF4
    .4byte 0x003EFFF4
    .4byte 0x0038FFF4
    .4byte 0x0032FFF4
    .asciz "timer.pic"
    .balign 4
    .4byte 0x30303000
    .4byte 0x3A303000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x3E800000
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x3ECCCCCD
    .4byte 0x3E800000
    .4byte 0x3ECCCCCD
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3E800000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x3F4CCCCD
    .4byte 0x3E800000
    .4byte 0x3F4CCCCD
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x3E800000
    .4byte 0x3F000000
    .4byte 0x3E800000
    .4byte 0x3F400000
    .4byte 0x00000000
    .4byte 0x09030906
    .4byte 0x09040905
    .asciz "face"
    .balign 4
    .asciz "player id"
    .balign 4
    .asciz "ko point"
    .balign 4
    .asciz "win bar"
lbl_0001D9A0:
    # 0x1D9A0
    .asciz "%03d"
    .balign 4
lbl_0001D9A8:
    # 0x1D9A8
    .asciz ":%02d"
    .balign 4
lbl_0001D9B0:
    # 0x1D9B0
    .4byte 0x0010100C
    .4byte 0x0A000000
lbl_0001D9B8:
    # 0x1D9B8
    .asciz "FIGHT COUNT DOWN"
    .balign 4
lbl_0001D9CC:
    # 0x1D9CC
    .asciz "FIGHT"
    .balign 4
lbl_0001D9D4:
    # 0x1D9D4
    .4byte 0x43A00000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x43A00000
    .4byte 0x42F00000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x00000000
lbl_0001D9F8:
    # 0x1D9F8
    .4byte 0xC3200000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x44480000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F19999A
    .4byte 0x00000000
lbl_0001DA40:
    # 0x1DA40
    .4byte 0x43A00000
    .4byte 0x43340000
    .4byte 0x00000000
    .4byte 0x43A00000
    .4byte 0x430C0000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0xC3200000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F19999A
    .4byte 0x00000000
    .4byte 0x44480000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x3F19999A
    .4byte 0x3F19999A
    .4byte 0x00000000
lbl_0001DAAC:
    # 0x1DAAC
    .4byte 0xC3200000
    .4byte 0x43340000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x430C0000
    .4byte 0x00000000
    .4byte 0x3F0CCCCD
    .4byte 0x3F0CCCCD
    .4byte 0x00000000
    .4byte 0x44480000
    .4byte 0x43340000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x430C0000
    .4byte 0x00000000
    .4byte 0x3F0CCCCD
    .4byte 0x3F0CCCCD
    .4byte 0x00000000
    .4byte 0xC3200000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x43200000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x3F0CCCCD
    .4byte 0x3F0CCCCD
    .4byte 0x00000000
    .4byte 0x44480000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x43F00000
    .4byte 0x43960000
    .4byte 0x00000000
    .4byte 0x3F0CCCCD
    .4byte 0x3F0CCCCD
    .4byte 0x00000000
    .4byte lbl_0001D9D4
    .4byte lbl_0001D9F8
    .4byte lbl_0001DA40
    .4byte lbl_0001DAAC
lbl_0001DB4C:
    # 0x1DB4C
    .4byte 0xFF0000FF
    .4byte 0x0000FFFF
    .4byte 0xFFFF00FF
    .4byte 0x00FF00FF
    .4byte 0xFF00FFFF
    .4byte 0x00FFFFFF
    .4byte 0xFF8000FF
    .4byte 0x8000FFFF
    .4byte 0xFF0080FF
    .4byte 0x80FF00FF
lbl_0001DB74:
    # 0x1DB74
    .4byte 0x000F0045
    .4byte 0x00460047
    .4byte 0x00480000
lbl_0001DB80:
    # 0x1DB80
    .4byte 0x0020002E
    .4byte 0x002F0030
    .4byte 0x00310000
lbl_0001DB8C:
    # 0x1DB8C
    .4byte 0x00330040
    .4byte 0x00410000
lbl_0001DB94:
    # 0x1DB94
    .4byte 0x00030057
    .4byte 0x005B005C
    .4byte 0x005D0000
lbl_0001DBA0:
    # 0x1DBA0
    .4byte 0x00000005
    .4byte lbl_0001DB74
lbl_0001DBA8:
    # 0x1DBA8
    .4byte 0x00000005
    .4byte lbl_0001DB80
lbl_0001DBB0:
    # 0x1DBB0
    .4byte 0x00000003
    .4byte lbl_0001DB8C
lbl_0001DBB8:
    # 0x1DBB8
    .4byte 0x00000005
    .4byte lbl_0001DB94
lbl_0001DBC0:
    # 0x1DBC0
    .4byte lbl_0001DBA0
    .4byte lbl_0001DBA8
    .4byte lbl_0001DBB0
    .4byte lbl_0001DBB8
    .asciz "COM WINS"
    .balign 4
    .asciz "%dP WINS"
    .balign 4
    .asciz "KACHI ZARU"
    .balign 4
    .4byte _prolog + 0x17888
    .4byte _prolog + 0x17AD8
    .asciz "FINAL ROUND"
    .asciz "ROUND %d"
    .balign 4
lbl_0001DC14:
    # 0x1DC14
    .asciz "SUDDEN DEATH"

# 6



.section .bss
lbl_10000000:
    .skip 0x8C
lbl_1000008C:
    .skip 0x8C
lbl_10000118:
    .skip 0x17400
lbl_10017518:
    .skip 0x8
lbl_10017520:
    .skip 0x58
lbl_10017578:
    .skip 0xEC
lbl_10017664:
    .skip 0x764
lbl_10017DC8:
    .skip 0xD0
lbl_10017E98:
    .skip 0xA48
lbl_100188E0:
    .skip 0x8
lbl_100188E8:
    .skip 0x18
lbl_10018900:
    .skip 0x20
lbl_10018920:
    .skip 0x34C
lbl_10018C6C:
    .skip 0x90
lbl_10018CFC:
    .skip 0x4
lbl_10018D00:
    .skip 0x2D0
lbl_10018FD0:
    .skip 0x4
lbl_10018FD4:
    .skip 0x6C
lbl_10019040:
    .skip 0x530




