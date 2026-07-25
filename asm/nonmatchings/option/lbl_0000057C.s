/* 0000057C 7C0802A6 */ mflr r0
/* 00000580 3C600000 */ lis r3, lbl_0000C6A4@ha
/* 00000584 90010004 */ stw r0, 4(r1)
/* 00000588 38630000 */ addi r3, r3, lbl_0000C6A4@l
/* 0000058C 38800000 */ li r4, 0
/* 00000590 9421FFF8 */ stwu r1, -8(r1)
/* 00000594 88630000 */ lbz r3, 0(r3)
/* 00000598 4BFFFC15 */ bl u_play_music
/* 0000059C 480079F5 */ bl lbl_00007F90
/* 000005A0 3C600000 */ lis r3, lbl_10000000@ha
/* 000005A4 38630000 */ addi r3, r3, lbl_10000000@l
/* 000005A8 3800001E */ li r0, 0x1e
/* 000005AC 900300D8 */ stw r0, 0xd8(r3)
/* 000005B0 3CC00000 */ lis r6, lbl_100001B4@ha
/* 000005B4 38000000 */ li r0, 0
/* 000005B8 3CA00000 */ lis r5, lbl_00000714@ha
/* 000005BC B0060000 */ sth r0, lbl_100001B4@l(r6)
/* 000005C0 3C800000 */ lis r4, submodeFinishFunc@ha
/* 000005C4 38050000 */ addi r0, r5, lbl_00000714@l
/* 000005C8 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 000005CC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000005D0 380000B1 */ li r0, 0xb1
/* 000005D4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000005D8 8001000C */ lwz r0, 0xc(r1)
/* 000005DC 38210008 */ addi r1, r1, 8
/* 000005E0 7C0803A6 */ mtlr r0
/* 000005E4 4E800020 */ blr 
