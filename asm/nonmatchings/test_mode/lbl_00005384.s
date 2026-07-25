/* 00005384 7C0802A6 */ mflr r0
/* 00005388 3C800000 */ lis r4, lbl_0000FE78@ha
/* 0000538C 90010004 */ stw r0, 4(r1)
/* 00005390 3C600000 */ lis r3, lbl_10000000@ha
/* 00005394 9421FFD0 */ stwu r1, -0x30(r1)
/* 00005398 DBE10028 */ stfd f31, 0x28(r1)
/* 0000539C BF21000C */ stmw r25, 0xc(r1)
/* 000053A0 3BA40000 */ addi r29, r4, lbl_0000FE78@l
/* 000053A4 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000053A8 4BFFADB5 */ bl mathutil_mtxA_from_mtxB
/* 000053AC 3C600000 */ lis r3, currentCamera@ha
/* 000053B0 38630000 */ addi r3, r3, currentCamera@l
/* 000053B4 80630000 */ lwz r3, 0(r3)
/* 000053B8 3863000C */ addi r3, r3, 0xc
/* 000053BC 4BFFADA1 */ bl mathutil_mtxA_translate
/* 000053C0 3C600000 */ lis r3, mathutilData@ha
/* 000053C4 3B230000 */ addi r25, r3, mathutilData@l
/* 000053C8 80790000 */ lwz r3, 0(r25)
/* 000053CC 38800000 */ li r4, 0
/* 000053D0 4BFFAD8D */ bl gxutil_load_pos_nrm_matrix
/* 000053D4 C03D0078 */ lfs f1, 0x78(r29)
/* 000053D8 4BFFAD85 */ bl mathutil_mtxA_scale_s
/* 000053DC 480002E1 */ bl lbl_000056BC
/* 000053E0 4BFFAD7D */ bl mathutil_mtxA_from_mtxB
/* 000053E4 C03D0060 */ lfs f1, 0x60(r29)
/* 000053E8 C05D006C */ lfs f2, 0x6c(r29)
/* 000053EC C07D0088 */ lfs f3, 0x88(r29)
/* 000053F0 4BFFAD6D */ bl mathutil_mtxA_translate_xyz
/* 000053F4 3860C000 */ li r3, -16384
/* 000053F8 4BFFAD65 */ bl mathutil_mtxA_rotate_x
/* 000053FC 3860C000 */ li r3, -16384
/* 00005400 4BFFAD5D */ bl mathutil_mtxA_rotate_z
/* 00005404 80790000 */ lwz r3, 0(r25)
/* 00005408 38800000 */ li r4, 0
/* 0000540C 4BFFAD51 */ bl gxutil_load_pos_nrm_matrix
/* 00005410 3B800000 */ li r28, 0
/* 00005414 3C600000 */ lis r3, powerOnTimer@ha
/* 00005418 3C805555 */ lis r4, 0x5555
/* 0000541C 3B7C0000 */ addi r27, r28, 0
/* 00005420 3B230000 */ addi r25, r3, powerOnTimer@l
/* 00005424 3BE45556 */ addi r31, r4, 0x5556
/* 00005428 3B400000 */ li r26, 0
/* 0000542C 4800010C */ b lbl_00005538
lbl_00005430:
/* 00005430 7C7FD096 */ mulhw r3, r31, r26
/* 00005434 801E0164 */ lwz r0, 0x164(r30)
/* 00005438 80DE016C */ lwz r6, 0x16c(r30)
/* 0000543C 7CA0E214 */ add r5, r0, r28
/* 00005440 54600FFE */ srwi r0, r3, 0x1f
/* 00005444 80850000 */ lwz r4, 0(r5)
/* 00005448 7C030214 */ add r0, r3, r0
/* 0000544C 80650004 */ lwz r3, 4(r5)
/* 00005450 7CC6DA14 */ add r6, r6, r27
/* 00005454 90860000 */ stw r4, 0(r6)
/* 00005458 1C000003 */ mulli r0, r0, 3
/* 0000545C 90660004 */ stw r3, 4(r6)
/* 00005460 7C00D050 */ subf r0, r0, r26
/* 00005464 80650008 */ lwz r3, 8(r5)
/* 00005468 2C000001 */ cmpwi r0, 1
/* 0000546C 90660008 */ stw r3, 8(r6)
/* 00005470 4182003C */ beq lbl_000054AC
/* 00005474 40800010 */ bge lbl_00005484
/* 00005478 2C000000 */ cmpwi r0, 0
/* 0000547C 40800014 */ bge lbl_00005490
/* 00005480 48000058 */ b lbl_000054D8
lbl_00005484:
/* 00005484 2C000003 */ cmpwi r0, 3
/* 00005488 40800050 */ bge lbl_000054D8
/* 0000548C 48000038 */ b lbl_000054C4
lbl_00005490:
/* 00005490 80190000 */ lwz r0, 0(r25)
/* 00005494 5403482C */ slwi r3, r0, 9
/* 00005498 4BFFACC5 */ bl mathutil_sin
/* 0000549C C81D0160 */ lfd f0, 0x160(r29)
/* 000054A0 FFE00072 */ fmul f31, f0, f1
/* 000054A4 FFE0F818 */ frsp f31, f31
/* 000054A8 48000030 */ b lbl_000054D8
lbl_000054AC:
/* 000054AC 80190000 */ lwz r0, 0(r25)
/* 000054B0 5403402E */ slwi r3, r0, 8
/* 000054B4 4BFFACA9 */ bl mathutil_sin
/* 000054B8 C01D0168 */ lfs f0, 0x168(r29)
/* 000054BC EFE00072 */ fmuls f31, f0, f1
/* 000054C0 48000018 */ b lbl_000054D8
lbl_000054C4:
/* 000054C4 80190000 */ lwz r0, 0(r25)
/* 000054C8 5403502A */ slwi r3, r0, 0xa
/* 000054CC 4BFFAC91 */ bl mathutil_sin
/* 000054D0 C01D016C */ lfs f0, 0x16c(r29)
/* 000054D4 EFE00072 */ fmuls f31, f0, f1
lbl_000054D8:
/* 000054D8 801E0164 */ lwz r0, 0x164(r30)
/* 000054DC 3B7B000C */ addi r27, r27, 0xc
/* 000054E0 3B5A0001 */ addi r26, r26, 1
/* 000054E4 7C60E214 */ add r3, r0, r28
/* 000054E8 C003000C */ lfs f0, 0xc(r3)
/* 000054EC C0230000 */ lfs f1, 0(r3)
/* 000054F0 EC1F0032 */ fmuls f0, f31, f0
/* 000054F4 EC01002A */ fadds f0, f1, f0
/* 000054F8 D0030000 */ stfs f0, 0(r3)
/* 000054FC 801E0164 */ lwz r0, 0x164(r30)
/* 00005500 7C60E214 */ add r3, r0, r28
/* 00005504 C0030010 */ lfs f0, 0x10(r3)
/* 00005508 C0230004 */ lfs f1, 4(r3)
/* 0000550C EC1F0032 */ fmuls f0, f31, f0
/* 00005510 EC01002A */ fadds f0, f1, f0
/* 00005514 D0030004 */ stfs f0, 4(r3)
/* 00005518 801E0164 */ lwz r0, 0x164(r30)
/* 0000551C 7C60E214 */ add r3, r0, r28
/* 00005520 C0030014 */ lfs f0, 0x14(r3)
/* 00005524 3B9C0040 */ addi r28, r28, 0x40
/* 00005528 C0230008 */ lfs f1, 8(r3)
/* 0000552C EC1F0032 */ fmuls f0, f31, f0
/* 00005530 EC01002A */ fadds f0, f1, f0
/* 00005534 D0030008 */ stfs f0, 8(r3)
lbl_00005538:
/* 00005538 807E0168 */ lwz r3, 0x168(r30)
/* 0000553C 80030000 */ lwz r0, 0(r3)
/* 00005540 7C1A0040 */ cmplw r26, r0
/* 00005544 4180FEEC */ blt lbl_00005430
/* 00005548 C03D0170 */ lfs f1, 0x170(r29)
/* 0000554C 38600002 */ li r3, 2
/* 00005550 C05D0174 */ lfs f2, 0x174(r29)
/* 00005554 4BFFAC09 */ bl avdisp_set_fog_params
/* 00005558 38600000 */ li r3, 0
/* 0000555C 38800059 */ li r4, 0x59
/* 00005560 38A00069 */ li r5, 0x69
/* 00005564 4BFFABF9 */ bl avdisp_set_fog_color
/* 00005568 38600001 */ li r3, 1
/* 0000556C 4BFFABF1 */ bl u_gxutil_set_fog_enabled
/* 00005570 807E0160 */ lwz r3, 0x160(r30)
/* 00005574 4BFFABE9 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00005578 4BFFABE5 */ bl u_gxutil_fog_something_2
/* 0000557C 39000000 */ li r8, 0
/* 00005580 38C80000 */ addi r6, r8, 0
/* 00005584 38E80000 */ addi r7, r8, 0
/* 00005588 48000038 */ b lbl_000055C0
lbl_0000558C:
/* 0000558C 807E016C */ lwz r3, 0x16c(r30)
/* 00005590 39080001 */ addi r8, r8, 1
/* 00005594 801E0164 */ lwz r0, 0x164(r30)
/* 00005598 7C833214 */ add r4, r3, r6
/* 0000559C 7CA03A14 */ add r5, r0, r7
/* 000055A0 80640000 */ lwz r3, 0(r4)
/* 000055A4 80040004 */ lwz r0, 4(r4)
/* 000055A8 38C6000C */ addi r6, r6, 0xc
/* 000055AC 38E70040 */ addi r7, r7, 0x40
/* 000055B0 90650000 */ stw r3, 0(r5)
/* 000055B4 90050004 */ stw r0, 4(r5)
/* 000055B8 80040008 */ lwz r0, 8(r4)
/* 000055BC 90050008 */ stw r0, 8(r5)
lbl_000055C0:
/* 000055C0 807E0168 */ lwz r3, 0x168(r30)
/* 000055C4 80030000 */ lwz r0, 0(r3)
/* 000055C8 7C080040 */ cmplw r8, r0
/* 000055CC 4180FFC0 */ blt lbl_0000558C
/* 000055D0 BB21000C */ lmw r25, 0xc(r1)
/* 000055D4 80010034 */ lwz r0, 0x34(r1)
/* 000055D8 CBE10028 */ lfd f31, 0x28(r1)
/* 000055DC 38210030 */ addi r1, r1, 0x30
/* 000055E0 7C0803A6 */ mtlr r0
/* 000055E4 4E800020 */ blr 
