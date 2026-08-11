# id: 11
# version: 1
# nameoffset: 0x157, size: 0x1C
# section table: 0x40, size: 0x88
# imp table: 0x136C8
# relocs offset: 0xE240
# _prolog:     1:0x0
# _epilog:     1:0x9C
# _unresolved: 1:0xE4
# num sections: 17
.include "macros.inc"
.global lbl_0000C640
.global lbl_0000C6A4
.global lbl_0000C6A5
.global lbl_0000C6A8
.global lbl_0000C6B8
.global lbl_0000C744
.global lbl_0000C7A4
.global lbl_0000C850
.global lbl_0000C868
.global lbl_0000C884
.global lbl_0000C8C4
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0000C15C	flags: 1
# offset: 0x0000C224	length: 0x00000004	flags: 0
# offset: 0x0000C228	length: 0x00000004	flags: 0
# offset: 0x0000C230	length: 0x00000410	flags: 0
# offset: 0x0000C640	length: 0x00001C00	flags: 0
# offset: 0x10000000	length: 0x00006F40	flags: 0
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
    # 0xC224
#    .4byte 0x00000000

# 3

.section .dtors
    # 0xC228
#    .4byte 0x00000000

# 4



.section .rodata
.balign 8

.section .data
.balign 8
lbl_0000C640:
    # 0xC640
    .4byte _prolog + 0x22C
    .4byte _prolog + 0x298
    .4byte _prolog + 0x4B4
    .4byte _prolog + 0x520
    .4byte _prolog + 0xA18
    .4byte _prolog + 0xBCC
    .4byte _prolog + 0x674
    .4byte _prolog + 0x6B4
    .4byte _prolog + 0x2018
    .4byte _prolog + 0x2044
    .4byte _prolog + 0x2090
    .4byte _prolog + 0x2110
    .4byte _prolog + 0x2BAC
    .4byte _prolog + 0x2C24
    .4byte _prolog + 0x25D8
    .4byte _prolog + 0x263C
    .4byte _prolog + 0x2CB0
    .4byte _prolog + 0x2CDC
    .4byte _prolog + 0x2E4C
    .4byte _prolog + 0x3178
    .4byte _prolog + 0x3B64
    .4byte _prolog + 0x3BA4
    .4byte _prolog + 0x3CC4
    .4byte _prolog + 0x3D10
    .4byte 0x00000000
lbl_0000C6A4:
    # 0xC6A4
    .byte 0x02
lbl_0000C6A5:
    # 0xC6A5
    .byte 0x03, 0x00, 0x00
lbl_0000C6A8:
    # 0xC6A8
    .asciz "OPTION LOADED\n"
    .balign 4
lbl_0000C6B8:
    # 0xC6B8
    .asciz "OPTION PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "option.c"
    .balign 4
    .4byte 0x0A000000
lbl_0000C744:
    # 0xC744
    .asciz "sub_mode: error %d in Option"
    .balign 4
lbl_0000C764:
    # 0xC764
    .asciz "REPLAY"
    .balign 4
lbl_0000C76C:
    # 0xC76C
    .asciz "POINT"
    .balign 4
lbl_0000C774:
    # 0xC774
    .asciz "RANKING"
lbl_0000C77C:
    # 0xC77C
    .asciz "SOUND"
    .balign 4
lbl_0000C784:
    # 0xC784
    .asciz "SEPARATE MODE"
    .balign 4
lbl_0000C794:
    # 0xC794
    .4byte 0x50414400
lbl_0000C798:
    # 0xC798
    .asciz "MEMORY CARD"
lbl_0000C7A4:
    # 0xC7A4
    .4byte 0x00000000
    .4byte lbl_0000C764
    .4byte 0x000000BC
    .4byte 0x00000000
    .4byte lbl_0000C76C
    .4byte 0x000000B6
    .4byte 0x00000000
    .4byte lbl_0000C774
    .4byte 0x000000B8
    .4byte 0x00000000
    .4byte lbl_0000C77C
    .4byte 0x000000B0
    .4byte 0x00000000
    .4byte lbl_0000C784
    .4byte 0x000000BE
    .4byte 0x00000000
    .4byte lbl_0000C794
    .4byte 0x000000C2
    .4byte 0x00000000
    .4byte lbl_0000C798
    .4byte 0x000000B4
    .4byte 0xC3C80000
    .4byte 0x428C0000
    .4byte 0x3F1D0E56
    .4byte 0x0049FFF9
    .asciz "a/Controller %d"
    .asciz "a/No controller\nconnected"
    .balign 4
    .asciz "p/LEVER/"
    .balign 4
lbl_0000C840:
    # 0xC840
    .4byte 0x00010203
    .4byte 0x04050607
    .4byte 0x08000000
lbl_0000C84C:
    # 0xC84C
    .4byte 0x090A0B00
lbl_0000C850:
    # 0xC850
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte lbl_0000C840
    .4byte 0x09000000
    .4byte lbl_0000C84C
    .4byte 0x03000000
lbl_0000C868:
    # 0xC868
    .4byte _prolog + 0x26A0
    .4byte _prolog + 0x26EC
    .4byte _prolog + 0x2820
    .4byte _prolog + 0x2924
    .4byte _prolog + 0x2984
    .4byte _prolog + 0x29A0
    .4byte _prolog + 0x2A8C
lbl_0000C884:
    # 0xC884
    .4byte 0x626B6700
    .asciz "MASTER %d"
    .balign 4
    .asciz "EXTRA %d"
    .balign 4
    .asciz "FLOOR %d"
    .balign 4
    .asciz "SCORE:%5d"
    .balign 4
lbl_0000C8C4:
