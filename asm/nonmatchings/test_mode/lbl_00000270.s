/* 00000270 7C0802A6 */ mflr r0
/* 00000274 3C600000 */ lis r3, lbl_802F2130@ha
/* 00000278 90010004 */ stw r0, 4(r1)
/* 0000027C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00000280 93E1000C */ stw r31, 0xc(r1)
/* 00000284 3BE00000 */ li r31, 0
/* 00000288 93E30000 */ stw r31, lbl_802F2130@l(r3)
/* 0000028C 4BFFFED1 */ bl reset_camera_viewport
/* 00000290 4800B1BD */ bl lbl_0000B44C
/* 00000294 4800BD0D */ bl lbl_0000BFA0
/* 00000298 48009229 */ bl lbl_000094C0
/* 0000029C 48001E6D */ bl lbl_00002108
/* 000002A0 480024C1 */ bl lbl_00002760
/* 000002A4 38600000 */ li r3, 0
/* 000002A8 38800000 */ li r4, 0
/* 000002AC 38A00001 */ li r5, 1
/* 000002B0 4BFFFEAD */ bl start_screen_fade
/* 000002B4 3860FFFF */ li r3, -1
/* 000002B8 38800001 */ li r4, 1
/* 000002BC 4BFFFEA1 */ bl u_play_music
/* 000002C0 3860000E */ li r3, 0xe
/* 000002C4 4BFFFE99 */ bl bitmap_free_group
/* 000002C8 4BFFFE95 */ bl func_800249D4
/* 000002CC 4BFFFE91 */ bl unload_stage
/* 000002D0 4BFFFE8D */ bl event_finish_all
/* 000002D4 38600000 */ li r3, 0
/* 000002D8 4BFFFE85 */ bl light_init
/* 000002DC 3C600000 */ lis r3, lbl_10000000@ha
/* 000002E0 38830000 */ addi r4, r3, lbl_10000000@l
/* 000002E4 93E40000 */ stw r31, 0(r4)
/* 000002E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000002EC 38000060 */ li r0, 0x60
/* 000002F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000002F4 80010014 */ lwz r0, 0x14(r1)
/* 000002F8 83E1000C */ lwz r31, 0xc(r1)
/* 000002FC 38210010 */ addi r1, r1, 0x10
/* 00000300 7C0803A6 */ mtlr r0
/* 00000304 4E800020 */ blr 
lbl_00000308:
/* 00000308 3C600000 */ lis r3, controllerInfo@ha
/* 0000030C 38E30000 */ addi r7, r3, controllerInfo@l
/* 00000310 A0670030 */ lhz r3, 0x30(r7)
/* 00000314 3C800000 */ lis r4, lbl_10000000@ha
/* 00000318 38840000 */ addi r4, r4, lbl_10000000@l
/* 0000031C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00000320 80840000 */ lwz r4, 0(r4)
/* 00000324 3CA00000 */ lis r5, lbl_000102B0@ha
/* 00000328 38050000 */ addi r0, r5, lbl_000102B0@l
/* 0000032C 40820044 */ bne lbl_00000370
/* 00000330 3CA00000 */ lis r5, analogInputs@ha
/* 00000334 38C50000 */ addi r6, r5, analogInputs@l
/* 00000338 A0A60008 */ lhz r5, 8(r6)
/* 0000033C 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000340 40820030 */ bne lbl_00000370
/* 00000344 A0A70000 */ lhz r5, 0(r7)
/* 00000348 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 0000034C 40820010 */ bne lbl_0000035C
/* 00000350 A0A60000 */ lhz r5, 0(r6)
/* 00000354 54A5077B */ rlwinm. r5, r5, 0, 0x1d, 0x1d
/* 00000358 4182003C */ beq lbl_00000394
lbl_0000035C:
/* 0000035C 3CA00000 */ lis r5, analogInputs@ha
/* 00000360 38A50000 */ addi r5, r5, analogInputs@l
/* 00000364 A0A50000 */ lhz r5, 0(r5)
/* 00000368 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 0000036C 41820028 */ beq lbl_00000394
lbl_00000370:
/* 00000370 38840001 */ addi r4, r4, 1
/* 00000374 2804001B */ cmplwi r4, 0x1b
/* 00000378 41800008 */ blt lbl_00000380
/* 0000037C 38800000 */ li r4, 0
lbl_00000380:
/* 00000380 1CA4000C */ mulli r5, r4, 0xc
/* 00000384 7CA02A14 */ add r5, r0, r5
/* 00000388 80A5027C */ lwz r5, 0x27c(r5)
/* 0000038C 2C050003 */ cmpwi r5, 3
/* 00000390 4182FFE0 */ beq lbl_00000370
lbl_00000394:
/* 00000394 54650739 */ rlwinm. r5, r3, 0, 0x1c, 0x1c
/* 00000398 4082004C */ bne lbl_000003E4
/* 0000039C 3CA00000 */ lis r5, analogInputs@ha
/* 000003A0 38C50000 */ addi r6, r5, analogInputs@l
/* 000003A4 A0A60008 */ lhz r5, 8(r6)
/* 000003A8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003AC 40820038 */ bne lbl_000003E4
/* 000003B0 3CA00000 */ lis r5, controllerInfo@ha
/* 000003B4 38A50000 */ addi r5, r5, controllerInfo@l
/* 000003B8 A0A50000 */ lhz r5, 0(r5)
/* 000003BC 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003C0 40820010 */ bne lbl_000003D0
/* 000003C4 A0A60000 */ lhz r5, 0(r6)
/* 000003C8 54A50739 */ rlwinm. r5, r5, 0, 0x1c, 0x1c
/* 000003CC 41820038 */ beq lbl_00000404
lbl_000003D0:
/* 000003D0 3CA00000 */ lis r5, analogInputs@ha
/* 000003D4 38A50000 */ addi r5, r5, analogInputs@l
/* 000003D8 A0A50000 */ lhz r5, 0(r5)
/* 000003DC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000003E0 41820024 */ beq lbl_00000404
lbl_000003E4:
/* 000003E4 3484FFFF */ addic. r4, r4, -1
/* 000003E8 40800008 */ bge lbl_000003F0
/* 000003EC 3880001A */ li r4, 0x1a
lbl_000003F0:
/* 000003F0 1CA4000C */ mulli r5, r4, 0xc
/* 000003F4 7CA02A14 */ add r5, r0, r5
/* 000003F8 80A5027C */ lwz r5, 0x27c(r5)
/* 000003FC 2C050003 */ cmpwi r5, 3
/* 00000400 4182FFE4 */ beq lbl_000003E4
lbl_00000404:
/* 00000404 1CA4000C */ mulli r5, r4, 0xc
/* 00000408 3CC00000 */ lis r6, lbl_10000000@ha
/* 0000040C 90860000 */ stw r4, lbl_10000000@l(r6)
/* 00000410 7CA02A14 */ add r5, r0, r5
/* 00000414 8405027C */ lwzu r0, 0x27c(r5)
/* 00000418 2C000001 */ cmpwi r0, 1
/* 0000041C 41820048 */ beq lbl_00000464
/* 00000420 40800010 */ bge lbl_00000430
/* 00000424 2C000000 */ cmpwi r0, 0
/* 00000428 40800014 */ bge lbl_0000043C
/* 0000042C 4E800020 */ blr 
lbl_00000430:
/* 00000430 2C000003 */ cmpwi r0, 3
/* 00000434 4C800020 */ bgelr 
/* 00000438 48000114 */ b lbl_0000054C
lbl_0000043C:
/* 0000043C 3C600000 */ lis r3, controllerInfo@ha
/* 00000440 38630000 */ addi r3, r3, controllerInfo@l
/* 00000444 A0030018 */ lhz r0, 0x18(r3)
/* 00000448 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000044C 4D820020 */ beqlr 
/* 00000450 80050008 */ lwz r0, 8(r5)
/* 00000454 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000458 7C000734 */ extsh r0, r0
/* 0000045C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000460 4E800020 */ blr 
lbl_00000464:
/* 00000464 3C800000 */ lis r4, loadingStageIdRequest@ha
/* 00000468 38A40000 */ addi r5, r4, loadingStageIdRequest@l
/* 0000046C 546407FF */ clrlwi. r4, r3, 0x1f
/* 00000470 A8050000 */ lha r0, 0(r5)
/* 00000474 7C040378 */ mr r4, r0
/* 00000478 4082004C */ bne lbl_000004C4
/* 0000047C 3CA00000 */ lis r5, analogInputs@ha
/* 00000480 38C50000 */ addi r6, r5, analogInputs@l
/* 00000484 A0A60008 */ lhz r5, 8(r6)
/* 00000488 54A507FF */ clrlwi. r5, r5, 0x1f
/* 0000048C 40820038 */ bne lbl_000004C4
/* 00000490 3CA00000 */ lis r5, controllerInfo@ha
/* 00000494 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000498 A0A50000 */ lhz r5, 0(r5)
/* 0000049C 54A507FF */ clrlwi. r5, r5, 0x1f
/* 000004A0 40820010 */ bne lbl_000004B0
/* 000004A4 A0A60000 */ lhz r5, 0(r6)
/* 000004A8 54A507FF */ clrlwi. r5, r5, 0x1f
/* 000004AC 41820028 */ beq lbl_000004D4
lbl_000004B0:
/* 000004B0 3CA00000 */ lis r5, analogInputs@ha
/* 000004B4 38A50000 */ addi r5, r5, analogInputs@l
/* 000004B8 A0A50000 */ lhz r5, 0(r5)
/* 000004BC 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000004C0 41820014 */ beq lbl_000004D4
lbl_000004C4:
/* 000004C4 3884FFFF */ addi r4, r4, -1
/* 000004C8 2C040001 */ cmpwi r4, 1
/* 000004CC 40800008 */ bge lbl_000004D4
/* 000004D0 38800001 */ li r4, 1
lbl_000004D4:
/* 000004D4 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000004D8 4082004C */ bne lbl_00000524
/* 000004DC 3C600000 */ lis r3, analogInputs@ha
/* 000004E0 38A30000 */ addi r5, r3, analogInputs@l
/* 000004E4 A0650008 */ lhz r3, 8(r5)
/* 000004E8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000004EC 40820038 */ bne lbl_00000524
/* 000004F0 3C600000 */ lis r3, controllerInfo@ha
/* 000004F4 38630000 */ addi r3, r3, controllerInfo@l
/* 000004F8 A0630000 */ lhz r3, 0(r3)
/* 000004FC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00000500 40820010 */ bne lbl_00000510
/* 00000504 A0650000 */ lhz r3, 0(r5)
/* 00000508 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 0000050C 41820028 */ beq lbl_00000534
lbl_00000510:
/* 00000510 3C600000 */ lis r3, analogInputs@ha
/* 00000514 38630000 */ addi r3, r3, analogInputs@l
/* 00000518 A0630000 */ lhz r3, 0(r3)
/* 0000051C 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00000520 41820014 */ beq lbl_00000534
lbl_00000524:
/* 00000524 38840001 */ addi r4, r4, 1
/* 00000528 2C0400C8 */ cmpwi r4, 0xc8
/* 0000052C 40810008 */ ble lbl_00000534
/* 00000530 388000C8 */ li r4, 0xc8
lbl_00000534:
/* 00000534 7C040000 */ cmpw r4, r0
/* 00000538 4D820020 */ beqlr 
/* 0000053C 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 00000540 7C800734 */ extsh r0, r4
/* 00000544 B0030000 */ sth r0, loadingStageIdRequest@l(r3)
/* 00000548 4E800020 */ blr 
lbl_0000054C:
/* 0000054C 3C800000 */ lis r4, lbl_802F1F40@ha
/* 00000550 38A40000 */ addi r5, r4, lbl_802F1F40@l
/* 00000554 546407FF */ clrlwi. r4, r3, 0x1f
/* 00000558 A8050000 */ lha r0, 0(r5)
/* 0000055C 7C040378 */ mr r4, r0
/* 00000560 4082004C */ bne lbl_000005AC
/* 00000564 3CA00000 */ lis r5, analogInputs@ha
/* 00000568 38C50000 */ addi r6, r5, analogInputs@l
/* 0000056C A0A60008 */ lhz r5, 8(r6)
/* 00000570 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000574 40820038 */ bne lbl_000005AC
/* 00000578 3CA00000 */ lis r5, controllerInfo@ha
/* 0000057C 38A50000 */ addi r5, r5, controllerInfo@l
/* 00000580 A0A50000 */ lhz r5, 0(r5)
/* 00000584 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000588 40820010 */ bne lbl_00000598
/* 0000058C A0A60000 */ lhz r5, 0(r6)
/* 00000590 54A507FF */ clrlwi. r5, r5, 0x1f
/* 00000594 41820024 */ beq lbl_000005B8
lbl_00000598:
/* 00000598 3CA00000 */ lis r5, analogInputs@ha
/* 0000059C 38A50000 */ addi r5, r5, analogInputs@l
/* 000005A0 A0A50000 */ lhz r5, 0(r5)
/* 000005A4 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 000005A8 41820010 */ beq lbl_000005B8
lbl_000005AC:
/* 000005AC 3484FFFF */ addic. r4, r4, -1
/* 000005B0 40800008 */ bge lbl_000005B8
/* 000005B4 38800000 */ li r4, 0
lbl_000005B8:
/* 000005B8 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005BC 4082004C */ bne lbl_00000608
/* 000005C0 3C600000 */ lis r3, analogInputs@ha
/* 000005C4 38A30000 */ addi r5, r3, analogInputs@l
/* 000005C8 A0650008 */ lhz r3, 8(r5)
/* 000005CC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005D0 40820038 */ bne lbl_00000608
/* 000005D4 3C600000 */ lis r3, controllerInfo@ha
/* 000005D8 38630000 */ addi r3, r3, controllerInfo@l
/* 000005DC A0630000 */ lhz r3, 0(r3)
/* 000005E0 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005E4 40820010 */ bne lbl_000005F4
/* 000005E8 A0650000 */ lhz r3, 0(r5)
/* 000005EC 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 000005F0 41820028 */ beq lbl_00000618
lbl_000005F4:
/* 000005F4 3C600000 */ lis r3, analogInputs@ha
/* 000005F8 38630000 */ addi r3, r3, analogInputs@l
/* 000005FC A0630000 */ lhz r3, 0(r3)
/* 00000600 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 00000604 41820014 */ beq lbl_00000618
lbl_00000608:
/* 00000608 38840001 */ addi r4, r4, 1
/* 0000060C 2C04001B */ cmpwi r4, 0x1b
/* 00000610 40810008 */ ble lbl_00000618
/* 00000614 3880001B */ li r4, 0x1b
lbl_00000618:
/* 00000618 7C040000 */ cmpw r4, r0
/* 0000061C 4D820020 */ beqlr 
/* 00000620 3C600000 */ lis r3, lbl_802F1F40@ha
/* 00000624 7C800734 */ extsh r0, r4
/* 00000628 B0030000 */ sth r0, lbl_802F1F40@l(r3)
/* 0000062C 4E800020 */ blr 
