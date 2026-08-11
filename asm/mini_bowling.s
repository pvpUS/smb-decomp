# id: 4
# version: 1
# nameoffset: 0x5F, size: 0x26
# section table: 0x40, size: 0x90
# imp table: 0x19108
# relocs offset: 0x154C8
# _prolog:     1:0x0
# _epilog:     1:0x64
# _unresolved: 1:0x90
# num sections: 18
.include "macros.inc"
.global lbl_00014F20
.global lbl_00014F24
.global lbl_00014F30
.global lbl_00014F38
.global lbl_00014F44
.global lbl_00014F50
.global lbl_00014F5C
.global lbl_00014F68
.global lbl_00014F74
.global lbl_00014F80
.global lbl_00014F88
.global lbl_00014F94
.global lbl_00014FA0
.global lbl_00014FAC
.global lbl_00014FB4
.global lbl_00014FC0
.global lbl_00014FD0
.global lbl_00014FDC
.global lbl_00014FE8
.global lbl_00014FF8
.global lbl_00015004
.global lbl_00015014
.global lbl_00015020
.global lbl_00015024
.global lbl_00015040
.global lbl_000151A0
.global lbl_000151A4
.global lbl_000151AC
.global lbl_000151B4
.global lbl_000151BC
.global lbl_000151C8
.global lbl_000151D4
.global lbl_000151E0
.global lbl_000151EC
.global lbl_000151F8
.global lbl_00015204
.global lbl_00015214
.global lbl_00015224
.global lbl_0001526C
.global lbl_00015284
.global lbl_00015298
.global lbl_000152AC
.global lbl_000152C0
.global lbl_000152D0
.global lbl_000152E8
.global lbl_000152FC
.global lbl_00015308
.global lbl_00015320
.global lbl_00015334
.global lbl_00015344
.global lbl_00015358
.global lbl_0001536C
.global lbl_00015380
.global lbl_00015388
# exported so the split-out .text (now in the .c) can link against these:
# offset: 0x00000000	length: 0x00000000	flags: 0
# offset: 0x000000D0	length: 0x0000EF44	flags: 1
# offset: 0x0000F014	length: 0x00000004	flags: 0
# offset: 0x0000F018	length: 0x00000004	flags: 0
# offset: 0x0000F020	length: 0x00005F00	flags: 0
# offset: 0x00014F20	length: 0x000005A8	flags: 0
# offset: 0x10000000	length: 0x0001B288	flags: 0
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
    # 0xF014
#    .4byte 0x00000000

# 3


.section .dtors
    # 0xF018
#    .4byte 0x00000000

# 4





.section .rodata
.balign 8

.section .data
lbl_00014F20:
    # 0x14F20
    .4byte 0x00000001
lbl_00014F24:
    # 0x14F24
    .4byte 0x00000061
    .4byte 0x01030200
    .4byte 0xFFFFFFFF
lbl_00014F30:
    # 0x14F30
    .asciz "Line"
    .balign 4
lbl_00014F38:
    # 0x14F38
    .asciz "Triangle"
    .balign 4
lbl_00014F44:
    # 0x14F44
    .asciz "Big four"
    .balign 4
lbl_00014F50:
    # 0x14F50
    .asciz "Big five"
    .balign 4
lbl_00014F5C:
    # 0x14F5C
    .asciz "Double dark"
lbl_00014F68:
    # 0x14F68
    .asciz "Railroad"
    .balign 4
lbl_00014F74:
    # 0x14F74
    .asciz "Cincinnati"
    .balign 4
lbl_00014F80:
    # 0x14F80
    .asciz "LiLy"
    .balign 4
lbl_00014F88:
    # 0x14F88
    .asciz "Snake eye"
    .balign 4
lbl_00014F94:
    # 0x14F94
    .asciz "Twin babies"
lbl_00014FA0:
    # 0x14FA0
    .asciz "Standard"
    .balign 4
lbl_00014FAC:
    # 0x14FAC
    .asciz "Bucket"
    .balign 4
lbl_00014FB4:
    # 0x14FB4
    .asciz "Baby split"
    .balign 4
lbl_00014FC0:
    # 0x14FC0
    .asciz "One in the dark"
lbl_00014FD0:
    # 0x14FD0
    .asciz "Fit split"
    .balign 4
lbl_00014FDC:
    # 0x14FDC
    .asciz "Wash out"
    .balign 4
lbl_00014FE8:
    # 0x14FE8
    .asciz "Christmas tree"
    .balign 4
lbl_00014FF8:
    # 0x14FF8
    .asciz "Dime store"
    .balign 4
