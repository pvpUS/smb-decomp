/* 000111B4 7C0802A6 */ mflr r0
/* 000111B8 3C800000 */ lis r4, lbl_0001CFD0@ha
/* 000111BC 90010004 */ stw r0, 4(r1)
/* 000111C0 38000019 */ li r0, 0x19
/* 000111C4 7C0903A6 */ mtctr r0
/* 000111C8 9421FEA8 */ stwu r1, -0x158(r1)
/* 000111CC DBE10150 */ stfd f31, 0x150(r1)
/* 000111D0 38A10010 */ addi r5, r1, 0x10
/* 000111D4 DBC10148 */ stfd f30, 0x148(r1)
/* 000111D8 DBA10140 */ stfd f29, 0x140(r1)
/* 000111DC DB810138 */ stfd f28, 0x138(r1)
/* 000111E0 DB610130 */ stfd f27, 0x130(r1)
/* 000111E4 DB410128 */ stfd f26, 0x128(r1)
/* 000111E8 BE0100E8 */ stmw r16, 0xe8(r1)
/* 000111EC 3AE40000 */ addi r23, r4, lbl_0001CFD0@l
/* 000111F0 3A630000 */ addi r19, r3, 0
/* 000111F4 3897387C */ addi r4, r23, 0x387c
lbl_000111F8:
/* 000111F8 84640008 */ lwzu r3, 8(r4)
/* 000111FC 80040004 */ lwz r0, 4(r4)
/* 00011200 94650008 */ stwu r3, 8(r5)
/* 00011204 90050004 */ stw r0, 4(r5)
/* 00011208 4200FFF0 */ bdnz lbl_000111F8
/* 0001120C 80040008 */ lwz r0, 8(r4)
/* 00011210 38600001 */ li r3, 1
/* 00011214 38800003 */ li r4, 3
/* 00011218 90050008 */ stw r0, 8(r5)
/* 0001121C 38A00000 */ li r5, 0
/* 00011220 4BFEEF15 */ bl avdisp_set_z_mode
/* 00011224 3C600000 */ lis r3, minigameGma@ha
/* 00011228 3CA00000 */ lis r5, lbl_10009878@ha
/* 0001122C 3C800000 */ lis r4, mathutilData@ha
/* 00011230 3CE00000 */ lis r7, commonGma@ha
/* 00011234 3CC00000 */ lis r6, lbl_10000004@ha
/* 00011238 3AC1000C */ addi r22, r1, 0xc
/* 0001123C 3BE30000 */ addi r31, r3, minigameGma@l
/* 00011240 3BA50000 */ addi r29, r5, lbl_10009878@l
/* 00011244 3BC40000 */ addi r30, r4, mathutilData@l
/* 00011248 3B670000 */ addi r27, r7, commonGma@l
/* 0001124C 3B860000 */ addi r28, r6, lbl_10000004@l
/* 00011250 3B010018 */ addi r24, r1, 0x18
/* 00011254 3B210020 */ addi r25, r1, 0x20
/* 00011258 3B41001C */ addi r26, r1, 0x1c
/* 0001125C 3A800000 */ li r20, 0
/* 00011260 3A400000 */ li r18, 0
lbl_00011264:
/* 00011264 3AA00000 */ li r21, 0
/* 00011268 3A200000 */ li r17, 0
lbl_0001126C:
/* 0001126C 7C7D8A14 */ add r3, r29, r17
/* 00011270 88030000 */ lbz r0, 0(r3)
/* 00011274 7C000775 */ extsb. r0, r0
/* 00011278 4182030C */ beq lbl_00011584
/* 0001127C C0230014 */ lfs f1, 0x14(r3)
/* 00011280 C0173778 */ lfs f0, 0x3778(r23)
/* 00011284 FC010040 */ fcmpo cr0, f1, f0
/* 00011288 418002FC */ blt lbl_00011584
/* 0001128C C0230010 */ lfs f1, 0x10(r3)
/* 00011290 7C18942E */ lfsx f0, r24, r18
/* 00011294 EC010028 */ fsubs f0, f1, f0
/* 00011298 D001000C */ stfs f0, 0xc(r1)
/* 0001129C C0173778 */ lfs f0, 0x3778(r23)
/* 000112A0 D0010010 */ stfs f0, 0x10(r1)
/* 000112A4 C0230018 */ lfs f1, 0x18(r3)
/* 000112A8 7C19942E */ lfsx f0, r25, r18
/* 000112AC EC010028 */ fsubs f0, f1, f0
/* 000112B0 D0010014 */ stfs f0, 0x14(r1)
/* 000112B4 C041000C */ lfs f2, 0xc(r1)
/* 000112B8 C0210010 */ lfs f1, 0x10(r1)
/* 000112BC C0010014 */ lfs f0, 0x14(r1)
/* 000112C0 EC4200B2 */ fmuls f2, f2, f2
/* 000112C4 EC41107A */ fmadds f2, f1, f1, f2
/* 000112C8 EC40103A */ fmadds f2, f0, f0, f2
/* 000112CC C01737D0 */ lfs f0, 0x37d0(r23)
/* 000112D0 FC020040 */ fcmpo cr0, f2, f0
/* 000112D4 40800010 */ bge lbl_000112E4
/* 000112D8 C01737A8 */ lfs f0, 0x37a8(r23)
/* 000112DC D001000C */ stfs f0, 0xc(r1)
/* 000112E0 4800000C */ b lbl_000112EC
lbl_000112E4:
/* 000112E4 7EC3B378 */ mr r3, r22
/* 000112E8 4BFEEE4D */ bl mathutil_vec_normalize_len
lbl_000112EC:
/* 000112EC 7E1D8A14 */ add r16, r29, r17
/* 000112F0 7C18942E */ lfsx f0, r24, r18
/* 000112F4 C0300010 */ lfs f1, 0x10(r16)
/* 000112F8 C3E1000C */ lfs f31, 0xc(r1)
/* 000112FC EC010028 */ fsubs f0, f1, f0
/* 00011300 C3C10014 */ lfs f30, 0x14(r1)
/* 00011304 D001000C */ stfs f0, 0xc(r1)
/* 00011308 7C1A942E */ lfsx f0, r26, r18
/* 0001130C FC000050 */ fneg f0, f0
/* 00011310 D0010010 */ stfs f0, 0x10(r1)
/* 00011314 C0300018 */ lfs f1, 0x18(r16)
/* 00011318 7C19942E */ lfsx f0, r25, r18
/* 0001131C EC010028 */ fsubs f0, f1, f0
/* 00011320 D0010014 */ stfs f0, 0x14(r1)
/* 00011324 C041000C */ lfs f2, 0xc(r1)
/* 00011328 C0210010 */ lfs f1, 0x10(r1)
/* 0001132C C0010014 */ lfs f0, 0x14(r1)
/* 00011330 EC6200B2 */ fmuls f3, f2, f2
/* 00011334 EC61187A */ fmadds f3, f1, f1, f3
/* 00011338 EC60183A */ fmadds f3, f0, f0, f3
/* 0001133C C0173950 */ lfs f0, 0x3950(r23)
/* 00011340 C0B737A8 */ lfs f5, 0x37a8(r23)
/* 00011344 C0500014 */ lfs f2, 0x14(r16)
/* 00011348 EC830024 */ fdivs f4, f3, f0
/* 0001134C C03737BC */ lfs f1, 0x37bc(r23)
/* 00011350 C0D737DC */ lfs f6, 0x37dc(r23)
/* 00011354 C07737A0 */ lfs f3, 0x37a0(r23)
/* 00011358 C0173778 */ lfs f0, 0x3778(r23)
/* 0001135C EC852028 */ fsubs f4, f5, f4
/* 00011360 EC220828 */ fsubs f1, f2, f1
/* 00011364 EC460132 */ fmuls f2, f6, f4
/* 00011368 EC230072 */ fmuls f1, f3, f1
/* 0001136C EFA20828 */ fsubs f29, f2, f1
/* 00011370 FC1D0040 */ fcmpo cr0, f29, f0
/* 00011374 41800210 */ blt lbl_00011584
/* 00011378 7EC3B378 */ mr r3, r22
/* 0001137C 4BFEEDB9 */ bl mathutil_vec_normalize_len
/* 00011380 C021000C */ lfs f1, 0xc(r1)
/* 00011384 C0010014 */ lfs f0, 0x14(r1)
/* 00011388 EC210072 */ fmuls f1, f1, f1
/* 0001138C C0410010 */ lfs f2, 0x10(r1)
/* 00011390 EC000032 */ fmuls f0, f0, f0
/* 00011394 FF601050 */ fneg f27, f2
/* 00011398 EC21002A */ fadds f1, f1, f0
/* 0001139C 4BFEED99 */ bl mathutil_sqrt
/* 000113A0 C01737A8 */ lfs f0, 0x37a8(r23)
/* 000113A4 FF800890 */ fmr f28, f1
/* 000113A8 EF40D824 */ fdivs f26, f0, f27
/* 000113AC 4BFEED89 */ bl mathutil_mtxA_from_mtxB
/* 000113B0 C0300010 */ lfs f1, 0x10(r16)
/* 000113B4 C0573868 */ lfs f2, 0x3868(r23)
/* 000113B8 C0700018 */ lfs f3, 0x18(r16)
/* 000113BC 4BFEED79 */ bl mathutil_mtxA_translate_xyz
/* 000113C0 FC20F890 */ fmr f1, f31
/* 000113C4 FC40F090 */ fmr f2, f30
/* 000113C8 4BFEED6D */ bl mathutil_mtxA_rotate_y_sin_cos
/* 000113CC C0373778 */ lfs f1, 0x3778(r23)
/* 000113D0 C01737BC */ lfs f0, 0x37bc(r23)
/* 000113D4 FC400890 */ fmr f2, f1
/* 000113D8 EC600732 */ fmuls f3, f0, f28
/* 000113DC 4BFEED59 */ bl mathutil_mtxA_translate_xyz
/* 000113E0 C03737BC */ lfs f1, 0x37bc(r23)
/* 000113E4 FC400890 */ fmr f2, f1
/* 000113E8 EC6106B2 */ fmuls f3, f1, f26
/* 000113EC 4BFEED49 */ bl mathutil_mtxA_scale_xyz
/* 000113F0 C0373778 */ lfs f1, 0x3778(r23)
/* 000113F4 C0700014 */ lfs f3, 0x14(r16)
/* 000113F8 C01737BC */ lfs f0, 0x37bc(r23)
/* 000113FC FC400890 */ fmr f2, f1
/* 00011400 EC630028 */ fsubs f3, f3, f0
/* 00011404 4BFEED31 */ bl mathutil_mtxA_translate_xyz
/* 00011408 38604000 */ li r3, 0x4000
/* 0001140C 4BFEED29 */ bl mathutil_mtxA_rotate_x
/* 00011410 807E0000 */ lwz r3, 0(r30)
/* 00011414 38800000 */ li r4, 0
/* 00011418 4BFEED1D */ bl GXLoadPosMtxImm
/* 0001141C 807E0000 */ lwz r3, 0(r30)
/* 00011420 38800000 */ li r4, 0
/* 00011424 4BFEED11 */ bl GXLoadNrmMtxImm
/* 00011428 FC20E890 */ fmr f1, f29
/* 0001142C C09737A8 */ lfs f4, 0x37a8(r23)
/* 00011430 FC40E890 */ fmr f2, f29
/* 00011434 FC60E890 */ fmr f3, f29
/* 00011438 4BFEECFD */ bl avdisp_set_post_mult_color
/* 0001143C 807B0000 */ lwz r3, 0(r27)
/* 00011440 80630008 */ lwz r3, 8(r3)
/* 00011444 80630270 */ lwz r3, 0x270(r3)
/* 00011448 4BFEECED */ bl avdisp_draw_model_unculled_sort_none
/* 0001144C 881C0000 */ lbz r0, 0(r28)
/* 00011450 7C000775 */ extsb. r0, r0
/* 00011454 4182002C */ beq lbl_00011480
/* 00011458 7E600775 */ extsb. r0, r19
/* 0001145C 4082000C */ bne lbl_00011468
/* 00011460 2C150000 */ cmpwi r21, 0
/* 00011464 4182001C */ beq lbl_00011480
lbl_00011468:
/* 00011468 7E600775 */ extsb. r0, r19
/* 0001146C 4182000C */ beq lbl_00011478
/* 00011470 2C150001 */ cmpwi r21, 1
/* 00011474 4081000C */ ble lbl_00011480
lbl_00011478:
/* 00011478 2C150009 */ cmpwi r21, 9
/* 0001147C 40820108 */ bne lbl_00011584
lbl_00011480:
/* 00011480 4BFEECB5 */ bl mathutil_mtxA_from_mtxB
/* 00011484 7C7D8A14 */ add r3, r29, r17
/* 00011488 38630010 */ addi r3, r3, 0x10
/* 0001148C 4BFEECA9 */ bl mathutil_mtxA_translate
/* 00011490 FC20F890 */ fmr f1, f31
/* 00011494 FC40F090 */ fmr f2, f30
/* 00011498 4BFEEC9D */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0001149C FC20D850 */ fneg f1, f27
/* 000114A0 FC40E050 */ fneg f2, f28
/* 000114A4 4BFEEC91 */ bl mathutil_mtxA_rotate_x_sin_cos
/* 000114A8 C03737A8 */ lfs f1, 0x37a8(r23)
/* 000114AC FC400890 */ fmr f2, f1
/* 000114B0 FC600890 */ fmr f3, f1
/* 000114B4 FC800890 */ fmr f4, f1
/* 000114B8 4BFEEC7D */ bl avdisp_set_post_mult_color
/* 000114BC C03737A8 */ lfs f1, 0x37a8(r23)
/* 000114C0 4BFEEC75 */ bl mathutil_mtxA_scale_s
/* 000114C4 C0373778 */ lfs f1, 0x3778(r23)
/* 000114C8 C05737C0 */ lfs f2, 0x37c0(r23)
/* 000114CC FC600890 */ fmr f3, f1
/* 000114D0 4BFEEC65 */ bl mathutil_mtxA_translate_xyz
/* 000114D4 C0173954 */ lfs f0, 0x3954(r23)
/* 000114D8 38800000 */ li r4, 0
/* 000114DC 807E0000 */ lwz r3, 0(r30)
/* 000114E0 EFBD0032 */ fmuls f29, f29, f0
/* 000114E4 4BFEEC51 */ bl GXLoadPosMtxImm
/* 000114E8 807E0000 */ lwz r3, 0(r30)
/* 000114EC 38800000 */ li r4, 0
/* 000114F0 4BFEEC45 */ bl GXLoadNrmMtxImm
/* 000114F4 C01737A8 */ lfs f0, 0x37a8(r23)
/* 000114F8 FC1D0040 */ fcmpo cr0, f29, f0
/* 000114FC 40810018 */ ble lbl_00011514
/* 00011500 807F0000 */ lwz r3, 0(r31)
/* 00011504 80630008 */ lwz r3, 8(r3)
/* 00011508 806300F0 */ lwz r3, 0xf0(r3)
/* 0001150C 4BFEEC29 */ bl avdisp_draw_model_unculled_sort_none
/* 00011510 48000074 */ b lbl_00011584
lbl_00011514:
/* 00011514 C0173958 */ lfs f0, 0x3958(r23)
/* 00011518 FC1D0040 */ fcmpo cr0, f29, f0
/* 0001151C 40810018 */ ble lbl_00011534
/* 00011520 807F0000 */ lwz r3, 0(r31)
/* 00011524 80630008 */ lwz r3, 8(r3)
/* 00011528 80630140 */ lwz r3, 0x140(r3)
/* 0001152C 4BFEEC09 */ bl avdisp_draw_model_unculled_sort_none
/* 00011530 48000054 */ b lbl_00011584
lbl_00011534:
/* 00011534 C01737BC */ lfs f0, 0x37bc(r23)
/* 00011538 FC1D0040 */ fcmpo cr0, f29, f0
/* 0001153C 40810018 */ ble lbl_00011554
/* 00011540 807F0000 */ lwz r3, 0(r31)
/* 00011544 80630008 */ lwz r3, 8(r3)
/* 00011548 80630148 */ lwz r3, 0x148(r3)
/* 0001154C 4BFEEBE9 */ bl avdisp_draw_model_unculled_sort_none
/* 00011550 48000034 */ b lbl_00011584
lbl_00011554:
/* 00011554 C01737C8 */ lfs f0, 0x37c8(r23)
/* 00011558 FC1D0040 */ fcmpo cr0, f29, f0
/* 0001155C 40810018 */ ble lbl_00011574
/* 00011560 807F0000 */ lwz r3, 0(r31)
/* 00011564 80630008 */ lwz r3, 8(r3)
/* 00011568 80630150 */ lwz r3, 0x150(r3)
/* 0001156C 4BFEEBC9 */ bl avdisp_draw_model_unculled_sort_none
/* 00011570 48000014 */ b lbl_00011584
lbl_00011574:
/* 00011574 807F0000 */ lwz r3, 0(r31)
/* 00011578 80630008 */ lwz r3, 8(r3)
/* 0001157C 80630158 */ lwz r3, 0x158(r3)
/* 00011580 4BFEEBB5 */ bl avdisp_draw_model_unculled_sort_none
lbl_00011584:
/* 00011584 3AB50001 */ addi r21, r21, 1
/* 00011588 2C15000A */ cmpwi r21, 0xa
/* 0001158C 3A310068 */ addi r17, r17, 0x68
/* 00011590 4180FCDC */ blt lbl_0001126C
/* 00011594 3A940001 */ addi r20, r20, 1
/* 00011598 2C140011 */ cmpwi r20, 0x11
/* 0001159C 3A52000C */ addi r18, r18, 0xc
/* 000115A0 4180FCC4 */ blt lbl_00011264
/* 000115A4 C03737A8 */ lfs f1, 0x37a8(r23)
/* 000115A8 FC400890 */ fmr f2, f1
/* 000115AC FC600890 */ fmr f3, f1
/* 000115B0 FC800890 */ fmr f4, f1
/* 000115B4 4BFEEB81 */ bl avdisp_set_post_mult_color
/* 000115B8 38600001 */ li r3, 1
/* 000115BC 38800003 */ li r4, 3
/* 000115C0 38A00001 */ li r5, 1
/* 000115C4 4BFEEB71 */ bl avdisp_set_z_mode
/* 000115C8 BA0100E8 */ lmw r16, 0xe8(r1)
/* 000115CC 8001015C */ lwz r0, 0x15c(r1)
/* 000115D0 CBE10150 */ lfd f31, 0x150(r1)
/* 000115D4 CBC10148 */ lfd f30, 0x148(r1)
/* 000115D8 7C0803A6 */ mtlr r0
/* 000115DC CBA10140 */ lfd f29, 0x140(r1)
/* 000115E0 CB810138 */ lfd f28, 0x138(r1)
/* 000115E4 CB610130 */ lfd f27, 0x130(r1)
/* 000115E8 CB410128 */ lfd f26, 0x128(r1)
/* 000115EC 38210158 */ addi r1, r1, 0x158
/* 000115F0 4E800020 */ blr 
