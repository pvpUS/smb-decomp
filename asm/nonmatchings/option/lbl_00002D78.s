/* 00002D78 7C0802A6 */ mflr r0
/* 00002D7C 90010004 */ stw r0, 4(r1)
/* 00002D80 9421FFF8 */ stwu r1, -8(r1)
/* 00002D84 48005CB1 */ bl lbl_00008A34
/* 00002D88 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002D8C 380000BF */ li r0, 0xbf
/* 00002D90 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002D94 8001000C */ lwz r0, 0xc(r1)
/* 00002D98 38210008 */ addi r1, r1, 8
/* 00002D9C 7C0803A6 */ mtlr r0
/* 00002DA0 4E800020 */ blr 
