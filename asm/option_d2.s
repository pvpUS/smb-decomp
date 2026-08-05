# option data segment 2 -- .data 0xC640 .. 0xC8F0 (run 20 DEF carve).
# Data-only: no .text, so its SOURCES position only fixes .data order.
# MUST be listed BEFORE src/option_30.c.
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
    .asciz " TIME:%5.2f"
lbl_0000C8C4:
    # 0xC8C4
    .4byte _prolog + 0x3ED0
    .4byte _prolog + 0x3ED8
    .4byte _prolog + 0x3EE0
    .4byte _prolog + 0x3EE8
    .4byte _prolog + 0x3EF0
    .4byte _prolog + 0x3EF8
    .4byte _prolog + 0x3F00
    .4byte _prolog + 0x3F08
    .4byte _prolog + 0x3F10
    .4byte _prolog + 0x3F18
    .4byte 0x00000000
