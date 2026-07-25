/* 0000ADDC 7C0802A6 */ mflr r0
/* 0000ADE0 3C600000 */ lis r3, ballInfo@ha
/* 0000ADE4 90010004 */ stw r0, 4(r1)
/* 0000ADE8 38030000 */ addi r0, r3, ballInfo@l
/* 0000ADEC 3CE00000 */ lis r7, lbl_00013BD0@ha
/* 0000ADF0 9421FFA8 */ stwu r1, -0x58(r1)
/* 0000ADF4 3CC00000 */ lis r6, mathutilData@ha
/* 0000ADF8 3CA00000 */ lis r5, globalAnimTimer@ha
/* 0000ADFC DBE10050 */ stfd f31, 0x50(r1)
/* 0000AE00 3C800000 */ lis r4, minigameGma@ha
/* 0000AE04 3C600000 */ lis r3, lbl_00015BC8@ha
/* 0000AE08 BEE1002C */ stmw r23, 0x2c(r1)
/* 0000AE0C 7C1B0378 */ mr r27, r0
/* 0000AE10 3B870000 */ addi r28, r7, lbl_00013BD0@l
/* 0000AE14 3BC60000 */ addi r30, r6, mathutilData@l
/* 0000AE18 3BE50000 */ addi r31, r5, globalAnimTimer@l
/* 0000AE1C 3B040000 */ addi r24, r4, minigameGma@l
/* 0000AE20 3B230000 */ addi r25, r3, lbl_00015BC8@l
/* 0000AE24 3B400000 */ li r26, 0
/* 0000AE28 3FA04330 */ lis r29, 0x4330
/* 0000AE2C 480001A8 */ b lbl_0000AFD4
lbl_0000AE30:
/* 0000AE30 881B0000 */ lbz r0, 0(r27)
/* 0000AE34 2C000002 */ cmpwi r0, 2
/* 0000AE38 40820194 */ bne lbl_0000AFCC
/* 0000AE3C 82FB0144 */ lwz r23, 0x144(r27)
/* 0000AE40 A817026E */ lha r0, 0x26e(r23)
/* 0000AE44 2C000000 */ cmpwi r0, 0
/* 0000AE48 40810184 */ ble lbl_0000AFCC
/* 0000AE4C 80BB0004 */ lwz r5, 4(r27)
/* 0000AE50 387B001C */ addi r3, r27, 0x1c
/* 0000AE54 801B0008 */ lwz r0, 8(r27)
/* 0000AE58 38810008 */ addi r4, r1, 8
/* 0000AE5C 90A10014 */ stw r5, 0x14(r1)
/* 0000AE60 90010018 */ stw r0, 0x18(r1)
/* 0000AE64 801B000C */ lwz r0, 0xc(r27)
/* 0000AE68 9001001C */ stw r0, 0x1c(r1)
/* 0000AE6C C01B0068 */ lfs f0, 0x68(r27)
/* 0000AE70 C03C0008 */ lfs f1, 8(r28)
/* 0000AE74 FC000050 */ fneg f0, f0
/* 0000AE78 EC210032 */ fmuls f1, f1, f0
/* 0000AE7C 4BFF5301 */ bl mathutil_vec_set_len
/* 0000AE80 C0410014 */ lfs f2, 0x14(r1)
/* 0000AE84 38610014 */ addi r3, r1, 0x14
/* 0000AE88 C0010008 */ lfs f0, 8(r1)
/* 0000AE8C C021000C */ lfs f1, 0xc(r1)
/* 0000AE90 EC42002A */ fadds f2, f2, f0
/* 0000AE94 C0010010 */ lfs f0, 0x10(r1)
/* 0000AE98 D0410014 */ stfs f2, 0x14(r1)
/* 0000AE9C C0410018 */ lfs f2, 0x18(r1)
/* 0000AEA0 EC22082A */ fadds f1, f2, f1
/* 0000AEA4 D0210018 */ stfs f1, 0x18(r1)
/* 0000AEA8 C021001C */ lfs f1, 0x1c(r1)
/* 0000AEAC EC01002A */ fadds f0, f1, f0
/* 0000AEB0 D001001C */ stfs f0, 0x1c(r1)
/* 0000AEB4 C0210018 */ lfs f1, 0x18(r1)
/* 0000AEB8 C01B0068 */ lfs f0, 0x68(r27)
/* 0000AEBC EC010028 */ fsubs f0, f1, f0
/* 0000AEC0 D0010018 */ stfs f0, 0x18(r1)
/* 0000AEC4 4BFF52B9 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000AEC8 4BFF52B5 */ bl mathutil_mtxA_sq_from_identity
/* 0000AECC A817026E */ lha r0, 0x26e(r23)
/* 0000AED0 2C00001E */ cmpwi r0, 0x1e
/* 0000AED4 40800030 */ bge lbl_0000AF04
/* 0000AED8 6C008000 */ xoris r0, r0, 0x8000
/* 0000AEDC C85C0010 */ lfd f2, 0x10(r28)
/* 0000AEE0 90010024 */ stw r0, 0x24(r1)
/* 0000AEE4 3C600000 */ lis r3, lbl_00013BF8@ha
/* 0000AEE8 C8230000 */ lfd f1, lbl_00013BF8@l(r3)
/* 0000AEEC 93A10020 */ stw r29, 0x20(r1)
/* 0000AEF0 C8010020 */ lfd f0, 0x20(r1)
/* 0000AEF4 FC000828 */ fsub f0, f0, f1
/* 0000AEF8 FFE20032 */ fmul f31, f2, f0
/* 0000AEFC FFE0F818 */ frsp f31, f31
/* 0000AF00 48000008 */ b lbl_0000AF08
lbl_0000AF04:
/* 0000AF04 C3FC0018 */ lfs f31, 0x18(r28)
lbl_0000AF08:
/* 0000AF08 387B001C */ addi r3, r27, 0x1c
/* 0000AF0C C0230000 */ lfs f1, 0(r3)
/* 0000AF10 C0430004 */ lfs f2, 4(r3)
/* 0000AF14 C0030008 */ lfs f0, 8(r3)
/* 0000AF18 EC210072 */ fmuls f1, f1, f1
/* 0000AF1C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000AF20 EC20083A */ fmadds f1, f0, f0, f1
/* 0000AF24 4BFF5259 */ bl mathutil_sqrt
/* 0000AF28 C01C001C */ lfs f0, 0x1c(r28)
/* 0000AF2C FC010040 */ fcmpo cr0, f1, f0
/* 0000AF30 40800024 */ bge lbl_0000AF54
/* 0000AF34 EC410024 */ fdivs f2, f1, f0
/* 0000AF38 C03C0008 */ lfs f1, 8(r28)
/* 0000AF3C C01C0018 */ lfs f0, 0x18(r28)
/* 0000AF40 EC42082A */ fadds f2, f2, f1
/* 0000AF44 FC020040 */ fcmpo cr0, f2, f0
/* 0000AF48 40810008 */ ble lbl_0000AF50
/* 0000AF4C FC400090 */ fmr f2, f0
lbl_0000AF50:
/* 0000AF50 EFFF00B2 */ fmuls f31, f31, f2
lbl_0000AF54:
/* 0000AF54 FC20F890 */ fmr f1, f31
/* 0000AF58 4BFF5225 */ bl mathutil_mtxA_scale_s
/* 0000AF5C C05C0024 */ lfs f2, 0x24(r28)
/* 0000AF60 C01B0068 */ lfs f0, 0x68(r27)
/* 0000AF64 C03C0000 */ lfs f1, 0(r28)
/* 0000AF68 EC020032 */ fmuls f0, f2, f0
/* 0000AF6C C07C0020 */ lfs f3, 0x20(r28)
/* 0000AF70 FC400890 */ fmr f2, f1
/* 0000AF74 EC63002A */ fadds f3, f3, f0
/* 0000AF78 4BFF5205 */ bl mathutil_mtxA_translate_xyz
/* 0000AF7C FC20F890 */ fmr f1, f31
/* 0000AF80 4BFF51FD */ bl avdisp_set_bound_sphere_scale
/* 0000AF84 807E0000 */ lwz r3, 0(r30)
/* 0000AF88 38800000 */ li r4, 0
/* 0000AF8C 4BFF51F1 */ bl gxutil_load_pos_nrm_matrix
/* 0000AF90 881B002E */ lbz r0, 0x2e(r27)
/* 0000AF94 80780000 */ lwz r3, 0(r24)
/* 0000AF98 7C000774 */ extsb r0, r0
/* 0000AF9C 80BF0000 */ lwz r5, 0(r31)
/* 0000AFA0 1C000005 */ mulli r0, r0, 5
/* 0000AFA4 80830008 */ lwz r4, 8(r3)
/* 0000AFA8 7C050214 */ add r0, r5, r0
/* 0000AFAC 540006FE */ clrlwi r0, r0, 0x1b
/* 0000AFB0 7C000734 */ extsh r0, r0
/* 0000AFB4 5400083C */ slwi r0, r0, 1
/* 0000AFB8 7C790214 */ add r3, r25, r0
/* 0000AFBC A8030000 */ lha r0, 0(r3)
/* 0000AFC0 54001838 */ slwi r0, r0, 3
/* 0000AFC4 7C64002E */ lwzx r3, r4, r0
/* 0000AFC8 4BFF51B5 */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000AFCC:
/* 0000AFCC 3B5A0001 */ addi r26, r26, 1
/* 0000AFD0 3B7B01A4 */ addi r27, r27, 0x1a4
lbl_0000AFD4:
/* 0000AFD4 7F400734 */ extsh r0, r26
/* 0000AFD8 2C000004 */ cmpwi r0, 4
/* 0000AFDC 4180FE54 */ blt lbl_0000AE30
/* 0000AFE0 BAE1002C */ lmw r23, 0x2c(r1)
/* 0000AFE4 8001005C */ lwz r0, 0x5c(r1)
/* 0000AFE8 CBE10050 */ lfd f31, 0x50(r1)
/* 0000AFEC 38210058 */ addi r1, r1, 0x58
/* 0000AFF0 7C0803A6 */ mtlr r0
/* 0000AFF4 4E800020 */ blr 
