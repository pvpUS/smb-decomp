# mini_pilot data segment 3 -- rodata from 0xC5C0 up to the CARVED HOLE at 0xC6D8.
# RUN 34: the 496 bytes 0xC3C8..0xC5B7 and the unsigned int->float magic at
# 0xC5B8 are now supplied by src/mini_pilot_32b.c.o's own literal pool (the signed
# int->float magic).  src/mini_pilot_50b.c.o supplies the 8 bytes; the rest of
# the original segment continues in mini_pilot_d4.s.  Same mechanism as the
# module's existing carve at 0xBEE0 (mini_pilot.s / mini_pilot_9.c.o / mini_pilot_d1.s).
.include "macros.inc"
.global lbl_0000C5C0
.global lbl_0000C690
.global lbl_0000C6D8

.section .rodata
.balign 8
lbl_0000C5C0:
    # 0xC5C0
    .4byte 0x43700000
    .4byte 0x00000000
    .4byte 0x40890000
    .4byte 0x00000000
    .4byte 0xC0380000
    .4byte 0x00000000
    .4byte 0x406E0000
    .4byte 0x00000000
    .4byte 0x42920000
    .4byte 0x3F900000
    .4byte 0x42960000
    .4byte 0x429A0000
    .4byte 0x3DA3D70A
    .4byte 0x3DB851EC
    .4byte 0x3F333333
    .4byte 0x3F51EB85
    .4byte 0x43380000
    .4byte 0x43C30000
    .4byte 0x421C0000
    .4byte 0x40A00000
    .4byte 0x40360000
    .4byte 0x00000000
    .4byte 0x405E0000
    .4byte 0x00000000
    .4byte 0x403A0000
    .4byte 0x00000000
    .4byte 0x3E4CCCCD
    .4byte 0x0B1D0B1B
    .4byte 0x0B1E0B1C
    .4byte 0x42A00000
    .4byte 0x40C00000
    .4byte 0x41C00000
    .4byte 0x42380000
    .4byte 0x42140000
    .4byte 0x43E28000
    .4byte 0x423C0000
    .4byte 0x43D30000
    .4byte 0x43DA0000
    .4byte 0x43CF8000
    .4byte 0x43D40000
    .4byte 0x433E0000
    .4byte 0x43200000
    .4byte 0x42D00000
    .4byte 0x45000000
    .4byte 0x42680000
    .4byte 0x42280000
    .4byte 0x42300000
    .4byte 0x42840000
    .4byte 0x42CE0000
    .4byte 0x41C80000
    .4byte 0x40478000
    .4byte 0x00000000
lbl_0000C690:
    # 0xC690
    .4byte 0x00000000
    .4byte 0x3F7AE148
    .4byte 0xBDCCCCCD
    .4byte 0x3E99999A
    .4byte 0x3A83126F
    .4byte 0x3F8147AE
    .4byte 0x42700000
    .4byte 0x3C888889
    .4byte 0x3F800000
    .4byte 0x447A0000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x3FC00000
    .4byte 0x46FFFE00
    .4byte 0x3E4CCCCD
    .4byte 0x3DCCCCCD
    .4byte 0x3F000000
    .4byte 0x3F666666
lbl_0000C6D8:
