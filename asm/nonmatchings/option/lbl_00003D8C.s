/* 00003D8C 7C0802A6 */ mflr r0
/* 00003D90 3C600000 */ lis r3, lbl_10000000@ha
/* 00003D94 90010004 */ stw r0, 4(r1)
/* 00003D98 38000001 */ li r0, 1
/* 00003D9C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003DA0 93E1000C */ stw r31, 0xc(r1)
/* 00003DA4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00003DA8 981F0039 */ stb r0, 0x39(r31)
/* 00003DAC 48006789 */ bl lbl_0000A534
/* 00003DB0 38000000 */ li r0, 0
/* 00003DB4 901F0154 */ stw r0, 0x154(r31)
/* 00003DB8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003DBC 380000C5 */ li r0, 0xc5
/* 00003DC0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003DC4 80010014 */ lwz r0, 0x14(r1)
/* 00003DC8 83E1000C */ lwz r31, 0xc(r1)
/* 00003DCC 38210010 */ addi r1, r1, 0x10
/* 00003DD0 7C0803A6 */ mtlr r0
/* 00003DD4 4E800020 */ blr 
