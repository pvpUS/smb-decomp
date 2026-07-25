/* 000109CC 7C0802A6 */ mflr r0
/* 000109D0 3C600000 */ lis r3, lbl_00026538@ha
/* 000109D4 90010004 */ stw r0, 4(r1)
/* 000109D8 9421FE90 */ stwu r1, -0x170(r1)
/* 000109DC DBE10168 */ stfd f31, 0x168(r1)
/* 000109E0 DBC10160 */ stfd f30, 0x160(r1)
/* 000109E4 BE810130 */ stmw r20, 0x130(r1)
/* 000109E8 3BA30000 */ addi r29, r3, lbl_00026538@l
/* 000109EC 4BFEF7E5 */ bl func_80092D34
/* 000109F0 3C800000 */ lis r4, backgroundInfo@ha
/* 000109F4 38840000 */ addi r4, r4, backgroundInfo@l
/* 000109F8 3B84008C */ addi r28, r4, 0x8c
/* 000109FC 83640078 */ lwz r27, 0x78(r4)
/* 00010A00 8004008C */ lwz r0, 0x8c(r4)
/* 00010A04 3BC30000 */ addi r30, r3, 0
/* 00010A08 28000000 */ cmplwi r0, 0
/* 00010A0C 4182000C */ beq lbl_00010A18
/* 00010A10 7C030378 */ mr r3, r0
/* 00010A14 4BFEF7BD */ bl u_avdisp_set_some_func_1
lbl_00010A18:
/* 00010A18 38000002 */ li r0, 2
/* 00010A1C B001011C */ sth r0, 0x11c(r1)
/* 00010A20 3C600000 */ lis r3, decodedStageGmaPtr@ha
/* 00010A24 80030000 */ lwz r0, decodedStageGmaPtr@l(r3)
/* 00010A28 28000000 */ cmplwi r0, 0
/* 00010A2C 41820108 */ beq lbl_00010B34
/* 00010A30 38000006 */ li r0, 6
/* 00010A34 3C800000 */ lis r4, animGroups@ha
/* 00010A38 B001011E */ sth r0, 0x11e(r1)
/* 00010A3C 3C600000 */ lis r3, lbl_8020AB88@ha
/* 00010A40 38C40000 */ addi r6, r4, animGroups@l
/* 00010A44 38030000 */ addi r0, r3, lbl_8020AB88@l
/* 00010A48 3C800000 */ lis r4, polyDisp@ha
/* 00010A4C 3CA00000 */ lis r5, mathutilData@ha
/* 00010A50 3C600000 */ lis r3, animGroupCount@ha
/* 00010A54 3B660000 */ addi r27, r6, 0
/* 00010A58 7C1A0378 */ mr r26, r0
/* 00010A5C 3AC40000 */ addi r22, r4, polyDisp@l
/* 00010A60 3BE50000 */ addi r31, r5, mathutilData@l
/* 00010A64 3AA30000 */ addi r21, r3, animGroupCount@l
/* 00010A68 3B000000 */ li r24, 0
/* 00010A6C 480000B8 */ b lbl_00010B24
lbl_00010A70:
/* 00010A70 4BFEF761 */ bl mathutil_mtxA_from_mtxB
/* 00010A74 C03D0000 */ lfs f1, 0(r29)
/* 00010A78 4BFEF759 */ bl mathutil_mtxA_scale_s
/* 00010A7C 2C180000 */ cmpwi r24, 0
/* 00010A80 4081000C */ ble lbl_00010A8C
/* 00010A84 387B0024 */ addi r3, r27, 0x24
/* 00010A88 4BFEF749 */ bl mathutil_mtxA_mult_right
lbl_00010A8C:
/* 00010A8C 807F0000 */ lwz r3, 0(r31)
/* 00010A90 38800000 */ li r4, 0
/* 00010A94 4BFEF73D */ bl GXLoadPosMtxImm
/* 00010A98 807F0000 */ lwz r3, 0(r31)
/* 00010A9C 38800000 */ li r4, 0
/* 00010AA0 4BFEF731 */ bl GXLoadNrmMtxImm
/* 00010AA4 82FA0000 */ lwz r23, 0(r26)
/* 00010AA8 3B200000 */ li r25, 0
/* 00010AAC 48000060 */ b lbl_00010B0C
lbl_00010AB0:
/* 00010AB0 80770000 */ lwz r3, 0(r23)
/* 00010AB4 546007BE */ clrlwi r0, r3, 0x1e
/* 00010AB8 28000001 */ cmplwi r0, 1
/* 00010ABC 40820048 */ bne lbl_00010B04
/* 00010AC0 80170004 */ lwz r0, 4(r23)
/* 00010AC4 28000000 */ cmplwi r0, 0
/* 00010AC8 7C140378 */ mr r20, r0
/* 00010ACC 41820038 */ beq lbl_00010B04
/* 00010AD0 41820034 */ beq lbl_00010B04
/* 00010AD4 80160000 */ lwz r0, 0(r22)
/* 00010AD8 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00010ADC 4182000C */ beq lbl_00010AE8
/* 00010AE0 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00010AE4 41820020 */ beq lbl_00010B04
lbl_00010AE8:
/* 00010AE8 7E83A378 */ mr r3, r20
/* 00010AEC 4BFEF6E5 */ bl avdisp_draw_model_culled_sort_none
/* 00010AF0 2C1E0000 */ cmpwi r30, 0
/* 00010AF4 41820010 */ beq lbl_00010B04
/* 00010AF8 92810120 */ stw r20, 0x120(r1)
/* 00010AFC 3861011C */ addi r3, r1, 0x11c
/* 00010B00 4BFEF6D1 */ bl func_80092F90
lbl_00010B04:
/* 00010B04 3B390001 */ addi r25, r25, 1
/* 00010B08 3AF7000C */ addi r23, r23, 0xc
lbl_00010B0C:
/* 00010B0C 801A0004 */ lwz r0, 4(r26)
/* 00010B10 7C190000 */ cmpw r25, r0
/* 00010B14 4180FF9C */ blt lbl_00010AB0
/* 00010B18 3B180001 */ addi r24, r24, 1
/* 00010B1C 3B5A0008 */ addi r26, r26, 8
/* 00010B20 3B7B0084 */ addi r27, r27, 0x84
lbl_00010B24:
/* 00010B24 80150000 */ lwz r0, 0(r21)
/* 00010B28 7C180000 */ cmpw r24, r0
/* 00010B2C 4180FF44 */ blt lbl_00010A70
/* 00010B30 4800028C */ b lbl_00010DBC
lbl_00010B34:
/* 00010B34 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010B38 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00010B3C 80630000 */ lwz r3, 0(r3)
/* 00010B40 8003005C */ lwz r0, 0x5c(r3)
/* 00010B44 28000000 */ cmplwi r0, 0
/* 00010B48 408200E0 */ bne lbl_00010C28
/* 00010B4C 3C800000 */ lis r4, animGroups@ha
/* 00010B50 38A40000 */ addi r5, r4, animGroups@l
/* 00010B54 3C600000 */ lis r3, lbl_802099E8@ha
/* 00010B58 38030000 */ addi r0, r3, lbl_802099E8@l
/* 00010B5C 3C800000 */ lis r4, lbl_802F1B4C@ha
/* 00010B60 3C600000 */ lis r3, animGroupCount@ha
/* 00010B64 3A850000 */ addi r20, r5, 0
/* 00010B68 7C180378 */ mr r24, r0
/* 00010B6C 3AC40000 */ addi r22, r4, lbl_802F1B4C@l
/* 00010B70 3AA30000 */ addi r21, r3, animGroupCount@l
/* 00010B74 3B400000 */ li r26, 0
/* 00010B78 480000A0 */ b lbl_00010C18
lbl_00010B7C:
/* 00010B7C 4BFEF655 */ bl mathutil_mtxA_from_mtxB
/* 00010B80 C03D0000 */ lfs f1, 0(r29)
/* 00010B84 4BFEF64D */ bl mathutil_mtxA_scale_s
/* 00010B88 2C1A0000 */ cmpwi r26, 0
/* 00010B8C 4081000C */ ble lbl_00010B98
/* 00010B90 38740024 */ addi r3, r20, 0x24
/* 00010B94 4BFEF63D */ bl mathutil_mtxA_mult_right
lbl_00010B98:
/* 00010B98 3BC00000 */ li r30, 0
/* 00010B9C 3AE00000 */ li r23, 0
/* 00010BA0 48000060 */ b lbl_00010C00
lbl_00010BA4:
/* 00010BA4 80780000 */ lwz r3, 0(r24)
/* 00010BA8 7F23B82E */ lwzx r25, r3, r23
/* 00010BAC 7F23CB78 */ mr r3, r25
/* 00010BB0 4BFEF621 */ bl nl2ngc_draw_model_sort_translucent_alt2
/* 00010BB4 281B0000 */ cmplwi r27, 0
/* 00010BB8 41820040 */ beq lbl_00010BF8
/* 00010BBC 4BFEF615 */ bl mathutil_mtxA_push
/* 00010BC0 38740024 */ addi r3, r20, 0x24
/* 00010BC4 4BFEF60D */ bl mathutil_mtxA_from_mtx
/* 00010BC8 7F6CDB78 */ mr r12, r27
/* 00010BCC 80960000 */ lwz r4, 0(r22)
/* 00010BD0 7D8803A6 */ mtlr r12
/* 00010BD4 38790000 */ addi r3, r25, 0
/* 00010BD8 4E800021 */ blrl 
/* 00010BDC 2C030000 */ cmpwi r3, 0
/* 00010BE0 41820014 */ beq lbl_00010BF4
/* 00010BE4 4BFEF5ED */ bl mathutil_mtxA_pop
/* 00010BE8 80760000 */ lwz r3, 0(r22)
/* 00010BEC 4BFEF5E5 */ bl nl2ngc_draw_model_sort_none_alt
/* 00010BF0 48000008 */ b lbl_00010BF8
lbl_00010BF4:
/* 00010BF4 4BFEF5DD */ bl mathutil_mtxA_pop
lbl_00010BF8:
/* 00010BF8 3AF70004 */ addi r23, r23, 4
/* 00010BFC 3BDE0001 */ addi r30, r30, 1
lbl_00010C00:
/* 00010C00 80180008 */ lwz r0, 8(r24)
/* 00010C04 7C1E0000 */ cmpw r30, r0
/* 00010C08 4180FF9C */ blt lbl_00010BA4
/* 00010C0C 3B5A0001 */ addi r26, r26, 1
/* 00010C10 3A940084 */ addi r20, r20, 0x84
/* 00010C14 3B18000C */ addi r24, r24, 0xc
lbl_00010C18:
/* 00010C18 80150000 */ lwz r0, 0(r21)
/* 00010C1C 7C1A0000 */ cmpw r26, r0
/* 00010C20 4180FF5C */ blt lbl_00010B7C
/* 00010C24 48000198 */ b lbl_00010DBC
lbl_00010C28:
/* 00010C28 3C600000 */ lis r3, currentCamera@ha
/* 00010C2C 80C30000 */ lwz r6, currentCamera@l(r3)
/* 00010C30 3C800000 */ lis r4, animGroups@ha
/* 00010C34 3C600000 */ lis r3, lbl_8020A348@ha
/* 00010C38 38A40000 */ addi r5, r4, animGroups@l
/* 00010C3C C3E60038 */ lfs f31, 0x38(r6)
/* 00010C40 38030000 */ addi r0, r3, lbl_8020A348@l
/* 00010C44 3C800000 */ lis r4, lbl_802F1B4C@ha
/* 00010C48 3C600000 */ lis r3, animGroupCount@ha
/* 00010C4C 3AE50000 */ addi r23, r5, 0
/* 00010C50 7C180378 */ mr r24, r0
/* 00010C54 3AA40000 */ addi r21, r4, lbl_802F1B4C@l
/* 00010C58 3AC30000 */ addi r22, r3, animGroupCount@l
/* 00010C5C 3BE00000 */ li r31, 0
/* 00010C60 48000150 */ b lbl_00010DB0
lbl_00010C64:
/* 00010C64 4BFEF56D */ bl mathutil_mtxA_from_mtxB
/* 00010C68 C03D0000 */ lfs f1, 0(r29)
/* 00010C6C 4BFEF565 */ bl mathutil_mtxA_scale_s
/* 00010C70 2C1F0000 */ cmpwi r31, 0
/* 00010C74 4081000C */ ble lbl_00010C80
/* 00010C78 38770024 */ addi r3, r23, 0x24
/* 00010C7C 4BFEF555 */ bl mathutil_mtxA_mult_right
lbl_00010C80:
/* 00010C80 83580000 */ lwz r26, 0(r24)
/* 00010C84 3B200000 */ li r25, 0
/* 00010C88 48000110 */ b lbl_00010D98
lbl_00010C8C:
/* 00010C8C 801A0000 */ lwz r0, 0(r26)
/* 00010C90 540007BE */ clrlwi r0, r0, 0x1e
/* 00010C94 28000001 */ cmplwi r0, 1
/* 00010C98 408200F8 */ bne lbl_00010D90
/* 00010C9C 801A0004 */ lwz r0, 4(r26)
/* 00010CA0 28000000 */ cmplwi r0, 0
/* 00010CA4 7C140378 */ mr r20, r0
/* 00010CA8 418200E8 */ beq lbl_00010D90
/* 00010CAC C83D0008 */ lfd f1, 8(r29)
/* 00010CB0 38740008 */ addi r3, r20, 8
/* 00010CB4 C0140014 */ lfs f0, 0x14(r20)
/* 00010CB8 38810108 */ addi r4, r1, 0x108
/* 00010CBC FFC10032 */ fmul f30, f1, f0
/* 00010CC0 FFC0F018 */ frsp f30, f30
/* 00010CC4 4BFEF50D */ bl mathutil_mtxA_tf_point
/* 00010CC8 C0210110 */ lfs f1, 0x110(r1)
/* 00010CCC C01D0010 */ lfs f0, 0x10(r29)
/* 00010CD0 FC010040 */ fcmpo cr0, f1, f0
/* 00010CD4 4080004C */ bge lbl_00010D20
/* 00010CD8 FC000850 */ fneg f0, f1
/* 00010CDC 80780004 */ lwz r3, 4(r24)
/* 00010CE0 EC2007F2 */ fmuls f1, f0, f31
/* 00010CE4 48000024 */ b lbl_00010D08
lbl_00010CE8:
/* 00010CE8 C01A0014 */ lfs f0, 0x14(r26)
/* 00010CEC 3B5A000C */ addi r26, r26, 0xc
/* 00010CF0 3B390001 */ addi r25, r25, 1
/* 00010CF4 EC000072 */ fmuls f0, f0, f1
/* 00010CF8 FC1E0040 */ fcmpo cr0, f30, f0
/* 00010CFC 4080000C */ bge lbl_00010D08
/* 00010D00 829A0004 */ lwz r20, 4(r26)
/* 00010D04 4800001C */ b lbl_00010D20
lbl_00010D08:
/* 00010D08 38190001 */ addi r0, r25, 1
/* 00010D0C 7C001800 */ cmpw r0, r3
/* 00010D10 40800010 */ bge lbl_00010D20
/* 00010D14 801A000C */ lwz r0, 0xc(r26)
/* 00010D18 28000002 */ cmplwi r0, 2
/* 00010D1C 4182FFCC */ beq lbl_00010CE8
lbl_00010D20:
/* 00010D20 28140000 */ cmplwi r20, 0
/* 00010D24 4182006C */ beq lbl_00010D90
/* 00010D28 7E83A378 */ mr r3, r20
/* 00010D2C 4BFEF4A5 */ bl nl2ngc_draw_model_sort_translucent_alt2
/* 00010D30 2C1E0000 */ cmpwi r30, 0
/* 00010D34 41820018 */ beq lbl_00010D4C
/* 00010D38 38000000 */ li r0, 0
/* 00010D3C B001011E */ sth r0, 0x11e(r1)
/* 00010D40 3861011C */ addi r3, r1, 0x11c
/* 00010D44 92810120 */ stw r20, 0x120(r1)
/* 00010D48 4BFEF489 */ bl func_80092F90
lbl_00010D4C:
/* 00010D4C 281B0000 */ cmplwi r27, 0
/* 00010D50 41820040 */ beq lbl_00010D90
/* 00010D54 4BFEF47D */ bl mathutil_mtxA_push
/* 00010D58 38770024 */ addi r3, r23, 0x24
/* 00010D5C 4BFEF475 */ bl mathutil_mtxA_from_mtx
/* 00010D60 7F6CDB78 */ mr r12, r27
/* 00010D64 80950000 */ lwz r4, 0(r21)
/* 00010D68 7D8803A6 */ mtlr r12
/* 00010D6C 38740000 */ addi r3, r20, 0
/* 00010D70 4E800021 */ blrl 
/* 00010D74 2C030000 */ cmpwi r3, 0
/* 00010D78 41820014 */ beq lbl_00010D8C
/* 00010D7C 4BFEF455 */ bl mathutil_mtxA_pop
/* 00010D80 80750000 */ lwz r3, 0(r21)
/* 00010D84 4BFEF44D */ bl nl2ngc_draw_model_sort_none_alt
/* 00010D88 48000008 */ b lbl_00010D90
lbl_00010D8C:
/* 00010D8C 4BFEF445 */ bl mathutil_mtxA_pop
lbl_00010D90:
/* 00010D90 3B390001 */ addi r25, r25, 1
/* 00010D94 3B5A000C */ addi r26, r26, 0xc
lbl_00010D98:
/* 00010D98 80180004 */ lwz r0, 4(r24)
/* 00010D9C 7C190000 */ cmpw r25, r0
/* 00010DA0 4180FEEC */ blt lbl_00010C8C
/* 00010DA4 3BFF0001 */ addi r31, r31, 1
/* 00010DA8 3B180008 */ addi r24, r24, 8
/* 00010DAC 3AF70084 */ addi r23, r23, 0x84
lbl_00010DB0:
/* 00010DB0 80160000 */ lwz r0, 0(r22)
/* 00010DB4 7C1F0000 */ cmpw r31, r0
/* 00010DB8 4180FEAC */ blt lbl_00010C64
lbl_00010DBC:
/* 00010DBC 3C600000 */ lis r3, mathutilData@ha
/* 00010DC0 3CA00000 */ lis r5, lbl_00026E10@ha
/* 00010DC4 3C800000 */ lis r4, decodedStageGmaPtr@ha
/* 00010DC8 3AE30000 */ addi r23, r3, mathutilData@l
/* 00010DCC 3B250000 */ addi r25, r5, lbl_00026E10@l
/* 00010DD0 3B040000 */ addi r24, r4, decodedStageGmaPtr@l
/* 00010DD4 3AA00000 */ li r21, 0
lbl_00010DD8:
/* 00010DD8 38990000 */ addi r4, r25, 0
/* 00010DDC 4CC63182 */ crclr 6
/* 00010DE0 38610008 */ addi r3, r1, 8
/* 00010DE4 38B50001 */ addi r5, r21, 1
/* 00010DE8 4BFEF3E9 */ bl sprintf
/* 00010DEC 80780000 */ lwz r3, 0(r24)
/* 00010DF0 38810008 */ addi r4, r1, 8
/* 00010DF4 4BFEF2D5 */ bl lbl_000000C8
/* 00010DF8 7C741B79 */ or. r20, r3, r3
/* 00010DFC 41820030 */ beq lbl_00010E2C
/* 00010E00 4BFEF3D1 */ bl mathutil_mtxA_from_mtxB
/* 00010E04 C03D0000 */ lfs f1, 0(r29)
/* 00010E08 4BFEF3C9 */ bl mathutil_mtxA_scale_s
/* 00010E0C 80770000 */ lwz r3, 0(r23)
/* 00010E10 38800000 */ li r4, 0
/* 00010E14 4BFEF3BD */ bl GXLoadPosMtxImm
/* 00010E18 80770000 */ lwz r3, 0(r23)
/* 00010E1C 38800000 */ li r4, 0
/* 00010E20 4BFEF3B1 */ bl GXLoadNrmMtxImm
/* 00010E24 7E83A378 */ mr r3, r20
/* 00010E28 4BFEF3A9 */ bl avdisp_draw_model_unculled_sort_none
lbl_00010E2C:
/* 00010E2C 3AB50001 */ addi r21, r21, 1
/* 00010E30 2C150014 */ cmpwi r21, 0x14
/* 00010E34 4180FFA4 */ blt lbl_00010DD8
/* 00010E38 801C0000 */ lwz r0, 0(r28)
/* 00010E3C 28000000 */ cmplwi r0, 0
/* 00010E40 4182000C */ beq lbl_00010E4C
/* 00010E44 38600000 */ li r3, 0
/* 00010E48 4BFEF389 */ bl u_avdisp_set_some_func_1
lbl_00010E4C:
/* 00010E4C BA810130 */ lmw r20, 0x130(r1)
/* 00010E50 80010174 */ lwz r0, 0x174(r1)
/* 00010E54 CBE10168 */ lfd f31, 0x168(r1)
/* 00010E58 CBC10160 */ lfd f30, 0x160(r1)
/* 00010E5C 7C0803A6 */ mtlr r0
/* 00010E60 38210170 */ addi r1, r1, 0x170
/* 00010E64 4E800020 */ blr 
