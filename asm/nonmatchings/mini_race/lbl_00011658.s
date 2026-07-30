/* 00011658 7C0802A6 */ mflr r0
/* 0001165C 90010004 */ stw r0, 4(r1)
/* 00011660 9421FFA0 */ stwu r1, -0x60(r1)
/* 00011664 DBE10058 */ stfd f31, 0x58(r1)
/* 00011668 DBC10050 */ stfd f30, 0x50(r1)
/* 0001166C DBA10048 */ stfd f29, 0x48(r1)
/* 00011670 BF21002C */ stmw r25, 0x2c(r1)
/* 00011674 7C7A1B78 */ mr r26, r3
/* 00011678 A8030006 */ lha r0, 6(r3)
/* 0001167C 3C600000 */ lis r3, lbl_00013F40@ha
/* 00011680 3BC30000 */ addi r30, r3, lbl_00013F40@l
/* 00011684 839A001C */ lwz r28, 0x1c(r26)
/* 00011688 2C000000 */ cmpwi r0, 0
/* 0001168C C3FA0014 */ lfs f31, 0x14(r26)
/* 00011690 C3BE0034 */ lfs f29, 0x34(r30)
/* 00011694 40820018 */ bne lbl_000116AC
/* 00011698 A81A0012 */ lha r0, 0x12(r26)
/* 0001169C 2C00003C */ cmpwi r0, 0x3c
/* 000116A0 4080000C */ bge lbl_000116AC
/* 000116A4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000116A8 408201A8 */ bne lbl_00011850
lbl_000116AC:
/* 000116AC 3C800000 */ lis r4, minigameGma@ha
/* 000116B0 3C600000 */ lis r3, mathutilData@ha
/* 000116B4 3BA10018 */ addi r29, r1, 0x18
/* 000116B8 3BE40000 */ addi r31, r4, minigameGma@l
/* 000116BC 3B230000 */ addi r25, r3, mathutilData@l
/* 000116C0 48000184 */ b lbl_00011844
lbl_000116C4:
/* 000116C4 80DF0000 */ lwz r6, 0(r31)
/* 000116C8 54651838 */ slwi r5, r3, 3
/* 000116CC 809E0028 */ lwz r4, 0x28(r30)
/* 000116D0 38610018 */ addi r3, r1, 0x18
/* 000116D4 80C60008 */ lwz r6, 8(r6)
/* 000116D8 801E002C */ lwz r0, 0x2c(r30)
/* 000116DC 7F66282E */ lwzx r27, r6, r5
/* 000116E0 9081000C */ stw r4, 0xc(r1)
/* 000116E4 90010010 */ stw r0, 0x10(r1)
/* 000116E8 801E0030 */ lwz r0, 0x30(r30)
/* 000116EC 90010014 */ stw r0, 0x14(r1)
/* 000116F0 C01A0020 */ lfs f0, 0x20(r26)
/* 000116F4 D001000C */ stfs f0, 0xc(r1)
/* 000116F8 C01C0008 */ lfs f0, 8(r28)
/* 000116FC C03C0004 */ lfs f1, 4(r28)
/* 00011700 EC1F0024 */ fdivs f0, f31, f0
/* 00011704 C05A0024 */ lfs f2, 0x24(r26)
/* 00011708 EC010032 */ fmuls f0, f1, f0
/* 0001170C EC02002A */ fadds f0, f2, f0
/* 00011710 D0010010 */ stfs f0, 0x10(r1)
/* 00011714 C01A0028 */ lfs f0, 0x28(r26)
/* 00011718 D0010014 */ stfs f0, 0x14(r1)
/* 0001171C 8081000C */ lwz r4, 0xc(r1)
/* 00011720 80010010 */ lwz r0, 0x10(r1)
/* 00011724 90810018 */ stw r4, 0x18(r1)
/* 00011728 9001001C */ stw r0, 0x1c(r1)
/* 0001172C 80010014 */ lwz r0, 0x14(r1)
/* 00011730 90010020 */ stw r0, 0x20(r1)
/* 00011734 4BFEEA49 */ bl mathutil_mtxA_from_mtxB_translate
/* 00011738 801C000C */ lwz r0, 0xc(r28)
/* 0001173C 2C000000 */ cmpwi r0, 0
/* 00011740 4182000C */ beq lbl_0001174C
/* 00011744 4BFEEA39 */ bl mathutil_mtxA_sq_from_identity
/* 00011748 4800001C */ b lbl_00011764
lbl_0001174C:
/* 0001174C A87A003A */ lha r3, 0x3a(r26)
/* 00011750 4BFEEA2D */ bl mathutil_mtxA_rotate_y
/* 00011754 A87A0038 */ lha r3, 0x38(r26)
/* 00011758 4BFEEA25 */ bl mathutil_mtxA_rotate_x
/* 0001175C A87A003C */ lha r3, 0x3c(r26)
/* 00011760 4BFEEA1D */ bl mathutil_mtxA_rotate_z
lbl_00011764:
/* 00011764 C03B0014 */ lfs f1, 0x14(r27)
/* 00011768 C01E0038 */ lfs f0, 0x38(r30)
/* 0001176C EFDF0824 */ fdivs f30, f31, f1
/* 00011770 FC00F000 */ fcmpu cr0, f0, f30
/* 00011774 41820014 */ beq lbl_00011788
/* 00011778 FC20F090 */ fmr f1, f30
/* 0001177C FC40F090 */ fmr f2, f30
/* 00011780 FC60F090 */ fmr f3, f30
/* 00011784 4BFEE9F9 */ bl mathutil_mtxA_scale_xyz
lbl_00011788:
/* 00011788 C01E0000 */ lfs f0, 0(r30)
/* 0001178C FC1D0040 */ fcmpo cr0, f29, f0
/* 00011790 4080008C */ bge lbl_0001181C
/* 00011794 FC40F090 */ fmr f2, f30
/* 00011798 C03B0014 */ lfs f1, 0x14(r27)
/* 0001179C 387B0008 */ addi r3, r27, 8
/* 000117A0 4BFEE9DD */ bl test_scaled_sphere_in_frustum
/* 000117A4 2C030000 */ cmpwi r3, 0
/* 000117A8 418200A8 */ beq lbl_00011850
/* 000117AC 389D0004 */ addi r4, r29, 4
/* 000117B0 387D0008 */ addi r3, r29, 8
/* 000117B4 3CA0E000 */ lis r5, 0xe000
/* 000117B8 C045000C */ lfs f2, 0xc(r5)
/* 000117BC C025001C */ lfs f1, 0x1c(r5)
/* 000117C0 C005002C */ lfs f0, 0x2c(r5)
/* 000117C4 D0410018 */ stfs f2, 0x18(r1)
/* 000117C8 D0240000 */ stfs f1, 0(r4)
/* 000117CC D0030000 */ stfs f0, 0(r3)
/* 000117D0 A81A0006 */ lha r0, 6(r26)
/* 000117D4 2C000004 */ cmpwi r0, 4
/* 000117D8 41820040 */ beq lbl_00011818
/* 000117DC C0010020 */ lfs f0, 0x20(r1)
/* 000117E0 C05E003C */ lfs f2, 0x3c(r30)
/* 000117E4 EC20F82A */ fadds f1, f0, f31
/* 000117E8 C01E0000 */ lfs f0, 0(r30)
/* 000117EC EC22082A */ fadds f1, f2, f1
/* 000117F0 EC21F824 */ fdivs f1, f1, f31
/* 000117F4 FFA00850 */ fneg f29, f1
/* 000117F8 FC1D0040 */ fcmpo cr0, f29, f0
/* 000117FC 4C401382 */ cror 2, 0, 2
/* 00011800 41820050 */ beq lbl_00011850
/* 00011804 C01E0038 */ lfs f0, 0x38(r30)
/* 00011808 FC1D0040 */ fcmpo cr0, f29, f0
/* 0001180C 40810010 */ ble lbl_0001181C
/* 00011810 FFA00090 */ fmr f29, f0
/* 00011814 48000008 */ b lbl_0001181C
lbl_00011818:
/* 00011818 C3BE0038 */ lfs f29, 0x38(r30)
lbl_0001181C:
/* 0001181C FC20E890 */ fmr f1, f29
/* 00011820 4BFEE95D */ bl avdisp_set_alpha
/* 00011824 FC20F090 */ fmr f1, f30
/* 00011828 4BFEE955 */ bl avdisp_set_bound_sphere_scale
/* 0001182C 80790000 */ lwz r3, 0(r25)
/* 00011830 38800000 */ li r4, 0
/* 00011834 4BFEE949 */ bl gxutil_load_pos_nrm_matrix
/* 00011838 7F63DB78 */ mr r3, r27
/* 0001183C 4BFEE941 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00011840 3B9C0010 */ addi r28, r28, 0x10
lbl_00011844:
/* 00011844 A87C0000 */ lha r3, 0(r28)
/* 00011848 7C600735 */ extsh. r0, r3
/* 0001184C 4080FE78 */ bge lbl_000116C4
lbl_00011850:
/* 00011850 BB21002C */ lmw r25, 0x2c(r1)
/* 00011854 80010064 */ lwz r0, 0x64(r1)
/* 00011858 CBE10058 */ lfd f31, 0x58(r1)
/* 0001185C CBC10050 */ lfd f30, 0x50(r1)
/* 00011860 7C0803A6 */ mtlr r0
/* 00011864 CBA10048 */ lfd f29, 0x48(r1)
/* 00011868 38210060 */ addi r1, r1, 0x60
/* 0001186C 4E800020 */ blr 
