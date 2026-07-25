/* 0000EA10 7C0802A6 */ mflr r0
/* 0000EA14 3C600000 */ lis r3, g_commonNlObj@ha
/* 0000EA18 90010004 */ stw r0, 4(r1)
/* 0000EA1C 3CA00000 */ lis r5, globalAnimTimer@ha
/* 0000EA20 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000EA24 DBE10048 */ stfd f31, 0x48(r1)
/* 0000EA28 BEC10020 */ stmw r22, 0x20(r1)
/* 0000EA2C 3BC10014 */ addi r30, r1, 0x14
/* 0000EA30 80830000 */ lwz r4, g_commonNlObj@l(r3)
/* 0000EA34 3C600000 */ lis r3, g_poolInfo@ha
/* 0000EA38 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000EA3C 83250000 */ lwz r25, globalAnimTimer@l(r5)
/* 0000EA40 83440030 */ lwz r26, 0x30(r4)
/* 0000EA44 83A30008 */ lwz r29, 8(r3)
/* 0000EA48 3C800000 */ lis r4, ballInfo@ha
/* 0000EA4C 38040000 */ addi r0, r4, ballInfo@l
/* 0000EA50 8363000C */ lwz r27, 0xc(r3)
/* 0000EA54 3C800000 */ lis r4, lbl_0001C238@ha
/* 0000EA58 3C600000 */ lis r3, lbl_801B7CF8@ha
/* 0000EA5C 7C1C0378 */ mr r28, r0
/* 0000EA60 3BE40000 */ addi r31, r4, lbl_0001C238@l
/* 0000EA64 57365828 */ slwi r22, r25, 0xb
/* 0000EA68 3AE30000 */ addi r23, r3, lbl_801B7CF8@l
/* 0000EA6C 57B86026 */ slwi r24, r29, 0xc
/* 0000EA70 48000160 */ b lbl_0000EBD0
lbl_0000EA74:
/* 0000EA74 881B0000 */ lbz r0, 0(r27)
/* 0000EA78 7C000775 */ extsb. r0, r0
/* 0000EA7C 41820144 */ beq lbl_0000EBC0
/* 0000EA80 801C0094 */ lwz r0, 0x94(r28)
/* 0000EA84 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 0000EA88 40820138 */ bne lbl_0000EBC0
/* 0000EA8C 387C0004 */ addi r3, r28, 4
/* 0000EA90 4BFF16D5 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000EA94 4BFF16D1 */ bl mathutil_mtxA_sq_from_identity
/* 0000EA98 389E0004 */ addi r4, r30, 4
/* 0000EA9C 387E0008 */ addi r3, r30, 8
/* 0000EAA0 3CA0E000 */ lis r5, 0xe000
/* 0000EAA4 C045000C */ lfs f2, 0xc(r5)
/* 0000EAA8 C025001C */ lfs f1, 0x1c(r5)
/* 0000EAAC C005002C */ lfs f0, 0x2c(r5)
/* 0000EAB0 D0410014 */ stfs f2, 0x14(r1)
/* 0000EAB4 D0240000 */ stfs f1, 0(r4)
/* 0000EAB8 D0030000 */ stfs f0, 0(r3)
/* 0000EABC C03C0068 */ lfs f1, 0x68(r28)
/* 0000EAC0 C041001C */ lfs f2, 0x1c(r1)
/* 0000EAC4 FC000850 */ fneg f0, f1
/* 0000EAC8 FC020040 */ fcmpo cr0, f2, f0
/* 0000EACC 4C411382 */ cror 2, 1, 2
/* 0000EAD0 418200F0 */ beq lbl_0000EBC0
/* 0000EAD4 EC22082A */ fadds f1, f2, f1
/* 0000EAD8 C0010014 */ lfs f0, 0x14(r1)
/* 0000EADC EC611024 */ fdivs f3, f1, f2
/* 0000EAE0 EC0000F2 */ fmuls f0, f0, f3
/* 0000EAE4 D0010014 */ stfs f0, 0x14(r1)
/* 0000EAE8 C0010018 */ lfs f0, 0x18(r1)
/* 0000EAEC EC0000F2 */ fmuls f0, f0, f3
/* 0000EAF0 D0010018 */ stfs f0, 0x18(r1)
/* 0000EAF4 C001001C */ lfs f0, 0x1c(r1)
/* 0000EAF8 EC0000F2 */ fmuls f0, f0, f3
/* 0000EAFC D001001C */ stfs f0, 0x1c(r1)
/* 0000EB00 C0410014 */ lfs f2, 0x14(r1)
/* 0000EB04 C0210018 */ lfs f1, 0x18(r1)
/* 0000EB08 C001001C */ lfs f0, 0x1c(r1)
/* 0000EB0C D045000C */ stfs f2, 0xc(r5)
/* 0000EB10 D025001C */ stfs f1, 0x1c(r5)
/* 0000EB14 D005002C */ stfs f0, 0x2c(r5)
/* 0000EB18 FFE01890 */ fmr f31, f3
/* 0000EB1C FC20F890 */ fmr f1, f31
/* 0000EB20 4BFF1645 */ bl mathutil_mtxA_scale_s
/* 0000EB24 57233830 */ slwi r3, r25, 7
/* 0000EB28 4BFF163D */ bl mathutil_mtxA_rotate_z
/* 0000EB2C 7C76C214 */ add r3, r22, r24
/* 0000EB30 4BFF1635 */ bl mathutil_sin
/* 0000EB34 881C014A */ lbz r0, 0x14a(r28)
/* 0000EB38 C05F0000 */ lfs f2, 0(r31)
/* 0000EB3C 1C00000C */ mulli r0, r0, 0xc
/* 0000EB40 C01F0018 */ lfs f0, 0x18(r31)
/* 0000EB44 EC22082A */ fadds f1, f2, f1
/* 0000EB48 7C970214 */ add r4, r23, r0
/* 0000EB4C 80640000 */ lwz r3, 0(r4)
/* 0000EB50 EC200072 */ fmuls f1, f0, f1
/* 0000EB54 80040004 */ lwz r0, 4(r4)
/* 0000EB58 90610008 */ stw r3, 8(r1)
/* 0000EB5C EC420828 */ fsubs f2, f2, f1
/* 0000EB60 9001000C */ stw r0, 0xc(r1)
/* 0000EB64 80040008 */ lwz r0, 8(r4)
/* 0000EB68 90010010 */ stw r0, 0x10(r1)
/* 0000EB6C C0010008 */ lfs f0, 8(r1)
/* 0000EB70 EC020032 */ fmuls f0, f2, f0
/* 0000EB74 EC01002A */ fadds f0, f1, f0
/* 0000EB78 D0010008 */ stfs f0, 8(r1)
/* 0000EB7C C001000C */ lfs f0, 0xc(r1)
/* 0000EB80 EC020032 */ fmuls f0, f2, f0
/* 0000EB84 EC01002A */ fadds f0, f1, f0
/* 0000EB88 D001000C */ stfs f0, 0xc(r1)
/* 0000EB8C C0010010 */ lfs f0, 0x10(r1)
/* 0000EB90 EC020032 */ fmuls f0, f2, f0
/* 0000EB94 EC01002A */ fadds f0, f1, f0
/* 0000EB98 D0010010 */ stfs f0, 0x10(r1)
/* 0000EB9C C0210008 */ lfs f1, 8(r1)
/* 0000EBA0 C041000C */ lfs f2, 0xc(r1)
/* 0000EBA4 C0610010 */ lfs f3, 0x10(r1)
/* 0000EBA8 4BFF15BD */ bl nlObjPutSetFadeColorBase
/* 0000EBAC FC20F890 */ fmr f1, f31
/* 0000EBB0 4BFF15B5 */ bl nlSetScaleFactor
/* 0000EBB4 7F43D378 */ mr r3, r26
/* 0000EBB8 C03F009C */ lfs f1, 0x9c(r31)
/* 0000EBBC 4BFF15A9 */ bl nl2ngc_draw_model_alpha_sort_none
lbl_0000EBC0:
/* 0000EBC0 3BBDFFFF */ addi r29, r29, -1
/* 0000EBC4 3B18F000 */ addi r24, r24, -4096
/* 0000EBC8 3B7B0001 */ addi r27, r27, 1
/* 0000EBCC 3B9C01A4 */ addi r28, r28, 0x1a4
lbl_0000EBD0:
/* 0000EBD0 2C1D0000 */ cmpwi r29, 0
/* 0000EBD4 4181FEA0 */ bgt lbl_0000EA74
/* 0000EBD8 4BFF158D */ bl fade_color_base_default
/* 0000EBDC BAC10020 */ lmw r22, 0x20(r1)
/* 0000EBE0 80010054 */ lwz r0, 0x54(r1)
/* 0000EBE4 CBE10048 */ lfd f31, 0x48(r1)
/* 0000EBE8 38210050 */ addi r1, r1, 0x50
/* 0000EBEC 7C0803A6 */ mtlr r0
/* 0000EBF0 4E800020 */ blr 
