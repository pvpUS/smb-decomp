/* 00007EE0 7C0802A6 */ mflr r0
/* 00007EE4 90010004 */ stw r0, 4(r1)
/* 00007EE8 9421FFF8 */ stwu r1, -8(r1)
/* 00007EEC 4BFF8271 */ bl DEMOInitROMFont
/* 00007EF0 3CA00000 */ lis r5, lbl_00007FE8@ha
/* 00007EF4 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00007EF8 38050000 */ addi r0, r5, lbl_00007FE8@l
/* 00007EFC 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00007F00 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00007F04 38000081 */ li r0, 0x81
/* 00007F08 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00007F0C 8001000C */ lwz r0, 0xc(r1)
/* 00007F10 38210008 */ addi r1, r1, 8
/* 00007F14 7C0803A6 */ mtlr r0
/* 00007F18 4E800020 */ blr 
