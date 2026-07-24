/* 0000AAAC 7C0802A6 */ mflr r0
/* 0000AAB0 3C600000 */ lis r3, lbl_10018510@ha
/* 0000AAB4 90010004 */ stw r0, 4(r1)
/* 0000AAB8 38030000 */ addi r0, r3, lbl_10018510@l
/* 0000AABC 3CC00000 */ lis r6, lbl_00014800@ha
/* 0000AAC0 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000AAC4 3C800000 */ lis r4, mathutilData@ha
/* 0000AAC8 3C600000 */ lis r3, minigameGma@ha
/* 0000AACC BF410008 */ stmw r26, 8(r1)
/* 0000AAD0 3CA00000 */ lis r5, polyDisp@ha
/* 0000AAD4 7C1A0378 */ mr r26, r0
/* 0000AAD8 3B860000 */ addi r28, r6, lbl_00014800@l
/* 0000AADC 3BC40000 */ addi r30, r4, mathutilData@l
/* 0000AAE0 3BE30000 */ addi r31, r3, minigameGma@l
/* 0000AAE4 3BA50000 */ addi r29, r5, polyDisp@l
/* 0000AAE8 3B600000 */ li r27, 0
lbl_0000AAEC:
/* 0000AAEC 801A0000 */ lwz r0, 0(r26)
/* 0000AAF0 28000000 */ cmplwi r0, 0
/* 0000AAF4 41820080 */ beq lbl_0000AB74
/* 0000AAF8 801D0000 */ lwz r0, 0(r29)
/* 0000AAFC 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000AB00 41820014 */ beq lbl_0000AB14
/* 0000AB04 C03A0128 */ lfs f1, 0x128(r26)
/* 0000AB08 C81C03E0 */ lfd f0, 0x3e0(r28)
/* 0000AB0C FC010040 */ fcmpo cr0, f1, f0
/* 0000AB10 41800064 */ blt lbl_0000AB74
lbl_0000AB14:
/* 0000AB14 4BFF564D */ bl mathutil_mtxA_from_mtxB
/* 0000AB18 387A0124 */ addi r3, r26, 0x124
/* 0000AB1C 4BFF5645 */ bl mathutil_mtxA_translate
/* 0000AB20 387A0148 */ addi r3, r26, 0x148
/* 0000AB24 4BFF563D */ bl mathutil_mtxA_mult_right
/* 0000AB28 C03C037C */ lfs f1, 0x37c(r28)
/* 0000AB2C C05C0380 */ lfs f2, 0x380(r28)
/* 0000AB30 C01C0384 */ lfs f0, 0x384(r28)
/* 0000AB34 FC200850 */ fneg f1, f1
/* 0000AB38 FC401050 */ fneg f2, f2
/* 0000AB3C FC600050 */ fneg f3, f0
/* 0000AB40 4BFF5621 */ bl mathutil_mtxA_translate_xyz
/* 0000AB44 807E0000 */ lwz r3, 0(r30)
/* 0000AB48 38800000 */ li r4, 0
/* 0000AB4C 4BFF5615 */ bl GXLoadPosMtxImm
/* 0000AB50 807E0000 */ lwz r3, 0(r30)
/* 0000AB54 38800000 */ li r4, 0
/* 0000AB58 4BFF5609 */ bl GXLoadNrmMtxImm
/* 0000AB5C 807F0000 */ lwz r3, 0(r31)
/* 0000AB60 801C03A0 */ lwz r0, 0x3a0(r28)
/* 0000AB64 80630008 */ lwz r3, 8(r3)
/* 0000AB68 54001838 */ slwi r0, r0, 3
/* 0000AB6C 7C63002E */ lwzx r3, r3, r0
/* 0000AB70 4BFF55F1 */ bl avdisp_draw_model_culled_sort_translucent
lbl_0000AB74:
/* 0000AB74 3B7B0001 */ addi r27, r27, 1
/* 0000AB78 2C1B000A */ cmpwi r27, 0xa
/* 0000AB7C 3B5A0184 */ addi r26, r26, 0x184
/* 0000AB80 4180FF6C */ blt lbl_0000AAEC
/* 0000AB84 BB410008 */ lmw r26, 8(r1)
/* 0000AB88 80010024 */ lwz r0, 0x24(r1)
/* 0000AB8C 38210020 */ addi r1, r1, 0x20
/* 0000AB90 7C0803A6 */ mtlr r0
/* 0000AB94 4E800020 */ blr 
