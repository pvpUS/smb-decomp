/* 000002F4 7C0802A6 */ mflr r0
/* 000002F8 3C600000 */ lis r3, lbl_10000000@ha
/* 000002FC 90010004 */ stw r0, 4(r1)
/* 00000300 38630000 */ addi r3, r3, lbl_10000000@l
/* 00000304 38000000 */ li r0, 0
/* 00000308 9421FFF8 */ stwu r1, -8(r1)
/* 0000030C 98030039 */ stb r0, 0x39(r3)
/* 00000310 48004BA5 */ bl lbl_00004EB4
/* 00000314 3C600000 */ lis r3, lbl_802014E0@ha
/* 00000318 80030000 */ lwz r0, lbl_802014E0@l(r3)
/* 0000031C 2C000049 */ cmpwi r0, 0x49
/* 00000320 41820010 */ beq sel_stage_handle_input
/* 00000324 38600049 */ li r3, 0x49
/* 00000328 38800000 */ li r4, 0
/* 0000032C 4BFFFE81 */ bl u_play_music
sel_stage_handle_input:
/* 00000330 3C600000 */ lis r3, modeCtrl@ha
/* 00000334 38830000 */ addi r4, r3, modeCtrl@l
/* 00000338 80040008 */ lwz r0, 8(r4)
/* 0000033C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000340 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00000344 90040008 */ stw r0, 8(r4)
/* 00000348 380000AF */ li r0, 0xaf
/* 0000034C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000350 8001000C */ lwz r0, 0xc(r1)
/* 00000354 38210008 */ addi r1, r1, 8
/* 00000358 7C0803A6 */ mtlr r0
/* 0000035C 4E800020 */ blr 
