/* 0000E3A4 7C0802A6 */ mflr r0
/* 0000E3A8 3D000000 */ lis r8, lbl_0001CF00@ha
/* 0000E3AC 90010004 */ stw r0, 4(r1)
/* 0000E3B0 9421FF50 */ stwu r1, -0xb0(r1)
/* 0000E3B4 DBE100A8 */ stfd f31, 0xa8(r1)
/* 0000E3B8 DBC100A0 */ stfd f30, 0xa0(r1)
/* 0000E3BC DBA10098 */ stfd f29, 0x98(r1)
/* 0000E3C0 DB810090 */ stfd f28, 0x90(r1)
/* 0000E3C4 DB610088 */ stfd f27, 0x88(r1)
/* 0000E3C8 FF601890 */ fmr f27, f3
/* 0000E3CC DB410080 */ stfd f26, 0x80(r1)
/* 0000E3D0 FF401090 */ fmr f26, f2
/* 0000E3D4 DB210078 */ stfd f25, 0x78(r1)
/* 0000E3D8 FF200890 */ fmr f25, f1
/* 0000E3DC BEC10050 */ stmw r22, 0x50(r1)
/* 0000E3E0 3BE80000 */ addi r31, r8, lbl_0001CF00@l
/* 0000E3E4 7C9B2378 */ mr r27, r4
/* 0000E3E8 7CBC2B79 */ or. r28, r5, r5
/* 0000E3EC 7CDD3378 */ mr r29, r6
/* 0000E3F0 7C7A1B78 */ mr r26, r3
/* 0000E3F4 3BC70000 */ addi r30, r7, 0
/* 0000E3F8 38800000 */ li r4, 0
/* 0000E3FC C01F0020 */ lfs f0, 0x20(r31)
/* 0000E400 D0060000 */ stfs f0, 0(r6)
/* 0000E404 C01F0020 */ lfs f0, 0x20(r31)
/* 0000E408 D0060004 */ stfs f0, 4(r6)
/* 0000E40C C01F0020 */ lfs f0, 0x20(r31)
/* 0000E410 D0060008 */ stfs f0, 8(r6)
/* 0000E414 40810200 */ ble lbl_0000E614
/* 0000E418 2C1C0008 */ cmpwi r28, 8
/* 0000E41C 387CFFF8 */ addi r3, r28, -8
/* 0000E420 40810474 */ ble lbl_0000E894
/* 0000E424 38030007 */ addi r0, r3, 7
/* 0000E428 5400E8FE */ srwi r0, r0, 3
/* 0000E42C 2C030000 */ cmpwi r3, 0
/* 0000E430 7C0903A6 */ mtctr r0
/* 0000E434 387A0000 */ addi r3, r26, 0
/* 0000E438 4081045C */ ble lbl_0000E894
lbl_0000E43C:
/* 0000E43C C03D0000 */ lfs f1, 0(r29)
/* 0000E440 38840008 */ addi r4, r4, 8
/* 0000E444 C0030000 */ lfs f0, 0(r3)
/* 0000E448 EC01002A */ fadds f0, f1, f0
/* 0000E44C D01D0000 */ stfs f0, 0(r29)
/* 0000E450 C03D0004 */ lfs f1, 4(r29)
/* 0000E454 C0030004 */ lfs f0, 4(r3)
/* 0000E458 EC01002A */ fadds f0, f1, f0
/* 0000E45C D01D0004 */ stfs f0, 4(r29)
/* 0000E460 C03D0008 */ lfs f1, 8(r29)
/* 0000E464 C0030008 */ lfs f0, 8(r3)
/* 0000E468 EC01002A */ fadds f0, f1, f0
/* 0000E46C D01D0008 */ stfs f0, 8(r29)
/* 0000E470 C03D0000 */ lfs f1, 0(r29)
/* 0000E474 C003000C */ lfs f0, 0xc(r3)
/* 0000E478 EC01002A */ fadds f0, f1, f0
/* 0000E47C D01D0000 */ stfs f0, 0(r29)
/* 0000E480 C03D0004 */ lfs f1, 4(r29)
/* 0000E484 C0030010 */ lfs f0, 0x10(r3)
/* 0000E488 EC01002A */ fadds f0, f1, f0
/* 0000E48C D01D0004 */ stfs f0, 4(r29)
/* 0000E490 C03D0008 */ lfs f1, 8(r29)
/* 0000E494 C0030014 */ lfs f0, 0x14(r3)
/* 0000E498 EC01002A */ fadds f0, f1, f0
/* 0000E49C D01D0008 */ stfs f0, 8(r29)
/* 0000E4A0 C03D0000 */ lfs f1, 0(r29)
/* 0000E4A4 C0030018 */ lfs f0, 0x18(r3)
/* 0000E4A8 EC01002A */ fadds f0, f1, f0
/* 0000E4AC D01D0000 */ stfs f0, 0(r29)
/* 0000E4B0 C03D0004 */ lfs f1, 4(r29)
/* 0000E4B4 C003001C */ lfs f0, 0x1c(r3)
/* 0000E4B8 EC01002A */ fadds f0, f1, f0
/* 0000E4BC D01D0004 */ stfs f0, 4(r29)
/* 0000E4C0 C03D0008 */ lfs f1, 8(r29)
/* 0000E4C4 C0030020 */ lfs f0, 0x20(r3)
/* 0000E4C8 EC01002A */ fadds f0, f1, f0
/* 0000E4CC D01D0008 */ stfs f0, 8(r29)
/* 0000E4D0 C03D0000 */ lfs f1, 0(r29)
/* 0000E4D4 C0030024 */ lfs f0, 0x24(r3)
/* 0000E4D8 EC01002A */ fadds f0, f1, f0
/* 0000E4DC D01D0000 */ stfs f0, 0(r29)
/* 0000E4E0 C03D0004 */ lfs f1, 4(r29)
/* 0000E4E4 C0030028 */ lfs f0, 0x28(r3)
/* 0000E4E8 EC01002A */ fadds f0, f1, f0
/* 0000E4EC D01D0004 */ stfs f0, 4(r29)
/* 0000E4F0 C03D0008 */ lfs f1, 8(r29)
/* 0000E4F4 C003002C */ lfs f0, 0x2c(r3)
/* 0000E4F8 EC01002A */ fadds f0, f1, f0
/* 0000E4FC D01D0008 */ stfs f0, 8(r29)
/* 0000E500 C03D0000 */ lfs f1, 0(r29)
/* 0000E504 C0030030 */ lfs f0, 0x30(r3)
/* 0000E508 EC01002A */ fadds f0, f1, f0
/* 0000E50C D01D0000 */ stfs f0, 0(r29)
/* 0000E510 C03D0004 */ lfs f1, 4(r29)
/* 0000E514 C0030034 */ lfs f0, 0x34(r3)
/* 0000E518 EC01002A */ fadds f0, f1, f0
/* 0000E51C D01D0004 */ stfs f0, 4(r29)
/* 0000E520 C03D0008 */ lfs f1, 8(r29)
/* 0000E524 C0030038 */ lfs f0, 0x38(r3)
/* 0000E528 EC01002A */ fadds f0, f1, f0
/* 0000E52C D01D0008 */ stfs f0, 8(r29)
/* 0000E530 C03D0000 */ lfs f1, 0(r29)
/* 0000E534 C003003C */ lfs f0, 0x3c(r3)
/* 0000E538 EC01002A */ fadds f0, f1, f0
/* 0000E53C D01D0000 */ stfs f0, 0(r29)
/* 0000E540 C03D0004 */ lfs f1, 4(r29)
/* 0000E544 C0030040 */ lfs f0, 0x40(r3)
/* 0000E548 EC01002A */ fadds f0, f1, f0
/* 0000E54C D01D0004 */ stfs f0, 4(r29)
/* 0000E550 C03D0008 */ lfs f1, 8(r29)
/* 0000E554 C0030044 */ lfs f0, 0x44(r3)
/* 0000E558 EC01002A */ fadds f0, f1, f0
/* 0000E55C D01D0008 */ stfs f0, 8(r29)
/* 0000E560 C03D0000 */ lfs f1, 0(r29)
/* 0000E564 C0030048 */ lfs f0, 0x48(r3)
/* 0000E568 EC01002A */ fadds f0, f1, f0
/* 0000E56C D01D0000 */ stfs f0, 0(r29)
/* 0000E570 C03D0004 */ lfs f1, 4(r29)
/* 0000E574 C003004C */ lfs f0, 0x4c(r3)
/* 0000E578 EC01002A */ fadds f0, f1, f0
/* 0000E57C D01D0004 */ stfs f0, 4(r29)
/* 0000E580 C03D0008 */ lfs f1, 8(r29)
/* 0000E584 C0030050 */ lfs f0, 0x50(r3)
/* 0000E588 EC01002A */ fadds f0, f1, f0
/* 0000E58C D01D0008 */ stfs f0, 8(r29)
/* 0000E590 C03D0000 */ lfs f1, 0(r29)
/* 0000E594 C0030054 */ lfs f0, 0x54(r3)
/* 0000E598 EC01002A */ fadds f0, f1, f0
/* 0000E59C D01D0000 */ stfs f0, 0(r29)
/* 0000E5A0 C03D0004 */ lfs f1, 4(r29)
/* 0000E5A4 C0030058 */ lfs f0, 0x58(r3)
/* 0000E5A8 EC01002A */ fadds f0, f1, f0
/* 0000E5AC D01D0004 */ stfs f0, 4(r29)
/* 0000E5B0 C003005C */ lfs f0, 0x5c(r3)
/* 0000E5B4 38630060 */ addi r3, r3, 0x60
/* 0000E5B8 C03D0008 */ lfs f1, 8(r29)
/* 0000E5BC EC01002A */ fadds f0, f1, f0
/* 0000E5C0 D01D0008 */ stfs f0, 8(r29)
/* 0000E5C4 4200FE78 */ bdnz lbl_0000E43C
/* 0000E5C8 480002CC */ b lbl_0000E894
lbl_0000E5CC:
/* 0000E5CC 7C04E050 */ subf r0, r4, r28
/* 0000E5D0 7C04E000 */ cmpw r4, r28
/* 0000E5D4 7C0903A6 */ mtctr r0
/* 0000E5D8 4080003C */ bge lbl_0000E614
lbl_0000E5DC:
/* 0000E5DC C03D0000 */ lfs f1, 0(r29)
/* 0000E5E0 C0030000 */ lfs f0, 0(r3)
/* 0000E5E4 EC01002A */ fadds f0, f1, f0
/* 0000E5E8 D01D0000 */ stfs f0, 0(r29)
/* 0000E5EC C03D0004 */ lfs f1, 4(r29)
/* 0000E5F0 C0030004 */ lfs f0, 4(r3)
/* 0000E5F4 EC01002A */ fadds f0, f1, f0
/* 0000E5F8 D01D0004 */ stfs f0, 4(r29)
/* 0000E5FC C0030008 */ lfs f0, 8(r3)
/* 0000E600 3863000C */ addi r3, r3, 0xc
/* 0000E604 C03D0008 */ lfs f1, 8(r29)
/* 0000E608 EC01002A */ fadds f0, f1, f0
/* 0000E60C D01D0008 */ stfs f0, 8(r29)
/* 0000E610 4200FFCC */ bdnz lbl_0000E5DC
lbl_0000E614:
/* 0000E614 6F808000 */ xoris r0, r28, 0x8000
/* 0000E618 C07F0028 */ lfs f3, 0x28(r31)
/* 0000E61C 9001004C */ stw r0, 0x4c(r1)
/* 0000E620 3C004330 */ lis r0, 0x4330
/* 0000E624 3C600000 */ lis r3, lbl_0001CF50@ha
/* 0000E628 C01D0000 */ lfs f0, 0(r29)
/* 0000E62C 90010048 */ stw r0, 0x48(r1)
/* 0000E630 C8430000 */ lfd f2, lbl_0001CF50@l(r3)
/* 0000E634 7FA3EB78 */ mr r3, r29
/* 0000E638 C8210048 */ lfd f1, 0x48(r1)
/* 0000E63C EC211028 */ fsubs f1, f1, f2
/* 0000E640 EC230824 */ fdivs f1, f3, f1
/* 0000E644 EC000072 */ fmuls f0, f0, f1
/* 0000E648 D01D0000 */ stfs f0, 0(r29)
/* 0000E64C C01D0004 */ lfs f0, 4(r29)
/* 0000E650 EC000072 */ fmuls f0, f0, f1
/* 0000E654 D01D0004 */ stfs f0, 4(r29)
/* 0000E658 C01D0008 */ lfs f0, 8(r29)
/* 0000E65C EC000072 */ fmuls f0, f0, f1
/* 0000E660 D01D0008 */ stfs f0, 8(r29)
/* 0000E664 4BFF1AD1 */ bl mathutil_vec_normalize_len
/* 0000E668 3AC00000 */ li r22, 0
lbl_0000E66C:
/* 0000E66C 4BFF1AC9 */ bl mathutil_mtxA_from_identity
/* 0000E670 C01D0000 */ lfs f0, 0(r29)
/* 0000E674 C03D0008 */ lfs f1, 8(r29)
/* 0000E678 EC400032 */ fmuls f2, f0, f0
/* 0000E67C C01F0024 */ lfs f0, 0x24(r31)
/* 0000E680 EC210072 */ fmuls f1, f1, f1
/* 0000E684 EC22082A */ fadds f1, f2, f1
/* 0000E688 FC010040 */ fcmpo cr0, f1, f0
/* 0000E68C FF800890 */ fmr f28, f1
/* 0000E690 40800008 */ bge lbl_0000E698
/* 0000E694 FF800090 */ fmr f28, f0
lbl_0000E698:
/* 0000E698 FC20E090 */ fmr f1, f28
/* 0000E69C 3861002C */ addi r3, r1, 0x2c
/* 0000E6A0 4BFF1A95 */ bl func_8000716C
/* 0000E6A4 C01D0004 */ lfs f0, 4(r29)
/* 0000E6A8 FFA00890 */ fmr f29, f1
/* 0000E6AC EC000032 */ fmuls f0, f0, f0
/* 0000E6B0 EC3C002A */ fadds f1, f28, f0
/* 0000E6B4 4BFF1A81 */ bl mathutil_rsqrt
/* 0000E6B8 C01D0008 */ lfs f0, 8(r29)
/* 0000E6BC FF800890 */ fmr f28, f1
/* 0000E6C0 C03D0000 */ lfs f1, 0(r29)
/* 0000E6C4 EC400772 */ fmuls f2, f0, f29
/* 0000E6C8 EC210772 */ fmuls f1, f1, f29
/* 0000E6CC 4BFF1A69 */ bl mathutil_mtxA_rotate_y_sin_cos
/* 0000E6D0 FC40E050 */ fneg f2, f28
/* 0000E6D4 C03D0004 */ lfs f1, 4(r29)
/* 0000E6D8 C001002C */ lfs f0, 0x2c(r1)
/* 0000E6DC EC210732 */ fmuls f1, f1, f28
/* 0000E6E0 EC420032 */ fmuls f2, f2, f0
/* 0000E6E4 4BFF1A51 */ bl mathutil_mtxA_rotate_x_sin_cos
/* 0000E6E8 C39F0020 */ lfs f28, 0x20(r31)
/* 0000E6EC 3AE00000 */ li r23, 0
/* 0000E6F0 1C17000C */ mulli r0, r23, 0xc
/* 0000E6F4 FFA0E090 */ fmr f29, f28
/* 0000E6F8 7F78DB78 */ mr r24, r27
/* 0000E6FC FFC0E890 */ fmr f30, f29
/* 0000E700 7F3A0214 */ add r25, r26, r0
/* 0000E704 FFE0F090 */ fmr f31, f30
/* 0000E708 4800008C */ b lbl_0000E794
lbl_0000E70C:
/* 0000E70C 38790000 */ addi r3, r25, 0
/* 0000E710 3881003C */ addi r4, r1, 0x3c
/* 0000E714 4BFF1A21 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 0000E718 C05F00BC */ lfs f2, 0xbc(r31)
/* 0000E71C C0210044 */ lfs f1, 0x44(r1)
/* 0000E720 C001003C */ lfs f0, 0x3c(r1)
/* 0000E724 EC220824 */ fdivs f1, f2, f1
/* 0000E728 EC000072 */ fmuls f0, f0, f1
/* 0000E72C D001003C */ stfs f0, 0x3c(r1)
/* 0000E730 C0010040 */ lfs f0, 0x40(r1)
/* 0000E734 EC000072 */ fmuls f0, f0, f1
/* 0000E738 D0010040 */ stfs f0, 0x40(r1)
/* 0000E73C C021003C */ lfs f1, 0x3c(r1)
/* 0000E740 C0180000 */ lfs f0, 0(r24)
/* 0000E744 EC41002A */ fadds f2, f1, f0
/* 0000E748 FC02F840 */ fcmpo cr0, f2, f31
/* 0000E74C 40810008 */ ble lbl_0000E754
/* 0000E750 FFE01090 */ fmr f31, f2
lbl_0000E754:
/* 0000E754 EC210028 */ fsubs f1, f1, f0
/* 0000E758 FC01E840 */ fcmpo cr0, f1, f29
/* 0000E75C 40800008 */ bge lbl_0000E764
/* 0000E760 FFA00890 */ fmr f29, f1
lbl_0000E764:
/* 0000E764 C0210040 */ lfs f1, 0x40(r1)
/* 0000E768 EC41002A */ fadds f2, f1, f0
/* 0000E76C FC02F040 */ fcmpo cr0, f2, f30
/* 0000E770 40810008 */ ble lbl_0000E778
/* 0000E774 FFC01090 */ fmr f30, f2
lbl_0000E778:
/* 0000E778 EC010028 */ fsubs f0, f1, f0
/* 0000E77C FC00E040 */ fcmpo cr0, f0, f28
/* 0000E780 40800008 */ bge lbl_0000E788
/* 0000E784 FF800090 */ fmr f28, f0
lbl_0000E788:
/* 0000E788 3B39000C */ addi r25, r25, 0xc
/* 0000E78C 3B180004 */ addi r24, r24, 4
/* 0000E790 3AF70001 */ addi r23, r23, 1
lbl_0000E794:
/* 0000E794 7C17E000 */ cmpw r23, r28
/* 0000E798 4180FF74 */ blt lbl_0000E70C
/* 0000E79C EC3FE82A */ fadds f1, f31, f29
/* 0000E7A0 C05F001C */ lfs f2, 0x1c(r31)
/* 0000E7A4 EC1EE02A */ fadds f0, f30, f28
/* 0000E7A8 389D0000 */ addi r4, r29, 0
/* 0000E7AC 38610030 */ addi r3, r1, 0x30
/* 0000E7B0 EC220072 */ fmuls f1, f2, f1
/* 0000E7B4 D0210030 */ stfs f1, 0x30(r1)
/* 0000E7B8 C03F001C */ lfs f1, 0x1c(r31)
/* 0000E7BC EC010032 */ fmuls f0, f1, f0
/* 0000E7C0 D0010034 */ stfs f0, 0x34(r1)
/* 0000E7C4 C01F00BC */ lfs f0, 0xbc(r31)
/* 0000E7C8 D0010038 */ stfs f0, 0x38(r1)
/* 0000E7CC 4BFF1969 */ bl mathutil_mtxA_tf_vec
/* 0000E7D0 7FA3EB78 */ mr r3, r29
/* 0000E7D4 4BFF1961 */ bl mathutil_vec_normalize_len
/* 0000E7D8 C0010030 */ lfs f0, 0x30(r1)
/* 0000E7DC 3AD60001 */ addi r22, r22, 1
/* 0000E7E0 C83F00C0 */ lfd f1, 0xc0(r31)
/* 0000E7E4 FC000210 */ fabs f0, f0
/* 0000E7E8 FC000840 */ fcmpo cr0, f0, f1
/* 0000E7EC 41810014 */ bgt lbl_0000E800
/* 0000E7F0 C0010034 */ lfs f0, 0x34(r1)
/* 0000E7F4 FC000210 */ fabs f0, f0
/* 0000E7F8 FC000840 */ fcmpo cr0, f0, f1
/* 0000E7FC 4081000C */ ble lbl_0000E808
lbl_0000E800:
/* 0000E800 2C1603E8 */ cmpwi r22, 0x3e8
/* 0000E804 4180FE68 */ blt lbl_0000E66C
lbl_0000E808:
/* 0000E808 EFFF0672 */ fmuls f31, f31, f25
/* 0000E80C FC1FF040 */ fcmpo cr0, f31, f30
/* 0000E810 4081000C */ ble lbl_0000E81C
/* 0000E814 FF20F890 */ fmr f25, f31
/* 0000E818 48000008 */ b lbl_0000E820
lbl_0000E81C:
/* 0000E81C FF20F090 */ fmr f25, f30
lbl_0000E820:
/* 0000E820 EC3906B2 */ fmuls f1, f25, f26
/* 0000E824 4BFF1911 */ bl mathutil_atan
/* 0000E828 7C600734 */ extsh r0, r3
/* 0000E82C FC20DA10 */ fabs f1, f27
/* 0000E830 5400083C */ slwi r0, r0, 1
/* 0000E834 6C008000 */ xoris r0, r0, 0x8000
/* 0000E838 9001004C */ stw r0, 0x4c(r1)
/* 0000E83C 3C004330 */ lis r0, 0x4330
/* 0000E840 3C600000 */ lis r3, lbl_0001CF50@ha
/* 0000E844 90010048 */ stw r0, 0x48(r1)
/* 0000E848 C8430000 */ lfd f2, lbl_0001CF50@l(r3)
/* 0000E84C C8010048 */ lfd f0, 0x48(r1)
/* 0000E850 EC001028 */ fsubs f0, f0, f2
/* 0000E854 D01E0000 */ stfs f0, 0(r30)
/* 0000E858 C81F00C8 */ lfd f0, 0xc8(r31)
/* 0000E85C FC010040 */ fcmpo cr0, f1, f0
/* 0000E860 4081002C */ ble lbl_0000E88C
/* 0000E864 EC1B0672 */ fmuls f0, f27, f25
/* 0000E868 C0410034 */ lfs f2, 0x34(r1)
/* 0000E86C C0210030 */ lfs f1, 0x30(r1)
/* 0000E870 7FA3EB78 */ mr r3, r29
/* 0000E874 C0610038 */ lfs f3, 0x38(r1)
/* 0000E878 EC1A0032 */ fmuls f0, f26, f0
/* 0000E87C EC42002A */ fadds f2, f2, f0
/* 0000E880 4BFF18B5 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000E884 7FA3EB78 */ mr r3, r29
/* 0000E888 4BFF18AD */ bl mathutil_vec_normalize_len
lbl_0000E88C:
/* 0000E88C 7EC3B378 */ mr r3, r22
/* 0000E890 48000010 */ b lbl_0000E8A0
lbl_0000E894:
/* 0000E894 1C04000C */ mulli r0, r4, 0xc
/* 0000E898 7C7A0214 */ add r3, r26, r0
/* 0000E89C 4BFFFD30 */ b lbl_0000E5CC
lbl_0000E8A0:
/* 0000E8A0 BAC10050 */ lmw r22, 0x50(r1)
/* 0000E8A4 800100B4 */ lwz r0, 0xb4(r1)
/* 0000E8A8 CBE100A8 */ lfd f31, 0xa8(r1)
/* 0000E8AC CBC100A0 */ lfd f30, 0xa0(r1)
/* 0000E8B0 7C0803A6 */ mtlr r0
/* 0000E8B4 CBA10098 */ lfd f29, 0x98(r1)
/* 0000E8B8 CB810090 */ lfd f28, 0x90(r1)
/* 0000E8BC CB610088 */ lfd f27, 0x88(r1)
/* 0000E8C0 CB410080 */ lfd f26, 0x80(r1)
/* 0000E8C4 CB210078 */ lfd f25, 0x78(r1)
/* 0000E8C8 382100B0 */ addi r1, r1, 0xb0
/* 0000E8CC 4E800020 */ blr 
