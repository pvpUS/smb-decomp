# mini_billiards data segment 2 -- rodata continuation after a carved hole
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
.global lbl_000210A8
.global lbl_00021204
.global lbl_0002157C
.global lbl_000215B0
.global lbl_10000000
.global lbl_10000002
.global lbl_10000003
.global lbl_10000004
.global lbl_10000006
.global lbl_10000008
.global lbl_1000000A
.global lbl_1000000B
.global lbl_1000000C
.global lbl_1000000D
.global lbl_1000000E
.global lbl_1000000F
.global lbl_10000010
.global lbl_10000011
.global lbl_10000012
.global lbl_10000013
.global lbl_10000014
.global lbl_10000015
.global lbl_10000016
.global lbl_10000017
.global lbl_10000018
.global lbl_1000001A
.global lbl_1000001C
.global lbl_1000001E
.global lbl_1000001F
.global lbl_10000020
.global lbl_10000024
.global lbl_10000028
.global lbl_1000002C
.global lbl_10000030
.global lbl_10000034
.global lbl_10000038
.global lbl_1000003C
.global lbl_10000048
.global lbl_10000049
.global lbl_1000004A
.global lbl_1000004C
.global lbl_1000004E
.global lbl_10000050
.global lbl_10000054
.global lbl_10000058
.global lbl_1000005C
.global lbl_10000060
.global lbl_10000061
.global lbl_10000062
.global lbl_10000064
.global lbl_100000A4
.global lbl_10000A64
.global lbl_10000A70
.global lbl_10009710
.global lbl_10009878
.global lbl_10009C88
.global lbl_10009C8C
.global lbl_10009CA0
.global lbl_10009CBC
.global lbl_1000A5BC
.global lbl_1000AA38
.global lbl_1000B340
.global lbl_1000B360
.global lbl_1000B361
.global lbl_1000B390
.global lbl_1000B418

.section .rodata
.balign 8
lbl_00020CA8:
    .4byte 0x40000000
    .4byte 0x4120F362
    .4byte 0x3E5B6DB7
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x3F333333
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte 0xFFFFFFFF
    .4byte 0x00000003
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000002
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x41A973E1
    .4byte 0xC1A973E1
    .4byte 0xC120F362
    .4byte 0x41A975ED
    .4byte 0xC1A975ED
    .4byte 0x4120F77B
    .4byte 0xC120F77B
    .4byte 0x3B03126F
    .4byte 0x3F800019
    .4byte 0x3E31D0D4
    .4byte 0x3FC00000
    .4byte 0x00000000
    .4byte 0x3FEF838B
    .4byte 0x8C811C17
    .4byte 0x3F5DB3D7
    .4byte 0x3EAF1D44
    .4byte 0x3E8483EE
    .4byte 0x3F86BCA2
    .4byte 0x3ECCCCCD
    .4byte 0x3BA3D70A
    .4byte 0x3BDA740E
    .4byte 0x3F3504F3
    .4byte 0x3C5A740E
    .4byte 0x3CCCCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x3F80A3D7
    .4byte 0x4000A3D7
    .4byte 0x41C6EF86
    .4byte 0x3F8051EC
    .4byte 0x400051EC
    .4byte 0x3F814880

# 5

.section .data
.balign 8
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
    # 0x21080
    .4byte _prolog + 0xD528
    .4byte _prolog + 0xD538
    .4byte _prolog + 0xD548
    .4byte _prolog + 0xD558
    .4byte _prolog + 0xD568
    .4byte _prolog + 0xD578
    .4byte _prolog + 0xD588
    .4byte _prolog + 0xD598
    .4byte _prolog + 0xD5A8
    .4byte _prolog + 0xD5B8
