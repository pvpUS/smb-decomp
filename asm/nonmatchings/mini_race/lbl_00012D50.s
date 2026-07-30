/* 00012D50 7C0802A6 */ mflr r0
/* 00012D54 3C600000 */ lis r3, lbl_00014060@ha
/* 00012D58 90010004 */ stw r0, 4(r1)
/* 00012D5C 9421FFC0 */ stwu r1, -0x40(r1)
/* 00012D60 93E1003C */ stw r31, 0x3c(r1)
/* 00012D64 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 00012D68 38810028 */ addi r4, r1, 0x28
/* 00012D6C 80BF0000 */ lwz r5, 0(r31)
/* 00012D70 38600026 */ li r3, 0x26
/* 00012D74 801F0004 */ lwz r0, 4(r31)
/* 00012D78 90A10028 */ stw r5, 0x28(r1)
/* 00012D7C 9001002C */ stw r0, 0x2c(r1)
/* 00012D80 80BF0008 */ lwz r5, 8(r31)
/* 00012D84 801F000C */ lwz r0, 0xc(r31)
/* 00012D88 90A10030 */ stw r5, 0x30(r1)
/* 00012D8C 90010034 */ stw r0, 0x34(r1)
/* 00012D90 4BFED3ED */ bl effect_replace_type_funcs
/* 00012D94 80BF0010 */ lwz r5, 0x10(r31)
/* 00012D98 38810018 */ addi r4, r1, 0x18
/* 00012D9C 801F0014 */ lwz r0, 0x14(r31)
/* 00012DA0 38600029 */ li r3, 0x29
/* 00012DA4 90A10018 */ stw r5, 0x18(r1)
/* 00012DA8 9001001C */ stw r0, 0x1c(r1)
/* 00012DAC 80BF0018 */ lwz r5, 0x18(r31)
/* 00012DB0 801F001C */ lwz r0, 0x1c(r31)
/* 00012DB4 90A10020 */ stw r5, 0x20(r1)
/* 00012DB8 90010024 */ stw r0, 0x24(r1)
/* 00012DBC 4BFED3C1 */ bl effect_replace_type_funcs
/* 00012DC0 80BF0020 */ lwz r5, 0x20(r31)
/* 00012DC4 38810008 */ addi r4, r1, 8
/* 00012DC8 801F0024 */ lwz r0, 0x24(r31)
/* 00012DCC 3860002C */ li r3, 0x2c
/* 00012DD0 90A10008 */ stw r5, 8(r1)
/* 00012DD4 9001000C */ stw r0, 0xc(r1)
/* 00012DD8 80BF0028 */ lwz r5, 0x28(r31)
/* 00012DDC 801F002C */ lwz r0, 0x2c(r31)
/* 00012DE0 90A10010 */ stw r5, 0x10(r1)
/* 00012DE4 90010014 */ stw r0, 0x14(r1)
/* 00012DE8 4BFED395 */ bl effect_replace_type_funcs
/* 00012DEC 80010044 */ lwz r0, 0x44(r1)
/* 00012DF0 83E1003C */ lwz r31, 0x3c(r1)
/* 00012DF4 38210040 */ addi r1, r1, 0x40
/* 00012DF8 7C0803A6 */ mtlr r0
/* 00012DFC 4E800020 */ blr 
