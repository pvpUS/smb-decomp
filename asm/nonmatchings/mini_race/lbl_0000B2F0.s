/* 0000B2F0 7C0802A6 */ mflr r0
/* 0000B2F4 3CC00000 */ lis r6, cameraInfo@ha
/* 0000B2F8 90010004 */ stw r0, 4(r1)
/* 0000B2FC 3C800000 */ lis r4, lbl_00013BD0@ha
/* 0000B300 38C60000 */ addi r6, r6, cameraInfo@l
/* 0000B304 9421FF90 */ stwu r1, -0x70(r1)
/* 0000B308 DBE10068 */ stfd f31, 0x68(r1)
/* 0000B30C DBC10060 */ stfd f30, 0x60(r1)
/* 0000B310 DBA10058 */ stfd f29, 0x58(r1)
/* 0000B314 BEC10030 */ stmw r22, 0x30(r1)
/* 0000B318 3B840000 */ addi r28, r4, lbl_00013BD0@l
/* 0000B31C 3AE30000 */ addi r23, r3, 0
/* 0000B320 3C800000 */ lis r4, ballInfo@ha
/* 0000B324 38040000 */ addi r0, r4, ballInfo@l
/* 0000B328 3C800000 */ lis r4, commonGma@ha
/* 0000B32C 3C600000 */ lis r3, lbl_801B7CF8@ha
/* 0000B330 7C1B0378 */ mr r27, r0
/* 0000B334 3BE40000 */ addi r31, r4, commonGma@l
/* 0000B338 3AC10024 */ addi r22, r1, 0x24
/* 0000B33C 3BC30000 */ addi r30, r3, lbl_801B7CF8@l
/* 0000B340 3B000000 */ li r24, 0
/* 0000B344 80BC0030 */ lwz r5, 0x30(r28)
/* 0000B348 80FC0034 */ lwz r7, 0x34(r28)
/* 0000B34C 90A10024 */ stw r5, 0x24(r1)
/* 0000B350 3CA00000 */ lis r5, mathutilData@ha
/* 0000B354 3BA50000 */ addi r29, r5, mathutilData@l
/* 0000B358 90E10028 */ stw r7, 0x28(r1)
/* 0000B35C 88F7002E */ lbz r7, 0x2e(r23)
/* 0000B360 C05C0044 */ lfs f2, 0x44(r28)
/* 0000B364 7CE00774 */ extsb r0, r7
/* 0000B368 C81C0048 */ lfd f0, 0x48(r28)
/* 0000B36C 1C000284 */ mulli r0, r0, 0x284
/* 0000B370 7F260214 */ add r25, r6, r0
/* 0000B374 C039004C */ lfs f1, 0x4c(r25)
/* 0000B378 EFE20072 */ fmuls f31, f2, f1
/* 0000B37C FFC0F824 */ fdiv f30, f0, f31
/* 0000B380 FFC0F018 */ frsp f30, f30
/* 0000B384 480001B0 */ b lbl_0000B534
lbl_0000B388:
/* 0000B388 881B0000 */ lbz r0, 0(r27)
/* 0000B38C 835B0144 */ lwz r26, 0x144(r27)
/* 0000B390 2C000002 */ cmpwi r0, 2
/* 0000B394 40820198 */ bne lbl_0000B52C
/* 0000B398 807A0014 */ lwz r3, 0x14(r26)
/* 0000B39C 54600673 */ rlwinm. r0, r3, 0, 0x19, 0x19
/* 0000B3A0 4082018C */ bne lbl_0000B52C
/* 0000B3A4 546006B5 */ rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 0000B3A8 4082001C */ bne lbl_0000B3C4
/* 0000B3AC 887B002E */ lbz r3, 0x2e(r27)
/* 0000B3B0 8817002E */ lbz r0, 0x2e(r23)
/* 0000B3B4 7C630774 */ extsb r3, r3
/* 0000B3B8 7C000774 */ extsb r0, r0
/* 0000B3BC 7C030000 */ cmpw r3, r0
/* 0000B3C0 4182016C */ beq lbl_0000B52C
lbl_0000B3C4:
/* 0000B3C4 807C0038 */ lwz r3, 0x38(r28)
/* 0000B3C8 801C003C */ lwz r0, 0x3c(r28)
/* 0000B3CC 9061000C */ stw r3, 0xc(r1)
/* 0000B3D0 90010010 */ stw r0, 0x10(r1)
/* 0000B3D4 801C0040 */ lwz r0, 0x40(r28)
/* 0000B3D8 90010014 */ stw r0, 0x14(r1)
/* 0000B3DC C01B0004 */ lfs f0, 4(r27)
/* 0000B3E0 D001000C */ stfs f0, 0xc(r1)
/* 0000B3E4 C03B0008 */ lfs f1, 8(r27)
/* 0000B3E8 C01B0068 */ lfs f0, 0x68(r27)
/* 0000B3EC EC01002A */ fadds f0, f1, f0
/* 0000B3F0 D0010010 */ stfs f0, 0x10(r1)
/* 0000B3F4 C01B000C */ lfs f0, 0xc(r27)
/* 0000B3F8 D0010014 */ stfs f0, 0x14(r1)
/* 0000B3FC 8061000C */ lwz r3, 0xc(r1)
/* 0000B400 80010010 */ lwz r0, 0x10(r1)
/* 0000B404 90610018 */ stw r3, 0x18(r1)
/* 0000B408 9001001C */ stw r0, 0x1c(r1)
/* 0000B40C 80010014 */ lwz r0, 0x14(r1)
/* 0000B410 90010020 */ stw r0, 0x20(r1)
/* 0000B414 C0B90000 */ lfs f5, 0(r25)
/* 0000B418 C0410018 */ lfs f2, 0x18(r1)
/* 0000B41C C0990004 */ lfs f4, 4(r25)
/* 0000B420 C021001C */ lfs f1, 0x1c(r1)
/* 0000B424 C0790008 */ lfs f3, 8(r25)
/* 0000B428 C0010020 */ lfs f0, 0x20(r1)
/* 0000B42C ECA51028 */ fsubs f5, f5, f2
/* 0000B430 EC840828 */ fsubs f4, f4, f1
/* 0000B434 EC630028 */ fsubs f3, f3, f0
/* 0000B438 EC250172 */ fmuls f1, f5, f5
/* 0000B43C EC24093A */ fmadds f1, f4, f4, f1
/* 0000B440 EC2308FA */ fmadds f1, f3, f3, f1
/* 0000B444 4BFF4D39 */ bl mathutil_sqrt
/* 0000B448 C0590038 */ lfs f2, 0x38(r25)
/* 0000B44C C01C0050 */ lfs f0, 0x50(r28)
/* 0000B450 EC220072 */ fmuls f1, f2, f1
/* 0000B454 EC5F0824 */ fdivs f2, f31, f1
/* 0000B458 FC020040 */ fcmpo cr0, f2, f0
/* 0000B45C 40800010 */ bge lbl_0000B46C
/* 0000B460 EC000072 */ fmuls f0, f0, f1
/* 0000B464 EFA007B2 */ fmuls f29, f0, f30
/* 0000B468 48000020 */ b lbl_0000B488
lbl_0000B46C:
/* 0000B46C C01C0054 */ lfs f0, 0x54(r28)
/* 0000B470 FC020040 */ fcmpo cr0, f2, f0
/* 0000B474 40810010 */ ble lbl_0000B484
/* 0000B478 EC000072 */ fmuls f0, f0, f1
/* 0000B47C EFA007B2 */ fmuls f29, f0, f30
/* 0000B480 48000008 */ b lbl_0000B488
lbl_0000B484:
/* 0000B484 C3BC0018 */ lfs f29, 0x18(r28)
lbl_0000B488:
/* 0000B488 38610018 */ addi r3, r1, 0x18
/* 0000B48C 4BFF4CF1 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B490 4BFF4CED */ bl mathutil_mtxA_sq_from_identity
/* 0000B494 FC20E890 */ fmr f1, f29
/* 0000B498 4BFF4CE5 */ bl mathutil_mtxA_scale_s
/* 0000B49C FC20E890 */ fmr f1, f29
/* 0000B4A0 4BFF4CDD */ bl avdisp_set_bound_sphere_scale
/* 0000B4A4 807D0000 */ lwz r3, 0(r29)
/* 0000B4A8 38800000 */ li r4, 0
/* 0000B4AC 4BFF4CD1 */ bl gxutil_load_pos_nrm_matrix
/* 0000B4B0 801A0014 */ lwz r0, 0x14(r26)
/* 0000B4B4 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000B4B8 41820050 */ beq lbl_0000B508
/* 0000B4BC 881B002E */ lbz r0, 0x2e(r27)
/* 0000B4C0 C09C0018 */ lfs f4, 0x18(r28)
/* 0000B4C4 7C000774 */ extsb r0, r0
/* 0000B4C8 1C00000C */ mulli r0, r0, 0xc
/* 0000B4CC 7C7E0214 */ add r3, r30, r0
/* 0000B4D0 C0230000 */ lfs f1, 0(r3)
/* 0000B4D4 C0430004 */ lfs f2, 4(r3)
/* 0000B4D8 C0630008 */ lfs f3, 8(r3)
/* 0000B4DC 4BFF4CA1 */ bl avdisp_set_post_mult_color
/* 0000B4E0 807F0000 */ lwz r3, 0(r31)
/* 0000B4E4 80630008 */ lwz r3, 8(r3)
/* 0000B4E8 806302C0 */ lwz r3, 0x2c0(r3)
/* 0000B4EC 4BFF4C91 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B4F0 C03C0018 */ lfs f1, 0x18(r28)
/* 0000B4F4 FC400890 */ fmr f2, f1
/* 0000B4F8 FC600890 */ fmr f3, f1
/* 0000B4FC FC800890 */ fmr f4, f1
/* 0000B500 4BFF4C7D */ bl avdisp_set_post_mult_color
/* 0000B504 48000028 */ b lbl_0000B52C
lbl_0000B508:
/* 0000B508 881B002E */ lbz r0, 0x2e(r27)
/* 0000B50C 807F0000 */ lwz r3, 0(r31)
/* 0000B510 7C000774 */ extsb r0, r0
/* 0000B514 5400083C */ slwi r0, r0, 1
/* 0000B518 80630008 */ lwz r3, 8(r3)
/* 0000B51C 7C1602AE */ lhax r0, r22, r0
/* 0000B520 54001838 */ slwi r0, r0, 3
/* 0000B524 7C63002E */ lwzx r3, r3, r0
/* 0000B528 4BFF4C55 */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000B52C:
/* 0000B52C 3B180001 */ addi r24, r24, 1
/* 0000B530 3B7B01A4 */ addi r27, r27, 0x1a4
lbl_0000B534:
/* 0000B534 7F000734 */ extsh r0, r24
/* 0000B538 2C000004 */ cmpwi r0, 4
/* 0000B53C 4180FE4C */ blt lbl_0000B388
/* 0000B540 BAC10030 */ lmw r22, 0x30(r1)
/* 0000B544 80010074 */ lwz r0, 0x74(r1)
/* 0000B548 CBE10068 */ lfd f31, 0x68(r1)
/* 0000B54C CBC10060 */ lfd f30, 0x60(r1)
/* 0000B550 7C0803A6 */ mtlr r0
/* 0000B554 CBA10058 */ lfd f29, 0x58(r1)
/* 0000B558 38210070 */ addi r1, r1, 0x70
/* 0000B55C 4E800020 */ blr 