lbl_000210A8:
    # 0x210A8
    .asciz "wins:%3d %3d"
    .balign 4
    .asciz "aces:%3d %3d"
    .balign 4
    .asciz "runo:%3d %3d"
    .balign 4
    .asciz "foul:%3d %3d"
    .balign 4
    .asciz "chng:%3d %3d"
    .balign 4
    .asciz "brea:%3d %3d"
    .balign 4
    .asciz "comb:%3d %3d"
    .balign 4
    .asciz "cano:%3d %3d"
    .balign 4
    .asciz "kiss:%3d %3d"
    .balign 4
    .asciz "drop:%3d %3d"
    .balign 4
    .asciz "shot:%3d %3d"
    .balign 4
    .asciz "1Player"
    .asciz "2Players"
    .balign 4
    .asciz "Player %d"
    .balign 4
    .asciz "Char 1"
    .balign 4
    .asciz "Char 2"
    .balign 4
    .asciz "Char 3"
    .balign 4
    .asciz "Char 4"
    .balign 4
    .asciz "1 SET"
    .balign 4
    .asciz "3 SETS"
    .balign 4
    .asciz "5 SETS"
    .balign 4
    .asciz "ENDLESS"
    .asciz "VERY EASY"
    .balign 4
    .asciz "  EASY   "
    .balign 4
    .asciz " NORMAL  "
    .balign 4
    .asciz "  HARD   "
    .balign 4
    .asciz "VERY HARD"
    .balign 4
    .asciz "SINGLE"
    .balign 4
    .asciz " ALL "
    .balign 4
lbl_00021204:
    # 0x21204
    .4byte 0x25640000
    .asciz "FOUL"
    .balign 4
    .asciz "REPLAY"
    .balign 4
    .asciz "COM FREE DROP"
    .balign 4
    .asciz "1P FREE DROP"
    .balign 4
    .asciz "2P FREE DROP"
    .balign 4
    .asciz "POCKET"
    .balign 4
    .asciz "COMBINATION SHOT"
    .balign 4
    .asciz "CANNON SHOT"
    .asciz "KISS SHOT"
    .balign 4
    .4byte 0x434F4D00
    .4byte 0x31500000
    .4byte 0x32500000
    .asciz "Break Ace"
    .balign 4
    .asciz "%d/%d"
    .balign 4
    .asciz "Break & Run-out"
    .asciz "Shot(s)"
    .asciz "Foul(s)"
    .asciz "Combination(s)"
    .balign 4
    .asciz "Pocket Ratio"
    .balign 4
    .asciz "%d%%"
    .balign 4
    .asciz "%d SET MATCH"
    .balign 4
    .asciz "COM BREAK SHOT"
    .balign 4
    .asciz "1P BREAK SHOT"
    .balign 4
    .asciz "2P BREAK SHOT"
    .balign 4
    .asciz "DRAW"
    .balign 4
    .asciz "SPECIAL MATCH"
    .balign 4
    .asciz "FIRST MATCH"
    .asciz "SECOND MATCH"
    .balign 4
    .asciz "THIRD MATCH"
    .asciz "FINAL MATCH"
    .asciz "COM SHOT"
    .balign 4
    .asciz "1P SHOT"
    .asciz "2P SHOT"
    .asciz "BREAK ACE"
    .balign 4
    .asciz "BREAK AND RUN]OUT"
    .balign 4
    .asciz "COM:%2d/%2d"
    .asciz " 1P:%2d/%2d"
    .asciz " 2P:%2d/%2d"
    .asciz "Break&Run-out"
    .balign 4
    .asciz "COM:%d/%d"
    .balign 4
    .asciz " 1P:%d/%d"
    .balign 4
    .asciz " 2P:%d/%d"
    .balign 4
    .asciz "Foul/Shot"
    .balign 4
    .asciz "COM:%3d%%"
    .balign 4
    .asciz " 1P:%3d%%"
    .balign 4
    .asciz " 2P:%3d%%"
    .balign 4
    .asciz "Combination Shot"
    .balign 4
    .asciz "COM:%3d"
    .asciz " 1P:%3d"
    .asciz " 2P:%3d"
    .asciz "Cannon Shot"
    .asciz "Kiss Shot"
    .balign 4
    .asciz "Results"
    .asciz "Win:"
    .balign 4
    .asciz "Lose:"
    .balign 4
    .asciz "Win Ratio:"
    .balign 4
    .asciz "1.000"
    .balign 4
    .asciz ".%03d"
    .balign 4
    .asciz "Pocket Ratio:"
    .balign 4
    .asciz "Break Ace:"
    .balign 4
    .asciz "Break and Run-out:"
    .balign 4
    .asciz "Foul/Shot:"
    .balign 4
    .asciz "Kiss Shot(s):"
    .balign 4
    .asciz "Cannon Shot(s):"
    .asciz "Combination Shot(s):"
    .balign 4
    .asciz "Number of Pocket(s):"
    .balign 4
    .asciz "Play Time:"
    .balign 4
    .4byte 0x25647300
    .asciz "%dm %ds"
    .asciz "%dh %dm"
    .asciz "%dd %dh"
    .asciz "Your LEVEL:"
    .asciz "PRESS A BUTTON"
    .balign 4
