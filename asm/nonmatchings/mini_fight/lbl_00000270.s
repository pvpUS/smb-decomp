/* 00000270 7C0802A6 */ mflr r0
/* 00000274 38600005 */ li r3, 5
/* 00000278 90010004 */ stw r0, 4(r1)
/* 0000027C 38800000 */ li r4, 0
/* 00000280 9421FFF8 */ stwu r1, -8(r1)
/* 00000284 4BFFFEE1 */ bl func_8006B3E8
/* 00000288 38600006 */ li r3, 6
/* 0000028C 38800000 */ li r4, 0
/* 00000290 4BFFFED5 */ bl func_8006B3E8
/* 00000294 38600007 */ li r3, 7
/* 00000298 38800000 */ li r4, 0
/* 0000029C 4BFFFEC9 */ bl func_8006B3E8
/* 000002A0 38600008 */ li r3, 8
/* 000002A4 38800000 */ li r4, 0
/* 000002A8 4BFFFEBD */ bl func_8006B3E8
/* 000002AC 8001000C */ lwz r0, 0xc(r1)
/* 000002B0 38210008 */ addi r1, r1, 8
/* 000002B4 7C0803A6 */ mtlr r0
/* 000002B8 4E800020 */ blr 
lbl_000002BC:
/* 000002BC 38C00000 */ li r6, 0
/* 000002C0 B0C3000C */ sth r6, 0xc(r3)
/* 000002C4 3C800000 */ lis r4, lbl_8028C0B0@ha
/* 000002C8 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 000002CC 80030008 */ lwz r0, 8(r3)
/* 000002D0 38840000 */ addi r4, r4, lbl_8028C0B0@l
/* 000002D4 38E50000 */ addi r7, r5, lbl_0001BF80@l
/* 000002D8 6000000A */ ori r0, r0, 0xa
/* 000002DC 90030008 */ stw r0, 8(r3)
/* 000002E0 80040014 */ lwz r0, 0x14(r4)
/* 000002E4 90030054 */ stw r0, 0x54(r3)
/* 000002E8 80830054 */ lwz r4, 0x54(r3)
/* 000002EC C0270000 */ lfs f1, 0(r7)
/* 000002F0 C0040014 */ lfs f0, 0x14(r4)
/* 000002F4 EC010032 */ fmuls f0, f1, f0
/* 000002F8 D0030034 */ stfs f0, 0x34(r3)
/* 000002FC 80A30054 */ lwz r5, 0x54(r3)
/* 00000300 80850008 */ lwz r4, 8(r5)
/* 00000304 8005000C */ lwz r0, 0xc(r5)
/* 00000308 90830010 */ stw r4, 0x10(r3)
/* 0000030C 90030014 */ stw r0, 0x14(r3)
/* 00000310 80050010 */ lwz r0, 0x10(r5)
/* 00000314 90030018 */ stw r0, 0x18(r3)
/* 00000318 80830054 */ lwz r4, 0x54(r3)
/* 0000031C C003003C */ lfs f0, 0x3c(r3)
/* 00000320 C0240014 */ lfs f1, 0x14(r4)
/* 00000324 C0470004 */ lfs f2, 4(r7)
/* 00000328 EC010032 */ fmuls f0, f1, f0
/* 0000032C C023005C */ lfs f1, 0x5c(r3)
/* 00000330 EC020032 */ fmuls f0, f2, f0
/* 00000334 EC010028 */ fsubs f0, f1, f0
/* 00000338 D00300B8 */ stfs f0, 0xb8(r3)
/* 0000033C C0070008 */ lfs f0, 8(r7)
/* 00000340 D00300C0 */ stfs f0, 0xc0(r3)
/* 00000344 C0070008 */ lfs f0, 8(r7)
/* 00000348 D00300C4 */ stfs f0, 0xc4(r3)
/* 0000034C C0070008 */ lfs f0, 8(r7)
/* 00000350 D00300C8 */ stfs f0, 0xc8(r3)
/* 00000354 C007000C */ lfs f0, 0xc(r7)
/* 00000358 D0030048 */ stfs f0, 0x48(r3)
/* 0000035C C007000C */ lfs f0, 0xc(r7)
/* 00000360 D003004C */ stfs f0, 0x4c(r3)
/* 00000364 C007000C */ lfs f0, 0xc(r7)
/* 00000368 D0030050 */ stfs f0, 0x50(r3)
/* 0000036C B0C30076 */ sth r6, 0x76(r3)
/* 00000370 C0070000 */ lfs f0, 0(r7)
/* 00000374 D003009C */ stfs f0, 0x9c(r3)
/* 00000378 80830010 */ lwz r4, 0x10(r3)
/* 0000037C 80030014 */ lwz r0, 0x14(r3)
/* 00000380 90830090 */ stw r4, 0x90(r3)
/* 00000384 90030094 */ stw r0, 0x94(r3)
/* 00000388 80030018 */ lwz r0, 0x18(r3)
/* 0000038C 90030098 */ stw r0, 0x98(r3)
/* 00000390 4E800020 */ blr 
lbl_00000394:
/* 00000394 A803000C */ lha r0, 0xc(r3)
/* 00000398 3C800000 */ lis r4, lbl_0001BF80@ha
/* 0000039C 80C300A4 */ lwz r6, 0xa4(r3)
/* 000003A0 38A40000 */ addi r5, r4, lbl_0001BF80@l
/* 000003A4 2C000001 */ cmpwi r0, 1
/* 000003A8 41820078 */ beq lbl_00000420
/* 000003AC 40800010 */ bge lbl_000003BC
/* 000003B0 2C000000 */ cmpwi r0, 0
/* 000003B4 40800014 */ bge lbl_000003C8
/* 000003B8 480000CC */ b lbl_00000484
lbl_000003BC:
/* 000003BC 2C000003 */ cmpwi r0, 3
/* 000003C0 408000C4 */ bge lbl_00000484
/* 000003C4 4800006C */ b lbl_00000430
lbl_000003C8:
/* 000003C8 A8830078 */ lha r4, 0x78(r3)
/* 000003CC 20040100 */ subfic r0, r4, 0x100
/* 000003D0 7C003670 */ srawi r0, r0, 6
/* 000003D4 7C040214 */ add r0, r4, r0
/* 000003D8 B0030078 */ sth r0, 0x78(r3)
/* 000003DC C0230048 */ lfs f1, 0x48(r3)
/* 000003E0 C8050010 */ lfd f0, 0x10(r5)
/* 000003E4 FC010040 */ fcmpo cr0, f1, f0
/* 000003E8 4081009C */ ble lbl_00000484
/* 000003EC C8050018 */ lfd f0, 0x18(r5)
/* 000003F0 FC010028 */ fsub f0, f1, f0
/* 000003F4 FC000018 */ frsp f0, f0
/* 000003F8 D0030048 */ stfs f0, 0x48(r3)
/* 000003FC C0230048 */ lfs f1, 0x48(r3)
/* 00000400 C8050010 */ lfd f0, 0x10(r5)
/* 00000404 FC010040 */ fcmpo cr0, f1, f0
/* 00000408 4080000C */ bge lbl_00000414
/* 0000040C C005000C */ lfs f0, 0xc(r5)
/* 00000410 D0030048 */ stfs f0, 0x48(r3)
lbl_00000414:
/* 00000414 C0030048 */ lfs f0, 0x48(r3)
/* 00000418 D0030050 */ stfs f0, 0x50(r3)
/* 0000041C 48000068 */ b lbl_00000484
lbl_00000420:
/* 00000420 38000002 */ li r0, 2
/* 00000424 B003000C */ sth r0, 0xc(r3)
/* 00000428 38000007 */ li r0, 7
/* 0000042C B003000E */ sth r0, 0xe(r3)
lbl_00000430:
/* 00000430 A883000E */ lha r4, 0xe(r3)
/* 00000434 3804FFFF */ addi r0, r4, -1
/* 00000438 B003000E */ sth r0, 0xe(r3)
/* 0000043C A803000E */ lha r0, 0xe(r3)
/* 00000440 2C000000 */ cmpwi r0, 0
/* 00000444 4080000C */ bge lbl_00000450
/* 00000448 38000000 */ li r0, 0
/* 0000044C B003000C */ sth r0, 0xc(r3)
lbl_00000450:
/* 00000450 A8830078 */ lha r4, 0x78(r3)
/* 00000454 38040100 */ addi r0, r4, 0x100
/* 00000458 B0030078 */ sth r0, 0x78(r3)
/* 0000045C C0430048 */ lfs f2, 0x48(r3)
/* 00000460 C8050028 */ lfd f0, 0x28(r5)
/* 00000464 C8250020 */ lfd f1, 0x20(r5)
/* 00000468 FC001028 */ fsub f0, f0, f2
/* 0000046C FC010032 */ fmul f0, f1, f0
/* 00000470 FC02002A */ fadd f0, f2, f0
/* 00000474 FC000018 */ frsp f0, f0
/* 00000478 D0030048 */ stfs f0, 0x48(r3)
/* 0000047C C0030048 */ lfs f0, 0x48(r3)
/* 00000480 D0030050 */ stfs f0, 0x50(r3)
lbl_00000484:
/* 00000484 88060001 */ lbz r0, 1(r6)
/* 00000488 28000001 */ cmplwi r0, 1
/* 0000048C 4182004C */ beq lbl_000004D8
/* 00000490 C02300C4 */ lfs f1, 0xc4(r3)
/* 00000494 C0050030 */ lfs f0, 0x30(r5)
/* 00000498 EC010028 */ fsubs f0, f1, f0
/* 0000049C D00300C4 */ stfs f0, 0xc4(r3)
/* 000004A0 C023005C */ lfs f1, 0x5c(r3)
/* 000004A4 C00300C4 */ lfs f0, 0xc4(r3)
/* 000004A8 EC01002A */ fadds f0, f1, f0
/* 000004AC D003005C */ stfs f0, 0x5c(r3)
/* 000004B0 C023005C */ lfs f1, 0x5c(r3)
/* 000004B4 C00300B8 */ lfs f0, 0xb8(r3)
/* 000004B8 FC010040 */ fcmpo cr0, f1, f0
/* 000004BC 4080001C */ bge lbl_000004D8
/* 000004C0 3C800000 */ lis r4, g_poolInfo@ha
/* 000004C4 A8030000 */ lha r0, 0(r3)
/* 000004C8 38840000 */ addi r4, r4, g_poolInfo@l
/* 000004CC 8084002C */ lwz r4, 0x2c(r4)
/* 000004D0 38A00003 */ li r5, 3
/* 000004D4 7CA401AE */ stbx r5, r4, r0
lbl_000004D8:
/* 000004D8 A8830076 */ lha r4, 0x76(r3)
/* 000004DC A8030078 */ lha r0, 0x78(r3)
/* 000004E0 7C040214 */ add r0, r4, r0
/* 000004E4 B0030076 */ sth r0, 0x76(r3)
/* 000004E8 4E800020 */ blr 
lbl_000004EC:
/* 000004EC 7C0802A6 */ mflr r0
/* 000004F0 90010004 */ stw r0, 4(r1)
/* 000004F4 9421FFB8 */ stwu r1, -0x48(r1)
/* 000004F8 DBE10040 */ stfd f31, 0x40(r1)
/* 000004FC DBC10038 */ stfd f30, 0x38(r1)
/* 00000500 93E10034 */ stw r31, 0x34(r1)
/* 00000504 93C10030 */ stw r30, 0x30(r1)
/* 00000508 93A1002C */ stw r29, 0x2c(r1)
/* 0000050C 3BA30000 */ addi r29, r3, 0
/* 00000510 3C600000 */ lis r3, lbl_0001BF80@ha
/* 00000514 3BC30000 */ addi r30, r3, lbl_0001BF80@l
/* 00000518 387D0058 */ addi r3, r29, 0x58
/* 0000051C 4BFFFC49 */ bl mathutil_mtxA_from_mtxB_translate
/* 00000520 A87D0074 */ lha r3, 0x74(r29)
/* 00000524 4BFFFC41 */ bl mathutil_mtxA_rotate_z
/* 00000528 A87D0072 */ lha r3, 0x72(r29)
/* 0000052C 4BFFFC39 */ bl mathutil_mtxA_rotate_y
/* 00000530 A87D0070 */ lha r3, 0x70(r29)
/* 00000534 4BFFFC31 */ bl mathutil_mtxA_rotate_x
/* 00000538 A87D0076 */ lha r3, 0x76(r29)
/* 0000053C 4BFFFC29 */ bl mathutil_mtxA_rotate_y
/* 00000540 C03D0048 */ lfs f1, 0x48(r29)
/* 00000544 C01D003C */ lfs f0, 0x3c(r29)
/* 00000548 EC010032 */ fmuls f0, f1, f0
/* 0000054C D001000C */ stfs f0, 0xc(r1)
/* 00000550 C01D0040 */ lfs f0, 0x40(r29)
/* 00000554 D0010010 */ stfs f0, 0x10(r1)
/* 00000558 C03D0050 */ lfs f1, 0x50(r29)
/* 0000055C C01D0044 */ lfs f0, 0x44(r29)
/* 00000560 EC010032 */ fmuls f0, f1, f0
/* 00000564 D0010014 */ stfs f0, 0x14(r1)
/* 00000568 C021000C */ lfs f1, 0xc(r1)
/* 0000056C C0410010 */ lfs f2, 0x10(r1)
/* 00000570 C0610014 */ lfs f3, 0x14(r1)
/* 00000574 4BFFFBF1 */ bl mathutil_mtxA_scale_xyz
/* 00000578 38610018 */ addi r3, r1, 0x18
/* 0000057C 38830004 */ addi r4, r3, 4
/* 00000580 38630008 */ addi r3, r3, 8
/* 00000584 3CA0E000 */ lis r5, 0xe000
/* 00000588 C045000C */ lfs f2, 0xc(r5)
/* 0000058C C025001C */ lfs f1, 0x1c(r5)
/* 00000590 C005002C */ lfs f0, 0x2c(r5)
/* 00000594 D0410018 */ stfs f2, 0x18(r1)
/* 00000598 D0240000 */ stfs f1, 0(r4)
/* 0000059C D0030000 */ stfs f0, 0(r3)
/* 000005A0 C0210020 */ lfs f1, 0x20(r1)
/* 000005A4 C81E0038 */ lfd f0, 0x38(r30)
/* 000005A8 FC010040 */ fcmpo cr0, f1, f0
/* 000005AC 41810140 */ bgt lbl_000006EC
/* 000005B0 807D0054 */ lwz r3, 0x54(r29)
/* 000005B4 C041000C */ lfs f2, 0xc(r1)
/* 000005B8 C3E30014 */ lfs f31, 0x14(r3)
/* 000005BC 38630008 */ addi r3, r3, 8
/* 000005C0 FC20F890 */ fmr f1, f31
/* 000005C4 4BFFFBA1 */ bl test_scaled_sphere_in_frustum
/* 000005C8 2C030000 */ cmpwi r3, 0
/* 000005CC 4182007C */ beq lbl_00000648
/* 000005D0 3C600000 */ lis r3, mathutilData@ha
/* 000005D4 3BE30000 */ addi r31, r3, mathutilData@l
/* 000005D8 807F0000 */ lwz r3, 0(r31)
/* 000005DC 38800000 */ li r4, 0
/* 000005E0 4BFFFB85 */ bl GXLoadPosMtxImm
/* 000005E4 807F0000 */ lwz r3, 0(r31)
/* 000005E8 38800000 */ li r4, 0
/* 000005EC 4BFFFB79 */ bl GXLoadNrmMtxImm
/* 000005F0 3C600000 */ lis r3, currentCamera@ha
/* 000005F4 C0210020 */ lfs f1, 0x20(r1)
/* 000005F8 38630000 */ addi r3, r3, currentCamera@l
/* 000005FC C01E0040 */ lfs f0, 0x40(r30)
/* 00000600 80630000 */ lwz r3, 0(r3)
/* 00000604 C043003C */ lfs f2, 0x3c(r3)
/* 00000608 EC5F00B2 */ fmuls f2, f31, f2
/* 0000060C EC220824 */ fdivs f1, f2, f1
/* 00000610 FC200850 */ fneg f1, f1
/* 00000614 FC010040 */ fcmpo cr0, f1, f0
/* 00000618 40810010 */ ble lbl_00000628
/* 0000061C 807D0054 */ lwz r3, 0x54(r29)
/* 00000620 4BFFFB45 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00000624 48000024 */ b lbl_00000648
lbl_00000628:
/* 00000628 38600000 */ li r3, 0
/* 0000062C 4BFFFB39 */ bl u_avdisp_set_some_func_1
/* 00000630 7C601B78 */ mr r0, r3
/* 00000634 807D0054 */ lwz r3, 0x54(r29)
/* 00000638 7C1F0378 */ mr r31, r0
/* 0000063C 4BFFFB29 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00000640 7FE3FB78 */ mr r3, r31
/* 00000644 4BFFFB21 */ bl u_avdisp_set_some_func_1
lbl_00000648:
/* 00000648 C03D0048 */ lfs f1, 0x48(r29)
/* 0000064C C01E000C */ lfs f0, 0xc(r30)
/* 00000650 FC010040 */ fcmpo cr0, f1, f0
/* 00000654 40810098 */ ble lbl_000006EC
/* 00000658 4BFFFB0D */ bl mathutil_mtxA_from_mtxB
/* 0000065C C05E0044 */ lfs f2, 0x44(r30)
/* 00000660 C01D005C */ lfs f0, 0x5c(r29)
/* 00000664 C03D0058 */ lfs f1, 0x58(r29)
/* 00000668 EC42002A */ fadds f2, f2, f0
/* 0000066C C07D0060 */ lfs f3, 0x60(r29)
/* 00000670 4BFFFAF5 */ bl mathutil_mtxA_translate_xyz
/* 00000674 A87D0074 */ lha r3, 0x74(r29)
/* 00000678 4BFFFAED */ bl mathutil_mtxA_rotate_z
/* 0000067C A87D0072 */ lha r3, 0x72(r29)
/* 00000680 4BFFFAE5 */ bl mathutil_mtxA_rotate_y
/* 00000684 A87D0070 */ lha r3, 0x70(r29)
/* 00000688 3863C000 */ addi r3, r3, -16384
/* 0000068C 4BFFFAD9 */ bl mathutil_mtxA_rotate_x
/* 00000690 C041000C */ lfs f2, 0xc(r1)
/* 00000694 C03E000C */ lfs f1, 0xc(r30)
/* 00000698 C07E0004 */ lfs f3, 4(r30)
/* 0000069C EC020828 */ fsubs f0, f2, f1
/* 000006A0 EFE300B2 */ fmuls f31, f3, f2
/* 000006A4 EFC30032 */ fmuls f30, f3, f0
/* 000006A8 FC1E0840 */ fcmpo cr0, f30, f1
/* 000006AC 40810008 */ ble lbl_000006B4
/* 000006B0 FFC00890 */ fmr f30, f1
lbl_000006B4:
/* 000006B4 FC20F890 */ fmr f1, f31
/* 000006B8 4BFFFAAD */ bl mathutil_mtxA_scale_s
/* 000006BC FC20F890 */ fmr f1, f31
/* 000006C0 4BFFFAA5 */ bl nlSetScaleFactor
/* 000006C4 FC20F090 */ fmr f1, f30
/* 000006C8 FC40F090 */ fmr f2, f30
/* 000006CC FC60F090 */ fmr f3, f30
/* 000006D0 4BFFFA95 */ bl nlObjPutSetFadeColorBase
/* 000006D4 3C600000 */ lis r3, g_commonNlObj@ha
/* 000006D8 38630000 */ addi r3, r3, g_commonNlObj@l
/* 000006DC 80630000 */ lwz r3, 0(r3)
/* 000006E0 806300B0 */ lwz r3, 0xb0(r3)
/* 000006E4 4BFFFA81 */ bl nlObjPutImm
/* 000006E8 4BFFFA7D */ bl fade_color_base_default
lbl_000006EC:
/* 000006EC 8001004C */ lwz r0, 0x4c(r1)
/* 000006F0 CBE10040 */ lfd f31, 0x40(r1)
/* 000006F4 CBC10038 */ lfd f30, 0x38(r1)
/* 000006F8 7C0803A6 */ mtlr r0
/* 000006FC 83E10034 */ lwz r31, 0x34(r1)
/* 00000700 83C10030 */ lwz r30, 0x30(r1)
/* 00000704 83A1002C */ lwz r29, 0x2c(r1)
/* 00000708 38210048 */ addi r1, r1, 0x48
/* 0000070C 4E800020 */ blr 
lbl_00000710:
/* 00000710 7C0802A6 */ mflr r0
/* 00000714 3CA00000 */ lis r5, currentBall@ha
/* 00000718 90010004 */ stw r0, 4(r1)
/* 0000071C 38000001 */ li r0, 1
/* 00000720 9421FFC8 */ stwu r1, -0x38(r1)
/* 00000724 93E10034 */ stw r31, 0x34(r1)
/* 00000728 38C1001C */ addi r6, r1, 0x1c
/* 0000072C 93C10030 */ stw r30, 0x30(r1)
/* 00000730 93A1002C */ stw r29, 0x2c(r1)
/* 00000734 3BA40000 */ addi r29, r4, 0
/* 00000738 389D0004 */ addi r4, r29, 4
/* 0000073C 93810028 */ stw r28, 0x28(r1)
/* 00000740 3B830000 */ addi r28, r3, 0
/* 00000744 83C50000 */ lwz r30, currentBall@l(r5)
/* 00000748 B003000C */ sth r0, 0xc(r3)
/* 0000074C 3C600000 */ lis r3, lbl_0001BF80@ha
/* 00000750 3BE30000 */ addi r31, r3, lbl_0001BF80@l
/* 00000754 80BC001C */ lwz r5, 0x1c(r28)
/* 00000758 387D0010 */ addi r3, r29, 0x10
/* 0000075C 801C0020 */ lwz r0, 0x20(r28)
/* 00000760 90A1001C */ stw r5, 0x1c(r1)
/* 00000764 38BC0028 */ addi r5, r28, 0x28
/* 00000768 90010020 */ stw r0, 0x20(r1)
/* 0000076C 801C0024 */ lwz r0, 0x24(r28)
/* 00000770 90010024 */ stw r0, 0x24(r1)
/* 00000774 80FC0054 */ lwz r7, 0x54(r28)
/* 00000778 C03D0028 */ lfs f1, 0x28(r29)
/* 0000077C C0470014 */ lfs f2, 0x14(r7)
/* 00000780 4BFFF9E5 */ bl func_8006AAEC
/* 00000784 809D0004 */ lwz r4, 4(r29)
/* 00000788 38610010 */ addi r3, r1, 0x10
/* 0000078C 801D0008 */ lwz r0, 8(r29)
/* 00000790 90810010 */ stw r4, 0x10(r1)
/* 00000794 90010014 */ stw r0, 0x14(r1)
/* 00000798 801D000C */ lwz r0, 0xc(r29)
/* 0000079C 90010018 */ stw r0, 0x18(r1)
/* 000007A0 C0210010 */ lfs f1, 0x10(r1)
/* 000007A4 C01C001C */ lfs f0, 0x1c(r28)
/* 000007A8 EC010028 */ fsubs f0, f1, f0
/* 000007AC D0010010 */ stfs f0, 0x10(r1)
/* 000007B0 C0210014 */ lfs f1, 0x14(r1)
/* 000007B4 C01C0020 */ lfs f0, 0x20(r28)
/* 000007B8 EC010028 */ fsubs f0, f1, f0
/* 000007BC D0010014 */ stfs f0, 0x14(r1)
/* 000007C0 C0210018 */ lfs f1, 0x18(r1)
/* 000007C4 C01C0024 */ lfs f0, 0x24(r28)
/* 000007C8 EC010028 */ fsubs f0, f1, f0
/* 000007CC D0010018 */ stfs f0, 0x18(r1)
/* 000007D0 4BFFF995 */ bl mathutil_vec_normalize_len
/* 000007D4 C0C10010 */ lfs f6, 0x10(r1)
/* 000007D8 C07D001C */ lfs f3, 0x1c(r29)
/* 000007DC C0210014 */ lfs f1, 0x14(r1)
/* 000007E0 C01D0020 */ lfs f0, 0x20(r29)
/* 000007E4 EC4600F2 */ fmuls f2, f6, f3
/* 000007E8 C0810018 */ lfs f4, 0x18(r1)
/* 000007EC EC210032 */ fmuls f1, f1, f0
/* 000007F0 C01D0024 */ lfs f0, 0x24(r29)
/* 000007F4 C8BF0048 */ lfd f5, 0x48(r31)
/* 000007F8 EC840032 */ fmuls f4, f4, f0
/* 000007FC C81F0038 */ lfd f0, 0x38(r31)
/* 00000800 EC22082A */ fadds f1, f2, f1
/* 00000804 EC24082A */ fadds f1, f4, f1
/* 00000808 FC250072 */ fmul f1, f5, f1
/* 0000080C FC400818 */ frsp f2, f1
/* 00000810 FC020040 */ fcmpo cr0, f2, f0
/* 00000814 40810038 */ ble lbl_0000084C
/* 00000818 EC0201B2 */ fmuls f0, f2, f6
/* 0000081C EC03002A */ fadds f0, f3, f0
/* 00000820 D01D001C */ stfs f0, 0x1c(r29)
/* 00000824 C0010014 */ lfs f0, 0x14(r1)
/* 00000828 C03D0020 */ lfs f1, 0x20(r29)
/* 0000082C EC020032 */ fmuls f0, f2, f0
/* 00000830 EC01002A */ fadds f0, f1, f0
/* 00000834 D01D0020 */ stfs f0, 0x20(r29)
/* 00000838 C0010018 */ lfs f0, 0x18(r1)
/* 0000083C C03D0024 */ lfs f1, 0x24(r29)
/* 00000840 EC020032 */ fmuls f0, f2, f0
/* 00000844 EC01002A */ fadds f0, f1, f0
/* 00000848 D01D0024 */ stfs f0, 0x24(r29)
lbl_0000084C:
/* 0000084C C03F0050 */ lfs f1, 0x50(r31)
/* 00000850 38605011 */ li r3, 0x5011
/* 00000854 C0010010 */ lfs f0, 0x10(r1)
/* 00000858 C05D001C */ lfs f2, 0x1c(r29)
/* 0000085C EC010032 */ fmuls f0, f1, f0
/* 00000860 EC02002A */ fadds f0, f2, f0
/* 00000864 D01D001C */ stfs f0, 0x1c(r29)
/* 00000868 C03F0050 */ lfs f1, 0x50(r31)
/* 0000086C C0010014 */ lfs f0, 0x14(r1)
/* 00000870 C05D0020 */ lfs f2, 0x20(r29)
/* 00000874 EC010032 */ fmuls f0, f1, f0
/* 00000878 EC02002A */ fadds f0, f2, f0
/* 0000087C D01D0020 */ stfs f0, 0x20(r29)
/* 00000880 C03F0050 */ lfs f1, 0x50(r31)
/* 00000884 C0010018 */ lfs f0, 0x18(r1)
/* 00000888 C05D0024 */ lfs f2, 0x24(r29)
/* 0000088C EC010032 */ fmuls f0, f1, f0
/* 00000890 EC02002A */ fadds f0, f2, f0
/* 00000894 D01D0024 */ stfs f0, 0x24(r29)
/* 00000898 C03C0034 */ lfs f1, 0x34(r28)
/* 0000089C C01D0028 */ lfs f0, 0x28(r29)
/* 000008A0 C85F0058 */ lfd f2, 0x58(r31)
/* 000008A4 EC21002A */ fadds f1, f1, f0
/* 000008A8 C0010010 */ lfs f0, 0x10(r1)
/* 000008AC FC22082A */ fadd f1, f2, f1
/* 000008B0 FC200818 */ frsp f1, f1
/* 000008B4 EC000072 */ fmuls f0, f0, f1
/* 000008B8 D0010010 */ stfs f0, 0x10(r1)
/* 000008BC C0010014 */ lfs f0, 0x14(r1)
/* 000008C0 EC000072 */ fmuls f0, f0, f1
/* 000008C4 D0010014 */ stfs f0, 0x14(r1)
/* 000008C8 C0010018 */ lfs f0, 0x18(r1)
/* 000008CC EC000072 */ fmuls f0, f0, f1
/* 000008D0 D0010018 */ stfs f0, 0x18(r1)
/* 000008D4 C03C001C */ lfs f1, 0x1c(r28)
/* 000008D8 C0010010 */ lfs f0, 0x10(r1)
/* 000008DC EC01002A */ fadds f0, f1, f0
/* 000008E0 D01D0004 */ stfs f0, 4(r29)
/* 000008E4 C03C0020 */ lfs f1, 0x20(r28)
/* 000008E8 C0010014 */ lfs f0, 0x14(r1)
/* 000008EC EC01002A */ fadds f0, f1, f0
/* 000008F0 D01D0008 */ stfs f0, 8(r29)
/* 000008F4 C03C0024 */ lfs f1, 0x24(r28)
/* 000008F8 C0010018 */ lfs f0, 0x18(r1)
/* 000008FC EC01002A */ fadds f0, f1, f0
/* 00000900 D01D000C */ stfs f0, 0xc(r29)
/* 00000904 4BFFF861 */ bl u_play_sound_0
/* 00000908 801E0094 */ lwz r0, 0x94(r30)
/* 0000090C 3C600000 */ lis r3, lbl_0001C9E4@ha
/* 00000910 3CA00000 */ lis r5, lbl_802F1DFC@ha
/* 00000914 60000020 */ ori r0, r0, 0x20
/* 00000918 901E0094 */ stw r0, 0x94(r30)
/* 0000091C 38030000 */ addi r0, r3, lbl_0001C9E4@l
/* 00000920 3C800000 */ lis r4, globalAnimTimer@ha
/* 00000924 80DE00FC */ lwz r6, 0xfc(r30)
/* 00000928 80660010 */ lwz r3, 0x10(r6)
/* 0000092C 90650000 */ stw r3, lbl_802F1DFC@l(r5)
/* 00000930 80640000 */ lwz r3, globalAnimTimer@l(r4)
/* 00000934 54630F3C */ rlwinm r3, r3, 1, 0x1c, 0x1e
/* 00000938 7C601A14 */ add r3, r0, r3
/* 0000093C A8630000 */ lha r3, 0(r3)
/* 00000940 4BFFF825 */ bl u_play_sound_0
/* 00000944 8001003C */ lwz r0, 0x3c(r1)
/* 00000948 83E10034 */ lwz r31, 0x34(r1)
/* 0000094C 83C10030 */ lwz r30, 0x30(r1)
/* 00000950 7C0803A6 */ mtlr r0
/* 00000954 83A1002C */ lwz r29, 0x2c(r1)
/* 00000958 83810028 */ lwz r28, 0x28(r1)
/* 0000095C 38210038 */ addi r1, r1, 0x38
/* 00000960 4E800020 */ blr 
lbl_00000964:
/* 00000964 4E800020 */ blr 
lbl_00000968:
/* 00000968 38C00000 */ li r6, 0
/* 0000096C B0C3000C */ sth r6, 0xc(r3)
/* 00000970 3C800000 */ lis r4, lbl_8028C0B0@ha
/* 00000974 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 00000978 80030008 */ lwz r0, 8(r3)
/* 0000097C 38840000 */ addi r4, r4, lbl_8028C0B0@l
/* 00000980 38E50000 */ addi r7, r5, lbl_0001BF80@l
/* 00000984 6000000A */ ori r0, r0, 0xa
/* 00000988 90030008 */ stw r0, 8(r3)
/* 0000098C 80040014 */ lwz r0, 0x14(r4)
/* 00000990 90030054 */ stw r0, 0x54(r3)
/* 00000994 80830054 */ lwz r4, 0x54(r3)
/* 00000998 C0270000 */ lfs f1, 0(r7)
/* 0000099C C0040014 */ lfs f0, 0x14(r4)
/* 000009A0 EC010032 */ fmuls f0, f1, f0
/* 000009A4 D0030034 */ stfs f0, 0x34(r3)
/* 000009A8 80A30054 */ lwz r5, 0x54(r3)
/* 000009AC 80850008 */ lwz r4, 8(r5)
/* 000009B0 8005000C */ lwz r0, 0xc(r5)
/* 000009B4 90830010 */ stw r4, 0x10(r3)
/* 000009B8 90030014 */ stw r0, 0x14(r3)
/* 000009BC 80050010 */ lwz r0, 0x10(r5)
/* 000009C0 90030018 */ stw r0, 0x18(r3)
/* 000009C4 80830058 */ lwz r4, 0x58(r3)
/* 000009C8 8003005C */ lwz r0, 0x5c(r3)
/* 000009CC 908300B4 */ stw r4, 0xb4(r3)
/* 000009D0 900300B8 */ stw r0, 0xb8(r3)
/* 000009D4 80030060 */ lwz r0, 0x60(r3)
/* 000009D8 900300BC */ stw r0, 0xbc(r3)
/* 000009DC C023005C */ lfs f1, 0x5c(r3)
/* 000009E0 C0030040 */ lfs f0, 0x40(r3)
/* 000009E4 EC010028 */ fsubs f0, f1, f0
/* 000009E8 D003005C */ stfs f0, 0x5c(r3)
/* 000009EC C0070008 */ lfs f0, 8(r7)
/* 000009F0 D00300C0 */ stfs f0, 0xc0(r3)
/* 000009F4 C0070008 */ lfs f0, 8(r7)
/* 000009F8 D00300C4 */ stfs f0, 0xc4(r3)
/* 000009FC C0070008 */ lfs f0, 8(r7)
/* 00000A00 D00300C8 */ stfs f0, 0xc8(r3)
/* 00000A04 C007000C */ lfs f0, 0xc(r7)
/* 00000A08 D0030048 */ stfs f0, 0x48(r3)
/* 00000A0C C007000C */ lfs f0, 0xc(r7)
/* 00000A10 D003004C */ stfs f0, 0x4c(r3)
/* 00000A14 C007000C */ lfs f0, 0xc(r7)
/* 00000A18 D0030050 */ stfs f0, 0x50(r3)
/* 00000A1C B0C30076 */ sth r6, 0x76(r3)
/* 00000A20 C0070000 */ lfs f0, 0(r7)
/* 00000A24 D003009C */ stfs f0, 0x9c(r3)
/* 00000A28 80830010 */ lwz r4, 0x10(r3)
/* 00000A2C 80030014 */ lwz r0, 0x14(r3)
/* 00000A30 90830090 */ stw r4, 0x90(r3)
/* 00000A34 90030094 */ stw r0, 0x94(r3)
/* 00000A38 80030018 */ lwz r0, 0x18(r3)
/* 00000A3C 90030098 */ stw r0, 0x98(r3)
/* 00000A40 4E800020 */ blr 
lbl_00000A44:
/* 00000A44 A803000C */ lha r0, 0xc(r3)
/* 00000A48 3C800000 */ lis r4, lbl_0001BF80@ha
/* 00000A4C 80C300A4 */ lwz r6, 0xa4(r3)
/* 00000A50 38A40000 */ addi r5, r4, lbl_0001BF80@l
/* 00000A54 2C000002 */ cmpwi r0, 2
/* 00000A58 418200D0 */ beq lbl_00000B28
/* 00000A5C 40800014 */ bge lbl_00000A70
/* 00000A60 2C000000 */ cmpwi r0, 0
/* 00000A64 4182001C */ beq lbl_00000A80
/* 00000A68 408000AC */ bge lbl_00000B14
/* 00000A6C 4800013C */ b lbl_00000BA8
lbl_00000A70:
/* 00000A70 2C000004 */ cmpwi r0, 4
/* 00000A74 418200D4 */ beq lbl_00000B48
/* 00000A78 40800130 */ bge lbl_00000BA8
/* 00000A7C 480000B8 */ b lbl_00000B34
lbl_00000A80:
/* 00000A80 A8830078 */ lha r4, 0x78(r3)
/* 00000A84 20040100 */ subfic r0, r4, 0x100
/* 00000A88 7C003670 */ srawi r0, r0, 6
/* 00000A8C 7C040214 */ add r0, r4, r0
/* 00000A90 B0030078 */ sth r0, 0x78(r3)
/* 00000A94 C0430048 */ lfs f2, 0x48(r3)
/* 00000A98 C005000C */ lfs f0, 0xc(r5)
/* 00000A9C C0250060 */ lfs f1, 0x60(r5)
/* 00000AA0 EC001028 */ fsubs f0, f0, f2
/* 00000AA4 EC010032 */ fmuls f0, f1, f0
/* 00000AA8 EC02002A */ fadds f0, f2, f0
/* 00000AAC D0030048 */ stfs f0, 0x48(r3)
/* 00000AB0 C023005C */ lfs f1, 0x5c(r3)
/* 00000AB4 C00300B8 */ lfs f0, 0xb8(r3)
/* 00000AB8 FC010040 */ fcmpo cr0, f1, f0
/* 00000ABC 40800040 */ bge lbl_00000AFC
/* 00000AC0 C02300C4 */ lfs f1, 0xc4(r3)
/* 00000AC4 C0050064 */ lfs f0, 0x64(r5)
/* 00000AC8 EC01002A */ fadds f0, f1, f0
/* 00000ACC D00300C4 */ stfs f0, 0xc4(r3)
/* 00000AD0 C023005C */ lfs f1, 0x5c(r3)
/* 00000AD4 C00300C4 */ lfs f0, 0xc4(r3)
/* 00000AD8 EC01002A */ fadds f0, f1, f0
/* 00000ADC D003005C */ stfs f0, 0x5c(r3)
/* 00000AE0 C003005C */ lfs f0, 0x5c(r3)
/* 00000AE4 C02300B8 */ lfs f1, 0xb8(r3)
/* 00000AE8 FC000840 */ fcmpo cr0, f0, f1
/* 00000AEC 40810010 */ ble lbl_00000AFC
/* 00000AF0 D023005C */ stfs f1, 0x5c(r3)
/* 00000AF4 C0050008 */ lfs f0, 8(r5)
/* 00000AF8 D00300C4 */ stfs f0, 0xc4(r3)
lbl_00000AFC:
/* 00000AFC 88060001 */ lbz r0, 1(r6)
/* 00000B00 28000004 */ cmplwi r0, 4
/* 00000B04 418200A4 */ beq lbl_00000BA8
/* 00000B08 38000003 */ li r0, 3
/* 00000B0C B003000C */ sth r0, 0xc(r3)
/* 00000B10 48000098 */ b lbl_00000BA8
lbl_00000B14:
/* 00000B14 38000004 */ li r0, 4
/* 00000B18 B003000C */ sth r0, 0xc(r3)
/* 00000B1C 80030008 */ lwz r0, 8(r3)
/* 00000B20 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 00000B24 90030008 */ stw r0, 8(r3)
lbl_00000B28:
/* 00000B28 38000003 */ li r0, 3
/* 00000B2C B003000C */ sth r0, 0xc(r3)
/* 00000B30 48000078 */ b lbl_00000BA8
lbl_00000B34:
/* 00000B34 38000004 */ li r0, 4
/* 00000B38 B003000C */ sth r0, 0xc(r3)
/* 00000B3C 80030008 */ lwz r0, 8(r3)
/* 00000B40 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 00000B44 90030008 */ stw r0, 8(r3)
lbl_00000B48:
/* 00000B48 C0230048 */ lfs f1, 0x48(r3)
/* 00000B4C C0050068 */ lfs f0, 0x68(r5)
/* 00000B50 EC010032 */ fmuls f0, f1, f0
/* 00000B54 D0030048 */ stfs f0, 0x48(r3)
/* 00000B58 C02300C4 */ lfs f1, 0xc4(r3)
/* 00000B5C C005006C */ lfs f0, 0x6c(r5)
/* 00000B60 EC010028 */ fsubs f0, f1, f0
/* 00000B64 D00300C4 */ stfs f0, 0xc4(r3)
/* 00000B68 C023005C */ lfs f1, 0x5c(r3)
/* 00000B6C C00300C4 */ lfs f0, 0xc4(r3)
/* 00000B70 EC01002A */ fadds f0, f1, f0
/* 00000B74 D003005C */ stfs f0, 0x5c(r3)
/* 00000B78 C02300B8 */ lfs f1, 0xb8(r3)
/* 00000B7C C005000C */ lfs f0, 0xc(r5)
/* 00000B80 C043005C */ lfs f2, 0x5c(r3)
/* 00000B84 EC010028 */ fsubs f0, f1, f0
/* 00000B88 FC020040 */ fcmpo cr0, f2, f0
/* 00000B8C 4080001C */ bge lbl_00000BA8
/* 00000B90 3C800000 */ lis r4, g_poolInfo@ha
/* 00000B94 A8030000 */ lha r0, 0(r3)
/* 00000B98 38840000 */ addi r4, r4, g_poolInfo@l
/* 00000B9C 8084002C */ lwz r4, 0x2c(r4)
/* 00000BA0 38A00003 */ li r5, 3
/* 00000BA4 7CA401AE */ stbx r5, r4, r0
lbl_00000BA8:
/* 00000BA8 A8830076 */ lha r4, 0x76(r3)
/* 00000BAC A8030078 */ lha r0, 0x78(r3)
/* 00000BB0 7C040214 */ add r0, r4, r0
/* 00000BB4 B0030076 */ sth r0, 0x76(r3)
/* 00000BB8 4E800020 */ blr 
lbl_00000BBC:
/* 00000BBC 7C0802A6 */ mflr r0
/* 00000BC0 90010004 */ stw r0, 4(r1)
/* 00000BC4 9421FFB8 */ stwu r1, -0x48(r1)
/* 00000BC8 DBE10040 */ stfd f31, 0x40(r1)
/* 00000BCC 93E1003C */ stw r31, 0x3c(r1)
/* 00000BD0 3BE30000 */ addi r31, r3, 0
/* 00000BD4 3C600000 */ lis r3, lbl_0001BF80@ha
/* 00000BD8 93C10038 */ stw r30, 0x38(r1)
/* 00000BDC 93A10034 */ stw r29, 0x34(r1)
/* 00000BE0 3BA30000 */ addi r29, r3, lbl_0001BF80@l
/* 00000BE4 387F0058 */ addi r3, r31, 0x58
/* 00000BE8 4BFFF57D */ bl mathutil_mtxA_from_mtxB_translate
/* 00000BEC A87F0074 */ lha r3, 0x74(r31)
/* 00000BF0 4BFFF575 */ bl mathutil_mtxA_rotate_z
/* 00000BF4 A87F0072 */ lha r3, 0x72(r31)
/* 00000BF8 4BFFF56D */ bl mathutil_mtxA_rotate_y
/* 00000BFC A87F0070 */ lha r3, 0x70(r31)
/* 00000C00 4BFFF565 */ bl mathutil_mtxA_rotate_x
/* 00000C04 A87F0076 */ lha r3, 0x76(r31)
/* 00000C08 4BFFF55D */ bl mathutil_mtxA_rotate_y
/* 00000C0C C01F003C */ lfs f0, 0x3c(r31)
/* 00000C10 D0010018 */ stfs f0, 0x18(r1)
/* 00000C14 C01F0040 */ lfs f0, 0x40(r31)
/* 00000C18 D001001C */ stfs f0, 0x1c(r1)
/* 00000C1C C01F0044 */ lfs f0, 0x44(r31)
/* 00000C20 D0010020 */ stfs f0, 0x20(r1)
/* 00000C24 C0210018 */ lfs f1, 0x18(r1)
/* 00000C28 C041001C */ lfs f2, 0x1c(r1)
/* 00000C2C C0610020 */ lfs f3, 0x20(r1)
/* 00000C30 4BFFF535 */ bl mathutil_mtxA_scale_xyz
/* 00000C34 38610024 */ addi r3, r1, 0x24
/* 00000C38 38830004 */ addi r4, r3, 4
/* 00000C3C 38630008 */ addi r3, r3, 8
/* 00000C40 3CA0E000 */ lis r5, 0xe000
/* 00000C44 C045000C */ lfs f2, 0xc(r5)
/* 00000C48 C025001C */ lfs f1, 0x1c(r5)
/* 00000C4C C005002C */ lfs f0, 0x2c(r5)
/* 00000C50 D0410024 */ stfs f2, 0x24(r1)
/* 00000C54 D0240000 */ stfs f1, 0(r4)
/* 00000C58 D0030000 */ stfs f0, 0(r3)
/* 00000C5C C021002C */ lfs f1, 0x2c(r1)
/* 00000C60 C81D0038 */ lfd f0, 0x38(r29)
/* 00000C64 FC010040 */ fcmpo cr0, f1, f0
/* 00000C68 41810368 */ bgt lbl_00000FD0
/* 00000C6C 807F0054 */ lwz r3, 0x54(r31)
/* 00000C70 C0410018 */ lfs f2, 0x18(r1)
/* 00000C74 C3E30014 */ lfs f31, 0x14(r3)
/* 00000C78 38630008 */ addi r3, r3, 8
/* 00000C7C FC20F890 */ fmr f1, f31
/* 00000C80 4BFFF4E5 */ bl test_scaled_sphere_in_frustum
/* 00000C84 2C030000 */ cmpwi r3, 0
/* 00000C88 4182007C */ beq lbl_00000D04
/* 00000C8C 3C600000 */ lis r3, mathutilData@ha
/* 00000C90 3BC30000 */ addi r30, r3, mathutilData@l
/* 00000C94 807E0000 */ lwz r3, 0(r30)
/* 00000C98 38800000 */ li r4, 0
/* 00000C9C 4BFFF4C9 */ bl GXLoadPosMtxImm
/* 00000CA0 807E0000 */ lwz r3, 0(r30)
/* 00000CA4 38800000 */ li r4, 0
/* 00000CA8 4BFFF4BD */ bl GXLoadNrmMtxImm
/* 00000CAC 3C600000 */ lis r3, currentCamera@ha
/* 00000CB0 C021002C */ lfs f1, 0x2c(r1)
/* 00000CB4 38630000 */ addi r3, r3, currentCamera@l
/* 00000CB8 C01D0040 */ lfs f0, 0x40(r29)
/* 00000CBC 80630000 */ lwz r3, 0(r3)
/* 00000CC0 C043003C */ lfs f2, 0x3c(r3)
/* 00000CC4 EC5F00B2 */ fmuls f2, f31, f2
/* 00000CC8 EC220824 */ fdivs f1, f2, f1
/* 00000CCC FC200850 */ fneg f1, f1
/* 00000CD0 FC010040 */ fcmpo cr0, f1, f0
/* 00000CD4 40810010 */ ble lbl_00000CE4
/* 00000CD8 807F0054 */ lwz r3, 0x54(r31)
/* 00000CDC 4BFFF489 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00000CE0 48000024 */ b lbl_00000D04
lbl_00000CE4:
/* 00000CE4 38600000 */ li r3, 0
/* 00000CE8 4BFFF47D */ bl u_avdisp_set_some_func_1
/* 00000CEC 7C601B78 */ mr r0, r3
/* 00000CF0 807F0054 */ lwz r3, 0x54(r31)
/* 00000CF4 7C1E0378 */ mr r30, r0
/* 00000CF8 4BFFF46D */ bl avdisp_draw_model_unculled_sort_translucent
/* 00000CFC 7FC3F378 */ mr r3, r30
/* 00000D00 4BFFF465 */ bl u_avdisp_set_some_func_1
lbl_00000D04:
/* 00000D04 4BFFF461 */ bl mathutil_mtxA_push
/* 00000D08 387F0010 */ addi r3, r31, 0x10
/* 00000D0C 4BFFF459 */ bl mathutil_mtxA_translate
/* 00000D10 4BFFF455 */ bl mathutil_mtxA_sq_from_identity
/* 00000D14 3861000C */ addi r3, r1, 0xc
/* 00000D18 38830004 */ addi r4, r3, 4
/* 00000D1C 38630008 */ addi r3, r3, 8
/* 00000D20 3FC0E000 */ lis r30, 0xe000
/* 00000D24 C05E000C */ lfs f2, 0xc(r30)
/* 00000D28 C03E001C */ lfs f1, 0x1c(r30)
/* 00000D2C C01E002C */ lfs f0, 0x2c(r30)
/* 00000D30 D041000C */ stfs f2, 0xc(r1)
/* 00000D34 D0240000 */ stfs f1, 0(r4)
/* 00000D38 D0030000 */ stfs f0, 0(r3)
/* 00000D3C C021000C */ lfs f1, 0xc(r1)
/* 00000D40 C0410010 */ lfs f2, 0x10(r1)
/* 00000D44 C0010014 */ lfs f0, 0x14(r1)
/* 00000D48 EC210072 */ fmuls f1, f1, f1
/* 00000D4C EC2208BA */ fmadds f1, f2, f2, f1
/* 00000D50 EC20083A */ fmadds f1, f0, f0, f1
/* 00000D54 4BFFF411 */ bl mathutil_sqrt
/* 00000D58 C01D000C */ lfs f0, 0xc(r29)
/* 00000D5C FC010040 */ fcmpo cr0, f1, f0
/* 00000D60 40810070 */ ble lbl_00000DD0
/* 00000D64 EC410028 */ fsubs f2, f1, f0
/* 00000D68 C001000C */ lfs f0, 0xc(r1)
/* 00000D6C EC220824 */ fdivs f1, f2, f1
/* 00000D70 EC000072 */ fmuls f0, f0, f1
/* 00000D74 D001000C */ stfs f0, 0xc(r1)
/* 00000D78 C0010010 */ lfs f0, 0x10(r1)
/* 00000D7C EC000072 */ fmuls f0, f0, f1
/* 00000D80 D0010010 */ stfs f0, 0x10(r1)
/* 00000D84 C0010014 */ lfs f0, 0x14(r1)
/* 00000D88 EC000072 */ fmuls f0, f0, f1
/* 00000D8C D0010014 */ stfs f0, 0x14(r1)
/* 00000D90 C041000C */ lfs f2, 0xc(r1)
/* 00000D94 C0210010 */ lfs f1, 0x10(r1)
/* 00000D98 C0010014 */ lfs f0, 0x14(r1)
/* 00000D9C D05E000C */ stfs f2, 0xc(r30)
/* 00000DA0 D03E001C */ stfs f1, 0x1c(r30)
/* 00000DA4 D01E002C */ stfs f0, 0x2c(r30)
/* 00000DA8 C3FF0048 */ lfs f31, 0x48(r31)
/* 00000DAC FC20F890 */ fmr f1, f31
/* 00000DB0 4BFFF3B5 */ bl mathutil_mtxA_scale_s
/* 00000DB4 FC20F890 */ fmr f1, f31
/* 00000DB8 4BFFF3AD */ bl nlSetScaleFactor
/* 00000DBC 3C600000 */ lis r3, g_commonNlObj@ha
/* 00000DC0 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00000DC4 80630000 */ lwz r3, 0(r3)
/* 00000DC8 806300B0 */ lwz r3, 0xb0(r3)
/* 00000DCC 4BFFF399 */ bl nlObjPutImm
lbl_00000DD0:
/* 00000DD0 4BFFF395 */ bl mathutil_mtxA_pop
/* 00000DD4 C03D000C */ lfs f1, 0xc(r29)
/* 00000DD8 C05D0070 */ lfs f2, 0x70(r29)
/* 00000DDC C07D0074 */ lfs f3, 0x74(r29)
/* 00000DE0 4BFFF385 */ bl nlObjPutSetFadeColorBase
/* 00000DE4 4BFFF381 */ bl mathutil_mtxA_push
/* 00000DE8 A81F0076 */ lha r0, 0x76(r31)
/* 00000DEC 54032036 */ slwi r3, r0, 4
/* 00000DF0 4BFFF375 */ bl mathutil_mtxA_rotate_y
/* 00000DF4 C05D000C */ lfs f2, 0xc(r29)
/* 00000DF8 C01F0018 */ lfs f0, 0x18(r31)
/* 00000DFC C03F0010 */ lfs f1, 0x10(r31)
/* 00000E00 EC62002A */ fadds f3, f2, f0
/* 00000E04 C05F0014 */ lfs f2, 0x14(r31)
/* 00000E08 4BFFF35D */ bl mathutil_mtxA_translate_xyz
/* 00000E0C 4BFFF359 */ bl mathutil_mtxA_sq_from_identity
/* 00000E10 3861000C */ addi r3, r1, 0xc
/* 00000E14 38830004 */ addi r4, r3, 4
/* 00000E18 38630008 */ addi r3, r3, 8
/* 00000E1C 3FC0E000 */ lis r30, 0xe000
/* 00000E20 C05E000C */ lfs f2, 0xc(r30)
/* 00000E24 C03E001C */ lfs f1, 0x1c(r30)
/* 00000E28 C01E002C */ lfs f0, 0x2c(r30)
/* 00000E2C D041000C */ stfs f2, 0xc(r1)
/* 00000E30 D0240000 */ stfs f1, 0(r4)
/* 00000E34 D0030000 */ stfs f0, 0(r3)
/* 00000E38 C021000C */ lfs f1, 0xc(r1)
/* 00000E3C C0410010 */ lfs f2, 0x10(r1)
/* 00000E40 C0010014 */ lfs f0, 0x14(r1)
/* 00000E44 EC210072 */ fmuls f1, f1, f1
/* 00000E48 EC2208BA */ fmadds f1, f2, f2, f1
/* 00000E4C EC20083A */ fmadds f1, f0, f0, f1
/* 00000E50 4BFFF315 */ bl mathutil_sqrt
/* 00000E54 C01D000C */ lfs f0, 0xc(r29)
/* 00000E58 FC010040 */ fcmpo cr0, f1, f0
/* 00000E5C 40810078 */ ble lbl_00000ED4
/* 00000E60 EC410028 */ fsubs f2, f1, f0
/* 00000E64 C001000C */ lfs f0, 0xc(r1)
/* 00000E68 EC220824 */ fdivs f1, f2, f1
/* 00000E6C EC000072 */ fmuls f0, f0, f1
/* 00000E70 D001000C */ stfs f0, 0xc(r1)
/* 00000E74 C0010010 */ lfs f0, 0x10(r1)
/* 00000E78 EC000072 */ fmuls f0, f0, f1
/* 00000E7C D0010010 */ stfs f0, 0x10(r1)
/* 00000E80 C0010014 */ lfs f0, 0x14(r1)
/* 00000E84 EC000072 */ fmuls f0, f0, f1
/* 00000E88 D0010014 */ stfs f0, 0x14(r1)
/* 00000E8C C041000C */ lfs f2, 0xc(r1)
/* 00000E90 C0210010 */ lfs f1, 0x10(r1)
/* 00000E94 C0010014 */ lfs f0, 0x14(r1)
/* 00000E98 D05E000C */ stfs f2, 0xc(r30)
/* 00000E9C D03E001C */ stfs f1, 0x1c(r30)
/* 00000EA0 D01E002C */ stfs f0, 0x2c(r30)
/* 00000EA4 C03D0060 */ lfs f1, 0x60(r29)
/* 00000EA8 C01F0048 */ lfs f0, 0x48(r31)
/* 00000EAC EFE10032 */ fmuls f31, f1, f0
/* 00000EB0 FC20F890 */ fmr f1, f31
/* 00000EB4 4BFFF2B1 */ bl mathutil_mtxA_scale_s
/* 00000EB8 FC20F890 */ fmr f1, f31
/* 00000EBC 4BFFF2A9 */ bl nlSetScaleFactor
/* 00000EC0 3C600000 */ lis r3, g_commonNlObj@ha
/* 00000EC4 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00000EC8 80630000 */ lwz r3, 0(r3)
/* 00000ECC 806300B0 */ lwz r3, 0xb0(r3)
/* 00000ED0 4BFFF295 */ bl nlObjPutImm
lbl_00000ED4:
/* 00000ED4 4BFFF291 */ bl mathutil_mtxA_pop
/* 00000ED8 4BFFF28D */ bl mathutil_mtxA_push
/* 00000EDC A81F0076 */ lha r0, 0x76(r31)
/* 00000EE0 54032036 */ slwi r3, r0, 4
/* 00000EE4 4BFFF281 */ bl mathutil_mtxA_rotate_y
/* 00000EE8 C05F0018 */ lfs f2, 0x18(r31)
/* 00000EEC C01D000C */ lfs f0, 0xc(r29)
/* 00000EF0 C03F0010 */ lfs f1, 0x10(r31)
/* 00000EF4 EC620028 */ fsubs f3, f2, f0
/* 00000EF8 C05F0014 */ lfs f2, 0x14(r31)
/* 00000EFC 4BFFF269 */ bl mathutil_mtxA_translate_xyz
/* 00000F00 4BFFF265 */ bl mathutil_mtxA_sq_from_identity
/* 00000F04 3861000C */ addi r3, r1, 0xc
/* 00000F08 38830004 */ addi r4, r3, 4
/* 00000F0C 38630008 */ addi r3, r3, 8
/* 00000F10 3FC0E000 */ lis r30, 0xe000
/* 00000F14 C05E000C */ lfs f2, 0xc(r30)
/* 00000F18 C03E001C */ lfs f1, 0x1c(r30)
/* 00000F1C C01E002C */ lfs f0, 0x2c(r30)
/* 00000F20 D041000C */ stfs f2, 0xc(r1)
/* 00000F24 D0240000 */ stfs f1, 0(r4)
/* 00000F28 D0030000 */ stfs f0, 0(r3)
/* 00000F2C C021000C */ lfs f1, 0xc(r1)
/* 00000F30 C0410010 */ lfs f2, 0x10(r1)
/* 00000F34 C0010014 */ lfs f0, 0x14(r1)
/* 00000F38 EC210072 */ fmuls f1, f1, f1
/* 00000F3C EC2208BA */ fmadds f1, f2, f2, f1
/* 00000F40 EC20083A */ fmadds f1, f0, f0, f1
/* 00000F44 4BFFF221 */ bl mathutil_sqrt
/* 00000F48 C01D000C */ lfs f0, 0xc(r29)
/* 00000F4C FC010040 */ fcmpo cr0, f1, f0
/* 00000F50 40810078 */ ble lbl_00000FC8
/* 00000F54 EC410028 */ fsubs f2, f1, f0
/* 00000F58 C001000C */ lfs f0, 0xc(r1)
/* 00000F5C EC220824 */ fdivs f1, f2, f1
/* 00000F60 EC000072 */ fmuls f0, f0, f1
/* 00000F64 D001000C */ stfs f0, 0xc(r1)
/* 00000F68 C0010010 */ lfs f0, 0x10(r1)
/* 00000F6C EC000072 */ fmuls f0, f0, f1
/* 00000F70 D0010010 */ stfs f0, 0x10(r1)
/* 00000F74 C0010014 */ lfs f0, 0x14(r1)
/* 00000F78 EC000072 */ fmuls f0, f0, f1
/* 00000F7C D0010014 */ stfs f0, 0x14(r1)
/* 00000F80 C041000C */ lfs f2, 0xc(r1)
/* 00000F84 C0210010 */ lfs f1, 0x10(r1)
/* 00000F88 C0010014 */ lfs f0, 0x14(r1)
/* 00000F8C D05E000C */ stfs f2, 0xc(r30)
/* 00000F90 D03E001C */ stfs f1, 0x1c(r30)
/* 00000F94 D01E002C */ stfs f0, 0x2c(r30)
/* 00000F98 C03D0060 */ lfs f1, 0x60(r29)
/* 00000F9C C01F0048 */ lfs f0, 0x48(r31)
/* 00000FA0 EFE10032 */ fmuls f31, f1, f0
/* 00000FA4 FC20F890 */ fmr f1, f31
/* 00000FA8 4BFFF1BD */ bl mathutil_mtxA_scale_s
/* 00000FAC FC20F890 */ fmr f1, f31
/* 00000FB0 4BFFF1B5 */ bl nlSetScaleFactor
/* 00000FB4 3C600000 */ lis r3, g_commonNlObj@ha
/* 00000FB8 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00000FBC 80630000 */ lwz r3, 0(r3)
/* 00000FC0 806300B0 */ lwz r3, 0xb0(r3)
/* 00000FC4 4BFFF1A1 */ bl nlObjPutImm
lbl_00000FC8:
/* 00000FC8 4BFFF19D */ bl mathutil_mtxA_pop
/* 00000FCC 4BFFF199 */ bl fade_color_base_default
lbl_00000FD0:
/* 00000FD0 8001004C */ lwz r0, 0x4c(r1)
/* 00000FD4 CBE10040 */ lfd f31, 0x40(r1)
/* 00000FD8 83E1003C */ lwz r31, 0x3c(r1)
/* 00000FDC 7C0803A6 */ mtlr r0
/* 00000FE0 83C10038 */ lwz r30, 0x38(r1)
/* 00000FE4 83A10034 */ lwz r29, 0x34(r1)
/* 00000FE8 38210048 */ addi r1, r1, 0x48
/* 00000FEC 4E800020 */ blr 
lbl_00000FF0:
/* 00000FF0 7C0802A6 */ mflr r0
/* 00000FF4 3CA00000 */ lis r5, currentBall@ha
/* 00000FF8 90010004 */ stw r0, 4(r1)
/* 00000FFC 38000001 */ li r0, 1
/* 00001000 9421FFC8 */ stwu r1, -0x38(r1)
/* 00001004 93E10034 */ stw r31, 0x34(r1)
/* 00001008 93C10030 */ stw r30, 0x30(r1)
/* 0000100C 93A1002C */ stw r29, 0x2c(r1)
/* 00001010 3BA40000 */ addi r29, r4, 0
/* 00001014 93810028 */ stw r28, 0x28(r1)
/* 00001018 3B830000 */ addi r28, r3, 0
/* 0000101C 83E50000 */ lwz r31, currentBall@l(r5)
/* 00001020 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 00001024 3BC50000 */ addi r30, r5, lbl_0001BF80@l
/* 00001028 B003000C */ sth r0, 0xc(r3)
/* 0000102C C02300C4 */ lfs f1, 0xc4(r3)
/* 00001030 C01E0008 */ lfs f0, 8(r30)
/* 00001034 FC010040 */ fcmpo cr0, f1, f0
/* 00001038 40810010 */ ble lbl_00001048
/* 0000103C C01E0078 */ lfs f0, 0x78(r30)
/* 00001040 EC010032 */ fmuls f0, f1, f0
/* 00001044 D01C00C4 */ stfs f0, 0xc4(r28)
lbl_00001048:
/* 00001048 80DC001C */ lwz r6, 0x1c(r28)
/* 0000104C 387D0010 */ addi r3, r29, 0x10
/* 00001050 801C0020 */ lwz r0, 0x20(r28)
/* 00001054 389D0004 */ addi r4, r29, 4
/* 00001058 38BC0028 */ addi r5, r28, 0x28
/* 0000105C 90C1001C */ stw r6, 0x1c(r1)
/* 00001060 38C1001C */ addi r6, r1, 0x1c
/* 00001064 90010020 */ stw r0, 0x20(r1)
/* 00001068 801C0024 */ lwz r0, 0x24(r28)
/* 0000106C 90010024 */ stw r0, 0x24(r1)
/* 00001070 80FC0054 */ lwz r7, 0x54(r28)
/* 00001074 C03D0028 */ lfs f1, 0x28(r29)
/* 00001078 C0470014 */ lfs f2, 0x14(r7)
/* 0000107C 4BFFF0E9 */ bl func_8006AAEC
/* 00001080 809D0004 */ lwz r4, 4(r29)
/* 00001084 38610010 */ addi r3, r1, 0x10
/* 00001088 801D0008 */ lwz r0, 8(r29)
/* 0000108C 90810010 */ stw r4, 0x10(r1)
/* 00001090 90010014 */ stw r0, 0x14(r1)
/* 00001094 801D000C */ lwz r0, 0xc(r29)
/* 00001098 90010018 */ stw r0, 0x18(r1)
/* 0000109C C0210010 */ lfs f1, 0x10(r1)
/* 000010A0 C01C001C */ lfs f0, 0x1c(r28)
/* 000010A4 EC010028 */ fsubs f0, f1, f0
/* 000010A8 D0010010 */ stfs f0, 0x10(r1)
/* 000010AC C0210014 */ lfs f1, 0x14(r1)
/* 000010B0 C01C0020 */ lfs f0, 0x20(r28)
/* 000010B4 EC010028 */ fsubs f0, f1, f0
/* 000010B8 D0010014 */ stfs f0, 0x14(r1)
/* 000010BC C0210018 */ lfs f1, 0x18(r1)
/* 000010C0 C01C0024 */ lfs f0, 0x24(r28)
/* 000010C4 EC010028 */ fsubs f0, f1, f0
/* 000010C8 D0010018 */ stfs f0, 0x18(r1)
/* 000010CC 4BFFF099 */ bl mathutil_vec_normalize_len
/* 000010D0 C0C10010 */ lfs f6, 0x10(r1)
/* 000010D4 C07D001C */ lfs f3, 0x1c(r29)
/* 000010D8 C0210014 */ lfs f1, 0x14(r1)
/* 000010DC C01D0020 */ lfs f0, 0x20(r29)
/* 000010E0 EC4600F2 */ fmuls f2, f6, f3
/* 000010E4 C0810018 */ lfs f4, 0x18(r1)
/* 000010E8 EC210032 */ fmuls f1, f1, f0
/* 000010EC C01D0024 */ lfs f0, 0x24(r29)
/* 000010F0 C8BE0048 */ lfd f5, 0x48(r30)
/* 000010F4 EC840032 */ fmuls f4, f4, f0
/* 000010F8 C81E0038 */ lfd f0, 0x38(r30)
/* 000010FC EC22082A */ fadds f1, f2, f1
/* 00001100 EC24082A */ fadds f1, f4, f1
/* 00001104 FC250072 */ fmul f1, f5, f1
/* 00001108 FC400818 */ frsp f2, f1
/* 0000110C FC020040 */ fcmpo cr0, f2, f0
/* 00001110 40810038 */ ble lbl_00001148
/* 00001114 EC0201B2 */ fmuls f0, f2, f6
/* 00001118 EC03002A */ fadds f0, f3, f0
/* 0000111C D01D001C */ stfs f0, 0x1c(r29)
/* 00001120 C0010014 */ lfs f0, 0x14(r1)
/* 00001124 C03D0020 */ lfs f1, 0x20(r29)
/* 00001128 EC020032 */ fmuls f0, f2, f0
/* 0000112C EC01002A */ fadds f0, f1, f0
/* 00001130 D01D0020 */ stfs f0, 0x20(r29)
/* 00001134 C0010018 */ lfs f0, 0x18(r1)
/* 00001138 C03D0024 */ lfs f1, 0x24(r29)
/* 0000113C EC020032 */ fmuls f0, f2, f0
/* 00001140 EC01002A */ fadds f0, f1, f0
/* 00001144 D01D0024 */ stfs f0, 0x24(r29)
lbl_00001148:
/* 00001148 C05C0034 */ lfs f2, 0x34(r28)
/* 0000114C 38605011 */ li r3, 0x5011
/* 00001150 C03D0028 */ lfs f1, 0x28(r29)
/* 00001154 C0010010 */ lfs f0, 0x10(r1)
/* 00001158 EC22082A */ fadds f1, f2, f1
/* 0000115C EC000072 */ fmuls f0, f0, f1
/* 00001160 D0010010 */ stfs f0, 0x10(r1)
/* 00001164 C0010014 */ lfs f0, 0x14(r1)
/* 00001168 EC000072 */ fmuls f0, f0, f1
/* 0000116C D0010014 */ stfs f0, 0x14(r1)
/* 00001170 C0010018 */ lfs f0, 0x18(r1)
/* 00001174 EC000072 */ fmuls f0, f0, f1
/* 00001178 D0010018 */ stfs f0, 0x18(r1)
/* 0000117C C03C001C */ lfs f1, 0x1c(r28)
/* 00001180 C0010010 */ lfs f0, 0x10(r1)
/* 00001184 EC01002A */ fadds f0, f1, f0
/* 00001188 D01D0004 */ stfs f0, 4(r29)
/* 0000118C C03C0020 */ lfs f1, 0x20(r28)
/* 00001190 C0010014 */ lfs f0, 0x14(r1)
/* 00001194 EC01002A */ fadds f0, f1, f0
/* 00001198 D01D0008 */ stfs f0, 8(r29)
/* 0000119C C03C0024 */ lfs f1, 0x24(r28)
/* 000011A0 C0010018 */ lfs f0, 0x18(r1)
/* 000011A4 EC01002A */ fadds f0, f1, f0
/* 000011A8 D01D000C */ stfs f0, 0xc(r29)
/* 000011AC 4BFFEFB9 */ bl u_play_sound_0
/* 000011B0 3C600000 */ lis r3, currentBall@ha
/* 000011B4 38630000 */ addi r3, r3, currentBall@l
/* 000011B8 80630000 */ lwz r3, 0(r3)
/* 000011BC 389D0000 */ addi r4, r29, 0
/* 000011C0 38A000F0 */ li r5, 0xf0
/* 000011C4 4800EE01 */ bl lbl_0000FFC4
/* 000011C8 801F0094 */ lwz r0, 0x94(r31)
/* 000011CC 3C600000 */ lis r3, lbl_0001C9E4@ha
/* 000011D0 3CA00000 */ lis r5, lbl_802F1DFC@ha
/* 000011D4 60000020 */ ori r0, r0, 0x20
/* 000011D8 901F0094 */ stw r0, 0x94(r31)
/* 000011DC 38030000 */ addi r0, r3, lbl_0001C9E4@l
/* 000011E0 3C800000 */ lis r4, globalAnimTimer@ha
/* 000011E4 80DF00FC */ lwz r6, 0xfc(r31)
/* 000011E8 80660010 */ lwz r3, 0x10(r6)
/* 000011EC 90650000 */ stw r3, lbl_802F1DFC@l(r5)
/* 000011F0 80640000 */ lwz r3, globalAnimTimer@l(r4)
/* 000011F4 54630F3C */ rlwinm r3, r3, 1, 0x1c, 0x1e
/* 000011F8 7C601A14 */ add r3, r0, r3
/* 000011FC A8630000 */ lha r3, 0(r3)
/* 00001200 4BFFEF65 */ bl u_play_sound_0
/* 00001204 8001003C */ lwz r0, 0x3c(r1)
/* 00001208 83E10034 */ lwz r31, 0x34(r1)
/* 0000120C 83C10030 */ lwz r30, 0x30(r1)
/* 00001210 7C0803A6 */ mtlr r0
/* 00001214 83A1002C */ lwz r29, 0x2c(r1)
/* 00001218 83810028 */ lwz r28, 0x28(r1)
/* 0000121C 38210038 */ addi r1, r1, 0x38
/* 00001220 4E800020 */ blr 
lbl_00001224:
/* 00001224 4E800020 */ blr 
lbl_00001228:
/* 00001228 7C0802A6 */ mflr r0
/* 0000122C 3CA00000 */ lis r5, ballInfo@ha
/* 00001230 90010004 */ stw r0, 4(r1)
/* 00001234 3CC00000 */ lis r6, minigameGma@ha
/* 00001238 38A50000 */ addi r5, r5, ballInfo@l
/* 0000123C 9421FFD8 */ stwu r1, -0x28(r1)
/* 00001240 3C800000 */ lis r4, lbl_0001CA54@ha
/* 00001244 38C60000 */ addi r6, r6, minigameGma@l
/* 00001248 93E10024 */ stw r31, 0x24(r1)
/* 0000124C 3BE00000 */ li r31, 0
/* 00001250 3D000000 */ lis r8, lbl_0001BF80@ha
/* 00001254 93C10020 */ stw r30, 0x20(r1)
/* 00001258 93A1001C */ stw r29, 0x1c(r1)
/* 0000125C 93810018 */ stw r28, 0x18(r1)
/* 00001260 7C7C1B78 */ mr r28, r3
/* 00001264 83A300A4 */ lwz r29, 0xa4(r3)
/* 00001268 80FD0000 */ lwz r7, 0(r29)
/* 0000126C B3E3000C */ sth r31, 0xc(r3)
/* 00001270 1CE701A4 */ mulli r7, r7, 0x1a4
/* 00001274 801C0008 */ lwz r0, 8(r28)
/* 00001278 7FC53A14 */ add r30, r5, r7
/* 0000127C 60000012 */ ori r0, r0, 0x12
/* 00001280 901C0008 */ stw r0, 8(r28)
/* 00001284 38040000 */ addi r0, r4, lbl_0001CA54@l
/* 00001288 3C600000 */ lis r3, lbl_802F1E7C@ha
/* 0000128C 88BE014A */ lbz r5, 0x14a(r30)
/* 00001290 38E80000 */ addi r7, r8, lbl_0001BF80@l
/* 00001294 80C60000 */ lwz r6, 0(r6)
/* 00001298 54A4083C */ slwi r4, r5, 1
/* 0000129C 7C802214 */ add r4, r0, r4
/* 000012A0 80C60008 */ lwz r6, 8(r6)
/* 000012A4 A0040000 */ lhz r0, 0(r4)
/* 000012A8 38A30000 */ addi r5, r3, lbl_802F1E7C@l
/* 000012AC 387C00B4 */ addi r3, r28, 0xb4
/* 000012B0 54001838 */ slwi r0, r0, 3
/* 000012B4 7C06002E */ lwzx r0, r6, r0
/* 000012B8 3881000C */ addi r4, r1, 0xc
/* 000012BC 901C0054 */ stw r0, 0x54(r28)
/* 000012C0 C0050000 */ lfs f0, 0(r5)
/* 000012C4 D01C0034 */ stfs f0, 0x34(r28)
/* 000012C8 80DC0054 */ lwz r6, 0x54(r28)
/* 000012CC C0250000 */ lfs f1, 0(r5)
/* 000012D0 C0060014 */ lfs f0, 0x14(r6)
/* 000012D4 80A60008 */ lwz r5, 8(r6)
/* 000012D8 EC210024 */ fdivs f1, f1, f0
/* 000012DC 8006000C */ lwz r0, 0xc(r6)
/* 000012E0 90BC0010 */ stw r5, 0x10(r28)
/* 000012E4 901C0014 */ stw r0, 0x14(r28)
/* 000012E8 80060010 */ lwz r0, 0x10(r6)
/* 000012EC 901C0018 */ stw r0, 0x18(r28)
/* 000012F0 C01C0010 */ lfs f0, 0x10(r28)
/* 000012F4 EC000072 */ fmuls f0, f0, f1
/* 000012F8 D01C0010 */ stfs f0, 0x10(r28)
/* 000012FC C01C0014 */ lfs f0, 0x14(r28)
/* 00001300 EC000072 */ fmuls f0, f0, f1
/* 00001304 D01C0014 */ stfs f0, 0x14(r28)
/* 00001308 C01C0018 */ lfs f0, 0x18(r28)
/* 0000130C EC000072 */ fmuls f0, f0, f1
/* 00001310 D01C0018 */ stfs f0, 0x18(r28)
/* 00001314 D03C0048 */ stfs f1, 0x48(r28)
/* 00001318 D03C004C */ stfs f1, 0x4c(r28)
/* 0000131C D03C0050 */ stfs f1, 0x50(r28)
/* 00001320 C0070000 */ lfs f0, 0(r7)
/* 00001324 D01C009C */ stfs f0, 0x9c(r28)
/* 00001328 80BC0010 */ lwz r5, 0x10(r28)
/* 0000132C 801C0014 */ lwz r0, 0x14(r28)
/* 00001330 90BC0090 */ stw r5, 0x90(r28)
/* 00001334 901C0094 */ stw r0, 0x94(r28)
/* 00001338 801C0018 */ lwz r0, 0x18(r28)
/* 0000133C 901C0098 */ stw r0, 0x98(r28)
/* 00001340 C0070008 */ lfs f0, 8(r7)
/* 00001344 D01C00B4 */ stfs f0, 0xb4(r28)
/* 00001348 C0070008 */ lfs f0, 8(r7)
/* 0000134C D01C00B8 */ stfs f0, 0xb8(r28)
/* 00001350 C007000C */ lfs f0, 0xc(r7)
/* 00001354 D01C00BC */ stfs f0, 0xbc(r28)
/* 00001358 C03E0068 */ lfs f1, 0x68(r30)
/* 0000135C 4BFFEE09 */ bl mathutil_vec_set_len
/* 00001360 C03E0004 */ lfs f1, 4(r30)
/* 00001364 3800FFFF */ li r0, -1
/* 00001368 C001000C */ lfs f0, 0xc(r1)
/* 0000136C 387D0000 */ addi r3, r29, 0
/* 00001370 389E0004 */ addi r4, r30, 4
/* 00001374 EC01002A */ fadds f0, f1, f0
/* 00001378 38BC0058 */ addi r5, r28, 0x58
/* 0000137C D01C0058 */ stfs f0, 0x58(r28)
/* 00001380 C03E0008 */ lfs f1, 8(r30)
/* 00001384 C0010010 */ lfs f0, 0x10(r1)
/* 00001388 EC01002A */ fadds f0, f1, f0
/* 0000138C D01C005C */ stfs f0, 0x5c(r28)
/* 00001390 C03E000C */ lfs f1, 0xc(r30)
/* 00001394 C0010014 */ lfs f0, 0x14(r1)
/* 00001398 EC01002A */ fadds f0, f1, f0
/* 0000139C D01C0060 */ stfs f0, 0x60(r28)
/* 000013A0 B3FD000E */ sth r31, 0xe(r29)
/* 000013A4 B3FD0022 */ sth r31, 0x22(r29)
/* 000013A8 B3FD000C */ sth r31, 0xc(r29)
/* 000013AC B3FD0020 */ sth r31, 0x20(r29)
/* 000013B0 901D002C */ stw r0, 0x2c(r29)
/* 000013B4 93FD0030 */ stw r31, 0x30(r29)
/* 000013B8 939D0024 */ stw r28, 0x24(r29)
/* 000013BC 48001FF1 */ bl lbl_000033AC
/* 000013C0 8001002C */ lwz r0, 0x2c(r1)
/* 000013C4 83E10024 */ lwz r31, 0x24(r1)
/* 000013C8 83C10020 */ lwz r30, 0x20(r1)
/* 000013CC 7C0803A6 */ mtlr r0
/* 000013D0 83A1001C */ lwz r29, 0x1c(r1)
/* 000013D4 83810018 */ lwz r28, 0x18(r1)
/* 000013D8 38210028 */ addi r1, r1, 0x28
/* 000013DC 4E800020 */ blr 
lbl_000013E0:
/* 000013E0 7C0802A6 */ mflr r0
/* 000013E4 3CC00000 */ lis r6, ballInfo@ha
/* 000013E8 90010004 */ stw r0, 4(r1)
/* 000013EC 3CA00000 */ lis r5, currentBall@ha
/* 000013F0 3D004330 */ lis r8, 0x4330
/* 000013F4 9421FF80 */ stwu r1, -0x80(r1)
/* 000013F8 3C800000 */ lis r4, lbl_802F1E78@ha
/* 000013FC DBE10078 */ stfd f31, 0x78(r1)
/* 00001400 DBC10070 */ stfd f30, 0x70(r1)
/* 00001404 DBA10068 */ stfd f29, 0x68(r1)
/* 00001408 BF010048 */ stmw r24, 0x48(r1)
/* 0000140C 7C781B78 */ mr r24, r3
/* 00001410 832300A4 */ lwz r25, 0xa4(r3)
/* 00001414 3C600000 */ lis r3, lbl_0001C010@ha
/* 00001418 80190000 */ lwz r0, 0(r25)
/* 0000141C 1CE001A4 */ mulli r7, r0, 0x1a4
/* 00001420 38060000 */ addi r0, r6, ballInfo@l
/* 00001424 7FC03A14 */ add r30, r0, r7
/* 00001428 93C50000 */ stw r30, currentBall@l(r5)
/* 0000142C 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 00001430 3BE50000 */ addi r31, r5, lbl_0001BF80@l
/* 00001434 A8190012 */ lha r0, 0x12(r25)
/* 00001438 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 0000143C 3C600000 */ lis r3, lbl_802F1E7C@ha
/* 00001440 6C008000 */ xoris r0, r0, 0x8000
/* 00001444 C0440000 */ lfs f2, lbl_802F1E78@l(r4)
/* 00001448 90010044 */ stw r0, 0x44(r1)
/* 0000144C 38A30000 */ addi r5, r3, lbl_802F1E7C@l
/* 00001450 C07F000C */ lfs f3, 0xc(r31)
/* 00001454 91010040 */ stw r8, 0x40(r1)
/* 00001458 3C600000 */ lis r3, lbl_0001C010@ha
/* 0000145C C0850000 */ lfs f4, 0(r5)
/* 00001460 3C800000 */ lis r4, lbl_802F1E70@ha
/* 00001464 C8010040 */ lfd f0, 0x40(r1)
/* 00001468 3CA00000 */ lis r5, lbl_802F1E74@ha
/* 0000146C EC000828 */ fsubs f0, f0, f1
/* 00001470 EC020032 */ fmuls f0, f2, f0
/* 00001474 EC03002A */ fadds f0, f3, f0
/* 00001478 EC040032 */ fmuls f0, f4, f0
/* 0000147C D0180034 */ stfs f0, 0x34(r24)
/* 00001480 80F80054 */ lwz r7, 0x54(r24)
/* 00001484 C0380034 */ lfs f1, 0x34(r24)
/* 00001488 C0070014 */ lfs f0, 0x14(r7)
/* 0000148C 80C70008 */ lwz r6, 8(r7)
/* 00001490 EFE10024 */ fdivs f31, f1, f0
/* 00001494 8007000C */ lwz r0, 0xc(r7)
/* 00001498 90D80010 */ stw r6, 0x10(r24)
/* 0000149C 90180014 */ stw r0, 0x14(r24)
/* 000014A0 80070010 */ lwz r0, 0x10(r7)
/* 000014A4 90180018 */ stw r0, 0x18(r24)
/* 000014A8 C0180010 */ lfs f0, 0x10(r24)
/* 000014AC EC0007F2 */ fmuls f0, f0, f31
/* 000014B0 D0180010 */ stfs f0, 0x10(r24)
/* 000014B4 C0180014 */ lfs f0, 0x14(r24)
/* 000014B8 EC0007F2 */ fmuls f0, f0, f31
/* 000014BC D0180014 */ stfs f0, 0x14(r24)
/* 000014C0 C0180018 */ lfs f0, 0x18(r24)
/* 000014C4 EC0007F2 */ fmuls f0, f0, f31
/* 000014C8 D0180018 */ stfs f0, 0x18(r24)
/* 000014CC D3F80048 */ stfs f31, 0x48(r24)
/* 000014D0 D3F8004C */ stfs f31, 0x4c(r24)
/* 000014D4 D3F80050 */ stfs f31, 0x50(r24)
/* 000014D8 A8190014 */ lha r0, 0x14(r25)
/* 000014DC C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 000014E0 6C008000 */ xoris r0, r0, 0x8000
/* 000014E4 A8790018 */ lha r3, 0x18(r25)
/* 000014E8 9001003C */ stw r0, 0x3c(r1)
/* 000014EC C0640000 */ lfs f3, lbl_802F1E70@l(r4)
/* 000014F0 2C030000 */ cmpwi r3, 0
/* 000014F4 91010038 */ stw r8, 0x38(r1)
/* 000014F8 C09F000C */ lfs f4, 0xc(r31)
/* 000014FC C8010038 */ lfd f0, 0x38(r1)
/* 00001500 C0A50000 */ lfs f5, lbl_802F1E74@l(r5)
/* 00001504 EC000828 */ fsubs f0, f0, f1
/* 00001508 C03F007C */ lfs f1, 0x7c(r31)
/* 0000150C C05F0050 */ lfs f2, 0x50(r31)
/* 00001510 EC030032 */ fmuls f0, f3, f0
/* 00001514 EC04002A */ fadds f0, f4, f0
/* 00001518 EFC50032 */ fmuls f30, f5, f0
/* 0000151C EC05F024 */ fdivs f0, f5, f30
/* 00001520 EC040028 */ fsubs f0, f4, f0
/* 00001524 EC010032 */ fmuls f0, f1, f0
/* 00001528 EFA20028 */ fsubs f29, f2, f0
/* 0000152C 40810024 */ ble lbl_00001550
/* 00001530 3803FFFF */ addi r0, r3, -1
/* 00001534 B0190018 */ sth r0, 0x18(r25)
/* 00001538 A8190018 */ lha r0, 0x18(r25)
/* 0000153C 2C000000 */ cmpwi r0, 0
/* 00001540 40820010 */ bne lbl_00001550
/* 00001544 8019001C */ lwz r0, 0x1c(r25)
/* 00001548 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000154C 9019001C */ stw r0, 0x1c(r25)
lbl_00001550:
/* 00001550 881E002E */ lbz r0, 0x2e(r30)
/* 00001554 3C600000 */ lis r3, lbl_10017664@ha
/* 00001558 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000155C 7C040774 */ extsb r4, r0
/* 00001560 1C040018 */ mulli r0, r4, 0x18
/* 00001564 7C630214 */ add r3, r3, r0
/* 00001568 A003001A */ lhz r0, 0x1a(r3)
/* 0000156C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001570 4082000C */ bne lbl_0000157C
/* 00001574 38C00000 */ li r6, 0
/* 00001578 48000014 */ b lbl_0000158C
lbl_0000157C:
/* 0000157C 1C84014C */ mulli r4, r4, 0x14c
/* 00001580 3C600000 */ lis r3, lbl_10019040@ha
/* 00001584 38030000 */ addi r0, r3, lbl_10019040@l
/* 00001588 7CC02214 */ add r6, r0, r4
lbl_0000158C:
/* 0000158C 3C600000 */ lis r3, lbl_802F1E94@ha
/* 00001590 80830000 */ lwz r4, lbl_802F1E94@l(r3)
/* 00001594 3C600000 */ lis r3, lbl_802F1E90@ha
/* 00001598 80030000 */ lwz r0, lbl_802F1E90@l(r3)
/* 0000159C 3BA00000 */ li r29, 0
/* 000015A0 7C850E70 */ srawi r5, r4, 1
/* 000015A4 7CA50194 */ addze r5, r5
/* 000015A8 54A5083C */ slwi r5, r5, 1
/* 000015AC 7CA52010 */ subfc r5, r5, r4
/* 000015B0 7C1B0E70 */ srawi r27, r0, 1
/* 000015B4 7F7B0194 */ addze r27, r27
/* 000015B8 577B083C */ slwi r27, r27, 1
/* 000015BC 2C050001 */ cmpwi r5, 1
/* 000015C0 7F7B0010 */ subfc r27, r27, r0
/* 000015C4 3B800000 */ li r28, 0
/* 000015C8 41820184 */ beq lbl_0000174C
/* 000015CC 40800304 */ bge lbl_000018D0
/* 000015D0 2C050000 */ cmpwi r5, 0
/* 000015D4 40800008 */ bge lbl_000015DC
/* 000015D8 480002F8 */ b lbl_000018D0
lbl_000015DC:
/* 000015DC 28060000 */ cmplwi r6, 0
/* 000015E0 408200B8 */ bne lbl_00001698
/* 000015E4 881E002E */ lbz r0, 0x2e(r30)
/* 000015E8 3C600000 */ lis r3, playerControllerIDs@ha
/* 000015EC 3C800000 */ lis r4, controllerInfo@ha
/* 000015F0 7C000774 */ extsb r0, r0
/* 000015F4 5405103A */ slwi r5, r0, 2
/* 000015F8 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000015FC 7C602A14 */ add r3, r0, r5
/* 00001600 80030000 */ lwz r0, 0(r3)
/* 00001604 3C600000 */ lis r3, lbl_0001C010@ha
/* 00001608 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 0000160C 3C600000 */ lis r3, lbl_0001C010@ha
/* 00001610 1CA0003C */ mulli r5, r0, 0x3c
/* 00001614 38040000 */ addi r0, r4, controllerInfo@l
/* 00001618 7CE02A14 */ add r7, r0, r5
/* 0000161C 88070002 */ lbz r0, 2(r7)
/* 00001620 3C804330 */ lis r4, 0x4330
/* 00001624 A0C70018 */ lhz r6, 0x18(r7)
/* 00001628 7C000774 */ extsb r0, r0
/* 0000162C A0A70000 */ lhz r5, 0(r7)
/* 00001630 6C008000 */ xoris r0, r0, 0x8000
/* 00001634 9001003C */ stw r0, 0x3c(r1)
/* 00001638 54DC05EE */ rlwinm r28, r6, 0, 0x17, 0x17
/* 0000163C 54BD05EE */ rlwinm r29, r5, 0, 0x17, 0x17
/* 00001640 90810038 */ stw r4, 0x38(r1)
/* 00001644 C8010038 */ lfd f0, 0x38(r1)
/* 00001648 EC000828 */ fsubs f0, f0, f1
/* 0000164C D001001C */ stfs f0, 0x1c(r1)
/* 00001650 88070003 */ lbz r0, 3(r7)
/* 00001654 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 00001658 7C000774 */ extsb r0, r0
/* 0000165C 6C008000 */ xoris r0, r0, 0x8000
/* 00001660 90010044 */ stw r0, 0x44(r1)
/* 00001664 90810040 */ stw r4, 0x40(r1)
/* 00001668 C8010040 */ lfd f0, 0x40(r1)
/* 0000166C EC000828 */ fsubs f0, f0, f1
/* 00001670 D0010020 */ stfs f0, 0x20(r1)
/* 00001674 C01F0008 */ lfs f0, 8(r31)
/* 00001678 D0010024 */ stfs f0, 0x24(r1)
/* 0000167C 4BFFEAE9 */ bl mathutil_mtxA_from_mtxB
/* 00001680 3861001C */ addi r3, r1, 0x1c
/* 00001684 38830000 */ addi r4, r3, 0
/* 00001688 4BFFEADD */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 0000168C C01F0008 */ lfs f0, 8(r31)
/* 00001690 D0010020 */ stfs f0, 0x20(r1)
/* 00001694 48000074 */ b lbl_00001708
lbl_00001698:
/* 00001698 88060002 */ lbz r0, 2(r6)
/* 0000169C 3C600000 */ lis r3, lbl_0001C010@ha
/* 000016A0 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 000016A4 3C804330 */ lis r4, 0x4330
/* 000016A8 7C000774 */ extsb r0, r0
/* 000016AC 6C008000 */ xoris r0, r0, 0x8000
/* 000016B0 A0A60000 */ lhz r5, 0(r6)
/* 000016B4 9001003C */ stw r0, 0x3c(r1)
/* 000016B8 3C600000 */ lis r3, lbl_0001C010@ha
/* 000016BC A0060018 */ lhz r0, 0x18(r6)
/* 000016C0 54BD05EE */ rlwinm r29, r5, 0, 0x17, 0x17
/* 000016C4 90810038 */ stw r4, 0x38(r1)
/* 000016C8 541C05EE */ rlwinm r28, r0, 0, 0x17, 0x17
/* 000016CC C8010038 */ lfd f0, 0x38(r1)
/* 000016D0 EC000828 */ fsubs f0, f0, f1
/* 000016D4 D001001C */ stfs f0, 0x1c(r1)
/* 000016D8 C01F0008 */ lfs f0, 8(r31)
/* 000016DC D0010020 */ stfs f0, 0x20(r1)
/* 000016E0 88060003 */ lbz r0, 3(r6)
/* 000016E4 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 000016E8 7C000774 */ extsb r0, r0
/* 000016EC 6C008000 */ xoris r0, r0, 0x8000
/* 000016F0 90010044 */ stw r0, 0x44(r1)
/* 000016F4 90810040 */ stw r4, 0x40(r1)
/* 000016F8 C8010040 */ lfd f0, 0x40(r1)
/* 000016FC EC000828 */ fsubs f0, f0, f1
/* 00001700 FC000050 */ fneg f0, f0
/* 00001704 D0010024 */ stfs f0, 0x24(r1)
lbl_00001708:
/* 00001708 C03F0008 */ lfs f1, 8(r31)
/* 0000170C C001001C */ lfs f0, 0x1c(r1)
/* 00001710 FC010000 */ fcmpu cr0, f1, f0
/* 00001714 4082002C */ bne lbl_00001740
/* 00001718 C0010024 */ lfs f0, 0x24(r1)
/* 0000171C FC010000 */ fcmpu cr0, f1, f0
/* 00001720 40820020 */ bne lbl_00001740
/* 00001724 807800B4 */ lwz r3, 0xb4(r24)
/* 00001728 801800B8 */ lwz r0, 0xb8(r24)
/* 0000172C 9061001C */ stw r3, 0x1c(r1)
/* 00001730 90010020 */ stw r0, 0x20(r1)
/* 00001734 801800BC */ lwz r0, 0xbc(r24)
/* 00001738 90010024 */ stw r0, 0x24(r1)
/* 0000173C 48000194 */ b lbl_000018D0
lbl_00001740:
/* 00001740 3861001C */ addi r3, r1, 0x1c
/* 00001744 4BFFEA21 */ bl mathutil_vec_normalize_len
/* 00001748 48000188 */ b lbl_000018D0
lbl_0000174C:
/* 0000174C 28060000 */ cmplwi r6, 0
/* 00001750 40820034 */ bne lbl_00001784
/* 00001754 881E002E */ lbz r0, 0x2e(r30)
/* 00001758 3C800000 */ lis r4, playerControllerIDs@ha
/* 0000175C 3C600000 */ lis r3, controllerInfo@ha
/* 00001760 7C000774 */ extsb r0, r0
/* 00001764 5405103A */ slwi r5, r0, 2
/* 00001768 38040000 */ addi r0, r4, playerControllerIDs@l
/* 0000176C 7C802A14 */ add r4, r0, r5
/* 00001770 80840000 */ lwz r4, 0(r4)
/* 00001774 38030000 */ addi r0, r3, controllerInfo@l
/* 00001778 1C64003C */ mulli r3, r4, 0x3c
/* 0000177C 7F401A14 */ add r26, r0, r3
/* 00001780 48000008 */ b lbl_00001788
lbl_00001784:
/* 00001784 7CDA3378 */ mr r26, r6
lbl_00001788:
/* 00001788 881A0004 */ lbz r0, 4(r26)
/* 0000178C 3C600000 */ lis r3, lbl_0001C010@ha
/* 00001790 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 00001794 3C804330 */ lis r4, 0x4330
/* 00001798 7C000774 */ extsb r0, r0
/* 0000179C 6C008000 */ xoris r0, r0, 0x8000
/* 000017A0 9001003C */ stw r0, 0x3c(r1)
/* 000017A4 3C600000 */ lis r3, lbl_0001C010@ha
/* 000017A8 90810038 */ stw r4, 0x38(r1)
/* 000017AC C8010038 */ lfd f0, 0x38(r1)
/* 000017B0 EC000828 */ fsubs f0, f0, f1
/* 000017B4 D001001C */ stfs f0, 0x1c(r1)
/* 000017B8 881A0005 */ lbz r0, 5(r26)
/* 000017BC C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 000017C0 7C000774 */ extsb r0, r0
/* 000017C4 6C008000 */ xoris r0, r0, 0x8000
/* 000017C8 90010044 */ stw r0, 0x44(r1)
/* 000017CC 90810040 */ stw r4, 0x40(r1)
/* 000017D0 C8010040 */ lfd f0, 0x40(r1)
/* 000017D4 EC000828 */ fsubs f0, f0, f1
/* 000017D8 D0010020 */ stfs f0, 0x20(r1)
/* 000017DC C01F0008 */ lfs f0, 8(r31)
/* 000017E0 D0010024 */ stfs f0, 0x24(r1)
/* 000017E4 C021001C */ lfs f1, 0x1c(r1)
/* 000017E8 C0410020 */ lfs f2, 0x20(r1)
/* 000017EC C0010024 */ lfs f0, 0x24(r1)
/* 000017F0 EC210072 */ fmuls f1, f1, f1
/* 000017F4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000017F8 EC20083A */ fmadds f1, f0, f0, f1
/* 000017FC 4BFFE969 */ bl mathutil_sqrt
/* 00001800 C01F0080 */ lfs f0, 0x80(r31)
/* 00001804 FC010040 */ fcmpo cr0, f1, f0
/* 00001808 40810008 */ ble lbl_00001810
/* 0000180C 3BA00001 */ li r29, 1
lbl_00001810:
/* 00001810 2C1D0000 */ cmpwi r29, 0
/* 00001814 3B9D0000 */ addi r28, r29, 0
/* 00001818 40820060 */ bne lbl_00001878
/* 0000181C 881A0002 */ lbz r0, 2(r26)
/* 00001820 3C600000 */ lis r3, lbl_0001C010@ha
/* 00001824 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 00001828 3C804330 */ lis r4, 0x4330
/* 0000182C 7C000774 */ extsb r0, r0
/* 00001830 6C008000 */ xoris r0, r0, 0x8000
/* 00001834 9001003C */ stw r0, 0x3c(r1)
/* 00001838 3C600000 */ lis r3, lbl_0001C010@ha
/* 0000183C 90810038 */ stw r4, 0x38(r1)
/* 00001840 C8010038 */ lfd f0, 0x38(r1)
/* 00001844 EC000828 */ fsubs f0, f0, f1
/* 00001848 D001001C */ stfs f0, 0x1c(r1)
/* 0000184C 881A0003 */ lbz r0, 3(r26)
/* 00001850 C8230000 */ lfd f1, lbl_0001C010@l(r3)
/* 00001854 7C000774 */ extsb r0, r0
/* 00001858 6C008000 */ xoris r0, r0, 0x8000
/* 0000185C 90010044 */ stw r0, 0x44(r1)
/* 00001860 90810040 */ stw r4, 0x40(r1)
/* 00001864 C8010040 */ lfd f0, 0x40(r1)
/* 00001868 EC000828 */ fsubs f0, f0, f1
/* 0000186C D0010020 */ stfs f0, 0x20(r1)
/* 00001870 C01F0008 */ lfs f0, 8(r31)
/* 00001874 D0010024 */ stfs f0, 0x24(r1)
lbl_00001878:
/* 00001878 4BFFE8ED */ bl mathutil_mtxA_from_mtxB
/* 0000187C 3861001C */ addi r3, r1, 0x1c
/* 00001880 38830000 */ addi r4, r3, 0
/* 00001884 4BFFE8E1 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00001888 C01F0008 */ lfs f0, 8(r31)
/* 0000188C D0010020 */ stfs f0, 0x20(r1)
/* 00001890 C03F0008 */ lfs f1, 8(r31)
/* 00001894 C001001C */ lfs f0, 0x1c(r1)
/* 00001898 FC010000 */ fcmpu cr0, f1, f0
/* 0000189C 4082002C */ bne lbl_000018C8
/* 000018A0 C0010024 */ lfs f0, 0x24(r1)
/* 000018A4 FC010000 */ fcmpu cr0, f1, f0
/* 000018A8 40820020 */ bne lbl_000018C8
/* 000018AC 807800B4 */ lwz r3, 0xb4(r24)
/* 000018B0 801800B8 */ lwz r0, 0xb8(r24)
/* 000018B4 9061001C */ stw r3, 0x1c(r1)
/* 000018B8 90010020 */ stw r0, 0x20(r1)
/* 000018BC 801800BC */ lwz r0, 0xbc(r24)
/* 000018C0 90010024 */ stw r0, 0x24(r1)
/* 000018C4 4800000C */ b lbl_000018D0
lbl_000018C8:
/* 000018C8 3861001C */ addi r3, r1, 0x1c
/* 000018CC 4BFFE899 */ bl mathutil_vec_normalize_len
lbl_000018D0:
/* 000018D0 801E0094 */ lwz r0, 0x94(r30)
/* 000018D4 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 000018D8 4182000C */ beq lbl_000018E4
/* 000018DC 3BA00000 */ li r29, 0
/* 000018E0 3B800000 */ li r28, 0
lbl_000018E4:
/* 000018E4 A818000C */ lha r0, 0xc(r24)
/* 000018E8 28000008 */ cmplwi r0, 8
/* 000018EC 41810854 */ bgt lbl_00002140
/* 000018F0 3C600000 */ lis r3, lbl_0001CA68@ha
/* 000018F4 38630000 */ addi r3, r3, lbl_0001CA68@l
/* 000018F8 5400103A */ slwi r0, r0, 2
/* 000018FC 7C03002E */ lwzx r0, r3, r0
/* 00001900 7C0903A6 */ mtctr r0
/* 00001904 4E800420 */ bctr 
lbl_00001908:
/* 00001908 38000001 */ li r0, 1
/* 0000190C B018000C */ sth r0, 0xc(r24)
/* 00001910 3C600000 */ lis r3, lbl_802F1E98@ha
/* 00001914 80030000 */ lwz r0, lbl_802F1E98@l(r3)
/* 00001918 7C000734 */ extsh r0, r0
/* 0000191C B018000E */ sth r0, 0xe(r24)
lbl_00001920:
/* 00001920 C05800B4 */ lfs f2, 0xb4(r24)
/* 00001924 387800B4 */ addi r3, r24, 0xb4
/* 00001928 C001001C */ lfs f0, 0x1c(r1)
/* 0000192C C03F0050 */ lfs f1, 0x50(r31)
/* 00001930 EC001028 */ fsubs f0, f0, f2
/* 00001934 EC010032 */ fmuls f0, f1, f0
/* 00001938 EC02002A */ fadds f0, f2, f0
/* 0000193C D01800B4 */ stfs f0, 0xb4(r24)
/* 00001940 C05800B8 */ lfs f2, 0xb8(r24)
/* 00001944 C0010020 */ lfs f0, 0x20(r1)
/* 00001948 C03F0050 */ lfs f1, 0x50(r31)
/* 0000194C EC001028 */ fsubs f0, f0, f2
/* 00001950 EC010032 */ fmuls f0, f1, f0
/* 00001954 EC02002A */ fadds f0, f2, f0
/* 00001958 D01800B8 */ stfs f0, 0xb8(r24)
/* 0000195C C05800BC */ lfs f2, 0xbc(r24)
/* 00001960 C0010024 */ lfs f0, 0x24(r1)
/* 00001964 C03F0050 */ lfs f1, 0x50(r31)
/* 00001968 EC001028 */ fsubs f0, f0, f2
/* 0000196C EC010032 */ fmuls f0, f1, f0
/* 00001970 EC02002A */ fadds f0, f2, f0
/* 00001974 D01800BC */ stfs f0, 0xbc(r24)
/* 00001978 4BFFE7ED */ bl mathutil_vec_normalize_len
/* 0000197C C03F0000 */ lfs f1, 0(r31)
/* 00001980 C0180034 */ lfs f0, 0x34(r24)
/* 00001984 C07E0068 */ lfs f3, 0x68(r30)
/* 00001988 EC410032 */ fmuls f2, f1, f0
/* 0000198C C01800B4 */ lfs f0, 0xb4(r24)
/* 00001990 C03E0004 */ lfs f1, 4(r30)
/* 00001994 EFE3102A */ fadds f31, f3, f2
/* 00001998 EC0007F2 */ fmuls f0, f0, f31
/* 0000199C EC01002A */ fadds f0, f1, f0
/* 000019A0 D0010028 */ stfs f0, 0x28(r1)
/* 000019A4 C01800B8 */ lfs f0, 0xb8(r24)
/* 000019A8 C03E0008 */ lfs f1, 8(r30)
/* 000019AC EC0007F2 */ fmuls f0, f0, f31
/* 000019B0 EC01002A */ fadds f0, f1, f0
/* 000019B4 D001002C */ stfs f0, 0x2c(r1)
/* 000019B8 C01800BC */ lfs f0, 0xbc(r24)
/* 000019BC C03E000C */ lfs f1, 0xc(r30)
/* 000019C0 EC0007F2 */ fmuls f0, f0, f31
/* 000019C4 EC01002A */ fadds f0, f1, f0
/* 000019C8 D0010030 */ stfs f0, 0x30(r1)
/* 000019CC A878000E */ lha r3, 0xe(r24)
/* 000019D0 3803FFFF */ addi r0, r3, -1
/* 000019D4 B018000E */ sth r0, 0xe(r24)
/* 000019D8 A818000E */ lha r0, 0xe(r24)
/* 000019DC 2C000000 */ cmpwi r0, 0
/* 000019E0 40800760 */ bge lbl_00002140
/* 000019E4 38000002 */ li r0, 2
/* 000019E8 B018000C */ sth r0, 0xc(r24)
/* 000019EC 48000754 */ b lbl_00002140
lbl_000019F0:
/* 000019F0 38000003 */ li r0, 3
/* 000019F4 B018000C */ sth r0, 0xc(r24)
lbl_000019F8:
/* 000019F8 C05800B4 */ lfs f2, 0xb4(r24)
/* 000019FC 387800B4 */ addi r3, r24, 0xb4
/* 00001A00 C001001C */ lfs f0, 0x1c(r1)
/* 00001A04 C03F0074 */ lfs f1, 0x74(r31)
/* 00001A08 EC001028 */ fsubs f0, f0, f2
/* 00001A0C EC010032 */ fmuls f0, f1, f0
/* 00001A10 EC02002A */ fadds f0, f2, f0
/* 00001A14 D01800B4 */ stfs f0, 0xb4(r24)
/* 00001A18 C05800B8 */ lfs f2, 0xb8(r24)
/* 00001A1C C0010020 */ lfs f0, 0x20(r1)
/* 00001A20 C03F0074 */ lfs f1, 0x74(r31)
/* 00001A24 EC001028 */ fsubs f0, f0, f2
/* 00001A28 EC010032 */ fmuls f0, f1, f0
/* 00001A2C EC02002A */ fadds f0, f2, f0
/* 00001A30 D01800B8 */ stfs f0, 0xb8(r24)
/* 00001A34 C05800BC */ lfs f2, 0xbc(r24)
/* 00001A38 C0010024 */ lfs f0, 0x24(r1)
/* 00001A3C C03F0074 */ lfs f1, 0x74(r31)
/* 00001A40 EC001028 */ fsubs f0, f0, f2
/* 00001A44 EC010032 */ fmuls f0, f1, f0
/* 00001A48 EC02002A */ fadds f0, f2, f0
/* 00001A4C D01800BC */ stfs f0, 0xbc(r24)
/* 00001A50 4BFFE715 */ bl mathutil_vec_normalize_len
/* 00001A54 C03F0000 */ lfs f1, 0(r31)
/* 00001A58 2C1C0000 */ cmpwi r28, 0
/* 00001A5C C0180034 */ lfs f0, 0x34(r24)
/* 00001A60 C07E0068 */ lfs f3, 0x68(r30)
/* 00001A64 EC410032 */ fmuls f2, f1, f0
/* 00001A68 C01800B4 */ lfs f0, 0xb4(r24)
/* 00001A6C C03E0004 */ lfs f1, 4(r30)
/* 00001A70 EFE3102A */ fadds f31, f3, f2
/* 00001A74 EC0007F2 */ fmuls f0, f0, f31
/* 00001A78 EC01002A */ fadds f0, f1, f0
/* 00001A7C D0010028 */ stfs f0, 0x28(r1)
/* 00001A80 C01800B8 */ lfs f0, 0xb8(r24)
/* 00001A84 C03E0008 */ lfs f1, 8(r30)
/* 00001A88 EC0007F2 */ fmuls f0, f0, f31
/* 00001A8C EC01002A */ fadds f0, f1, f0
/* 00001A90 D001002C */ stfs f0, 0x2c(r1)
/* 00001A94 C01800BC */ lfs f0, 0xbc(r24)
/* 00001A98 C03E000C */ lfs f1, 0xc(r30)
/* 00001A9C EC0007F2 */ fmuls f0, f0, f31
/* 00001AA0 EC01002A */ fadds f0, f1, f0
/* 00001AA4 D0010030 */ stfs f0, 0x30(r1)
/* 00001AA8 41820698 */ beq lbl_00002140
/* 00001AAC 8061001C */ lwz r3, 0x1c(r1)
/* 00001AB0 80010020 */ lwz r0, 0x20(r1)
/* 00001AB4 907800B4 */ stw r3, 0xb4(r24)
/* 00001AB8 901800B8 */ stw r0, 0xb8(r24)
/* 00001ABC 80010024 */ lwz r0, 0x24(r1)
/* 00001AC0 901800BC */ stw r0, 0xbc(r24)
/* 00001AC4 8019001C */ lwz r0, 0x1c(r25)
/* 00001AC8 5400077D */ rlwinm. r0, r0, 0, 0x1d, 0x1e
/* 00001ACC 40820010 */ bne lbl_00001ADC
/* 00001AD0 38000004 */ li r0, 4
/* 00001AD4 B018000C */ sth r0, 0xc(r24)
/* 00001AD8 48000668 */ b lbl_00002140
lbl_00001ADC:
/* 00001ADC 38000006 */ li r0, 6
/* 00001AE0 B018000C */ sth r0, 0xc(r24)
/* 00001AE4 4800065C */ b lbl_00002140
lbl_00001AE8:
/* 00001AE8 38000005 */ li r0, 5
/* 00001AEC B018000C */ sth r0, 0xc(r24)
/* 00001AF0 3C600000 */ lis r3, lbl_802F1E8C@ha
/* 00001AF4 38C30000 */ addi r6, r3, lbl_802F1E8C@l
/* 00001AF8 80180008 */ lwz r0, 8(r24)
/* 00001AFC 38790004 */ addi r3, r25, 4
/* 00001B00 38800000 */ li r4, 0
/* 00001B04 60000002 */ ori r0, r0, 2
/* 00001B08 90180008 */ stw r0, 8(r24)
/* 00001B0C 38A00008 */ li r5, 8
/* 00001B10 80060000 */ lwz r0, 0(r6)
/* 00001B14 7C000734 */ extsh r0, r0
/* 00001B18 B018000E */ sth r0, 0xe(r24)
/* 00001B1C 4BFFE649 */ bl memset
/* 00001B20 8019001C */ lwz r0, 0x1c(r25)
/* 00001B24 3C800000 */ lis r4, lbl_802F1E88@ha
/* 00001B28 38610010 */ addi r3, r1, 0x10
/* 00001B2C 60000008 */ ori r0, r0, 8
/* 00001B30 9019001C */ stw r0, 0x1c(r25)
/* 00001B34 38A40000 */ addi r5, r4, lbl_802F1E88@l
/* 00001B38 38830000 */ addi r4, r3, 0
/* 00001B3C 8019001C */ lwz r0, 0x1c(r25)
/* 00001B40 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00001B44 9019001C */ stw r0, 0x1c(r25)
/* 00001B48 C01800B4 */ lfs f0, 0xb4(r24)
/* 00001B4C C03E0004 */ lfs f1, 4(r30)
/* 00001B50 EC0007F2 */ fmuls f0, f0, f31
/* 00001B54 EC01002A */ fadds f0, f1, f0
/* 00001B58 D0010028 */ stfs f0, 0x28(r1)
/* 00001B5C C01800B8 */ lfs f0, 0xb8(r24)
/* 00001B60 C03E0008 */ lfs f1, 8(r30)
/* 00001B64 EC0007F2 */ fmuls f0, f0, f31
/* 00001B68 EC01002A */ fadds f0, f1, f0
/* 00001B6C D001002C */ stfs f0, 0x2c(r1)
/* 00001B70 C01800BC */ lfs f0, 0xbc(r24)
/* 00001B74 C03E000C */ lfs f1, 0xc(r30)
/* 00001B78 EC0007F2 */ fmuls f0, f0, f31
/* 00001B7C EC01002A */ fadds f0, f1, f0
/* 00001B80 D0010030 */ stfs f0, 0x30(r1)
/* 00001B84 C0210028 */ lfs f1, 0x28(r1)
/* 00001B88 C0180058 */ lfs f0, 0x58(r24)
/* 00001B8C C041002C */ lfs f2, 0x2c(r1)
/* 00001B90 EC010028 */ fsubs f0, f1, f0
/* 00001B94 C0210030 */ lfs f1, 0x30(r1)
/* 00001B98 D0010010 */ stfs f0, 0x10(r1)
/* 00001B9C C018005C */ lfs f0, 0x5c(r24)
/* 00001BA0 EC020028 */ fsubs f0, f2, f0
/* 00001BA4 D0010014 */ stfs f0, 0x14(r1)
/* 00001BA8 C0180060 */ lfs f0, 0x60(r24)
/* 00001BAC EC010028 */ fsubs f0, f1, f0
/* 00001BB0 D0010018 */ stfs f0, 0x18(r1)
/* 00001BB4 C0250000 */ lfs f1, 0(r5)
/* 00001BB8 4BFFE5AD */ bl mathutil_vec_set_len
/* 00001BBC C0380064 */ lfs f1, 0x64(r24)
/* 00001BC0 3CA00000 */ lis r5, playerCharacterSelection@ha
/* 00001BC4 C0010010 */ lfs f0, 0x10(r1)
/* 00001BC8 38050000 */ addi r0, r5, playerCharacterSelection@l
/* 00001BCC 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00001BD0 EC01002A */ fadds f0, f1, f0
/* 00001BD4 3C600000 */ lis r3, u_somePlayerId@ha
/* 00001BD8 D0180064 */ stfs f0, 0x64(r24)
/* 00001BDC C0380068 */ lfs f1, 0x68(r24)
/* 00001BE0 C0010014 */ lfs f0, 0x14(r1)
/* 00001BE4 EC01002A */ fadds f0, f1, f0
/* 00001BE8 D0180068 */ stfs f0, 0x68(r24)
/* 00001BEC C038006C */ lfs f1, 0x6c(r24)
/* 00001BF0 C0010018 */ lfs f0, 0x18(r1)
/* 00001BF4 EC01002A */ fadds f0, f1, f0
/* 00001BF8 D018006C */ stfs f0, 0x6c(r24)
/* 00001BFC 80B90000 */ lwz r5, 0(r25)
/* 00001C00 54A5103A */ slwi r5, r5, 2
/* 00001C04 7CA02A14 */ add r5, r0, r5
/* 00001C08 80050000 */ lwz r0, 0(r5)
/* 00001C0C 90040000 */ stw r0, lbl_802F1DFC@l(r4)
/* 00001C10 80190000 */ lwz r0, 0(r25)
/* 00001C14 90030000 */ stw r0, u_somePlayerId@l(r3)
/* 00001C18 A8190014 */ lha r0, 0x14(r25)
/* 00001C1C 2C000000 */ cmpwi r0, 0
/* 00001C20 40810014 */ ble lbl_00001C34
/* 00001C24 38600104 */ li r3, 0x104
/* 00001C28 4BFFE53D */ bl u_play_sound_1_dupe
/* 00001C2C 9079002C */ stw r3, 0x2c(r25)
/* 00001C30 48000014 */ b lbl_00001C44
lbl_00001C34:
/* 00001C34 38600106 */ li r3, 0x106
/* 00001C38 4BFFE52D */ bl u_play_sound_0
/* 00001C3C 3800FFFF */ li r0, -1
/* 00001C40 9019002C */ stw r0, 0x2c(r25)
lbl_00001C44:
/* 00001C44 801E0094 */ lwz r0, 0x94(r30)
/* 00001C48 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001C4C 41820038 */ beq lbl_00001C84
/* 00001C50 3C600000 */ lis r3, lbl_802F1E6C@ha
/* 00001C54 C03E001C */ lfs f1, 0x1c(r30)
/* 00001C58 C4030000 */ lfsu f0, lbl_802F1E6C@l(r3)
/* 00001C5C EC010032 */ fmuls f0, f1, f0
/* 00001C60 D01E001C */ stfs f0, 0x1c(r30)
/* 00001C64 C03E0020 */ lfs f1, 0x20(r30)
/* 00001C68 C0030000 */ lfs f0, 0(r3)
/* 00001C6C EC010032 */ fmuls f0, f1, f0
/* 00001C70 D01E0020 */ stfs f0, 0x20(r30)
/* 00001C74 C03E0024 */ lfs f1, 0x24(r30)
/* 00001C78 C0030000 */ lfs f0, 0(r3)
/* 00001C7C EC010032 */ fmuls f0, f1, f0
/* 00001C80 D01E0024 */ stfs f0, 0x24(r30)
lbl_00001C84:
/* 00001C84 2C1B0001 */ cmpwi r27, 1
/* 00001C88 40820060 */ bne lbl_00001CE8
/* 00001C8C C05800B4 */ lfs f2, 0xb4(r24)
/* 00001C90 387800B4 */ addi r3, r24, 0xb4
/* 00001C94 C001001C */ lfs f0, 0x1c(r1)
/* 00001C98 C03F0074 */ lfs f1, 0x74(r31)
/* 00001C9C EC001028 */ fsubs f0, f0, f2
/* 00001CA0 EC010032 */ fmuls f0, f1, f0
/* 00001CA4 EC02002A */ fadds f0, f2, f0
/* 00001CA8 D01800B4 */ stfs f0, 0xb4(r24)
/* 00001CAC C05800B8 */ lfs f2, 0xb8(r24)
/* 00001CB0 C0010020 */ lfs f0, 0x20(r1)
/* 00001CB4 C03F0074 */ lfs f1, 0x74(r31)
/* 00001CB8 EC001028 */ fsubs f0, f0, f2
/* 00001CBC EC010032 */ fmuls f0, f1, f0
/* 00001CC0 EC02002A */ fadds f0, f2, f0
/* 00001CC4 D01800B8 */ stfs f0, 0xb8(r24)
/* 00001CC8 C05800BC */ lfs f2, 0xbc(r24)
/* 00001CCC C0010024 */ lfs f0, 0x24(r1)
/* 00001CD0 C03F0074 */ lfs f1, 0x74(r31)
/* 00001CD4 EC001028 */ fsubs f0, f0, f2
/* 00001CD8 EC010032 */ fmuls f0, f1, f0
/* 00001CDC EC02002A */ fadds f0, f2, f0
/* 00001CE0 D01800BC */ stfs f0, 0xbc(r24)
/* 00001CE4 4BFFE481 */ bl mathutil_vec_normalize_len
lbl_00001CE8:
/* 00001CE8 C01800B4 */ lfs f0, 0xb4(r24)
/* 00001CEC C03E0004 */ lfs f1, 4(r30)
/* 00001CF0 EC0007B2 */ fmuls f0, f0, f30
/* 00001CF4 EC01002A */ fadds f0, f1, f0
/* 00001CF8 D0010028 */ stfs f0, 0x28(r1)
/* 00001CFC C01800B8 */ lfs f0, 0xb8(r24)
/* 00001D00 C03E0008 */ lfs f1, 8(r30)
/* 00001D04 EC0007B2 */ fmuls f0, f0, f30
/* 00001D08 EC01002A */ fadds f0, f1, f0
/* 00001D0C D001002C */ stfs f0, 0x2c(r1)
/* 00001D10 C01800BC */ lfs f0, 0xbc(r24)
/* 00001D14 C03E000C */ lfs f1, 0xc(r30)
/* 00001D18 EC0007B2 */ fmuls f0, f0, f30
/* 00001D1C EC01002A */ fadds f0, f1, f0
/* 00001D20 D0010030 */ stfs f0, 0x30(r1)
/* 00001D24 8019001C */ lwz r0, 0x1c(r25)
/* 00001D28 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00001D2C 4182000C */ beq lbl_00001D38
/* 00001D30 38000006 */ li r0, 6
/* 00001D34 B018000C */ sth r0, 0xc(r24)
lbl_00001D38:
/* 00001D38 A878000E */ lha r3, 0xe(r24)
/* 00001D3C 3803FFFF */ addi r0, r3, -1
/* 00001D40 B018000E */ sth r0, 0xe(r24)
/* 00001D44 A818000E */ lha r0, 0xe(r24)
/* 00001D48 2C000000 */ cmpwi r0, 0
/* 00001D4C 41800018 */ blt lbl_00001D64
/* 00001D50 2C1D0000 */ cmpwi r29, 0
/* 00001D54 41820010 */ beq lbl_00001D64
/* 00001D58 8019001C */ lwz r0, 0x1c(r25)
/* 00001D5C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001D60 418203E0 */ beq lbl_00002140
lbl_00001D64:
/* 00001D64 38000000 */ li r0, 0
/* 00001D68 B018000C */ sth r0, 0xc(r24)
/* 00001D6C 3800FFF6 */ li r0, -10
/* 00001D70 8079001C */ lwz r3, 0x1c(r25)
/* 00001D74 7C600038 */ and r0, r3, r0
/* 00001D78 9019001C */ stw r0, 0x1c(r25)
/* 00001D7C 480003C4 */ b lbl_00002140
lbl_00001D80:
/* 00001D80 38000007 */ li r0, 7
/* 00001D84 B018000C */ sth r0, 0xc(r24)
/* 00001D88 38000003 */ li r0, 3
/* 00001D8C 38790004 */ addi r3, r25, 4
/* 00001D90 B018000E */ sth r0, 0xe(r24)
/* 00001D94 38800000 */ li r4, 0
/* 00001D98 38A00008 */ li r5, 8
/* 00001D9C 80180008 */ lwz r0, 8(r24)
/* 00001DA0 60000002 */ ori r0, r0, 2
/* 00001DA4 90180008 */ stw r0, 8(r24)
/* 00001DA8 4BFFE3BD */ bl memset
/* 00001DAC 8019001C */ lwz r0, 0x1c(r25)
/* 00001DB0 3C800000 */ lis r4, lbl_802F1E88@ha
/* 00001DB4 38610010 */ addi r3, r1, 0x10
/* 00001DB8 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00001DBC 9019001C */ stw r0, 0x1c(r25)
/* 00001DC0 38A40000 */ addi r5, r4, lbl_802F1E88@l
/* 00001DC4 38830000 */ addi r4, r3, 0
/* 00001DC8 8019001C */ lwz r0, 0x1c(r25)
/* 00001DCC 60000008 */ ori r0, r0, 8
/* 00001DD0 9019001C */ stw r0, 0x1c(r25)
/* 00001DD4 C01800B4 */ lfs f0, 0xb4(r24)
/* 00001DD8 C03E0004 */ lfs f1, 4(r30)
/* 00001DDC EC0007F2 */ fmuls f0, f0, f31
/* 00001DE0 EC01002A */ fadds f0, f1, f0
/* 00001DE4 D0010028 */ stfs f0, 0x28(r1)
/* 00001DE8 C01800B8 */ lfs f0, 0xb8(r24)
/* 00001DEC C03E0008 */ lfs f1, 8(r30)
/* 00001DF0 EC0007F2 */ fmuls f0, f0, f31
/* 00001DF4 EC01002A */ fadds f0, f1, f0
/* 00001DF8 D001002C */ stfs f0, 0x2c(r1)
/* 00001DFC C01800BC */ lfs f0, 0xbc(r24)
/* 00001E00 C03E000C */ lfs f1, 0xc(r30)
/* 00001E04 EC0007F2 */ fmuls f0, f0, f31
/* 00001E08 EC01002A */ fadds f0, f1, f0
/* 00001E0C D0010030 */ stfs f0, 0x30(r1)
/* 00001E10 C0210028 */ lfs f1, 0x28(r1)
/* 00001E14 C0180058 */ lfs f0, 0x58(r24)
/* 00001E18 C041002C */ lfs f2, 0x2c(r1)
/* 00001E1C EC010028 */ fsubs f0, f1, f0
/* 00001E20 C0210030 */ lfs f1, 0x30(r1)
/* 00001E24 D0010010 */ stfs f0, 0x10(r1)
/* 00001E28 C018005C */ lfs f0, 0x5c(r24)
/* 00001E2C EC020028 */ fsubs f0, f2, f0
/* 00001E30 D0010014 */ stfs f0, 0x14(r1)
/* 00001E34 C0180060 */ lfs f0, 0x60(r24)
/* 00001E38 EC010028 */ fsubs f0, f1, f0
/* 00001E3C D0010018 */ stfs f0, 0x18(r1)
/* 00001E40 C0250000 */ lfs f1, 0(r5)
/* 00001E44 4BFFE321 */ bl mathutil_vec_set_len
/* 00001E48 C0380064 */ lfs f1, 0x64(r24)
/* 00001E4C 3CA00000 */ lis r5, playerCharacterSelection@ha
/* 00001E50 C0010010 */ lfs f0, 0x10(r1)
/* 00001E54 38050000 */ addi r0, r5, playerCharacterSelection@l
/* 00001E58 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00001E5C EC01002A */ fadds f0, f1, f0
/* 00001E60 3C600000 */ lis r3, u_somePlayerId@ha
/* 00001E64 D0180064 */ stfs f0, 0x64(r24)
/* 00001E68 C0380068 */ lfs f1, 0x68(r24)
/* 00001E6C C0010014 */ lfs f0, 0x14(r1)
/* 00001E70 EC01002A */ fadds f0, f1, f0
/* 00001E74 D0180068 */ stfs f0, 0x68(r24)
/* 00001E78 C038006C */ lfs f1, 0x6c(r24)
/* 00001E7C C0010018 */ lfs f0, 0x18(r1)
/* 00001E80 EC01002A */ fadds f0, f1, f0
/* 00001E84 D018006C */ stfs f0, 0x6c(r24)
/* 00001E88 80B90000 */ lwz r5, 0(r25)
/* 00001E8C 54A5103A */ slwi r5, r5, 2
/* 00001E90 7CA02A14 */ add r5, r0, r5
/* 00001E94 80050000 */ lwz r0, 0(r5)
/* 00001E98 90040000 */ stw r0, lbl_802F1DFC@l(r4)
/* 00001E9C 80190000 */ lwz r0, 0(r25)
/* 00001EA0 90030000 */ stw r0, u_somePlayerId@l(r3)
/* 00001EA4 A8190014 */ lha r0, 0x14(r25)
/* 00001EA8 2C000000 */ cmpwi r0, 0
/* 00001EAC 40810014 */ ble lbl_00001EC0
/* 00001EB0 38600104 */ li r3, 0x104
/* 00001EB4 4BFFE2B1 */ bl u_play_sound_1_dupe
/* 00001EB8 9079002C */ stw r3, 0x2c(r25)
/* 00001EBC 48000014 */ b lbl_00001ED0
lbl_00001EC0:
/* 00001EC0 38600106 */ li r3, 0x106
/* 00001EC4 4BFFE2A1 */ bl u_play_sound_0
/* 00001EC8 3800FFFF */ li r0, -1
/* 00001ECC 9019002C */ stw r0, 0x2c(r25)
lbl_00001ED0:
/* 00001ED0 801E0094 */ lwz r0, 0x94(r30)
/* 00001ED4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001ED8 41820038 */ beq lbl_00001F10
/* 00001EDC 3C600000 */ lis r3, lbl_802F1E6C@ha
/* 00001EE0 C03E001C */ lfs f1, 0x1c(r30)
/* 00001EE4 C4030000 */ lfsu f0, lbl_802F1E6C@l(r3)
/* 00001EE8 EC010032 */ fmuls f0, f1, f0
/* 00001EEC D01E001C */ stfs f0, 0x1c(r30)
/* 00001EF0 C03E0020 */ lfs f1, 0x20(r30)
/* 00001EF4 C0030000 */ lfs f0, 0(r3)
/* 00001EF8 EC010032 */ fmuls f0, f1, f0
/* 00001EFC D01E0020 */ stfs f0, 0x20(r30)
/* 00001F00 C03E0024 */ lfs f1, 0x24(r30)
/* 00001F04 C0030000 */ lfs f0, 0(r3)
/* 00001F08 EC010032 */ fmuls f0, f1, f0
/* 00001F0C D01E0024 */ stfs f0, 0x24(r30)
lbl_00001F10:
/* 00001F10 C01800B4 */ lfs f0, 0xb4(r24)
/* 00001F14 C03E0004 */ lfs f1, 4(r30)
/* 00001F18 EC0007B2 */ fmuls f0, f0, f30
/* 00001F1C EC01002A */ fadds f0, f1, f0
/* 00001F20 D0010028 */ stfs f0, 0x28(r1)
/* 00001F24 C01800B8 */ lfs f0, 0xb8(r24)
/* 00001F28 C03E0008 */ lfs f1, 8(r30)
/* 00001F2C EC0007B2 */ fmuls f0, f0, f30
/* 00001F30 EC01002A */ fadds f0, f1, f0
/* 00001F34 D001002C */ stfs f0, 0x2c(r1)
/* 00001F38 C01800BC */ lfs f0, 0xbc(r24)
/* 00001F3C C03E000C */ lfs f1, 0xc(r30)
/* 00001F40 EC0007B2 */ fmuls f0, f0, f30
/* 00001F44 EC01002A */ fadds f0, f1, f0
/* 00001F48 D0010030 */ stfs f0, 0x30(r1)
/* 00001F4C A878000E */ lha r3, 0xe(r24)
/* 00001F50 3803FFFF */ addi r0, r3, -1
/* 00001F54 B018000E */ sth r0, 0xe(r24)
/* 00001F58 A818000E */ lha r0, 0xe(r24)
/* 00001F5C 2C000000 */ cmpwi r0, 0
/* 00001F60 4080002C */ bge lbl_00001F8C
/* 00001F64 38000008 */ li r0, 8
/* 00001F68 B018000C */ sth r0, 0xc(r24)
/* 00001F6C 80190028 */ lwz r0, 0x28(r25)
/* 00001F70 2C000000 */ cmpwi r0, 0
/* 00001F74 4180000C */ blt lbl_00001F80
/* 00001F78 5403043E */ clrlwi r3, r0, 0x10
/* 00001F7C 4BFFE1E9 */ bl SoundOff
lbl_00001F80:
/* 00001F80 38600107 */ li r3, 0x107
/* 00001F84 4BFFE1E1 */ bl u_play_sound_1_dupe
/* 00001F88 90790028 */ stw r3, 0x28(r25)
lbl_00001F8C:
/* 00001F8C 2C1D0000 */ cmpwi r29, 0
/* 00001F90 41820018 */ beq lbl_00001FA8
/* 00001F94 8079001C */ lwz r3, 0x1c(r25)
/* 00001F98 546007FF */ clrlwi. r0, r3, 0x1f
/* 00001F9C 4082000C */ bne lbl_00001FA8
/* 00001FA0 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00001FA4 4082019C */ bne lbl_00002140
lbl_00001FA8:
/* 00001FA8 38000000 */ li r0, 0
/* 00001FAC B018000C */ sth r0, 0xc(r24)
/* 00001FB0 3800FFF6 */ li r0, -10
/* 00001FB4 8079001C */ lwz r3, 0x1c(r25)
/* 00001FB8 7C600038 */ and r0, r3, r0
/* 00001FBC 9019001C */ stw r0, 0x1c(r25)
/* 00001FC0 80190028 */ lwz r0, 0x28(r25)
/* 00001FC4 2C000000 */ cmpwi r0, 0
/* 00001FC8 41800178 */ blt lbl_00002140
/* 00001FCC 5403043E */ clrlwi r3, r0, 0x10
/* 00001FD0 4BFFE195 */ bl SoundOff
/* 00001FD4 3800FFFF */ li r0, -1
/* 00001FD8 90190028 */ stw r0, 0x28(r25)
/* 00001FDC 48000164 */ b lbl_00002140
lbl_00001FE0:
/* 00001FE0 801E0094 */ lwz r0, 0x94(r30)
/* 00001FE4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00001FE8 41820038 */ beq lbl_00002020
/* 00001FEC 3C600000 */ lis r3, lbl_802F1E6C@ha
/* 00001FF0 C03E001C */ lfs f1, 0x1c(r30)
/* 00001FF4 C4030000 */ lfsu f0, lbl_802F1E6C@l(r3)
/* 00001FF8 EC010032 */ fmuls f0, f1, f0
/* 00001FFC D01E001C */ stfs f0, 0x1c(r30)
/* 00002000 C03E0020 */ lfs f1, 0x20(r30)
/* 00002004 C0030000 */ lfs f0, 0(r3)
/* 00002008 EC010032 */ fmuls f0, f1, f0
/* 0000200C D01E0020 */ stfs f0, 0x20(r30)
/* 00002010 C03E0024 */ lfs f1, 0x24(r30)
/* 00002014 C0030000 */ lfs f0, 0(r3)
/* 00002018 EC010032 */ fmuls f0, f1, f0
/* 0000201C D01E0024 */ stfs f0, 0x24(r30)
lbl_00002020:
/* 00002020 C3BF0050 */ lfs f29, 0x50(r31)
/* 00002024 38600E38 */ li r3, 0xe38
/* 00002028 4BFFE13D */ bl mathutil_mtxA_from_rotate_y
/* 0000202C 387800B4 */ addi r3, r24, 0xb4
/* 00002030 38830000 */ addi r4, r3, 0
/* 00002034 4BFFE131 */ bl mathutil_mtxA_tf_vec
/* 00002038 387800B4 */ addi r3, r24, 0xb4
/* 0000203C 4BFFE129 */ bl mathutil_vec_normalize_len
/* 00002040 C01800B4 */ lfs f0, 0xb4(r24)
/* 00002044 C03F0084 */ lfs f1, 0x84(r31)
/* 00002048 EC0007B2 */ fmuls f0, f0, f30
/* 0000204C C05E0004 */ lfs f2, 4(r30)
/* 00002050 EC010032 */ fmuls f0, f1, f0
/* 00002054 EC02002A */ fadds f0, f2, f0
/* 00002058 D0010028 */ stfs f0, 0x28(r1)
/* 0000205C C01800B8 */ lfs f0, 0xb8(r24)
/* 00002060 C03F0084 */ lfs f1, 0x84(r31)
/* 00002064 EC0007B2 */ fmuls f0, f0, f30
/* 00002068 C05E0008 */ lfs f2, 8(r30)
/* 0000206C EC010032 */ fmuls f0, f1, f0
/* 00002070 EC02002A */ fadds f0, f2, f0
/* 00002074 D001002C */ stfs f0, 0x2c(r1)
/* 00002078 C01800BC */ lfs f0, 0xbc(r24)
/* 0000207C C03F0084 */ lfs f1, 0x84(r31)
/* 00002080 EC0007B2 */ fmuls f0, f0, f30
/* 00002084 C05E000C */ lfs f2, 0xc(r30)
/* 00002088 EC010032 */ fmuls f0, f1, f0
/* 0000208C EC02002A */ fadds f0, f2, f0
/* 00002090 D0010030 */ stfs f0, 0x30(r1)
/* 00002094 80190028 */ lwz r0, 0x28(r25)
/* 00002098 2C00FFFF */ cmpwi r0, -1
/* 0000209C 41820054 */ beq lbl_000020F0
/* 000020A0 3C600000 */ lis r3, globalAnimTimer@ha
/* 000020A4 38830000 */ addi r4, r3, globalAnimTimer@l
/* 000020A8 3C60CCCD */ lis r3, 0xcccd
/* 000020AC 80840000 */ lwz r4, 0(r4)
/* 000020B0 3803CCCD */ addi r0, r3, -13107
/* 000020B4 7C002016 */ mulhwu r0, r0, r4
/* 000020B8 5400F0BE */ srwi r0, r0, 2
/* 000020BC 1C000005 */ mulli r0, r0, 5
/* 000020C0 7C002051 */ subf. r0, r0, r4
/* 000020C4 4082002C */ bne lbl_000020F0
/* 000020C8 38810028 */ addi r4, r1, 0x28
/* 000020CC 38A1000D */ addi r5, r1, 0xd
/* 000020D0 38C1000C */ addi r6, r1, 0xc
/* 000020D4 38600000 */ li r3, 0
/* 000020D8 4BFFE08D */ bl func_8002B634
/* 000020DC 80190028 */ lwz r0, 0x28(r25)
/* 000020E0 8881000D */ lbz r4, 0xd(r1)
/* 000020E4 88A1000C */ lbz r5, 0xc(r1)
/* 000020E8 5403043E */ clrlwi r3, r0, 0x10
/* 000020EC 4BFFE079 */ bl SoundPan
lbl_000020F0:
/* 000020F0 2C1D0000 */ cmpwi r29, 0
/* 000020F4 41820018 */ beq lbl_0000210C
/* 000020F8 8079001C */ lwz r3, 0x1c(r25)
/* 000020FC 546007FF */ clrlwi. r0, r3, 0x1f
/* 00002100 4082000C */ bne lbl_0000210C
/* 00002104 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00002108 40820038 */ bne lbl_00002140
lbl_0000210C:
/* 0000210C 38000000 */ li r0, 0
/* 00002110 B018000C */ sth r0, 0xc(r24)
/* 00002114 3800FFF6 */ li r0, -10
/* 00002118 8079001C */ lwz r3, 0x1c(r25)
/* 0000211C 7C600038 */ and r0, r3, r0
/* 00002120 9019001C */ stw r0, 0x1c(r25)
/* 00002124 80190028 */ lwz r0, 0x28(r25)
/* 00002128 2C000000 */ cmpwi r0, 0
/* 0000212C 41800014 */ blt lbl_00002140
/* 00002130 5403043E */ clrlwi r3, r0, 0x10
/* 00002134 4BFFE031 */ bl SoundOff
/* 00002138 3800FFFF */ li r0, -1
/* 0000213C 90190028 */ stw r0, 0x28(r25)
lbl_00002140:
/* 00002140 8079001C */ lwz r3, 0x1c(r25)
/* 00002144 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00002148 41820068 */ beq lbl_000021B0
/* 0000214C 546007FA */ rlwinm r0, r3, 0, 0x1f, 0x1d
/* 00002150 9019001C */ stw r0, 0x1c(r25)
/* 00002154 38790000 */ addi r3, r25, 0
/* 00002158 389E0004 */ addi r4, r30, 4
/* 0000215C C01F0008 */ lfs f0, 8(r31)
/* 00002160 38B80058 */ addi r5, r24, 0x58
/* 00002164 D0180064 */ stfs f0, 0x64(r24)
/* 00002168 C01F0008 */ lfs f0, 8(r31)
/* 0000216C D0180068 */ stfs f0, 0x68(r24)
/* 00002170 C01F0008 */ lfs f0, 8(r31)
/* 00002174 D018006C */ stfs f0, 0x6c(r24)
/* 00002178 80C10028 */ lwz r6, 0x28(r1)
/* 0000217C 8001002C */ lwz r0, 0x2c(r1)
/* 00002180 90D80058 */ stw r6, 0x58(r24)
/* 00002184 9018005C */ stw r0, 0x5c(r24)
/* 00002188 80010030 */ lwz r0, 0x30(r1)
/* 0000218C 90180060 */ stw r0, 0x60(r24)
/* 00002190 80D80058 */ lwz r6, 0x58(r24)
/* 00002194 8018005C */ lwz r0, 0x5c(r24)
/* 00002198 90D8007C */ stw r6, 0x7c(r24)
/* 0000219C 90180080 */ stw r0, 0x80(r24)
/* 000021A0 80180060 */ lwz r0, 0x60(r24)
/* 000021A4 90180084 */ stw r0, 0x84(r24)
/* 000021A8 48001205 */ bl lbl_000033AC
/* 000021AC 480000C0 */ b lbl_0000226C
lbl_000021B0:
/* 000021B0 C0380064 */ lfs f1, 0x64(r24)
/* 000021B4 C01F0088 */ lfs f0, 0x88(r31)
/* 000021B8 EC010032 */ fmuls f0, f1, f0
/* 000021BC D0180064 */ stfs f0, 0x64(r24)
/* 000021C0 C0380068 */ lfs f1, 0x68(r24)
/* 000021C4 C01F0088 */ lfs f0, 0x88(r31)
/* 000021C8 EC010032 */ fmuls f0, f1, f0
/* 000021CC D0180068 */ stfs f0, 0x68(r24)
/* 000021D0 C038006C */ lfs f1, 0x6c(r24)
/* 000021D4 C01F0088 */ lfs f0, 0x88(r31)
/* 000021D8 EC010032 */ fmuls f0, f1, f0
/* 000021DC D018006C */ stfs f0, 0x6c(r24)
/* 000021E0 C0210028 */ lfs f1, 0x28(r1)
/* 000021E4 C0180058 */ lfs f0, 0x58(r24)
/* 000021E8 C0580064 */ lfs f2, 0x64(r24)
/* 000021EC EC010028 */ fsubs f0, f1, f0
/* 000021F0 EC1D0032 */ fmuls f0, f29, f0
/* 000021F4 EC02002A */ fadds f0, f2, f0
/* 000021F8 D0180064 */ stfs f0, 0x64(r24)
/* 000021FC C041002C */ lfs f2, 0x2c(r1)
/* 00002200 C03F0044 */ lfs f1, 0x44(r31)
/* 00002204 C018005C */ lfs f0, 0x5c(r24)
/* 00002208 EC220828 */ fsubs f1, f2, f1
/* 0000220C C0580068 */ lfs f2, 0x68(r24)
/* 00002210 EC010028 */ fsubs f0, f1, f0
/* 00002214 EC1D0032 */ fmuls f0, f29, f0
/* 00002218 EC02002A */ fadds f0, f2, f0
/* 0000221C D0180068 */ stfs f0, 0x68(r24)
/* 00002220 C0210030 */ lfs f1, 0x30(r1)
/* 00002224 C0180060 */ lfs f0, 0x60(r24)
/* 00002228 C058006C */ lfs f2, 0x6c(r24)
/* 0000222C EC010028 */ fsubs f0, f1, f0
/* 00002230 EC1D0032 */ fmuls f0, f29, f0
/* 00002234 EC02002A */ fadds f0, f2, f0
/* 00002238 D018006C */ stfs f0, 0x6c(r24)
/* 0000223C C0380058 */ lfs f1, 0x58(r24)
/* 00002240 C0180064 */ lfs f0, 0x64(r24)
/* 00002244 EC01002A */ fadds f0, f1, f0
/* 00002248 D0180058 */ stfs f0, 0x58(r24)
/* 0000224C C038005C */ lfs f1, 0x5c(r24)
/* 00002250 C0180068 */ lfs f0, 0x68(r24)
/* 00002254 EC01002A */ fadds f0, f1, f0
/* 00002258 D018005C */ stfs f0, 0x5c(r24)
/* 0000225C C0380060 */ lfs f1, 0x60(r24)
/* 00002260 C018006C */ lfs f0, 0x6c(r24)
/* 00002264 EC01002A */ fadds f0, f1, f0
/* 00002268 D0180060 */ stfs f0, 0x60(r24)
lbl_0000226C:
/* 0000226C C0380058 */ lfs f1, 0x58(r24)
/* 00002270 38610010 */ addi r3, r1, 0x10
/* 00002274 C01E0004 */ lfs f0, 4(r30)
/* 00002278 38980070 */ addi r4, r24, 0x70
/* 0000227C 38B80072 */ addi r5, r24, 0x72
/* 00002280 EC010028 */ fsubs f0, f1, f0
/* 00002284 D0010010 */ stfs f0, 0x10(r1)
/* 00002288 C038005C */ lfs f1, 0x5c(r24)
/* 0000228C C01E0008 */ lfs f0, 8(r30)
/* 00002290 EC010028 */ fsubs f0, f1, f0
/* 00002294 D0010014 */ stfs f0, 0x14(r1)
/* 00002298 C0380060 */ lfs f1, 0x60(r24)
/* 0000229C C01E000C */ lfs f0, 0xc(r30)
/* 000022A0 EC010028 */ fsubs f0, f1, f0
/* 000022A4 D0010018 */ stfs f0, 0x18(r1)
/* 000022A8 4BFFDEBD */ bl mathutil_vec_to_euler_xy
/* 000022AC 38990004 */ addi r4, r25, 4
/* 000022B0 A8790004 */ lha r3, 4(r25)
/* 000022B4 2C030000 */ cmpwi r3, 0
/* 000022B8 4081000C */ ble lbl_000022C4
/* 000022BC 3803FFFF */ addi r0, r3, -1
/* 000022C0 B0040000 */ sth r0, 0(r4)
lbl_000022C4:
/* 000022C4 AC640002 */ lhau r3, 2(r4)
/* 000022C8 2C030000 */ cmpwi r3, 0
/* 000022CC 4081000C */ ble lbl_000022D8
/* 000022D0 3803FFFF */ addi r0, r3, -1
/* 000022D4 B0040000 */ sth r0, 0(r4)
lbl_000022D8:
/* 000022D8 AC640002 */ lhau r3, 2(r4)
/* 000022DC 2C030000 */ cmpwi r3, 0
/* 000022E0 4081000C */ ble lbl_000022EC
/* 000022E4 3803FFFF */ addi r0, r3, -1
/* 000022E8 B0040000 */ sth r0, 0(r4)
lbl_000022EC:
/* 000022EC AC640002 */ lhau r3, 2(r4)
/* 000022F0 2C030000 */ cmpwi r3, 0
/* 000022F4 4081000C */ ble lbl_00002300
/* 000022F8 3803FFFF */ addi r0, r3, -1
/* 000022FC B0040000 */ sth r0, 0(r4)
lbl_00002300:
/* 00002300 A879000C */ lha r3, 0xc(r25)
/* 00002304 2C030000 */ cmpwi r3, 0
/* 00002308 4182000C */ beq lbl_00002314
/* 0000230C 3803FFFF */ addi r0, r3, -1
/* 00002310 B019000C */ sth r0, 0xc(r25)
lbl_00002314:
/* 00002314 A8790016 */ lha r3, 0x16(r25)
/* 00002318 2C030000 */ cmpwi r3, 0
/* 0000231C 4081000C */ ble lbl_00002328
/* 00002320 3803FFFF */ addi r0, r3, -1
/* 00002324 B0190016 */ sth r0, 0x16(r25)
lbl_00002328:
/* 00002328 80790030 */ lwz r3, 0x30(r25)
/* 0000232C 2C030000 */ cmpwi r3, 0
/* 00002330 40810044 */ ble lbl_00002374
/* 00002334 3803FFFF */ addi r0, r3, -1
/* 00002338 90190030 */ stw r0, 0x30(r25)
/* 0000233C 80190030 */ lwz r0, 0x30(r25)
/* 00002340 2C000000 */ cmpwi r0, 0
/* 00002344 40820030 */ bne lbl_00002374
/* 00002348 8019002C */ lwz r0, 0x2c(r25)
/* 0000234C 2C000000 */ cmpwi r0, 0
/* 00002350 41800024 */ blt lbl_00002374
/* 00002354 3C600000 */ lis r3, currentBall@ha
/* 00002358 3B430000 */ addi r26, r3, currentBall@l
/* 0000235C 837A0000 */ lwz r27, 0(r26)
/* 00002360 5403043E */ clrlwi r3, r0, 0x10
/* 00002364 4BFFDE01 */ bl SoundOff
/* 00002368 3800FFFF */ li r0, -1
/* 0000236C 9019002C */ stw r0, 0x2c(r25)
/* 00002370 937A0000 */ stw r27, 0(r26)
lbl_00002374:
/* 00002374 7F03C378 */ mr r3, r24
/* 00002378 48002121 */ bl lbl_00004498
/* 0000237C 3C600000 */ lis r3, cameraInfo@ha
/* 00002380 38630000 */ addi r3, r3, cameraInfo@l
/* 00002384 8803001F */ lbz r0, 0x1f(r3)
/* 00002388 2C000003 */ cmpwi r0, 3
/* 0000238C 4082000C */ bne lbl_00002398
/* 00002390 7F03C378 */ mr r3, r24
/* 00002394 48001A4D */ bl lbl_00003DE0
lbl_00002398:
/* 00002398 801E0094 */ lwz r0, 0x94(r30)
/* 0000239C 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 000023A0 4082000C */ bne lbl_000023AC
/* 000023A4 7F03C378 */ mr r3, r24
/* 000023A8 48000F11 */ bl lbl_000032B8
lbl_000023AC:
/* 000023AC A8790020 */ lha r3, 0x20(r25)
/* 000023B0 2C030000 */ cmpwi r3, 0
/* 000023B4 41820054 */ beq lbl_00002408
/* 000023B8 3803FFFF */ addi r0, r3, -1
/* 000023BC B0190020 */ sth r0, 0x20(r25)
/* 000023C0 A8190020 */ lha r0, 0x20(r25)
/* 000023C4 2C000000 */ cmpwi r0, 0
/* 000023C8 40820040 */ bne lbl_00002408
/* 000023CC 80190000 */ lwz r0, 0(r25)
/* 000023D0 3C800000 */ lis r4, playerCharacterSelection@ha
/* 000023D4 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 000023D8 5405103A */ slwi r5, r0, 2
/* 000023DC 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000023E0 7C802A14 */ add r4, r0, r5
/* 000023E4 80040000 */ lwz r0, 0(r4)
/* 000023E8 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 000023EC 3C600000 */ lis r3, u_somePlayerId@ha
/* 000023F0 90040000 */ stw r0, 0(r4)
/* 000023F4 38830000 */ addi r4, r3, u_somePlayerId@l
/* 000023F8 38600108 */ li r3, 0x108
/* 000023FC 80190000 */ lwz r0, 0(r25)
/* 00002400 90040000 */ stw r0, 0(r4)
/* 00002404 4BFFDD61 */ bl u_play_sound_0
lbl_00002408:
/* 00002408 C03800B4 */ lfs f1, 0xb4(r24)
/* 0000240C 38780058 */ addi r3, r24, 0x58
/* 00002410 C01E0068 */ lfs f0, 0x68(r30)
/* 00002414 C05E0004 */ lfs f2, 4(r30)
/* 00002418 EC010032 */ fmuls f0, f1, f0
/* 0000241C EC02002A */ fadds f0, f2, f0
/* 00002420 D0010010 */ stfs f0, 0x10(r1)
/* 00002424 C03800B8 */ lfs f1, 0xb8(r24)
/* 00002428 C01E0068 */ lfs f0, 0x68(r30)
/* 0000242C C05E0008 */ lfs f2, 8(r30)
/* 00002430 EC210032 */ fmuls f1, f1, f0
/* 00002434 C01F0044 */ lfs f0, 0x44(r31)
/* 00002438 EC22082A */ fadds f1, f2, f1
/* 0000243C EC010028 */ fsubs f0, f1, f0
/* 00002440 D0010014 */ stfs f0, 0x14(r1)
/* 00002444 C03800BC */ lfs f1, 0xbc(r24)
/* 00002448 C01E0068 */ lfs f0, 0x68(r30)
/* 0000244C C05E000C */ lfs f2, 0xc(r30)
/* 00002450 EC010032 */ fmuls f0, f1, f0
/* 00002454 EC02002A */ fadds f0, f2, f0
/* 00002458 D0010018 */ stfs f0, 0x18(r1)
/* 0000245C 4BFFDD09 */ bl mathutil_mtxA_from_translate
/* 00002460 A8780072 */ lha r3, 0x72(r24)
/* 00002464 4BFFDD01 */ bl mathutil_mtxA_rotate_y
/* 00002468 A8780070 */ lha r3, 0x70(r24)
/* 0000246C 4BFFDCF9 */ bl mathutil_mtxA_rotate_x
/* 00002470 C03F0008 */ lfs f1, 8(r31)
/* 00002474 38610028 */ addi r3, r1, 0x28
/* 00002478 C07F008C */ lfs f3, 0x8c(r31)
/* 0000247C FC400890 */ fmr f2, f1
/* 00002480 4BFFDCE5 */ bl mathutil_mtxA_tf_point_xyz
/* 00002484 3C600000 */ lis r3, mathutilData@ha
/* 00002488 39230000 */ addi r9, r3, mathutilData@l
/* 0000248C 80A90000 */ lwz r5, 0(r9)
/* 00002490 38790000 */ addi r3, r25, 0
/* 00002494 38810010 */ addi r4, r1, 0x10
/* 00002498 C0050008 */ lfs f0, 8(r5)
/* 0000249C 38B800B4 */ addi r5, r24, 0xb4
/* 000024A0 38C10028 */ addi r6, r1, 0x28
/* 000024A4 FC000050 */ fneg f0, f0
/* 000024A8 38E1001C */ addi r7, r1, 0x1c
/* 000024AC D001001C */ stfs f0, 0x1c(r1)
/* 000024B0 81090000 */ lwz r8, 0(r9)
/* 000024B4 C0080018 */ lfs f0, 0x18(r8)
/* 000024B8 FC000050 */ fneg f0, f0
/* 000024BC D0010020 */ stfs f0, 0x20(r1)
/* 000024C0 81090000 */ lwz r8, 0(r9)
/* 000024C4 C0080028 */ lfs f0, 0x28(r8)
/* 000024C8 FC000050 */ fneg f0, f0
/* 000024CC D0010024 */ stfs f0, 0x24(r1)
/* 000024D0 4800104D */ bl lbl_0000351C
/* 000024D4 BB010048 */ lmw r24, 0x48(r1)
/* 000024D8 80010084 */ lwz r0, 0x84(r1)
/* 000024DC CBE10078 */ lfd f31, 0x78(r1)
/* 000024E0 CBC10070 */ lfd f30, 0x70(r1)
/* 000024E4 7C0803A6 */ mtlr r0
/* 000024E8 CBA10068 */ lfd f29, 0x68(r1)
/* 000024EC 38210080 */ addi r1, r1, 0x80
/* 000024F0 4E800020 */ blr 
