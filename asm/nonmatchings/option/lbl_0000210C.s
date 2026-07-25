/* 0000210C 7C0802A6 */ mflr r0
/* 00002110 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002114 90010004 */ stw r0, 4(r1)
/* 00002118 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000211C 9421FFF8 */ stwu r1, -8(r1)
/* 00002120 A0030004 */ lhz r0, 4(r3)
/* 00002124 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002128 41820020 */ beq lbl_00002148
/* 0000212C 3860006B */ li r3, 0x6b
/* 00002130 4BFFE07D */ bl u_play_sound_0
/* 00002134 3860005A */ li r3, 0x5a
/* 00002138 48002129 */ bl lbl_00004260
/* 0000213C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002140 380000AE */ li r0, 0xae
/* 00002144 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002148:
/* 00002148 8001000C */ lwz r0, 0xc(r1)
/* 0000214C 38210008 */ addi r1, r1, 8
/* 00002150 7C0803A6 */ mtlr r0
/* 00002154 4E800020 */ blr 
