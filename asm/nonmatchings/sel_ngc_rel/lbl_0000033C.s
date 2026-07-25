/* 0000033C 7C0802A6 */ mflr r0
/* 00000340 3C600000 */ lis r3, debugFlags@ha
/* 00000344 90010004 */ stw r0, 4(r1)
/* 00000348 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000034C 93E10024 */ stw r31, 0x24(r1)
/* 00000350 93C10020 */ stw r30, 0x20(r1)
/* 00000354 93A1001C */ stw r29, 0x1c(r1)
/* 00000358 93810018 */ stw r28, 0x18(r1)
/* 0000035C 80030000 */ lwz r0, debugFlags@l(r3)
/* 00000360 3C600000 */ lis r3, lbl_10000000@ha
/* 00000364 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000368 7000000A */ andi. r0, r0, 0xa
/* 0000036C 40820248 */ bne lbl_000005B4
/* 00000370 4BFFFE19 */ bl u_clear_buffers_2_and_5
/* 00000374 38600001 */ li r3, 1
/* 00000378 4BFFFE11 */ bl event_start
/* 0000037C 38600004 */ li r3, 4
/* 00000380 4BFFFE09 */ bl event_start
/* 00000384 38600005 */ li r3, 5
/* 00000388 4BFFFE01 */ bl event_start
/* 0000038C 3860000F */ li r3, 0xf
/* 00000390 4BFFFDF9 */ bl event_start
/* 00000394 38600010 */ li r3, 0x10
/* 00000398 4BFFFDF1 */ bl event_start
/* 0000039C 38600012 */ li r3, 0x12
/* 000003A0 4BFFFDE9 */ bl event_start
/* 000003A4 3860000D */ li r3, 0xd
/* 000003A8 4BFFFDE1 */ bl event_start
/* 000003AC 38600013 */ li r3, 0x13
/* 000003B0 4BFFFDD9 */ bl event_start
/* 000003B4 38600000 */ li r3, 0
/* 000003B8 4BFFFDD1 */ bl light_init
/* 000003BC 38600034 */ li r3, 0x34
/* 000003C0 4BFFFDC9 */ bl camera_set_state_all
/* 000003C4 3C600000 */ lis r3, g_poolInfo@ha
/* 000003C8 38630000 */ addi r3, r3, g_poolInfo@l
/* 000003CC 38A3000C */ addi r5, r3, 0xc
/* 000003D0 8063000C */ lwz r3, 0xc(r3)
/* 000003D4 38800002 */ li r4, 2
/* 000003D8 38000000 */ li r0, 0
/* 000003DC 98830000 */ stb r4, 0(r3)
/* 000003E0 38600004 */ li r3, 4
/* 000003E4 80850000 */ lwz r4, 0(r5)
/* 000003E8 98040001 */ stb r0, 1(r4)
/* 000003EC 80850000 */ lwz r4, 0(r5)
/* 000003F0 98040002 */ stb r0, 2(r4)
/* 000003F4 80850000 */ lwz r4, 0(r5)
/* 000003F8 98040003 */ stb r0, 3(r4)
/* 000003FC 4BFFFD8D */ bl call_bitmap_load_group
/* 00000400 4800A551 */ bl lbl_0000A950
/* 00000404 3B800000 */ li r28, 0
lbl_00000408:
/* 00000408 7F83E378 */ mr r3, r28
/* 0000040C 4800E7C9 */ bl lbl_0000EBD4
/* 00000410 3B9C0001 */ addi r28, r28, 1
/* 00000414 2C1C001A */ cmpwi r28, 0x1a
/* 00000418 4180FFF0 */ blt lbl_00000408
/* 0000041C 3C600000 */ lis r3, lbl_801EEDA8@ha
/* 00000420 3BA30000 */ addi r29, r3, lbl_801EEDA8@l
/* 00000424 3B800000 */ li r28, 0
/* 00000428 939D00BC */ stw r28, 0xbc(r29)
/* 0000042C 3C600000 */ lis r3, lbl_00009868@ha
/* 00000430 3BC30000 */ addi r30, r3, lbl_00009868@l
/* 00000434 939D00C0 */ stw r28, 0xc0(r29)
/* 00000438 38BE0000 */ addi r5, r30, 0
/* 0000043C 38600000 */ li r3, 0
/* 00000440 38800000 */ li r4, 0
/* 00000444 4BFFFD45 */ bl ape_get_by_type
/* 00000448 38BE0000 */ addi r5, r30, 0
/* 0000044C 38600001 */ li r3, 1
/* 00000450 38800001 */ li r4, 1
/* 00000454 4BFFFD35 */ bl ape_get_by_type
/* 00000458 38BE0000 */ addi r5, r30, 0
/* 0000045C 38600002 */ li r3, 2
/* 00000460 38800002 */ li r4, 2
/* 00000464 4BFFFD25 */ bl ape_get_by_type
/* 00000468 38BE0000 */ addi r5, r30, 0
/* 0000046C 38600003 */ li r3, 3
/* 00000470 38800003 */ li r4, 3
/* 00000474 4BFFFD15 */ bl ape_get_by_type
/* 00000478 939D0058 */ stw r28, 0x58(r29)
/* 0000047C 380000BE */ li r0, 0xbe
/* 00000480 939D005C */ stw r28, 0x5c(r29)
/* 00000484 939D0060 */ stw r28, 0x60(r29)
/* 00000488 939D0064 */ stw r28, 0x64(r29)
/* 0000048C 901F003C */ stw r0, 0x3c(r31)
/* 00000490 807F003C */ lwz r3, 0x3c(r31)
/* 00000494 4BFFFCF5 */ bl preload_stage_files
/* 00000498 38000001 */ li r0, 1
/* 0000049C 3C600000 */ lis r3, modeCtrl@ha
/* 000004A0 901F00C0 */ stw r0, 0xc0(r31)
/* 000004A4 38630000 */ addi r3, r3, modeCtrl@l
/* 000004A8 80030008 */ lwz r0, 8(r3)
/* 000004AC 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 000004B0 418200AC */ beq lbl_0000055C
/* 000004B4 80030028 */ lwz r0, 0x28(r3)
/* 000004B8 2C000004 */ cmpwi r0, 4
/* 000004BC 41820030 */ beq lbl_000004EC
/* 000004C0 40800010 */ bge lbl_000004D0
/* 000004C4 2C000003 */ cmpwi r0, 3
/* 000004C8 40800014 */ bge lbl_000004DC
/* 000004CC 48000040 */ b lbl_0000050C
lbl_000004D0:
/* 000004D0 2C000006 */ cmpwi r0, 6
/* 000004D4 40800038 */ bge lbl_0000050C
/* 000004D8 48000024 */ b lbl_000004FC
lbl_000004DC:
/* 000004DC 38600008 */ li r3, 8
/* 000004E0 38800000 */ li r4, 0
/* 000004E4 4BFFFCA5 */ bl u_play_music
/* 000004E8 480000C0 */ b lbl_000005A8
lbl_000004EC:
/* 000004EC 3860000A */ li r3, 0xa
/* 000004F0 38800000 */ li r4, 0
/* 000004F4 4BFFFC95 */ bl u_play_music
/* 000004F8 480000B0 */ b lbl_000005A8
lbl_000004FC:
/* 000004FC 3860000C */ li r3, 0xc
/* 00000500 38800000 */ li r4, 0
/* 00000504 4BFFFC85 */ bl u_play_music
/* 00000508 480000A0 */ b lbl_000005A8
lbl_0000050C:
/* 0000050C 38600006 */ li r3, 6
/* 00000510 4BFFFC79 */ bl is_minigame_unlocked
/* 00000514 2C030000 */ cmpwi r3, 0
/* 00000518 41820034 */ beq lbl_0000054C
/* 0000051C 38600007 */ li r3, 7
/* 00000520 4BFFFC69 */ bl is_minigame_unlocked
/* 00000524 2C030000 */ cmpwi r3, 0
/* 00000528 41820024 */ beq lbl_0000054C
/* 0000052C 38600008 */ li r3, 8
/* 00000530 4BFFFC59 */ bl is_minigame_unlocked
/* 00000534 2C030000 */ cmpwi r3, 0
/* 00000538 41820014 */ beq lbl_0000054C
/* 0000053C 38600006 */ li r3, 6
/* 00000540 38800000 */ li r4, 0
/* 00000544 4BFFFC45 */ bl u_play_music
/* 00000548 48000060 */ b lbl_000005A8
lbl_0000054C:
/* 0000054C 38600004 */ li r3, 4
/* 00000550 38800000 */ li r4, 0
/* 00000554 4BFFFC35 */ bl u_play_music
/* 00000558 48000050 */ b lbl_000005A8
lbl_0000055C:
/* 0000055C 38600006 */ li r3, 6
/* 00000560 4BFFFC29 */ bl is_minigame_unlocked
/* 00000564 2C030000 */ cmpwi r3, 0
/* 00000568 41820034 */ beq lbl_0000059C
/* 0000056C 38600007 */ li r3, 7
/* 00000570 4BFFFC19 */ bl is_minigame_unlocked
/* 00000574 2C030000 */ cmpwi r3, 0
/* 00000578 41820024 */ beq lbl_0000059C
/* 0000057C 38600008 */ li r3, 8
/* 00000580 4BFFFC09 */ bl is_minigame_unlocked
/* 00000584 2C030000 */ cmpwi r3, 0
/* 00000588 41820014 */ beq lbl_0000059C
/* 0000058C 38600006 */ li r3, 6
/* 00000590 38800000 */ li r4, 0
/* 00000594 4BFFFBF5 */ bl u_play_music
/* 00000598 48000010 */ b lbl_000005A8
lbl_0000059C:
/* 0000059C 38600004 */ li r3, 4
/* 000005A0 38800000 */ li r4, 0
/* 000005A4 4BFFFBE5 */ bl u_play_music
lbl_000005A8:
/* 000005A8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000005AC 38000020 */ li r0, 0x20
/* 000005B0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000005B4:
/* 000005B4 8001002C */ lwz r0, 0x2c(r1)
/* 000005B8 83E10024 */ lwz r31, 0x24(r1)
/* 000005BC 83C10020 */ lwz r30, 0x20(r1)
/* 000005C0 7C0803A6 */ mtlr r0
/* 000005C4 83A1001C */ lwz r29, 0x1c(r1)
/* 000005C8 83810018 */ lwz r28, 0x18(r1)
/* 000005CC 38210028 */ addi r1, r1, 0x28
/* 000005D0 4E800020 */ blr 
