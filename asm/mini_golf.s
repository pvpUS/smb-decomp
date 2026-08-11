# id: 7
# version: 1
# nameoffset: 0xCD, size: 0x23
# section table: 0x40, size: 0x88
# imp table: 0x347B8
# relocs offset: 0x2A9F0
# _prolog:     1:0x84
# _epilog:     1:0xDC
# _unresolved: 1:0x108
# num sections: 17
.include "macros.inc"
.global lbl_00026AB0
.global lbl_00026AC4
.global lbl_00026AEC
.global lbl_00026AF0
.global lbl_00026AF4
.global lbl_00026AF8
.global lbl_00026B40
.global lbl_00026BCC
.global lbl_00026BE8
.global lbl_00026D08
.global lbl_00026D50
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000C8	length: 0x0002601C	flags: 1
# offset: 0x000260E4	length: 0x00000004	flags: 0
# offset: 0x000260E8	length: 0x00000004	flags: 0
# offset: 0x000260F0	length: 0x000009C0	flags: 0
# offset: 0x00026AB0	length: 0x00003F40	flags: 0
# offset: 0x10000000	length: 0x000002D0	flags: 0
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
    # 0x260E4
#    .4byte 0x00000000

# 3
.section .dtors
    # 0x260E8
#    .4byte 0x00000000

# 4

.section .rodata
.balign 8

.section .data
.balign 8
lbl_00026AB0:
    # 0x26AB0
    .4byte 0x000F0019
    .4byte 0x00280050
    .4byte 0x000A0014
    .4byte 0x00280050
    .4byte 0x00A30100
lbl_00026AC4:
    # 0x26AC4
    .4byte 0x00A700B1
    .4byte 0x00A400A2
    .4byte 0x00A500A3
    .4byte 0x00AC00A8
    .4byte 0x00AF00A9
    .4byte 0x00B200AD
    .4byte 0x00B000AA
    .4byte 0x00A600AB
    .4byte 0x00AE00A1
    .4byte 0xFFFFFFFF
lbl_00026AEC:
    # 0x26AEC
    .4byte 0xFF000000
lbl_00026AF0:
    # 0x26AF0
    .4byte 0x00000000
lbl_00026AF4:
    # 0x26AF4
    .4byte 0x00000000
lbl_00026AF8:
    # 0x26AF8
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
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
lbl_00026B40:
    # 0x26B40
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0xC0900000
    .4byte 0xC1200000
    .4byte 0xC0A00000
    .4byte 0xC0400000
    .4byte 0xC1200000
    .4byte 0xC0A00000
    .4byte 0x40400000
    .4byte 0xC0E00000
    .4byte 0xC0A00000
    .4byte 0x40D00000
    .4byte 0xC0E00000
    .4byte 0xC0A00000
    .4byte 0x40D00000
    .4byte 0xC0E00000
    .4byte 0xC0400000
    .4byte 0x40D00000
    .4byte 0xC0400000
    .4byte 0x40400000
    .4byte 0x40D00000
    .4byte 0xC0400000
    .4byte 0x40C00000
    .4byte 0x40400000
    .4byte 0xC0400000
    .4byte 0x40C00000
    .4byte 0xC0400000
    .4byte 0x3F800000
    .4byte 0x40C00000
    .4byte 0xC0D00000
    .4byte 0x3F800000
    .4byte 0x40C00000
    .4byte 0xC0D00000
    .4byte 0x3F800000
    .4byte 0x00000000
lbl_00026BCC:
    # 0x26BCC
    .asciz "RELOCATION MINI_GOLF LOADED"
lbl_00026BE8:
    # 0x26BE8
    .asciz "RELOCATION MINI_GOLF PURGED"
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "mini_golf.c"
    .4byte 0x0A000000
    .asciz "AUTO"
    .balign 4
    .asciz "XF_TEST"
    .asciz "REPLAY"
    .balign 4
    .asciz "HOLE"
    .balign 4
    .4byte 0x25640000
    .asciz "PAR3"
    .balign 4
    .asciz "NODISP_BACK_WALL_N%d"
    .balign 4
    .asciz "If you put this in, you win."
    .balign 4
    .asciz "If you don't put this in, you lose."
lbl_00026D08:
    # 0x26D08
    .4byte _prolog + 0x6CB0
    .4byte _prolog + 0x6CCC
    .4byte _prolog + 0x6CE8
    .4byte _prolog + 0x6D04
    .4byte _prolog + 0x6D20
    .4byte _prolog + 0x6D3C
    .4byte _prolog + 0x6D58
    .4byte _prolog + 0x6D74
    .4byte _prolog + 0x6D90
    .4byte _prolog + 0x6DAC
    .4byte _prolog + 0x6DC8
    .4byte _prolog + 0x6DE4
    .4byte _prolog + 0x6E00
    .4byte _prolog + 0x6E1C
    .4byte _prolog + 0x6E38
    .4byte _prolog + 0x6E54
    .4byte _prolog + 0x6E70
    .4byte _prolog + 0x6E8C
lbl_00026D50:
