/* 00003C2C 7C0802A6 */ mflr r0
/* 00003C30 90010004 */ stw r0, 4(r1)
/* 00003C34 9421FFF8 */ stwu r1, -8(r1)
/* 00003C38 48005E41 */ bl lbl_00009A78
/* 00003C3C 3C600000 */ lis r3, lbl_10000000@ha
/* 00003C40 38830000 */ addi r4, r3, lbl_10000000@l
/* 00003C44 88040039 */ lbz r0, 0x39(r4)
/* 00003C48 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003C4C 7C000774 */ extsb r0, r0
/* 00003C50 90040114 */ stw r0, 0x114(r4)
/* 00003C54 380000C3 */ li r0, 0xc3
/* 00003C58 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003C5C 8001000C */ lwz r0, 0xc(r1)
/* 00003C60 38210008 */ addi r1, r1, 8
/* 00003C64 7C0803A6 */ mtlr r0
/* 00003C68 4E800020 */ blr 
