/* 0000AEDC 7C0802A6 */ mflr r0
/* 0000AEE0 3CA00000 */ lis r5, lbl_00010080@ha
/* 0000AEE4 90010004 */ stw r0, 4(r1)
/* 0000AEE8 28040000 */ cmplwi r4, 0
/* 0000AEEC 9421FF38 */ stwu r1, -0xc8(r1)
/* 0000AEF0 BF6100B4 */ stmw r27, 0xb4(r1)
/* 0000AEF4 3BE50000 */ addi r31, r5, lbl_00010080@l
/* 0000AEF8 3CA00000 */ lis r5, lbl_10000E00@ha
/* 0000AEFC 3BC50000 */ addi r30, r5, lbl_10000E00@l
/* 0000AF00 3BA30000 */ addi r29, r3, 0
/* 0000AF04 801F0080 */ lwz r0, 0x80(r31)
/* 0000AF08 90010070 */ stw r0, 0x70(r1)
/* 0000AF0C 41820130 */ beq lbl_0000B03C
/* 0000AF10 38600001 */ li r3, 1
/* 0000AF14 4BFF5249 */ bl GXSetNumChans
/* 0000AF18 380000FF */ li r0, 0xff
/* 0000AF1C 98010070 */ stb r0, 0x70(r1)
/* 0000AF20 38810020 */ addi r4, r1, 0x20
/* 0000AF24 38600004 */ li r3, 4
/* 0000AF28 98010071 */ stb r0, 0x71(r1)
/* 0000AF2C 98010072 */ stb r0, 0x72(r1)
/* 0000AF30 98010073 */ stb r0, 0x73(r1)
/* 0000AF34 80010070 */ lwz r0, 0x70(r1)
/* 0000AF38 90010020 */ stw r0, 0x20(r1)
/* 0000AF3C 4BFF5221 */ bl GXSetChanMatColor
/* 0000AF40 38000000 */ li r0, 0
/* 0000AF44 98010070 */ stb r0, 0x70(r1)
/* 0000AF48 3881001C */ addi r4, r1, 0x1c
/* 0000AF4C 38600004 */ li r3, 4
/* 0000AF50 98010071 */ stb r0, 0x71(r1)
/* 0000AF54 98010072 */ stb r0, 0x72(r1)
/* 0000AF58 98010073 */ stb r0, 0x73(r1)
/* 0000AF5C 80010070 */ lwz r0, 0x70(r1)
/* 0000AF60 9001001C */ stw r0, 0x1c(r1)
/* 0000AF64 4BFF51F9 */ bl GXSetChanAmbColor
/* 0000AF68 38600004 */ li r3, 4
/* 0000AF6C 38800000 */ li r4, 0
/* 0000AF70 38A00000 */ li r5, 0
/* 0000AF74 38C00000 */ li r6, 0
/* 0000AF78 38E00001 */ li r7, 1
/* 0000AF7C 39000002 */ li r8, 2
/* 0000AF80 39200001 */ li r9, 1
/* 0000AF84 4BFF51D9 */ bl GXSetChanCtrl
/* 0000AF88 38600000 */ li r3, 0
/* 0000AF8C 388000FF */ li r4, 0xff
/* 0000AF90 38A000FF */ li r5, 0xff
/* 0000AF94 38C00004 */ li r6, 4
/* 0000AF98 4BFF51C5 */ bl GXSetTevOrder_cached
/* 0000AF9C 38600000 */ li r3, 0
/* 0000AFA0 38800004 */ li r4, 4
/* 0000AFA4 4BFF51B9 */ bl GXSetTevOp_cached
/* 0000AFA8 38600000 */ li r3, 0
/* 0000AFAC 4BFF51B1 */ bl GXSetNumTexGens
/* 0000AFB0 38600001 */ li r3, 1
/* 0000AFB4 4BFF51A9 */ bl GXSetNumTevStages_cached
/* 0000AFB8 38600001 */ li r3, 1
/* 0000AFBC 38800001 */ li r4, 1
/* 0000AFC0 38A00000 */ li r5, 0
/* 0000AFC4 38C00000 */ li r6, 0
/* 0000AFC8 4BFF5195 */ bl GXSetBlendMode_cached
/* 0000AFCC 3C600000 */ lis r3, gxCache@ha
/* 0000AFD0 38630000 */ addi r3, r3, gxCache@l
/* 0000AFD4 80630000 */ lwz r3, 0(r3)
/* 0000AFD8 88030008 */ lbz r0, 8(r3)
/* 0000AFDC 28000000 */ cmplwi r0, 0
/* 0000AFE0 4082001C */ bne lbl_0000AFFC
/* 0000AFE4 80030004 */ lwz r0, 4(r3)
/* 0000AFE8 2C000001 */ cmpwi r0, 1
/* 0000AFEC 40820010 */ bne lbl_0000AFFC
/* 0000AFF0 88030000 */ lbz r0, 0(r3)
/* 0000AFF4 28000001 */ cmplwi r0, 1
/* 0000AFF8 4182003C */ beq lbl_0000B034
lbl_0000AFFC:
/* 0000AFFC 38600001 */ li r3, 1
/* 0000B000 38800001 */ li r4, 1
/* 0000B004 38A00000 */ li r5, 0
/* 0000B008 4BFF5155 */ bl GXSetZMode
/* 0000B00C 3C600000 */ lis r3, gxCache@ha
/* 0000B010 38830000 */ addi r4, r3, gxCache@l
/* 0000B014 80640000 */ lwz r3, 0(r4)
/* 0000B018 38A00001 */ li r5, 1
/* 0000B01C 38000000 */ li r0, 0
/* 0000B020 98A30000 */ stb r5, 0(r3)
/* 0000B024 80640000 */ lwz r3, 0(r4)
/* 0000B028 90A30004 */ stw r5, 4(r3)
/* 0000B02C 80640000 */ lwz r3, 0(r4)
/* 0000B030 98030008 */ stb r0, 8(r3)
lbl_0000B034:
/* 0000B034 4BFF5129 */ bl fog_gx_set
/* 0000B038 480001D8 */ b lbl_0000B210
lbl_0000B03C:
/* 0000B03C 4BFF5121 */ bl mathutil_mtxA_from_mtxB
/* 0000B040 C03F0064 */ lfs f1, 0x64(r31)
/* 0000B044 38610030 */ addi r3, r1, 0x30
/* 0000B048 38800000 */ li r4, 0
/* 0000B04C 4BFF5111 */ bl GXInitLightSpot
/* 0000B050 C03F0000 */ lfs f1, 0(r31)
/* 0000B054 38610030 */ addi r3, r1, 0x30
/* 0000B058 38800000 */ li r4, 0
/* 0000B05C FC400890 */ fmr f2, f1
/* 0000B060 4BFF50FD */ bl GXInitLightDistAttn
/* 0000B064 3B8000FF */ li r28, 0xff
/* 0000B068 9B810070 */ stb r28, 0x70(r1)
/* 0000B06C 38810018 */ addi r4, r1, 0x18
/* 0000B070 38610030 */ addi r3, r1, 0x30
/* 0000B074 9B810071 */ stb r28, 0x71(r1)
/* 0000B078 9B810072 */ stb r28, 0x72(r1)
/* 0000B07C 9B810073 */ stb r28, 0x73(r1)
/* 0000B080 80010070 */ lwz r0, 0x70(r1)
/* 0000B084 90010018 */ stw r0, 0x18(r1)
/* 0000B088 4BFF50D5 */ bl GXInitLightColor
/* 0000B08C 387E0000 */ addi r3, r30, 0
/* 0000B090 38810024 */ addi r4, r1, 0x24
/* 0000B094 4BFF50C9 */ bl mathutil_mtxA_tf_point
/* 0000B098 C0210024 */ lfs f1, 0x24(r1)
/* 0000B09C 38610030 */ addi r3, r1, 0x30
/* 0000B0A0 C0410028 */ lfs f2, 0x28(r1)
/* 0000B0A4 C061002C */ lfs f3, 0x2c(r1)
/* 0000B0A8 4BFF50B5 */ bl GXInitLightPos
/* 0000B0AC 38610030 */ addi r3, r1, 0x30
/* 0000B0B0 38800001 */ li r4, 1
/* 0000B0B4 4BFF50A9 */ bl GXLoadLightObjImm
/* 0000B0B8 38600001 */ li r3, 1
/* 0000B0BC 4BFF50A1 */ bl GXSetNumChans
/* 0000B0C0 9B810070 */ stb r28, 0x70(r1)
/* 0000B0C4 38810014 */ addi r4, r1, 0x14
/* 0000B0C8 38600004 */ li r3, 4
/* 0000B0CC 9B810071 */ stb r28, 0x71(r1)
/* 0000B0D0 9B810072 */ stb r28, 0x72(r1)
/* 0000B0D4 9B810073 */ stb r28, 0x73(r1)
/* 0000B0D8 80010070 */ lwz r0, 0x70(r1)
/* 0000B0DC 90010014 */ stw r0, 0x14(r1)
/* 0000B0E0 4BFF507D */ bl GXSetChanMatColor
/* 0000B0E4 3C600000 */ lis r3, powerOnTimer@ha
/* 0000B0E8 80030000 */ lwz r0, powerOnTimer@l(r3)
/* 0000B0EC 5403402E */ slwi r3, r0, 8
/* 0000B0F0 4BFF506D */ bl mathutil_sin
/* 0000B0F4 C01F000C */ lfs f0, 0xc(r31)
/* 0000B0F8 38A00020 */ li r5, 0x20
/* 0000B0FC C05F0088 */ lfs f2, 0x88(r31)
/* 0000B100 38000040 */ li r0, 0x40
/* 0000B104 EC20082A */ fadds f1, f0, f1
/* 0000B108 C01F0084 */ lfs f0, 0x84(r31)
/* 0000B10C 38810010 */ addi r4, r1, 0x10
/* 0000B110 38600004 */ li r3, 4
/* 0000B114 EC220072 */ fmuls f1, f2, f1
/* 0000B118 EC00082A */ fadds f0, f0, f1
/* 0000B11C FC00001E */ fctiwz f0, f0
/* 0000B120 D80100A8 */ stfd f0, 0xa8(r1)
/* 0000B124 80C100AC */ lwz r6, 0xac(r1)
/* 0000B128 98C10070 */ stb r6, 0x70(r1)
/* 0000B12C 98A10071 */ stb r5, 0x71(r1)
/* 0000B130 98010072 */ stb r0, 0x72(r1)
/* 0000B134 9B810073 */ stb r28, 0x73(r1)
/* 0000B138 80010070 */ lwz r0, 0x70(r1)
/* 0000B13C 90010010 */ stw r0, 0x10(r1)
/* 0000B140 4BFF501D */ bl GXSetChanAmbColor
/* 0000B144 38600004 */ li r3, 4
/* 0000B148 38800001 */ li r4, 1
/* 0000B14C 38A00000 */ li r5, 0
/* 0000B150 38C00000 */ li r6, 0
/* 0000B154 38E00001 */ li r7, 1
/* 0000B158 39000002 */ li r8, 2
/* 0000B15C 39200001 */ li r9, 1
/* 0000B160 4BFF4FFD */ bl GXSetChanCtrl
/* 0000B164 38600000 */ li r3, 0
/* 0000B168 388000FF */ li r4, 0xff
/* 0000B16C 38A000FF */ li r5, 0xff
/* 0000B170 38C00004 */ li r6, 4
/* 0000B174 4BFF4FE9 */ bl GXSetTevOrder_cached
/* 0000B178 38600000 */ li r3, 0
/* 0000B17C 38800004 */ li r4, 4
/* 0000B180 4BFF4FDD */ bl GXSetTevOp_cached
/* 0000B184 38600000 */ li r3, 0
/* 0000B188 4BFF4FD5 */ bl GXSetNumTexGens
/* 0000B18C 38600001 */ li r3, 1
/* 0000B190 4BFF4FCD */ bl GXSetNumTevStages_cached
/* 0000B194 38600001 */ li r3, 1
/* 0000B198 38800001 */ li r4, 1
/* 0000B19C 38A00000 */ li r5, 0
/* 0000B1A0 38C00000 */ li r6, 0
/* 0000B1A4 4BFF4FB9 */ bl GXSetBlendMode_cached
/* 0000B1A8 3C600000 */ lis r3, gxCache@ha
/* 0000B1AC 38630000 */ addi r3, r3, gxCache@l
/* 0000B1B0 80630000 */ lwz r3, 0(r3)
/* 0000B1B4 88030008 */ lbz r0, 8(r3)
/* 0000B1B8 28000001 */ cmplwi r0, 1
/* 0000B1BC 4082001C */ bne lbl_0000B1D8
/* 0000B1C0 80030004 */ lwz r0, 4(r3)
/* 0000B1C4 2C000001 */ cmpwi r0, 1
/* 0000B1C8 40820010 */ bne lbl_0000B1D8
/* 0000B1CC 88030000 */ lbz r0, 0(r3)
/* 0000B1D0 28000001 */ cmplwi r0, 1
/* 0000B1D4 41820038 */ beq lbl_0000B20C
lbl_0000B1D8:
/* 0000B1D8 38600001 */ li r3, 1
/* 0000B1DC 38800001 */ li r4, 1
/* 0000B1E0 38A00001 */ li r5, 1
/* 0000B1E4 4BFF4F79 */ bl GXSetZMode
/* 0000B1E8 3C600000 */ lis r3, gxCache@ha
/* 0000B1EC 38830000 */ addi r4, r3, gxCache@l
/* 0000B1F0 80640000 */ lwz r3, 0(r4)
/* 0000B1F4 38000001 */ li r0, 1
/* 0000B1F8 98030000 */ stb r0, 0(r3)
/* 0000B1FC 80640000 */ lwz r3, 0(r4)
/* 0000B200 90030004 */ stw r0, 4(r3)
/* 0000B204 80640000 */ lwz r3, 0(r4)
/* 0000B208 98030008 */ stb r0, 8(r3)
lbl_0000B20C:
/* 0000B20C 4BFF4F51 */ bl fog_gx_set
lbl_0000B210:
/* 0000B210 4BFF4F4D */ bl mathutil_mtxA_from_identity
/* 0000B214 7FA3EB78 */ mr r3, r29
/* 0000B218 4BFF4F45 */ bl mathutil_mtxA_translate
/* 0000B21C C03F008C */ lfs f1, 0x8c(r31)
/* 0000B220 38610074 */ addi r3, r1, 0x74
/* 0000B224 C01D000C */ lfs f0, 0xc(r29)
/* 0000B228 EC210032 */ fmuls f1, f1, f0
/* 0000B22C FC400890 */ fmr f2, f1
/* 0000B230 FC600890 */ fmr f3, f1
/* 0000B234 4BFF4F29 */ bl C_MTXScale
/* 0000B238 3C600000 */ lis r3, mathutilData@ha
/* 0000B23C 3B830000 */ addi r28, r3, mathutilData@l
/* 0000B240 807C0000 */ lwz r3, 0(r28)
/* 0000B244 38810074 */ addi r4, r1, 0x74
/* 0000B248 38A30000 */ addi r5, r3, 0
/* 0000B24C 4BFF4F11 */ bl PSMTXConcat
/* 0000B250 809C0000 */ lwz r4, 0(r28)
/* 0000B254 38A40000 */ addi r5, r4, 0
/* 0000B258 38640030 */ addi r3, r4, 0x30
/* 0000B25C 4BFF4F01 */ bl PSMTXConcat
/* 0000B260 807C0000 */ lwz r3, 0(r28)
/* 0000B264 38800000 */ li r4, 0
/* 0000B268 4BFF4EF5 */ bl GXLoadPosMtxImm
/* 0000B26C 807C0000 */ lwz r3, 0(r28)
/* 0000B270 38800000 */ li r4, 0
/* 0000B274 4BFF4EE9 */ bl GXLoadNrmMtxImm
/* 0000B278 38600008 */ li r3, 8
/* 0000B27C 38800008 */ li r4, 8
/* 0000B280 4BFF4EDD */ bl GXDrawSphere
/* 0000B284 4BFF4ED9 */ bl mathutil_mtxA_from_identity
/* 0000B288 7FA3EB78 */ mr r3, r29
/* 0000B28C 4BFF4ED1 */ bl mathutil_mtxA_translate
/* 0000B290 801E015C */ lwz r0, 0x15c(r30)
/* 0000B294 54033830 */ slwi r3, r0, 7
/* 0000B298 4BFF4EC5 */ bl mathutil_mtxA_rotate_y
/* 0000B29C 801E015C */ lwz r0, 0x15c(r30)
/* 0000B2A0 54033032 */ slwi r3, r0, 6
/* 0000B2A4 4BFF4EB9 */ bl mathutil_mtxA_rotate_x
/* 0000B2A8 801E015C */ lwz r0, 0x15c(r30)
/* 0000B2AC 54032834 */ slwi r3, r0, 5
/* 0000B2B0 4BFF4EAD */ bl mathutil_mtxA_rotate_z
/* 0000B2B4 3B600010 */ li r27, 0x10
/* 0000B2B8 577E801E */ slwi r30, r27, 0x10
lbl_0000B2BC:
/* 0000B2BC 4BFF4EA1 */ bl mathutil_mtxA_push
/* 0000B2C0 7FC32670 */ srawi r3, r30, 4
/* 0000B2C4 4BFF4E99 */ bl mathutil_mtxA_rotate_y
/* 0000B2C8 C03F0000 */ lfs f1, 0(r31)
/* 0000B2CC C07F003C */ lfs f3, 0x3c(r31)
/* 0000B2D0 C01D000C */ lfs f0, 0xc(r29)
/* 0000B2D4 FC400890 */ fmr f2, f1
/* 0000B2D8 EC630032 */ fmuls f3, f3, f0
/* 0000B2DC 4BFF4E81 */ bl mathutil_mtxA_translate_xyz
/* 0000B2E0 C05D000C */ lfs f2, 0xc(r29)
/* 0000B2E4 38610074 */ addi r3, r1, 0x74
/* 0000B2E8 C03F0090 */ lfs f1, 0x90(r31)
/* 0000B2EC C01F008C */ lfs f0, 0x8c(r31)
/* 0000B2F0 EC2100B2 */ fmuls f1, f1, f2
/* 0000B2F4 EC6000B2 */ fmuls f3, f0, f2
/* 0000B2F8 FC400890 */ fmr f2, f1
/* 0000B2FC 4BFF4E61 */ bl C_MTXScale
/* 0000B300 807C0000 */ lwz r3, 0(r28)
/* 0000B304 38810074 */ addi r4, r1, 0x74
/* 0000B308 38A30000 */ addi r5, r3, 0
/* 0000B30C 4BFF4E51 */ bl PSMTXConcat
/* 0000B310 809C0000 */ lwz r4, 0(r28)
/* 0000B314 38A40000 */ addi r5, r4, 0
/* 0000B318 38640030 */ addi r3, r4, 0x30
/* 0000B31C 4BFF4E41 */ bl PSMTXConcat
/* 0000B320 807C0000 */ lwz r3, 0(r28)
/* 0000B324 38800000 */ li r4, 0
/* 0000B328 4BFF4E35 */ bl GXLoadPosMtxImm
/* 0000B32C 807C0000 */ lwz r3, 0(r28)
/* 0000B330 38800000 */ li r4, 0
/* 0000B334 4BFF4E29 */ bl GXLoadNrmMtxImm
/* 0000B338 38600008 */ li r3, 8
/* 0000B33C 4BFF4E21 */ bl GXDrawCylinder
/* 0000B340 4BFF4E1D */ bl mathutil_mtxA_pop
/* 0000B344 377BFFFF */ addic. r27, r27, -1
/* 0000B348 3FDEFFFF */ addis r30, r30, 0xffff
/* 0000B34C 4181FF70 */ bgt lbl_0000B2BC
/* 0000B350 BB6100B4 */ lmw r27, 0xb4(r1)
/* 0000B354 800100CC */ lwz r0, 0xcc(r1)
/* 0000B358 382100C8 */ addi r1, r1, 0xc8
/* 0000B35C 7C0803A6 */ mtlr r0
/* 0000B360 4E800020 */ blr 
