/* 000000C8 7C0802A6 */ mflr r0
/* 000000CC 3C600000 */ lis r3, lbl_00000F34@ha
/* 000000D0 90010004 */ stw r0, 4(r1)
/* 000000D4 3C800000 */ lis r4, lbl_0000E8D0@ha
/* 000000D8 3CA00000 */ lis r5, lbl_0000C85C@ha
/* 000000DC 9421FFF8 */ stwu r1, -8(r1)
/* 000000E0 38C50000 */ addi r6, r5, lbl_0000C85C@l
/* 000000E4 38630000 */ addi r3, r3, lbl_00000F34@l
/* 000000E8 38840000 */ addi r4, r4, lbl_0000E8D0@l
/* 000000EC 38A00000 */ li r5, 0
/* 000000F0 48000045 */ bl set_minigame_callbacks
/* 000000F4 480000ED */ bl lbl_000001E0
/* 000000F8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000000FC 3800009D */ li r0, 0x9d
/* 00000100 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000104 8001000C */ lwz r0, 0xc(r1)
/* 00000108 38210008 */ addi r1, r1, 8
/* 0000010C 7C0803A6 */ mtlr r0
/* 00000110 4E800020 */ blr 
