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
# RUN 35 ANCHOR.  The 16 bytes at 0xFEC8 (unsigned magic) and 0xFED0
# (signed magic) are BOTH emitted by the merged src/test_mode_16.c, so no
# asm object can define a symbol 8 bytes INSIDE that span.  This `.set`
# names it without contributing a byte -- run-34 idiom 1, sel_ngc shape.
.set lbl_0000FED0, lbl_0000FEC8 + 0x8
