/* 00000360 7C0802A6 */ mflr r0
/* 00000364 3C600000 */ lis r3, modeCtrl@ha
/* 00000368 90010004 */ stw r0, 4(r1)
/* 0000036C 38C30000 */ addi r6, r3, modeCtrl@l
/* 00000370 9421FFE0 */ stwu r1, -0x20(r1)
/* 00000374 93E1001C */ stw r31, 0x1c(r1)
/* 00000378 93C10018 */ stw r30, 0x18(r1)
/* 0000037C 3BC60008 */ addi r30, r6, 8
/* 00000380 93A10014 */ stw r29, 0x14(r1)
/* 00000384 80060008 */ lwz r0, 8(r6)
/* 00000388 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000038C 40820198 */ bne lbl_00000524
/* 00000390 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000394 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000398 A0830008 */ lhz r4, 8(r3)
/* 0000039C 3C600000 */ lis r3, lbl_10000000@ha
/* 000003A0 38630000 */ addi r3, r3, lbl_10000000@l
/* 000003A4 3BE3003C */ addi r31, r3, 0x3c
/* 000003A8 80630050 */ lwz r3, 0x50(r3)
/* 000003AC 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000003B0 7C650774 */ extsb r5, r3
/* 000003B4 40820018 */ bne lbl_000003CC
/* 000003B8 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000003BC 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000003C0 A0030008 */ lhz r0, 8(r3)
/* 000003C4 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000003C8 41820018 */ beq lbl_000003E0
lbl_000003CC:
/* 000003CC 38A50001 */ addi r5, r5, 1
/* 000003D0 7CA00774 */ extsb r0, r5
/* 000003D4 28000007 */ cmplwi r0, 7
/* 000003D8 41800008 */ blt lbl_000003E0
/* 000003DC 38A00000 */ li r5, 0
lbl_000003E0:
/* 000003E0 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000003E4 40820018 */ bne lbl_000003FC
/* 000003E8 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000003EC 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000003F0 A0030008 */ lhz r0, 8(r3)
/* 000003F4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000003F8 41820014 */ beq lbl_0000040C
lbl_000003FC:
/* 000003FC 38A5FFFF */ addi r5, r5, -1
/* 00000400 7CA00775 */ extsb. r0, r5
/* 00000404 40800008 */ bge lbl_0000040C
/* 00000408 38A00006 */ li r5, 6
lbl_0000040C:
/* 0000040C 801F0014 */ lwz r0, 0x14(r31)
/* 00000410 7CBD0774 */ extsb r29, r5
/* 00000414 7C1D0000 */ cmpw r29, r0
/* 00000418 41820010 */ beq lbl_00000428
/* 0000041C 3860006C */ li r3, 0x6c
/* 00000420 4BFFFD8D */ bl u_play_sound_0
/* 00000424 93BF0014 */ stw r29, 0x14(r31)
lbl_00000428:
/* 00000428 801F0014 */ lwz r0, 0x14(r31)
/* 0000042C 3C600000 */ lis r3, lbl_0000C7A4@ha
/* 00000430 3BA30000 */ addi r29, r3, lbl_0000C7A4@l
/* 00000434 1C00000C */ mulli r0, r0, 0xc
/* 00000438 7C7D0214 */ add r3, r29, r0
/* 0000043C 80030000 */ lwz r0, 0(r3)
/* 00000440 2C000000 */ cmpwi r0, 0
/* 00000444 41820008 */ beq lbl_0000044C
/* 00000448 48000054 */ b lbl_0000049C
lbl_0000044C:
/* 0000044C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000450 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000454 A0030004 */ lhz r0, 4(r3)
/* 00000458 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000045C 41820040 */ beq lbl_0000049C
/* 00000460 3860006A */ li r3, 0x6a
/* 00000464 4BFFFD49 */ bl u_play_sound_0
/* 00000468 38600058 */ li r3, 0x58
/* 0000046C 48003D99 */ bl lbl_00004204
/* 00000470 3C600000 */ lis r3, modeCtrl@ha
/* 00000474 3800001E */ li r0, 0x1e
/* 00000478 90030000 */ stw r0, modeCtrl@l(r3)
/* 0000047C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000480 801F0014 */ lwz r0, 0x14(r31)
/* 00000484 1C00000C */ mulli r0, r0, 0xc
/* 00000488 7C9D0214 */ add r4, r29, r0
/* 0000048C 80040008 */ lwz r0, 8(r4)
/* 00000490 7C000734 */ extsh r0, r0
/* 00000494 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000498 480000C8 */ b lbl_00000560
lbl_0000049C:
/* 0000049C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000004A0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000004A4 A0030004 */ lhz r0, 4(r3)
/* 000004A8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000004AC 418200B4 */ beq lbl_00000560
/* 000004B0 3C600000 */ lis r3, eventInfo@ha
/* 000004B4 88030000 */ lbz r0, eventInfo@l(r3)
/* 000004B8 7C000775 */ extsb. r0, r0
/* 000004BC 408200A4 */ bne lbl_00000560
/* 000004C0 3860006B */ li r3, 0x6b
/* 000004C4 4BFFFCE9 */ bl u_play_sound_0
/* 000004C8 4BFFFCE5 */ bl func_8009F4C4
/* 000004CC 5460063E */ clrlwi r0, r3, 0x18
/* 000004D0 28000001 */ cmplwi r0, 1
/* 000004D4 40820014 */ bne lbl_000004E8
/* 000004D8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000004DC 380000BA */ li r0, 0xba
/* 000004E0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000004E4 4800007C */ b lbl_00000560
lbl_000004E8:
/* 000004E8 3C600000 */ lis r3, modeCtrl@ha
/* 000004EC 3BE30000 */ addi r31, r3, modeCtrl@l
/* 000004F0 3800001E */ li r0, 0x1e
/* 000004F4 901F0000 */ stw r0, 0(r31)
/* 000004F8 38600101 */ li r3, 0x101
/* 000004FC 38800000 */ li r4, 0
/* 00000500 80BF0000 */ lwz r5, 0(r31)
/* 00000504 4BFFFCA9 */ bl start_screen_fade
/* 00000508 807F0000 */ lwz r3, 0(r31)
/* 0000050C 38800002 */ li r4, 2
/* 00000510 4BFFFC9D */ bl u_play_music
/* 00000514 801E0000 */ lwz r0, 0(r30)
/* 00000518 60000004 */ ori r0, r0, 4
/* 0000051C 901E0000 */ stw r0, 0(r30)
/* 00000520 48000040 */ b lbl_00000560
lbl_00000524:
/* 00000524 80660000 */ lwz r3, 0(r6)
/* 00000528 3403FFFF */ addic. r0, r3, -1
/* 0000052C 90060000 */ stw r0, 0(r6)
/* 00000530 41810030 */ bgt lbl_00000560
/* 00000534 38A00000 */ li r5, 0
/* 00000538 90A60000 */ stw r5, 0(r6)
/* 0000053C 38000003 */ li r0, 3
/* 00000540 3C800000 */ lis r4, gameModeRequest@ha
/* 00000544 90060020 */ stw r0, 0x20(r6)
/* 00000548 38000001 */ li r0, 1
/* 0000054C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000550 90060010 */ stw r0, 0x10(r6)
/* 00000554 38000015 */ li r0, 0x15
/* 00000558 B0A40000 */ sth r5, gameModeRequest@l(r4)
/* 0000055C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00000560:
/* 00000560 80010024 */ lwz r0, 0x24(r1)
/* 00000564 83E1001C */ lwz r31, 0x1c(r1)
/* 00000568 83C10018 */ lwz r30, 0x18(r1)
/* 0000056C 7C0803A6 */ mtlr r0
/* 00000570 83A10014 */ lwz r29, 0x14(r1)
/* 00000574 38210020 */ addi r1, r1, 0x20
/* 00000578 4E800020 */ blr 
