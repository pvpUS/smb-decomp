/* 00010304 7C0802A6 */ mflr r0
/* 00010308 90010004 */ stw r0, 4(r1)
/* 0001030C 9421FFA8 */ stwu r1, -0x58(r1)
/* 00010310 DBE10050 */ stfd f31, 0x50(r1)
/* 00010314 BF61003C */ stmw r27, 0x3c(r1)
/* 00010318 7C7C1B78 */ mr r28, r3
/* 0001031C 3BA40000 */ addi r29, r4, 0
/* 00010320 3BC50000 */ addi r30, r5, 0
/* 00010324 C0030004 */ lfs f0, 4(r3)
/* 00010328 3C600000 */ lis r3, lbl_000264A8@ha
/* 0001032C 3BE30000 */ addi r31, r3, lbl_000264A8@l
/* 00010330 D01C0010 */ stfs f0, 0x10(r28)
/* 00010334 387C001C */ addi r3, r28, 0x1c
/* 00010338 C01C0008 */ lfs f0, 8(r28)
/* 0001033C D01C0014 */ stfs f0, 0x14(r28)
/* 00010340 C01C000C */ lfs f0, 0xc(r28)
/* 00010344 D01C0018 */ stfs f0, 0x18(r28)
/* 00010348 C0230000 */ lfs f1, 0(r3)
/* 0001034C C0430004 */ lfs f2, 4(r3)
/* 00010350 C0030008 */ lfs f0, 8(r3)
/* 00010354 EC210072 */ fmuls f1, f1, f1
/* 00010358 EC2208BA */ fmadds f1, f2, f2, f1
/* 0001035C EC20083A */ fmadds f1, f0, f0, f1
/* 00010360 4BFEFE71 */ bl mathutil_sqrt
/* 00010364 D03C00F8 */ stfs f1, 0xf8(r28)
/* 00010368 801C0094 */ lwz r0, 0x94(r28)
/* 0001036C 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00010370 901C0094 */ stw r0, 0x94(r28)
/* 00010374 4BFEFE5D */ bl mathutil_mtxA_from_identity
/* 00010378 881C002E */ lbz r0, 0x2e(r28)
/* 0001037C 3C600000 */ lis r3, worldInfo@ha
/* 00010380 3B630000 */ addi r27, r3, worldInfo@l
/* 00010384 7C000774 */ extsb r0, r0
/* 00010388 54003032 */ slwi r0, r0, 6
/* 0001038C 7C7B0214 */ add r3, r27, r0
/* 00010390 A8630000 */ lha r3, 0(r3)
/* 00010394 4BFEFE3D */ bl mathutil_mtxA_rotate_x
/* 00010398 881C002E */ lbz r0, 0x2e(r28)
/* 0001039C 7C000774 */ extsb r0, r0
/* 000103A0 54003032 */ slwi r0, r0, 6
/* 000103A4 7C7B0214 */ add r3, r27, r0
/* 000103A8 A8630002 */ lha r3, 2(r3)
/* 000103AC 4BFEFE25 */ bl mathutil_mtxA_rotate_z
/* 000103B0 C01F0030 */ lfs f0, 0x30(r31)
/* 000103B4 3861002C */ addi r3, r1, 0x2c
/* 000103B8 38830000 */ addi r4, r3, 0
/* 000103BC D001002C */ stfs f0, 0x2c(r1)
/* 000103C0 C01F0044 */ lfs f0, 0x44(r31)
/* 000103C4 D0010030 */ stfs f0, 0x30(r1)
/* 000103C8 C01F0030 */ lfs f0, 0x30(r31)
/* 000103CC D0010034 */ stfs f0, 0x34(r1)
/* 000103D0 4BFEFE01 */ bl mathutil_mtxA_tf_vec
/* 000103D4 C01F0030 */ lfs f0, 0x30(r31)
/* 000103D8 D0010020 */ stfs f0, 0x20(r1)
/* 000103DC C01C006C */ lfs f0, 0x6c(r28)
/* 000103E0 FC000050 */ fneg f0, f0
/* 000103E4 D0010024 */ stfs f0, 0x24(r1)
/* 000103E8 C01F0030 */ lfs f0, 0x30(r31)
/* 000103EC D0010028 */ stfs f0, 0x28(r1)
/* 000103F0 807C0094 */ lwz r3, 0x94(r28)
/* 000103F4 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 000103F8 41820014 */ beq lbl_0001040C
/* 000103FC C0010024 */ lfs f0, 0x24(r1)
/* 00010400 FC000050 */ fneg f0, f0
/* 00010404 D0010024 */ stfs f0, 0x24(r1)
/* 00010408 48000014 */ b lbl_0001041C
lbl_0001040C:
/* 0001040C 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00010410 4182000C */ beq lbl_0001041C
/* 00010414 C01F0030 */ lfs f0, 0x30(r31)
/* 00010418 D0010024 */ stfs f0, 0x24(r1)
lbl_0001041C:
/* 0001041C 801C0094 */ lwz r0, 0x94(r28)
/* 00010420 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 00010424 40820124 */ bne lbl_00010548
/* 00010428 3C600000 */ lis r3, gameSubmode@ha
/* 0001042C A8030000 */ lha r0, gameSubmode@l(r3)
/* 00010430 2C00000E */ cmpwi r0, 0xe
/* 00010434 41820114 */ beq lbl_00010548
/* 00010438 2C1E0000 */ cmpwi r30, 0
/* 0001043C 4082010C */ bne lbl_00010548
/* 00010440 801C0120 */ lwz r0, 0x120(r28)
/* 00010444 540007FF */ clrlwi. r0, r0, 0x1f
/* 00010448 41820100 */ beq lbl_00010548
/* 0001044C 807C001C */ lwz r3, 0x1c(r28)
/* 00010450 801C0020 */ lwz r0, 0x20(r28)
/* 00010454 90610014 */ stw r3, 0x14(r1)
/* 00010458 90010018 */ stw r0, 0x18(r1)
/* 0001045C 801C0024 */ lwz r0, 0x24(r28)
/* 00010460 9001001C */ stw r0, 0x1c(r1)
/* 00010464 C001001C */ lfs f0, 0x1c(r1)
/* 00010468 C0210014 */ lfs f1, 0x14(r1)
/* 0001046C EC210072 */ fmuls f1, f1, f1
/* 00010470 EC20083A */ fmadds f1, f0, f0, f1
/* 00010474 C01F0070 */ lfs f0, 0x70(r31)
/* 00010478 FC010040 */ fcmpo cr0, f1, f0
/* 0001047C 408100CC */ ble lbl_00010548
/* 00010480 4BFEFD51 */ bl mathutil_sqrt
/* 00010484 C85F0078 */ lfd f2, 0x78(r31)
/* 00010488 3C600000 */ lis r3, cameraInfo@ha
/* 0001048C C0010014 */ lfs f0, 0x14(r1)
/* 00010490 3BC30000 */ addi r30, r3, cameraInfo@l
/* 00010494 FC220824 */ fdiv f1, f2, f1
/* 00010498 FC200818 */ frsp f1, f1
/* 0001049C EC000072 */ fmuls f0, f0, f1
/* 000104A0 D0010014 */ stfs f0, 0x14(r1)
/* 000104A4 C001001C */ lfs f0, 0x1c(r1)
/* 000104A8 EC000072 */ fmuls f0, f0, f1
/* 000104AC D001001C */ stfs f0, 0x1c(r1)
/* 000104B0 881C002E */ lbz r0, 0x2e(r28)
/* 000104B4 7C000774 */ extsb r0, r0
/* 000104B8 1C000284 */ mulli r0, r0, 0x284
/* 000104BC 7C7E0214 */ add r3, r30, r0
/* 000104C0 A863001A */ lha r3, 0x1a(r3)
/* 000104C4 38634000 */ addi r3, r3, 0x4000
/* 000104C8 4BFEFD09 */ bl mathutil_sin
/* 000104CC 881C002E */ lbz r0, 0x2e(r28)
/* 000104D0 FC200850 */ fneg f1, f1
/* 000104D4 C001001C */ lfs f0, 0x1c(r1)
/* 000104D8 7C000774 */ extsb r0, r0
/* 000104DC 1C000284 */ mulli r0, r0, 0x284
/* 000104E0 EFE00072 */ fmuls f31, f0, f1
/* 000104E4 7C7E0214 */ add r3, r30, r0
/* 000104E8 A863001A */ lha r3, 0x1a(r3)
/* 000104EC 4BFEFCE5 */ bl mathutil_sin
/* 000104F0 FC400850 */ fneg f2, f1
/* 000104F4 C0210014 */ lfs f1, 0x14(r1)
/* 000104F8 C81F0080 */ lfd f0, 0x80(r31)
/* 000104FC EC2100B2 */ fmuls f1, f1, f2
/* 00010500 EC21F82A */ fadds f1, f1, f31
/* 00010504 FC010040 */ fcmpo cr0, f1, f0
/* 00010508 40800040 */ bge lbl_00010548
/* 0001050C FC200850 */ fneg f1, f1
/* 00010510 C85F0088 */ lfd f2, 0x88(r31)
/* 00010514 C87F0078 */ lfd f3, 0x78(r31)
/* 00010518 C0010020 */ lfs f0, 0x20(r1)
/* 0001051C FC220072 */ fmul f1, f2, f1
/* 00010520 FC23082A */ fadd f1, f3, f1
/* 00010524 FC200818 */ frsp f1, f1
/* 00010528 EC000072 */ fmuls f0, f0, f1
/* 0001052C D0010020 */ stfs f0, 0x20(r1)
/* 00010530 C0010024 */ lfs f0, 0x24(r1)
/* 00010534 EC000072 */ fmuls f0, f0, f1
/* 00010538 D0010024 */ stfs f0, 0x24(r1)
/* 0001053C C0010028 */ lfs f0, 0x28(r1)
/* 00010540 EC000072 */ fmuls f0, f0, f1
/* 00010544 D0010028 */ stfs f0, 0x28(r1)
lbl_00010548:
/* 00010548 4BFEFC89 */ bl mathutil_mtxA_from_identity
/* 0001054C 881C002E */ lbz r0, 0x2e(r28)
/* 00010550 3C600000 */ lis r3, worldInfo@ha
/* 00010554 3BC30000 */ addi r30, r3, worldInfo@l
/* 00010558 7C000774 */ extsb r0, r0
/* 0001055C 54003032 */ slwi r0, r0, 6
/* 00010560 7C7E0214 */ add r3, r30, r0
/* 00010564 A8630000 */ lha r3, 0(r3)
/* 00010568 4BFEFC69 */ bl mathutil_mtxA_rotate_x
/* 0001056C 881C002E */ lbz r0, 0x2e(r28)
/* 00010570 7C000774 */ extsb r0, r0
/* 00010574 54003032 */ slwi r0, r0, 6
/* 00010578 7C7E0214 */ add r3, r30, r0
/* 0001057C A8630002 */ lha r3, 2(r3)
/* 00010580 4BFEFC51 */ bl mathutil_mtxA_rotate_z
/* 00010584 38610020 */ addi r3, r1, 0x20
/* 00010588 38830000 */ addi r4, r3, 0
/* 0001058C 4BFEFC45 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00010590 C03C001C */ lfs f1, 0x1c(r28)
/* 00010594 7F83E378 */ mr r3, r28
/* 00010598 C0010020 */ lfs f0, 0x20(r1)
/* 0001059C 7FA4EB78 */ mr r4, r29
/* 000105A0 EC01002A */ fadds f0, f1, f0
/* 000105A4 D01C001C */ stfs f0, 0x1c(r28)
/* 000105A8 C03C0020 */ lfs f1, 0x20(r28)
/* 000105AC C0010024 */ lfs f0, 0x24(r1)
/* 000105B0 EC01002A */ fadds f0, f1, f0
/* 000105B4 D01C0020 */ stfs f0, 0x20(r28)
/* 000105B8 C03C0024 */ lfs f1, 0x24(r28)
/* 000105BC C0010028 */ lfs f0, 0x28(r1)
/* 000105C0 EC01002A */ fadds f0, f1, f0
/* 000105C4 D01C0024 */ stfs f0, 0x24(r28)
/* 000105C8 C03C0004 */ lfs f1, 4(r28)
/* 000105CC C01C001C */ lfs f0, 0x1c(r28)
/* 000105D0 EC01002A */ fadds f0, f1, f0
/* 000105D4 D01C0004 */ stfs f0, 4(r28)
/* 000105D8 C03C0008 */ lfs f1, 8(r28)
/* 000105DC C01C0020 */ lfs f0, 0x20(r28)
/* 000105E0 EC01002A */ fadds f0, f1, f0
/* 000105E4 D01C0008 */ stfs f0, 8(r28)
/* 000105E8 C03C000C */ lfs f1, 0xc(r28)
/* 000105EC C01C0024 */ lfs f0, 0x24(r28)
/* 000105F0 EC01002A */ fadds f0, f1, f0
/* 000105F4 D01C000C */ stfs f0, 0xc(r28)
/* 000105F8 4BFEFBD9 */ bl init_physball_from_ball
/* 000105FC 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010600 80830000 */ lwz r4, decodedStageLzPtr@l(r3)
/* 00010604 7FA3EB78 */ mr r3, r29
/* 00010608 4BFFFACD */ bl lbl_000100D4
/* 0001060C 387C0000 */ addi r3, r28, 0
/* 00010610 389D0000 */ addi r4, r29, 0
/* 00010614 4BFEFBBD */ bl set_ball_pos_and_vel_from_physball
/* 00010618 801D0000 */ lwz r0, 0(r29)
/* 0001061C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00010620 41820080 */ beq lbl_000106A0
/* 00010624 801D0050 */ lwz r0, 0x50(r29)
/* 00010628 2C000000 */ cmpwi r0, 0
/* 0001062C 4082002C */ bne lbl_00010658
/* 00010630 C01D0044 */ lfs f0, 0x44(r29)
/* 00010634 FC000050 */ fneg f0, f0
/* 00010638 D01C0114 */ stfs f0, 0x114(r28)
/* 0001063C C01D0048 */ lfs f0, 0x48(r29)
/* 00010640 FC000050 */ fneg f0, f0
/* 00010644 D01C0118 */ stfs f0, 0x118(r28)
/* 00010648 C01D004C */ lfs f0, 0x4c(r29)
/* 0001064C FC000050 */ fneg f0, f0
/* 00010650 D01C011C */ stfs f0, 0x11c(r28)
/* 00010654 4800004C */ b lbl_000106A0
lbl_00010658:
/* 00010658 1C800084 */ mulli r4, r0, 0x84
/* 0001065C 3C600000 */ lis r3, animGroups@ha
/* 00010660 38030000 */ addi r0, r3, animGroups@l
/* 00010664 7C602214 */ add r3, r0, r4
/* 00010668 38630024 */ addi r3, r3, 0x24
/* 0001066C 4BFEFB65 */ bl mathutil_mtxA_from_mtx
/* 00010670 387D0044 */ addi r3, r29, 0x44
/* 00010674 389C0114 */ addi r4, r28, 0x114
/* 00010678 4BFEFB59 */ bl mathutil_mtxA_tf_vec
/* 0001067C C01C0114 */ lfs f0, 0x114(r28)
/* 00010680 FC000050 */ fneg f0, f0
/* 00010684 D01C0114 */ stfs f0, 0x114(r28)
/* 00010688 C01C0118 */ lfs f0, 0x118(r28)
/* 0001068C FC000050 */ fneg f0, f0
/* 00010690 D01C0118 */ stfs f0, 0x118(r28)
/* 00010694 C01C011C */ lfs f0, 0x11c(r28)
/* 00010698 FC000050 */ fneg f0, f0
/* 0001069C D01C011C */ stfs f0, 0x11c(r28)
lbl_000106A0:
/* 000106A0 BB61003C */ lmw r27, 0x3c(r1)
/* 000106A4 8001005C */ lwz r0, 0x5c(r1)
/* 000106A8 CBE10050 */ lfd f31, 0x50(r1)
/* 000106AC 38210058 */ addi r1, r1, 0x58
/* 000106B0 7C0803A6 */ mtlr r0
/* 000106B4 4E800020 */ blr 
