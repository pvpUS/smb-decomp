/* 000000D0 7C0802A6 */ mflr r0
/* 000000D4 3C600000 */ lis r3, lbl_00000718@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3C800000 */ lis r4, lbl_000009EC@ha
/* 000000E0 3CA00000 */ lis r5, lbl_00000F98@ha
/* 000000E4 3CC00000 */ lis r6, lbl_00007878@ha
/* 000000E8 9421FFF8 */ stwu r1, -8(r1)
/* 000000EC 3CE00000 */ lis r7, lbl_0000871C@ha
/* 000000F0 38630000 */ addi r3, r3, lbl_00000718@l
/* 000000F4 38840000 */ addi r4, r4, lbl_000009EC@l
/* 000000F8 38A50000 */ addi r5, r5, lbl_00000F98@l
/* 000000FC 38C60000 */ addi r6, r6, lbl_00007878@l
/* 00000100 38E70000 */ addi r7, r7, lbl_0000871C@l
/* 00000104 4800005D */ bl u_set_minigame_callbacks_2
/* 00000108 48000105 */ bl lbl_0000020C
/* 0000010C 3C800000 */ lis r4, gameSubmodeRequest@ha
/* 00000110 38000097 */ li r0, 0x97
/* 00000114 3C600000 */ lis r3, lbl_00015024@ha
/* 00000118 B0040000 */ sth r0, gameSubmodeRequest@l(r4)
/* 0000011C 38630000 */ addi r3, r3, lbl_00015024@l
/* 00000120 48000041 */ bl puts
/* 00000124 8001000C */ lwz r0, 0xc(r1)
/* 00000128 38210008 */ addi r1, r1, 8
/* 0000012C 7C0803A6 */ mtlr r0
/* 00000130 4E800020 */ blr 