lbl_0002157C:
    # 0x2157C
    .4byte _prolog + 0x14794
    .4byte _prolog + 0x149A0
    .4byte _prolog + 0x14BAC
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x150CC
    .4byte _prolog + 0x152A8
    .4byte _prolog + 0x15484
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x1565C
    .4byte _prolog + 0x14DD8
lbl_000215B0:
    # 0x215B0
    .asciz "Encode Over."

# 6

.section .bss
lbl_10000000:
    .skip 0x2
lbl_10000002:
    .skip 0x1
lbl_10000003:
    .skip 0x1
lbl_10000004:
    .skip 0x2
lbl_10000006:
    .skip 0x2
lbl_10000008:
    .skip 0x2
lbl_1000000A:
    .skip 0x1
lbl_1000000B:
    .skip 0x1
lbl_1000000C:
    .skip 0x1
lbl_1000000D:
    .skip 0x1
lbl_1000000E:
    .skip 0x1
lbl_1000000F:
    .skip 0x1
lbl_10000010:
    .skip 0x1
lbl_10000011:
    .skip 0x1
lbl_10000012:
    .skip 0x1
lbl_10000013:
    .skip 0x1
lbl_10000014:
    .skip 0x1
lbl_10000015:
    .skip 0x1
lbl_10000016:
    .skip 0x1
lbl_10000017:
    .skip 0x1
lbl_10000018:
    .skip 0x2
lbl_1000001A:
    .skip 0x2
lbl_1000001C:
    .skip 0x2
lbl_1000001E:
    .skip 0x1
lbl_1000001F:
    .skip 0x1
lbl_10000020:
    .skip 0x4
lbl_10000024:
    .skip 0x4
lbl_10000028:
    .skip 0x4
lbl_1000002C:
    .skip 0x4
lbl_10000030:
    .skip 0x4
lbl_10000034:
    .skip 0x4
lbl_10000038:
    .skip 0x4
lbl_1000003C:
    .skip 0xC
lbl_10000048:
    .skip 0x1
lbl_10000049:
    .skip 0x1
lbl_1000004A:
    .skip 0x2
lbl_1000004C:
    .skip 0x2
lbl_1000004E:
    .skip 0x2
lbl_10000050:
    .skip 0x4
lbl_10000054:
    .skip 0x4
lbl_10000058:
    .skip 0x4
lbl_1000005C:
    .skip 0x4
lbl_10000060:
    .skip 0x1
lbl_10000061:
    .skip 0x1
lbl_10000062:
    .skip 0x2
lbl_10000064:
    .skip 0x40
lbl_100000A4:
    .skip 0x9C0
lbl_10000A64:
    .skip 0xC
lbl_10000A70:
    .skip 0x8CA0
lbl_10009710:
    .skip 0x168
lbl_10009878:
    .skip 0x410
lbl_10009C88:
    .skip 0x4
lbl_10009C8C:
    .skip 0x14
lbl_10009CA0:
    .skip 0x1C
lbl_10009CBC:
    .skip 0x900
lbl_1000A5BC:
    .skip 0x47C
lbl_1000AA38:
    .skip 0x908
lbl_1000B340:
    .skip 0x20
lbl_1000B360:
    .skip 0x1
lbl_1000B361:
    .skip 0x2F
lbl_1000B390:
    .skip 0x88
lbl_1000B418:
    .skip 0x24


