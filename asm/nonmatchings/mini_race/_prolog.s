/* 000000D0 7C0802A6 */ mflr r0
/* 000000D4 3C600000 */ lis r3, lbl_0000056C@ha
/* 000000D8 90010004 */ stw r0, 4(r1)
/* 000000DC 3C800000 */ lis r4, lbl_000007EC@ha
/* 000000E0 3CA00000 */ lis r5, lbl_00003398@ha
/* 000000E4 3CC00000 */ lis r6, lbl_00008C4C@ha
/* 000000E8 9421FFF8 */ stwu r1, -8(r1)
/* 000000EC 38630000 */ addi r3, r3, lbl_0000056C@l
/* 000000F0 38840000 */ addi r4, r4, lbl_000007EC@l
/* 000000F4 38A50000 */ addi r5, r5, lbl_00003398@l
/* 000000F8 38C60000 */ addi r6, r6, lbl_00008C4C@l
/* 000000FC 48000081 */ bl set_minigame_callbacks
/* 00000100 48000129 */ bl lbl_00000228
/* 00000104 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000108 38830000 */ addi r4, r3, gameSubmodeRequest@l
/* 0000010C 38000099 */ li r0, 0x99
/* 00000110 B0040000 */ sth r0, 0(r4)
/* 00000114 3C600000 */ lis r3, debugFlags@ha
/* 00000118 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000011C 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000120 41820010 */ beq lbl_00000130
/* 00000124 3C600000 */ lis r3, lbl_0001593C@ha
/* 00000128 38630000 */ addi r3, r3, lbl_0001593C@l
/* 0000012C 48000051 */ bl puts
lbl_00000130:
/* 00000130 8001000C */ lwz r0, 0xc(r1)
/* 00000134 38210008 */ addi r1, r1, 8
/* 00000138 7C0803A6 */ mtlr r0
/* 0000013C 4E800020 */ blr 
