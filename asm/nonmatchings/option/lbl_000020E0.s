/* 000020E0 7C0802A6 */ mflr r0
/* 000020E4 90010004 */ stw r0, 4(r1)
/* 000020E8 9421FFF8 */ stwu r1, -8(r1)
/* 000020EC 480056A5 */ bl lbl_00007790
/* 000020F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000020F4 380000B7 */ li r0, 0xb7
/* 000020F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000020FC 8001000C */ lwz r0, 0xc(r1)
/* 00002100 38210008 */ addi r1, r1, 8
/* 00002104 7C0803A6 */ mtlr r0
/* 00002108 4E800020 */ blr 
