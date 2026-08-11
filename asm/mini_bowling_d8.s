# mini_bowling data segment 8 -- data continuation after a carved hole
.include "macros.inc"
.global lbl_00015428
.global lbl_00015434
.global lbl_0001543C
.global lbl_00015444
.global lbl_00015454
.global lbl_00015460
.global lbl_0001546C
.global lbl_00015480

.section .rodata
.balign 8

.section .data
lbl_00015424:
    .4byte 0x00000000
lbl_00015428:
    # 0x15428
    .asciz "%dP START"
    .balign 4
lbl_00015434:
    # 0x15434
    .asciz "START"
    .balign 4
lbl_0001543C:
    # 0x1543C
    .asciz "1 PIN"
    .balign 4
lbl_00015444:
    # 0x15444
    .asciz "%d PINS"
    .asciz "RESULT"
    .balign 4
lbl_00015454:
    # 0x15454
    .asciz "GAME OVER"
    .balign 4
lbl_00015460:
    # 0x15460
    .asciz "ALL CLEAR"
    .balign 4
lbl_0001546C:
    # 0x1546C
    .4byte 0x35000000
    .4byte 0x31000000
    .4byte 0x32000000
    .4byte 0x33000000
    .4byte 0x34000000
lbl_00015480:
