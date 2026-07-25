/* 0000B280 7C0802A6 */ mflr r0
/* 0000B284 3C600000 */ lis r3, decodedStageGmaPtr@ha
/* 0000B288 90010004 */ stw r0, 4(r1)
/* 0000B28C 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000B290 BF210014 */ stmw r25, 0x14(r1)
/* 0000B294 80030000 */ lwz r0, decodedStageGmaPtr@l(r3)
/* 0000B298 28000000 */ cmplwi r0, 0
/* 0000B29C 418200BC */ beq lbl_0000B358
/* 0000B2A0 3C800000 */ lis r4, animGroups@ha
/* 0000B2A4 3C600000 */ lis r3, lbl_8020AB88@ha
/* 0000B2A8 38A40000 */ addi r5, r4, animGroups@l
/* 0000B2AC 38030000 */ addi r0, r3, lbl_8020AB88@l
/* 0000B2B0 3C800000 */ lis r4, mathutilData@ha
/* 0000B2B4 3C600000 */ lis r3, animGroupCount@ha
/* 0000B2B8 3B650000 */ addi r27, r5, 0
/* 0000B2BC 7C1A0378 */ mr r26, r0
/* 0000B2C0 3BC40000 */ addi r30, r4, mathutilData@l
/* 0000B2C4 3BE30000 */ addi r31, r3, animGroupCount@l
/* 0000B2C8 3BA00000 */ li r29, 0
/* 0000B2CC 48000080 */ b lbl_0000B34C
lbl_0000B2D0:
/* 0000B2D0 4BFF4F01 */ bl mathutil_mtxA_from_mtxB
/* 0000B2D4 2C1D0000 */ cmpwi r29, 0
/* 0000B2D8 4081000C */ ble lbl_0000B2E4
/* 0000B2DC 387B0024 */ addi r3, r27, 0x24
/* 0000B2E0 4BFF4EF1 */ bl mathutil_mtxA_mult_right
lbl_0000B2E4:
/* 0000B2E4 807E0000 */ lwz r3, 0(r30)
/* 0000B2E8 38800000 */ li r4, 0
/* 0000B2EC 4BFF4EE5 */ bl GXLoadPosMtxImm
/* 0000B2F0 807E0000 */ lwz r3, 0(r30)
/* 0000B2F4 38800000 */ li r4, 0
/* 0000B2F8 4BFF4ED9 */ bl GXLoadNrmMtxImm
/* 0000B2FC 833A0000 */ lwz r25, 0(r26)
/* 0000B300 3B800000 */ li r28, 0
/* 0000B304 48000030 */ b lbl_0000B334
lbl_0000B308:
/* 0000B308 80190000 */ lwz r0, 0(r25)
/* 0000B30C 540007BE */ clrlwi r0, r0, 0x1e
/* 0000B310 28000001 */ cmplwi r0, 1
/* 0000B314 40820018 */ bne lbl_0000B32C
/* 0000B318 80190004 */ lwz r0, 4(r25)
/* 0000B31C 28000000 */ cmplwi r0, 0
/* 0000B320 7C030378 */ mr r3, r0
/* 0000B324 41820008 */ beq lbl_0000B32C
/* 0000B328 4BFF4EA9 */ bl avdisp_draw_model_culled_sort_none
lbl_0000B32C:
/* 0000B32C 3B9C0001 */ addi r28, r28, 1
/* 0000B330 3B39000C */ addi r25, r25, 0xc
lbl_0000B334:
/* 0000B334 801A0004 */ lwz r0, 4(r26)
/* 0000B338 7C1C0000 */ cmpw r28, r0
/* 0000B33C 4180FFCC */ blt lbl_0000B308
/* 0000B340 3BBD0001 */ addi r29, r29, 1
/* 0000B344 3B5A0008 */ addi r26, r26, 8
/* 0000B348 3B7B0084 */ addi r27, r27, 0x84
lbl_0000B34C:
/* 0000B34C 801F0000 */ lwz r0, 0(r31)
/* 0000B350 7C1D0000 */ cmpw r29, r0
/* 0000B354 4180FF7C */ blt lbl_0000B2D0
lbl_0000B358:
/* 0000B358 BB210014 */ lmw r25, 0x14(r1)
/* 0000B35C 80010034 */ lwz r0, 0x34(r1)
/* 0000B360 38210030 */ addi r1, r1, 0x30
/* 0000B364 7C0803A6 */ mtlr r0
/* 0000B368 4E800020 */ blr 
