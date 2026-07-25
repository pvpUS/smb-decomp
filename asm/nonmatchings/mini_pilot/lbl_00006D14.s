/* 00006D14 3C600000 */ lis r3, g_poolInfo@ha
/* 00006D18 38630000 */ addi r3, r3, g_poolInfo@l
/* 00006D1C 80C3000C */ lwz r6, 0xc(r3)
/* 00006D20 3C800000 */ lis r4, playerControllerIDs@ha
/* 00006D24 3C600000 */ lis r3, controllerInfo@ha
/* 00006D28 88060000 */ lbz r0, 0(r6)
/* 00006D2C 38A40000 */ addi r5, r4, playerControllerIDs@l
/* 00006D30 38830000 */ addi r4, r3, controllerInfo@l
/* 00006D34 7C000775 */ extsb. r0, r0
/* 00006D38 41820024 */ beq lbl_00006D5C
/* 00006D3C 80050000 */ lwz r0, 0(r5)
/* 00006D40 1C00003C */ mulli r0, r0, 0x3c
/* 00006D44 7C640214 */ add r3, r4, r0
/* 00006D48 A0030018 */ lhz r0, 0x18(r3)
/* 00006D4C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006D50 4182000C */ beq lbl_00006D5C
/* 00006D54 38600001 */ li r3, 1
/* 00006D58 4E800020 */ blr 
lbl_00006D5C:
/* 00006D5C 88060001 */ lbz r0, 1(r6)
/* 00006D60 38A50004 */ addi r5, r5, 4
/* 00006D64 38C60001 */ addi r6, r6, 1
/* 00006D68 7C000775 */ extsb. r0, r0
/* 00006D6C 41820024 */ beq lbl_00006D90
/* 00006D70 80050000 */ lwz r0, 0(r5)
/* 00006D74 1C00003C */ mulli r0, r0, 0x3c
/* 00006D78 7C640214 */ add r3, r4, r0
/* 00006D7C A0030018 */ lhz r0, 0x18(r3)
/* 00006D80 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006D84 4182000C */ beq lbl_00006D90
/* 00006D88 38600001 */ li r3, 1
/* 00006D8C 4E800020 */ blr 
lbl_00006D90:
/* 00006D90 88060001 */ lbz r0, 1(r6)
/* 00006D94 38C60001 */ addi r6, r6, 1
/* 00006D98 38A50004 */ addi r5, r5, 4
/* 00006D9C 7C000775 */ extsb. r0, r0
/* 00006DA0 41820024 */ beq lbl_00006DC4
/* 00006DA4 80050000 */ lwz r0, 0(r5)
/* 00006DA8 1C00003C */ mulli r0, r0, 0x3c
/* 00006DAC 7C640214 */ add r3, r4, r0
/* 00006DB0 A0030018 */ lhz r0, 0x18(r3)
/* 00006DB4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006DB8 4182000C */ beq lbl_00006DC4
/* 00006DBC 38600001 */ li r3, 1
/* 00006DC0 4E800020 */ blr 
lbl_00006DC4:
/* 00006DC4 88060001 */ lbz r0, 1(r6)
/* 00006DC8 38A50004 */ addi r5, r5, 4
/* 00006DCC 7C000775 */ extsb. r0, r0
/* 00006DD0 41820024 */ beq lbl_00006DF4
/* 00006DD4 80050000 */ lwz r0, 0(r5)
/* 00006DD8 1C00003C */ mulli r0, r0, 0x3c
/* 00006DDC 7C640214 */ add r3, r4, r0
/* 00006DE0 A0030018 */ lhz r0, 0x18(r3)
/* 00006DE4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00006DE8 4182000C */ beq lbl_00006DF4
/* 00006DEC 38600001 */ li r3, 1
/* 00006DF0 4E800020 */ blr 
lbl_00006DF4:
/* 00006DF4 38600000 */ li r3, 0
/* 00006DF8 4E800020 */ blr 
