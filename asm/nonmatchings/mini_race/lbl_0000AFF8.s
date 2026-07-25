/* 0000AFF8 7C0802A6 */ mflr r0
/* 0000AFFC 3C600000 */ lis r3, currentBall@ha
/* 0000B000 90010004 */ stw r0, 4(r1)
/* 0000B004 38630000 */ addi r3, r3, currentBall@l
/* 0000B008 3CA00000 */ lis r5, decodedStageLzPtr@ha
/* 0000B00C 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000B010 3C800000 */ lis r4, lbl_10000028@ha
/* 0000B014 BF010018 */ stmw r24, 0x18(r1)
/* 0000B018 80630000 */ lwz r3, 0(r3)
/* 0000B01C 80E30144 */ lwz r7, 0x144(r3)
/* 0000B020 38650000 */ addi r3, r5, decodedStageLzPtr@l
/* 0000B024 80C30000 */ lwz r6, 0(r3)
/* 0000B028 38A40000 */ addi r5, r4, lbl_10000028@l
/* 0000B02C A0850000 */ lhz r4, 0(r5)
/* 0000B030 83E60078 */ lwz r31, 0x78(r6)
/* 0000B034 3C600000 */ lis r3, lbl_00015768@ha
/* 0000B038 80070014 */ lwz r0, 0x14(r7)
/* 0000B03C 1C840048 */ mulli r4, r4, 0x48
/* 0000B040 83DF0024 */ lwz r30, 0x24(r31)
/* 0000B044 83BF0034 */ lwz r29, 0x34(r31)
/* 0000B048 38630000 */ addi r3, r3, lbl_00015768@l
/* 0000B04C 839F0044 */ lwz r28, 0x44(r31)
/* 0000B050 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 0000B054 837F0064 */ lwz r27, 0x64(r31)
/* 0000B058 38C70000 */ addi r6, r7, 0
/* 0000B05C 7F432214 */ add r26, r3, r4
/* 0000B060 4182000C */ beq lbl_0000B06C
/* 0000B064 3C600000 */ lis r3, lbl_10000054@ha
/* 0000B068 80C30000 */ lwz r6, lbl_10000054@l(r3)
lbl_0000B06C:
/* 0000B06C A0650004 */ lhz r3, 4(r5)
/* 0000B070 A8060022 */ lha r0, 0x22(r6)
/* 0000B074 3863FFFF */ addi r3, r3, -1
/* 0000B078 7C030000 */ cmpw r3, r0
/* 0000B07C 4181004C */ bgt lbl_0000B0C8
/* 0000B080 A81A0004 */ lha r0, 4(r26)
/* 0000B084 2C000000 */ cmpwi r0, 0
/* 0000B088 41800084 */ blt lbl_0000B10C
/* 0000B08C 4BFF50F1 */ bl mathutil_mtxA_from_mtxB
/* 0000B090 3C600000 */ lis r3, mathutilData@ha
/* 0000B094 38630000 */ addi r3, r3, mathutilData@l
/* 0000B098 80630000 */ lwz r3, 0(r3)
/* 0000B09C 38800000 */ li r4, 0
/* 0000B0A0 4BFF50DD */ bl gxutil_load_pos_nrm_matrix
/* 0000B0A4 3C600000 */ lis r3, decodedStageGmaPtr@ha
/* 0000B0A8 A81A0004 */ lha r0, 4(r26)
/* 0000B0AC 38630000 */ addi r3, r3, decodedStageGmaPtr@l
/* 0000B0B0 80630000 */ lwz r3, 0(r3)
/* 0000B0B4 54001838 */ slwi r0, r0, 3
/* 0000B0B8 80630008 */ lwz r3, 8(r3)
/* 0000B0BC 7C63002E */ lwzx r3, r3, r0
/* 0000B0C0 4BFF50BD */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B0C4 48000048 */ b lbl_0000B10C
lbl_0000B0C8:
/* 0000B0C8 A81A0002 */ lha r0, 2(r26)
/* 0000B0CC 2C000000 */ cmpwi r0, 0
/* 0000B0D0 4180003C */ blt lbl_0000B10C
/* 0000B0D4 4BFF50A9 */ bl mathutil_mtxA_from_mtxB
/* 0000B0D8 3C600000 */ lis r3, mathutilData@ha
/* 0000B0DC 38630000 */ addi r3, r3, mathutilData@l
/* 0000B0E0 80630000 */ lwz r3, 0(r3)
/* 0000B0E4 38800000 */ li r4, 0
/* 0000B0E8 4BFF5095 */ bl gxutil_load_pos_nrm_matrix
/* 0000B0EC 3C600000 */ lis r3, decodedStageGmaPtr@ha
/* 0000B0F0 A81A0002 */ lha r0, 2(r26)
/* 0000B0F4 38630000 */ addi r3, r3, decodedStageGmaPtr@l
/* 0000B0F8 80630000 */ lwz r3, 0(r3)
/* 0000B0FC 54001838 */ slwi r0, r0, 3
/* 0000B100 80630008 */ lwz r3, 8(r3)
/* 0000B104 7C63002E */ lwzx r3, r3, r0
/* 0000B108 4BFF5075 */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000B10C:
/* 0000B10C 3C800000 */ lis r4, mathutilData@ha
/* 0000B110 3C600000 */ lis r3, minigameGma@ha
/* 0000B114 3B240000 */ addi r25, r4, mathutilData@l
/* 0000B118 3B430000 */ addi r26, r3, minigameGma@l
/* 0000B11C 3B000000 */ li r24, 0
/* 0000B120 48000048 */ b lbl_0000B168
lbl_0000B124:
/* 0000B124 7FC3F378 */ mr r3, r30
/* 0000B128 4BFF5055 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B12C A87E0010 */ lha r3, 0x10(r30)
/* 0000B130 4BFF504D */ bl mathutil_mtxA_rotate_z
/* 0000B134 A87E000E */ lha r3, 0xe(r30)
/* 0000B138 4BFF5045 */ bl mathutil_mtxA_rotate_y
/* 0000B13C A87E000C */ lha r3, 0xc(r30)
/* 0000B140 4BFF503D */ bl mathutil_mtxA_rotate_x
/* 0000B144 80790000 */ lwz r3, 0(r25)
/* 0000B148 38800000 */ li r4, 0
/* 0000B14C 4BFF5031 */ bl gxutil_load_pos_nrm_matrix
/* 0000B150 807A0000 */ lwz r3, 0(r26)
/* 0000B154 80630008 */ lwz r3, 8(r3)
/* 0000B158 80630050 */ lwz r3, 0x50(r3)
/* 0000B15C 4BFF5021 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B160 3B180001 */ addi r24, r24, 1
/* 0000B164 3BDE0014 */ addi r30, r30, 0x14
lbl_0000B168:
/* 0000B168 801F0020 */ lwz r0, 0x20(r31)
/* 0000B16C 7C180000 */ cmpw r24, r0
/* 0000B170 4180FFB4 */ blt lbl_0000B124
/* 0000B174 3C600000 */ lis r3, minigameGma@ha
/* 0000B178 3C800000 */ lis r4, mathutilData@ha
/* 0000B17C 3B430000 */ addi r26, r3, minigameGma@l
/* 0000B180 3BC40000 */ addi r30, r4, mathutilData@l
/* 0000B184 3B200000 */ li r25, 0
/* 0000B188 48000078 */ b lbl_0000B200
lbl_0000B18C:
/* 0000B18C 7F83E378 */ mr r3, r28
/* 0000B190 4BFF4FED */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B194 A87C0010 */ lha r3, 0x10(r28)
/* 0000B198 4BFF4FE5 */ bl mathutil_mtxA_rotate_z
/* 0000B19C A87C000E */ lha r3, 0xe(r28)
/* 0000B1A0 4BFF4FDD */ bl mathutil_mtxA_rotate_y
/* 0000B1A4 A87C000C */ lha r3, 0xc(r28)
/* 0000B1A8 4BFF4FD5 */ bl mathutil_mtxA_rotate_x
/* 0000B1AC 807E0000 */ lwz r3, 0(r30)
/* 0000B1B0 38800000 */ li r4, 0
/* 0000B1B4 4BFF4FC9 */ bl gxutil_load_pos_nrm_matrix
/* 0000B1B8 881C0012 */ lbz r0, 0x12(r28)
/* 0000B1BC 2C000052 */ cmpwi r0, 0x52
/* 0000B1C0 41820014 */ beq lbl_0000B1D4
/* 0000B1C4 40800024 */ bge lbl_0000B1E8
/* 0000B1C8 2C000042 */ cmpwi r0, 0x42
/* 0000B1CC 4182001C */ beq lbl_0000B1E8
/* 0000B1D0 48000018 */ b lbl_0000B1E8
lbl_0000B1D4:
/* 0000B1D4 807A0000 */ lwz r3, 0(r26)
/* 0000B1D8 80630008 */ lwz r3, 8(r3)
/* 0000B1DC 80630038 */ lwz r3, 0x38(r3)
/* 0000B1E0 4BFF4F9D */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B1E4 48000014 */ b lbl_0000B1F8
lbl_0000B1E8:
/* 0000B1E8 807A0000 */ lwz r3, 0(r26)
/* 0000B1EC 80630008 */ lwz r3, 8(r3)
/* 0000B1F0 80630030 */ lwz r3, 0x30(r3)
/* 0000B1F4 4BFF4F89 */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000B1F8:
/* 0000B1F8 3B390001 */ addi r25, r25, 1
/* 0000B1FC 3B9C0014 */ addi r28, r28, 0x14
lbl_0000B200:
/* 0000B200 801F0040 */ lwz r0, 0x40(r31)
/* 0000B204 7C190000 */ cmpw r25, r0
/* 0000B208 4180FF84 */ blt lbl_0000B18C
/* 0000B20C 3C800000 */ lis r4, mathutilData@ha
/* 0000B210 3C600000 */ lis r3, minigameGma@ha
/* 0000B214 3B840000 */ addi r28, r4, mathutilData@l
/* 0000B218 3B430000 */ addi r26, r3, minigameGma@l
/* 0000B21C 3B200000 */ li r25, 0
/* 0000B220 48000048 */ b lbl_0000B268
lbl_0000B224:
/* 0000B224 7F63DB78 */ mr r3, r27
/* 0000B228 4BFF4F55 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B22C A87B0010 */ lha r3, 0x10(r27)
/* 0000B230 4BFF4F4D */ bl mathutil_mtxA_rotate_z
/* 0000B234 A87B000E */ lha r3, 0xe(r27)
/* 0000B238 4BFF4F45 */ bl mathutil_mtxA_rotate_y
/* 0000B23C A87B000C */ lha r3, 0xc(r27)
/* 0000B240 4BFF4F3D */ bl mathutil_mtxA_rotate_x
/* 0000B244 807C0000 */ lwz r3, 0(r28)
/* 0000B248 38800000 */ li r4, 0
/* 0000B24C 4BFF4F31 */ bl gxutil_load_pos_nrm_matrix
/* 0000B250 807A0000 */ lwz r3, 0(r26)
/* 0000B254 80630008 */ lwz r3, 8(r3)
/* 0000B258 80630010 */ lwz r3, 0x10(r3)
/* 0000B25C 4BFF4F21 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B260 3B390001 */ addi r25, r25, 1
/* 0000B264 3B7B0014 */ addi r27, r27, 0x14
lbl_0000B268:
/* 0000B268 801F0060 */ lwz r0, 0x60(r31)
/* 0000B26C 7C190000 */ cmpw r25, r0
/* 0000B270 4180FFB4 */ blt lbl_0000B224
/* 0000B274 3C800000 */ lis r4, mathutilData@ha
/* 0000B278 3C600000 */ lis r3, minigameGma@ha
/* 0000B27C 3B640000 */ addi r27, r4, mathutilData@l
/* 0000B280 3B430000 */ addi r26, r3, minigameGma@l
/* 0000B284 3B200000 */ li r25, 0
/* 0000B288 48000048 */ b lbl_0000B2D0
lbl_0000B28C:
/* 0000B28C 7FA3EB78 */ mr r3, r29
/* 0000B290 4BFF4EED */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B294 A87D0010 */ lha r3, 0x10(r29)
/* 0000B298 4BFF4EE5 */ bl mathutil_mtxA_rotate_z
/* 0000B29C A87D000E */ lha r3, 0xe(r29)
/* 0000B2A0 4BFF4EDD */ bl mathutil_mtxA_rotate_y
/* 0000B2A4 A87D000C */ lha r3, 0xc(r29)
/* 0000B2A8 4BFF4ED5 */ bl mathutil_mtxA_rotate_x
/* 0000B2AC 807B0000 */ lwz r3, 0(r27)
/* 0000B2B0 38800000 */ li r4, 0
/* 0000B2B4 4BFF4EC9 */ bl gxutil_load_pos_nrm_matrix
/* 0000B2B8 807A0000 */ lwz r3, 0(r26)
/* 0000B2BC 80630008 */ lwz r3, 8(r3)
/* 0000B2C0 80630040 */ lwz r3, 0x40(r3)
/* 0000B2C4 4BFF4EB9 */ bl avdisp_draw_model_culled_sort_translucent
/* 0000B2C8 3B390001 */ addi r25, r25, 1
/* 0000B2CC 3BBD0014 */ addi r29, r29, 0x14
lbl_0000B2D0:
/* 0000B2D0 801F0030 */ lwz r0, 0x30(r31)
/* 0000B2D4 7C190000 */ cmpw r25, r0
/* 0000B2D8 4180FFB4 */ blt lbl_0000B28C
/* 0000B2DC BB010018 */ lmw r24, 0x18(r1)
/* 0000B2E0 8001003C */ lwz r0, 0x3c(r1)
/* 0000B2E4 38210038 */ addi r1, r1, 0x38
/* 0000B2E8 7C0803A6 */ mtlr r0
/* 0000B2EC 4E800020 */ blr 
