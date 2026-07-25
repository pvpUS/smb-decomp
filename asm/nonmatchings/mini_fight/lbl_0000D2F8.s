/* 0000D2F8 7C0802A6 */ mflr r0
/* 0000D2FC 3C600000 */ lis r3, currentCamera@ha
/* 0000D300 90010004 */ stw r0, 4(r1)
/* 0000D304 3C800000 */ lis r4, lbl_801B7CF8@ha
/* 0000D308 3CC00000 */ lis r6, u_cameraId1@ha
/* 0000D30C 9421FF60 */ stwu r1, -0xa0(r1)
/* 0000D310 DBE10098 */ stfd f31, 0x98(r1)
/* 0000D314 DBC10090 */ stfd f30, 0x90(r1)
/* 0000D318 DBA10088 */ stfd f29, 0x88(r1)
/* 0000D31C BE21004C */ stmw r17, 0x4c(r1)
/* 0000D320 3B210024 */ addi r25, r1, 0x24
/* 0000D324 3BE40000 */ addi r31, r4, lbl_801B7CF8@l
/* 0000D328 3B860000 */ addi r28, r6, u_cameraId1@l
/* 0000D32C 3FC04330 */ lis r30, 0x4330
/* 0000D330 80A30000 */ lwz r5, currentCamera@l(r3)
/* 0000D334 3C600000 */ lis r3, lbl_0001C238@ha
/* 0000D338 3B630000 */ addi r27, r3, lbl_0001C238@l
/* 0000D33C C03B0000 */ lfs f1, 0(r27)
/* 0000D340 3C600000 */ lis r3, g_poolInfo@ha
/* 0000D344 C0050034 */ lfs f0, 0x34(r5)
/* 0000D348 38E30000 */ addi r7, r3, g_poolInfo@l
/* 0000D34C 3C600000 */ lis r3, lbl_10017520@ha
/* 0000D350 EFA10024 */ fdivs f29, f1, f0
/* 0000D354 3B430000 */ addi r26, r3, lbl_10017520@l
/* 0000D358 3C600000 */ lis r3, ballInfo@ha
/* 0000D35C C3C5003C */ lfs f30, 0x3c(r5)
/* 0000D360 38030000 */ addi r0, r3, ballInfo@l
/* 0000D364 3C600000 */ lis r3, mathutilData@ha
/* 0000D368 82E7000C */ lwz r23, 0xc(r7)
/* 0000D36C 3CA00000 */ lis r5, lbl_0001DB4C@ha
/* 0000D370 82C70008 */ lwz r22, 8(r7)
/* 0000D374 7C180378 */ mr r24, r0
/* 0000D378 3A7A014C */ addi r19, r26, 0x14c
/* 0000D37C 3ABA0894 */ addi r21, r26, 0x894
/* 0000D380 3A9A0058 */ addi r20, r26, 0x58
/* 0000D384 3A230000 */ addi r17, r3, mathutilData@l
/* 0000D388 3BA50000 */ addi r29, r5, lbl_0001DB4C@l
/* 0000D38C 480004DC */ b lbl_0000D868
lbl_0000D390:
/* 0000D390 88170000 */ lbz r0, 0(r23)
/* 0000D394 2C000002 */ cmpwi r0, 2
/* 0000D398 408204B8 */ bne lbl_0000D850
/* 0000D39C 80180094 */ lwz r0, 0x94(r24)
/* 0000D3A0 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000D3A4 408204AC */ bne lbl_0000D850
/* 0000D3A8 C0340004 */ lfs f1, 4(r20)
/* 0000D3AC C01B000C */ lfs f0, 0xc(r27)
/* 0000D3B0 FC010040 */ fcmpo cr0, f1, f0
/* 0000D3B4 4C401382 */ cror 2, 0, 2
/* 0000D3B8 41820498 */ beq lbl_0000D850
/* 0000D3BC 38780004 */ addi r3, r24, 4
/* 0000D3C0 4BFF2DA5 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000D3C4 4BFF2DA1 */ bl mathutil_mtxA_sq_from_identity
/* 0000D3C8 C03B000C */ lfs f1, 0xc(r27)
/* 0000D3CC C05B0084 */ lfs f2, 0x84(r27)
/* 0000D3D0 C0180068 */ lfs f0, 0x68(r24)
/* 0000D3D4 FC600890 */ fmr f3, f1
/* 0000D3D8 EC42002A */ fadds f2, f2, f0
/* 0000D3DC 4BFF2D89 */ bl mathutil_mtxA_translate_xyz
/* 0000D3E0 38990004 */ addi r4, r25, 4
/* 0000D3E4 38790008 */ addi r3, r25, 8
/* 0000D3E8 3CA0E000 */ lis r5, 0xe000
/* 0000D3EC C045000C */ lfs f2, 0xc(r5)
/* 0000D3F0 C025001C */ lfs f1, 0x1c(r5)
/* 0000D3F4 C005002C */ lfs f0, 0x2c(r5)
/* 0000D3F8 D0410024 */ stfs f2, 0x24(r1)
/* 0000D3FC D0240000 */ stfs f1, 0(r4)
/* 0000D400 D0030000 */ stfs f0, 0(r3)
/* 0000D404 C041002C */ lfs f2, 0x2c(r1)
/* 0000D408 C01B000C */ lfs f0, 0xc(r27)
/* 0000D40C FC020040 */ fcmpo cr0, f2, f0
/* 0000D410 40800440 */ bge lbl_0000D850
/* 0000D414 C01B0040 */ lfs f0, 0x40(r27)
/* 0000D418 C0210024 */ lfs f1, 0x24(r1)
/* 0000D41C EC601024 */ fdivs f3, f0, f2
/* 0000D420 C0010028 */ lfs f0, 0x28(r1)
/* 0000D424 EC2107B2 */ fmuls f1, f1, f30
/* 0000D428 EC0007B2 */ fmuls f0, f0, f30
/* 0000D42C EC230072 */ fmuls f1, f3, f1
/* 0000D430 EC030032 */ fmuls f0, f3, f0
/* 0000D434 EC3D0072 */ fmuls f1, f29, f1
/* 0000D438 D0210018 */ stfs f1, 0x18(r1)
/* 0000D43C D001001C */ stfs f0, 0x1c(r1)
/* 0000D440 C0210018 */ lfs f1, 0x18(r1)
/* 0000D444 C001001C */ lfs f0, 0x1c(r1)
/* 0000D448 FC200A10 */ fabs f1, f1
/* 0000D44C FC000210 */ fabs f0, f0
/* 0000D450 FC010040 */ fcmpo cr0, f1, f0
/* 0000D454 40810008 */ ble lbl_0000D45C
/* 0000D458 48000008 */ b lbl_0000D460
lbl_0000D45C:
/* 0000D45C FC200090 */ fmr f1, f0
lbl_0000D460:
/* 0000D460 FC600818 */ frsp f3, f1
/* 0000D464 C01B001C */ lfs f0, 0x1c(r27)
/* 0000D468 FC030040 */ fcmpo cr0, f3, f0
/* 0000D46C 408100A4 */ ble lbl_0000D510
/* 0000D470 EC601824 */ fdivs f3, f0, f3
/* 0000D474 C0010024 */ lfs f0, 0x24(r1)
/* 0000D478 EC0000F2 */ fmuls f0, f0, f3
/* 0000D47C D0010024 */ stfs f0, 0x24(r1)
/* 0000D480 C0010028 */ lfs f0, 0x28(r1)
/* 0000D484 EC0000F2 */ fmuls f0, f0, f3
/* 0000D488 D0010028 */ stfs f0, 0x28(r1)
/* 0000D48C C03B0084 */ lfs f1, 0x84(r27)
/* 0000D490 C0180068 */ lfs f0, 0x68(r24)
/* 0000D494 801C0000 */ lwz r0, 0(r28)
/* 0000D498 EC01002A */ fadds f0, f1, f0
/* 0000D49C C0210028 */ lfs f1, 0x28(r1)
/* 0000D4A0 5400103A */ slwi r0, r0, 2
/* 0000D4A4 C0410024 */ lfs f2, 0x24(r1)
/* 0000D4A8 7C740214 */ add r3, r20, r0
/* 0000D4AC EC0000F2 */ fmuls f0, f0, f3
/* 0000D4B0 82430020 */ lwz r18, 0x20(r3)
/* 0000D4B4 EC210028 */ fsubs f1, f1, f0
/* 0000D4B8 4BFF2CAD */ bl mathutil_atan2
/* 0000D4BC 7C630734 */ extsh r3, r3
/* 0000D4C0 38834000 */ addi r4, r3, 0x4000
/* 0000D4C4 38048000 */ addi r0, r4, -32768
/* 0000D4C8 48000008 */ b lbl_0000D4D0
lbl_0000D4CC:
/* 0000D4CC 3E520001 */ addis r18, r18, 1
lbl_0000D4D0:
/* 0000D4D0 7C120000 */ cmpw r18, r0
/* 0000D4D4 4180FFF8 */ blt lbl_0000D4CC
/* 0000D4D8 3C640001 */ addis r3, r4, 1
/* 0000D4DC 38038000 */ addi r0, r3, -32768
/* 0000D4E0 48000008 */ b lbl_0000D4E8
lbl_0000D4E4:
/* 0000D4E4 3E52FFFF */ addis r18, r18, 0xffff
lbl_0000D4E8:
/* 0000D4E8 7C120000 */ cmpw r18, r0
/* 0000D4EC 4181FFF8 */ bgt lbl_0000D4E4
/* 0000D4F0 801C0000 */ lwz r0, 0(r28)
/* 0000D4F4 7C722050 */ subf r3, r18, r4
/* 0000D4F8 7C632670 */ srawi r3, r3, 4
/* 0000D4FC 5400103A */ slwi r0, r0, 2
/* 0000D500 7E521A14 */ add r18, r18, r3
/* 0000D504 7C740214 */ add r3, r20, r0
/* 0000D508 92430020 */ stw r18, 0x20(r3)
/* 0000D50C 48000020 */ b lbl_0000D52C
lbl_0000D510:
/* 0000D510 801C0000 */ lwz r0, 0(r28)
/* 0000D514 5400103A */ slwi r0, r0, 2
/* 0000D518 7C940214 */ add r4, r20, r0
/* 0000D51C 80640020 */ lwz r3, 0x20(r4)
/* 0000D520 7C601E70 */ srawi r0, r3, 3
/* 0000D524 7C001850 */ subf r0, r0, r3
/* 0000D528 90040020 */ stw r0, 0x20(r4)
lbl_0000D52C:
/* 0000D52C C021002C */ lfs f1, 0x2c(r1)
/* 0000D530 C01B0040 */ lfs f0, 0x40(r27)
/* 0000D534 FC010040 */ fcmpo cr0, f1, f0
/* 0000D538 4081000C */ ble lbl_0000D544
/* 0000D53C FC800850 */ fneg f4, f1
/* 0000D540 48000008 */ b lbl_0000D548
lbl_0000D544:
/* 0000D544 C09B0000 */ lfs f4, 0(r27)
lbl_0000D548:
/* 0000D548 C05B0040 */ lfs f2, 0x40(r27)
/* 0000D54C C021002C */ lfs f1, 0x2c(r1)
/* 0000D550 C0010024 */ lfs f0, 0x24(r1)
/* 0000D554 EC620824 */ fdivs f3, f2, f1
/* 0000D558 EC0000F2 */ fmuls f0, f0, f3
/* 0000D55C D0010024 */ stfs f0, 0x24(r1)
/* 0000D560 C0010028 */ lfs f0, 0x28(r1)
/* 0000D564 EC0000F2 */ fmuls f0, f0, f3
/* 0000D568 D0010028 */ stfs f0, 0x28(r1)
/* 0000D56C C01B0040 */ lfs f0, 0x40(r27)
/* 0000D570 D001002C */ stfs f0, 0x2c(r1)
/* 0000D574 C0410024 */ lfs f2, 0x24(r1)
/* 0000D578 C0210028 */ lfs f1, 0x28(r1)
/* 0000D57C C001002C */ lfs f0, 0x2c(r1)
/* 0000D580 3C60E000 */ lis r3, 0xe000
/* 0000D584 D043000C */ stfs f2, 0xc(r3)
/* 0000D588 D023001C */ stfs f1, 0x1c(r3)
/* 0000D58C D003002C */ stfs f0, 0x2c(r3)
/* 0000D590 C01B006C */ lfs f0, 0x6c(r27)
/* 0000D594 EC0007B2 */ fmuls f0, f0, f30
/* 0000D598 FC030040 */ fcmpo cr0, f3, f0
/* 0000D59C 40810008 */ ble lbl_0000D5A4
/* 0000D5A0 FC600090 */ fmr f3, f0
lbl_0000D5A4:
/* 0000D5A4 C01B0088 */ lfs f0, 0x88(r27)
/* 0000D5A8 EC0007B2 */ fmuls f0, f0, f30
/* 0000D5AC FC030040 */ fcmpo cr0, f3, f0
/* 0000D5B0 40800008 */ bge lbl_0000D5B8
/* 0000D5B4 FC600090 */ fmr f3, f0
lbl_0000D5B8:
/* 0000D5B8 EC030132 */ fmuls f0, f3, f4
/* 0000D5BC C0340004 */ lfs f1, 4(r20)
/* 0000D5C0 EFE10032 */ fmuls f31, f1, f0
/* 0000D5C4 FC20F890 */ fmr f1, f31
/* 0000D5C8 4BFF2B9D */ bl mathutil_mtxA_scale_s
/* 0000D5CC 801C0000 */ lwz r0, 0(r28)
/* 0000D5D0 5400103A */ slwi r0, r0, 2
/* 0000D5D4 7C740214 */ add r3, r20, r0
/* 0000D5D8 80630020 */ lwz r3, 0x20(r3)
/* 0000D5DC 4BFF2B89 */ bl mathutil_mtxA_rotate_z
/* 0000D5E0 C0140030 */ lfs f0, 0x30(r20)
/* 0000D5E4 FC00001E */ fctiwz f0, f0
/* 0000D5E8 D8010040 */ stfd f0, 0x40(r1)
/* 0000D5EC 80010044 */ lwz r0, 0x44(r1)
/* 0000D5F0 7C030734 */ extsh r3, r0
/* 0000D5F4 4BFF2B71 */ bl mathutil_mtxA_rotate_y
/* 0000D5F8 80710000 */ lwz r3, 0(r17)
/* 0000D5FC 38800000 */ li r4, 0
/* 0000D600 4BFF2B65 */ bl GXLoadNrmMtxImm
/* 0000D604 80710000 */ lwz r3, 0(r17)
/* 0000D608 38800000 */ li r4, 0
/* 0000D60C 4BFF2B59 */ bl GXLoadPosMtxImm
/* 0000D610 FC20F890 */ fmr f1, f31
/* 0000D614 4BFF2B51 */ bl avdisp_set_bound_sphere_scale
/* 0000D618 A8130006 */ lha r0, 6(r19)
/* 0000D61C 2C000000 */ cmpwi r0, 0
/* 0000D620 418200BC */ beq lbl_0000D6DC
/* 0000D624 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000D628 408200B4 */ bne lbl_0000D6DC
/* 0000D62C 8818014A */ lbz r0, 0x14a(r24)
/* 0000D630 3CC00000 */ lis r6, lbl_0001C2D8@ha
/* 0000D634 3C800000 */ lis r4, lbl_0001C2D8@ha
/* 0000D638 5400103A */ slwi r0, r0, 2
/* 0000D63C 7C7D0214 */ add r3, r29, r0
/* 0000D640 80030000 */ lwz r0, 0(r3)
/* 0000D644 3C600000 */ lis r3, lbl_0001C2D8@ha
/* 0000D648 90010014 */ stw r0, 0x14(r1)
/* 0000D64C 88E10014 */ lbz r7, 0x14(r1)
/* 0000D650 88A10015 */ lbz r5, 0x15(r1)
/* 0000D654 88010016 */ lbz r0, 0x16(r1)
/* 0000D658 90E10044 */ stw r7, 0x44(r1)
/* 0000D65C C8860000 */ lfd f4, lbl_0001C2D8@l(r6)
/* 0000D660 90A1003C */ stw r5, 0x3c(r1)
/* 0000D664 C8640000 */ lfd f3, lbl_0001C2D8@l(r4)
/* 0000D668 90010034 */ stw r0, 0x34(r1)
/* 0000D66C C8230000 */ lfd f1, lbl_0001C2D8@l(r3)
/* 0000D670 93C10040 */ stw r30, 0x40(r1)
/* 0000D674 C0BB0090 */ lfs f5, 0x90(r27)
/* 0000D678 93C10038 */ stw r30, 0x38(r1)
/* 0000D67C C8010040 */ lfd f0, 0x40(r1)
/* 0000D680 C8410038 */ lfd f2, 0x38(r1)
/* 0000D684 93C10030 */ stw r30, 0x30(r1)
/* 0000D688 EC802028 */ fsubs f4, f0, f4
/* 0000D68C EC421828 */ fsubs f2, f2, f3
/* 0000D690 C07B008C */ lfs f3, 0x8c(r27)
/* 0000D694 C8010030 */ lfd f0, 0x30(r1)
/* 0000D698 EC000828 */ fsubs f0, f0, f1
/* 0000D69C EC25202A */ fadds f1, f5, f4
/* 0000D6A0 C09B000C */ lfs f4, 0xc(r27)
/* 0000D6A4 EC45102A */ fadds f2, f5, f2
/* 0000D6A8 EC05002A */ fadds f0, f5, f0
/* 0000D6AC EC230072 */ fmuls f1, f3, f1
/* 0000D6B0 EC4300B2 */ fmuls f2, f3, f2
/* 0000D6B4 EC630032 */ fmuls f3, f3, f0
/* 0000D6B8 4BFF2AAD */ bl avdisp_set_post_add_color
/* 0000D6BC 80750000 */ lwz r3, 0(r21)
/* 0000D6C0 4BFF2AA5 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000D6C4 C03B000C */ lfs f1, 0xc(r27)
/* 0000D6C8 FC400890 */ fmr f2, f1
/* 0000D6CC FC600890 */ fmr f3, f1
/* 0000D6D0 FC800890 */ fmr f4, f1
/* 0000D6D4 4BFF2A91 */ bl avdisp_set_post_add_color
/* 0000D6D8 48000060 */ b lbl_0000D738
lbl_0000D6DC:
/* 0000D6DC A0130012 */ lhz r0, 0x12(r19)
/* 0000D6E0 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000D6E4 40820010 */ bne lbl_0000D6F4
/* 0000D6E8 80750000 */ lwz r3, 0(r21)
/* 0000D6EC 4BFF2A79 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000D6F0 48000048 */ b lbl_0000D738
lbl_0000D6F4:
/* 0000D6F4 8818014A */ lbz r0, 0x14a(r24)
/* 0000D6F8 1C00000C */ mulli r0, r0, 0xc
/* 0000D6FC 7C9F0214 */ add r4, r31, r0
/* 0000D700 80640000 */ lwz r3, 0(r4)
/* 0000D704 80040004 */ lwz r0, 4(r4)
/* 0000D708 90610008 */ stw r3, 8(r1)
/* 0000D70C 9001000C */ stw r0, 0xc(r1)
/* 0000D710 80040008 */ lwz r0, 8(r4)
/* 0000D714 90010010 */ stw r0, 0x10(r1)
/* 0000D718 C0210008 */ lfs f1, 8(r1)
/* 0000D71C C041000C */ lfs f2, 0xc(r1)
/* 0000D720 C0610010 */ lfs f3, 0x10(r1)
/* 0000D724 C09B0000 */ lfs f4, 0(r27)
/* 0000D728 4BFF2A3D */ bl avdisp_set_post_mult_color
/* 0000D72C 80750000 */ lwz r3, 0(r21)
/* 0000D730 4BFF2A35 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000D734 4BFF2A31 */ bl fade_color_base_default
lbl_0000D738:
/* 0000D738 C0140010 */ lfs f0, 0x10(r20)
/* 0000D73C C03B000C */ lfs f1, 0xc(r27)
/* 0000D740 FC000840 */ fcmpo cr0, f0, f1
/* 0000D744 4081010C */ ble lbl_0000D850
/* 0000D748 C05B0000 */ lfs f2, 0(r27)
/* 0000D74C FC600890 */ fmr f3, f1
/* 0000D750 C014001C */ lfs f0, 0x1c(r20)
/* 0000D754 C09B0014 */ lfs f4, 0x14(r27)
/* 0000D758 EC020028 */ fsubs f0, f2, f0
/* 0000D75C C05B0008 */ lfs f2, 8(r27)
/* 0000D760 EC040032 */ fmuls f0, f4, f0
/* 0000D764 EC42002A */ fadds f2, f2, f0
/* 0000D768 4BFF29FD */ bl mathutil_mtxA_translate_xyz
/* 0000D76C 38990004 */ addi r4, r25, 4
/* 0000D770 38790008 */ addi r3, r25, 8
/* 0000D774 3CA0E000 */ lis r5, 0xe000
/* 0000D778 C045000C */ lfs f2, 0xc(r5)
/* 0000D77C C025001C */ lfs f1, 0x1c(r5)
/* 0000D780 C005002C */ lfs f0, 0x2c(r5)
/* 0000D784 D0410024 */ stfs f2, 0x24(r1)
/* 0000D788 D0240000 */ stfs f1, 0(r4)
/* 0000D78C D0030000 */ stfs f0, 0(r3)
/* 0000D790 C0210024 */ lfs f1, 0x24(r1)
/* 0000D794 C01B0094 */ lfs f0, 0x94(r27)
/* 0000D798 EC010032 */ fmuls f0, f1, f0
/* 0000D79C D0010024 */ stfs f0, 0x24(r1)
/* 0000D7A0 C0210028 */ lfs f1, 0x28(r1)
/* 0000D7A4 C01B0094 */ lfs f0, 0x94(r27)
/* 0000D7A8 EC010032 */ fmuls f0, f1, f0
/* 0000D7AC D0010028 */ stfs f0, 0x28(r1)
/* 0000D7B0 C01B0098 */ lfs f0, 0x98(r27)
/* 0000D7B4 D001002C */ stfs f0, 0x2c(r1)
/* 0000D7B8 C0410024 */ lfs f2, 0x24(r1)
/* 0000D7BC C0210028 */ lfs f1, 0x28(r1)
/* 0000D7C0 C001002C */ lfs f0, 0x2c(r1)
/* 0000D7C4 D045000C */ stfs f2, 0xc(r5)
/* 0000D7C8 D025001C */ stfs f1, 0x1c(r5)
/* 0000D7CC D005002C */ stfs f0, 0x2c(r5)
/* 0000D7D0 4BFF2995 */ bl mathutil_mtxA_sq_from_identity
/* 0000D7D4 C03B009C */ lfs f1, 0x9c(r27)
/* 0000D7D8 C0140010 */ lfs f0, 0x10(r20)
/* 0000D7DC C05B0094 */ lfs f2, 0x94(r27)
/* 0000D7E0 EC010032 */ fmuls f0, f1, f0
/* 0000D7E4 EC020032 */ fmuls f0, f2, f0
/* 0000D7E8 EFFF0032 */ fmuls f31, f31, f0
/* 0000D7EC FC20F890 */ fmr f1, f31
/* 0000D7F0 4BFF2975 */ bl mathutil_mtxA_scale_s
/* 0000D7F4 C0140014 */ lfs f0, 0x14(r20)
/* 0000D7F8 FC00001E */ fctiwz f0, f0
/* 0000D7FC D8010030 */ stfd f0, 0x30(r1)
/* 0000D800 80010034 */ lwz r0, 0x34(r1)
/* 0000D804 7C030734 */ extsh r3, r0
/* 0000D808 4BFF295D */ bl mathutil_mtxA_rotate_z
/* 0000D80C 80710000 */ lwz r3, 0(r17)
/* 0000D810 38800000 */ li r4, 0
/* 0000D814 4BFF2951 */ bl GXLoadPosMtxImm
/* 0000D818 C03B0000 */ lfs f1, 0(r27)
/* 0000D81C C05B0074 */ lfs f2, 0x74(r27)
/* 0000D820 FC800890 */ fmr f4, f1
/* 0000D824 C07B0018 */ lfs f3, 0x18(r27)
/* 0000D828 4BFF293D */ bl avdisp_set_post_mult_color
/* 0000D82C FC20F890 */ fmr f1, f31
/* 0000D830 4BFF2935 */ bl avdisp_set_bound_sphere_scale
/* 0000D834 807A08A4 */ lwz r3, 0x8a4(r26)
/* 0000D838 4BFF292D */ bl avdisp_draw_model_culled_sort_translucent
/* 0000D83C C03B0000 */ lfs f1, 0(r27)
/* 0000D840 FC400890 */ fmr f2, f1
/* 0000D844 FC600890 */ fmr f3, f1
/* 0000D848 FC800890 */ fmr f4, f1
/* 0000D84C 4BFF2919 */ bl avdisp_set_post_mult_color
lbl_0000D850:
/* 0000D850 3AD6FFFF */ addi r22, r22, -1
/* 0000D854 3B1801A4 */ addi r24, r24, 0x1a4
/* 0000D858 3AF70001 */ addi r23, r23, 1
/* 0000D85C 3AB50004 */ addi r21, r21, 4
/* 0000D860 3A940038 */ addi r20, r20, 0x38
/* 0000D864 3A730018 */ addi r19, r19, 0x18
lbl_0000D868:
/* 0000D868 2C160000 */ cmpwi r22, 0
/* 0000D86C 4181FB24 */ bgt lbl_0000D390
/* 0000D870 BA21004C */ lmw r17, 0x4c(r1)
/* 0000D874 800100A4 */ lwz r0, 0xa4(r1)
/* 0000D878 CBE10098 */ lfd f31, 0x98(r1)
/* 0000D87C CBC10090 */ lfd f30, 0x90(r1)
/* 0000D880 7C0803A6 */ mtlr r0
/* 0000D884 CBA10088 */ lfd f29, 0x88(r1)
/* 0000D888 382100A0 */ addi r1, r1, 0xa0
/* 0000D88C 4E800020 */ blr 
