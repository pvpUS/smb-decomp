# mini_bowling data segment 3 -- data continuation after a carved hole
.include "macros.inc"
.global lbl_000153E0
.global lbl_000153E4
.global lbl_000153E8
.global lbl_000153F4

.section .rodata
.balign 8

.section .data
lbl_000153A8:
    .asciz "Pattern%d "
    .balign 4
    .asciz " Pattern"
    .balign 4
    .asciz "Which will you challenge"
    .balign 4
    .4byte 0x3F000000
lbl_000153E0:
    # 0x153E0
    .4byte 0xFFFFFFFF
lbl_000153E4:
    # 0x153E4
    .4byte 0xFFFFFFFF
lbl_000153E8:
    # 0x153E8
    .4byte 0x00000000
    .4byte 0x3F000000
lbl_000153F4:
