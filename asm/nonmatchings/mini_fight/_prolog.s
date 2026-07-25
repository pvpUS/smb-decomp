/* 000000C8 7C0802A6 */ mflr r0
/* 000000CC 3C600000 */ lis r3, lbl_0000AAD0@ha
/* 000000D0 90010004 */ stw r0, 4(r1)
/* 000000D4 3C800000 */ lis r4, lbl_0000ABA8@ha
/* 000000D8 3CA00000 */ lis r5, lbl_0000FF34@ha
/* 000000DC 3CC00000 */ lis r6, lbl_00012248@ha
/* 000000E0 9421FFF8 */ stwu r1, -8(r1)
/* 000000E4 38630000 */ addi r3, r3, lbl_0000AAD0@l
/* 000000E8 38840000 */ addi r4, r4, lbl_0000ABA8@l
/* 000000EC 38A50000 */ addi r5, r5, lbl_0000FF34@l
/* 000000F0 38C60000 */ addi r6, r6, lbl_00012248@l
/* 000000F4 48000071 */ bl set_minigame_callbacks
/* 000000F8 3C600000 */ lis r3, lbl_0001C918@ha
/* 000000FC 38630000 */ addi r3, r3, lbl_0001C918@l
/* 00000100 48000065 */ bl puts
/* 00000104 4800A58D */ bl lbl_0000A690
/* 00000108 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000010C 38000095 */ li r0, 0x95
/* 00000110 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000114 8001000C */ lwz r0, 0xc(r1)
/* 00000118 38210008 */ addi r1, r1, 8
/* 0000011C 7C0803A6 */ mtlr r0
/* 00000120 4E800020 */ blr 