lbl_00015004:
    # 0x15004
    .asciz "Little three"
    .balign 4
lbl_00015014:
    # 0x15014
    .asciz "Big three"
    .balign 4
lbl_00015020:
    # 0x15020
    .4byte lbl_00010BF0
lbl_00015024:
    # 0x15024
    .asciz "RELOCATION BOWLING LOADED\n"
    .balign 4
lbl_00015040:
    # 0x15040
    .asciz "RELOCATION BOWLING PURGED\n"
    .balign 4
    .asciz "\nError: A called an unlinked function.\n"
    .asciz "Address:      Back Chain    LR Save\n"
    .balign 4
    .asciz "0x%08x:   0x%08x    0x%08x\n"
    .asciz "mini_bowling.c"
    .balign 4
    .4byte 0x0A000000
    .asciz "Number left"
    .4byte 0x25640000
    .asciz "p/LEVER/"
    .balign 4
    .asciz "Move"
    .balign 4
    .asciz "p/BUTTON_A/"
    .asciz "Position"
    .balign 4
    .asciz "Select"
    .balign 4
    .asciz "p/SANNKAKU_B/"
    .balign 4
    .asciz "Angle"
    .balign 4
    .asciz "Power"
    .balign 4
    .asciz "p/BUTTON_L/BUTTON_R/"
    .balign 4
    .asciz "Spin"
    .balign 4
    .asciz "Number of balls left %d"
    .asciz "Number of patterns cleared %d"
    .balign 4
    .asciz "REPLAY"
    .balign 4
lbl_000151A0:
    # 0x151A0
    .4byte 0x5C000000
lbl_000151A4:
    # 0x151A4
    .asciz "STRIKE\\"
lbl_000151AC:
    # 0x151AC
    .asciz "DOUBLE\\"
lbl_000151B4:
    # 0x151B4
    .asciz "TURKEY\\"
lbl_000151BC:
    # 0x151BC
    .asciz "4TH STRIKE\\"
lbl_000151C8:
    # 0x151C8
    .asciz "5TH STRIKE\\"
lbl_000151D4:
    # 0x151D4
    .asciz "6TH STRIKE\\"
lbl_000151E0:
    # 0x151E0
    .asciz "7TH STRIKE\\"
lbl_000151EC:
    # 0x151EC
    .asciz "8TH STRIKE\\"
lbl_000151F8:
    # 0x151F8
    .asciz "9TH STRIKE\\"
lbl_00015204:
    # 0x15204
    .asciz "10TH STRIKE\\"
    .balign 4
lbl_00015214:
    # 0x15214
    .asciz "11TH STRIKE\\"
    .balign 4
lbl_00015224:
    # 0x15224
    .asciz "PERFECT\\"
    .balign 4
    .asciz "FALL OUT"
    .balign 4
    .asciz "PUNCH OUT\\"
    .balign 4
    .asciz "SPARE["
    .balign 4
    .asciz "MISS"
    .balign 4
    .asciz "CLEAR["
    .balign 4
    .asciz "TRY AGAIN"
    .balign 4
lbl_0001526C:
    # 0x1526C
    .asciz "split \"making it fit\""
    .balign 4
lbl_00015284:
    # 0x15284
    .asciz "split \"rail road\""
    .balign 4
lbl_00015298:
    # 0x15298
    .asciz "split \"cincinnati\""
    .balign 4
lbl_000152AC:
    # 0x152AC
    .asciz "split \"snake eye\""
    .balign 4
lbl_000152C0:
    # 0x152C0
    .asciz "\"baby split\""
    .balign 4
lbl_000152D0:
    # 0x152D0
    .asciz "split \"one in the dark\""
lbl_000152E8:
    # 0x152E8
    .asciz "split \"dime store\""
    .balign 4
lbl_000152FC:
    # 0x152FC
    .asciz "split \"6-7\""
lbl_00015308:
    # 0x15308
    .asciz "split \"christmas tree\""
    .balign 4
lbl_00015320:
    # 0x15320
    .asciz "split \"big three\""
    .balign 4
lbl_00015334:
    # 0x15334
    .asciz "split \"lily\""
    .balign 4
lbl_00015344:
    # 0x15344
    .asciz "split \"big four\""
    .balign 4
lbl_00015358:
    # 0x15358
    .asciz "split \"4-7-9-10\""
    .balign 4
lbl_0001536C:
    # 0x1536C
    .asciz "split \"big five\""
    .balign 4
lbl_00015380:
    # 0x15380
    .asciz "split"
    .balign 4
lbl_00015388:
