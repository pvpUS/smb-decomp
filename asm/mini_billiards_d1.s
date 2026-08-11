# mini_billiards data segment 1 -- data continuation after a carved hole
.include "macros.inc"
.global lbl_00020DA0
.global lbl_00020E30
.global lbl_00020E38
.global lbl_00020E40
.global lbl_00020EC0
.global lbl_00020EE0
.global lbl_00020F00
.global lbl_00020F70
.global lbl_00020FC0
.global lbl_00021080

.section .rodata
.balign 8

.section .data
lbl_00020DA0:
    # 0x20DA0
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "mini_billiards.c"
    .balign 4
    .4byte 0x0A000000
lbl_00020E30:
    # 0x20E30
    .asciz "mode:%d"
lbl_00020E38:
    # 0x20E38
    .asciz "time:%d"
lbl_00020E40:
    # 0x20E40
    .4byte _prolog + 0x16E0
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16E8
    .4byte _prolog + 0x16F0
    .4byte _prolog + 0x16F8
    .4byte _prolog + 0x1700
    .4byte _prolog + 0x1808
    .4byte _prolog + 0x1834
    .4byte _prolog + 0x1928
    .4byte _prolog + 0x1930
    .4byte _prolog + 0x1938
    .4byte _prolog + 0x1938
    .4byte _prolog + 0x1938
    .4byte _prolog + 0x1938
    .4byte _prolog + 0x1938
    .4byte _prolog + 0x1940
    .4byte _prolog + 0x19AC
    .4byte _prolog + 0x19B4
    .4byte _prolog + 0x19BC
    .4byte _prolog + 0x19C4
    .4byte _prolog + 0x19CC
    .4byte _prolog + 0x19D4
    .4byte _prolog + 0x19DC
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x3F000000
    .4byte 0x00000000
    .4byte 0xFFFFFFFF
lbl_00020EC0:
    # 0x20EC0
    .4byte _prolog + 0x8900
    .4byte _prolog + 0x8924
    .4byte _prolog + 0x8948
    .4byte _prolog + 0x896C
    .4byte _prolog + 0x8990
    .4byte _prolog + 0x89B4
    .4byte _prolog + 0x89D8
    .4byte _prolog + 0x89FC
lbl_00020EE0:
    # 0x20EE0
    .4byte _prolog + 0x8414
    .4byte _prolog + 0x8478
    .4byte _prolog + 0x84DC
    .4byte _prolog + 0x8540
    .4byte _prolog + 0x85A4
    .4byte _prolog + 0x8608
    .4byte _prolog + 0x866C
    .4byte _prolog + 0x86D0
lbl_00020F00:
    # 0x20F00
    .4byte _prolog + 0x8E28
    .4byte _prolog + 0x8E8C
    .4byte _prolog + 0x8EF0
    .4byte _prolog + 0x8F54
    .4byte _prolog + 0x8F94
    .4byte _prolog + 0x8FD4
    .4byte _prolog + 0x9038
    .4byte _prolog + 0x909C
    .4byte _prolog + 0x9100
    .4byte _prolog + 0x913C
    .4byte _prolog + 0x9178
    .4byte _prolog + 0x91B4
    .4byte _prolog + 0x91F4
    .4byte _prolog + 0x926C
    .asciz "Wall In:%d %d %d\n"
    .balign 4
    .asciz "In Out Over:%d %d %d\n"
    .balign 4
    .asciz "Out:%d %d\n"
    .balign 4
lbl_00020F70:
    # 0x20F70
    .4byte 0x01000011
    .4byte 0x02000001
    .4byte 0xB4000000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F800000
    .4byte 0x3F19999A
    .4byte 0x407FFFFC
    .4byte 0xC0333333
    .4byte 0x9900F600
    .4byte 0x00000000
    .4byte 0xBDE055FC
    .4byte 0xBF396840
    .4byte 0x3F2E47DC
    .4byte 0x41380008
    .4byte 0x3E4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41B00000
    .4byte 0x00000000
lbl_00020FC0:
    # 0x20FC0
    .asciz "same time %d\n"
    .balign 4
    .asciz "kado illigal.%d %f"
    .balign 4
    .asciz "old:%14.6e\n"
    .asciz "Reverse kado %d"
    .asciz "KADO illigal.%d %12.6e"
    .balign 4
    .asciz "KADO:%14.6e %14.6e %14.6e\n"
    .balign 4
    .asciz "coli illigal.%d %d\n"
    .asciz "coli illigal.%d %d %f %f\n"
    .balign 4
    .asciz "Ball Calc Overflow.\n"
    .balign 4
    .4byte 0x00000000
lbl_00021080:
