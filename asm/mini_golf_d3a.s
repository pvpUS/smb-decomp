# mini_golf data segment 3a -- rodata up to the carved hole at lbl_000263B0
.include "macros.inc"
.global lbl_00026390
.global lbl_000263B0

.section .rodata
.balign 8
lbl_00026388:
    .4byte 0x3FE00000
    .4byte 0x00000000
lbl_00026390:
    # 0x26390
    .4byte 0x00000000
    .4byte 0x3F800000
    .4byte 0x40400000
    .4byte 0x34000000
    .4byte 0x3FE80000
    .4byte 0x00000000
    .4byte 0x3FC99999
    .4byte 0x9999999A
lbl_000263B0:
    # 0x263B0 -- CARVED HOLE, 8 bytes, emitted by src/mini_golf_31.c
    #            as its signed int->float magic 43300000 80000000.
    # Zero-size alias: the symbol must survive here for the 29 @ha/@l
    # references in lbl_0000C33C / lbl_0000D64C / lbl_0000E99C.
