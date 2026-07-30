/* 000094F0 7C0802A6 */ mflr r0
/* 000094F4 3C800000 */ lis r4, polyDisp@ha
/* 000094F8 90010004 */ stw r0, 4(r1)
/* 000094FC 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009500 93E1001C */ stw r31, 0x1c(r1)
/* 00009504 93C10018 */ stw r30, 0x18(r1)
/* 00009508 93A10014 */ stw r29, 0x14(r1)
/* 0000950C 7C7D1B78 */ mr r29, r3
/* 00009510 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009514 83C30030 */ lwz r30, 0x30(r3)
/* 00009518 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000951C 41820030 */ beq lbl_0000954C
/* 00009520 C01E0014 */ lfs f0, 0x14(r30)
/* 00009524 C03D0038 */ lfs f1, 0x38(r29)
/* 00009528 FC000050 */ fneg f0, f0
/* 0000952C FC010040 */ fcmpo cr0, f1, f0
/* 00009530 418000A0 */ blt lbl_000095D0
/* 00009534 A89D00A4 */ lha r4, 0xa4(r29)
/* 00009538 3C600000 */ lis r3, lbl_10000000@ha
/* 0000953C 38030000 */ addi r0, r3, lbl_10000000@l
/* 00009540 5483103A */ slwi r3, r4, 2
/* 00009544 7C601A14 */ add r3, r0, r3
/* 00009548 83C30000 */ lwz r30, 0(r3)
lbl_0000954C:
/* 0000954C C03D0034 */ lfs f1, 0x34(r29)
/* 00009550 C05D0038 */ lfs f2, 0x38(r29)
/* 00009554 C07D003C */ lfs f3, 0x3c(r29)
/* 00009558 4BFF6C0D */ bl mathutil_mtxA_from_mtxB_translate_xyz
/* 0000955C A87D004E */ lha r3, 0x4e(r29)
/* 00009560 4BFF6C05 */ bl mathutil_mtxA_rotate_y
/* 00009564 A87D004C */ lha r3, 0x4c(r29)
/* 00009568 4BFF6BFD */ bl mathutil_mtxA_rotate_x
/* 0000956C A87D0050 */ lha r3, 0x50(r29)
/* 00009570 4BFF6BF5 */ bl mathutil_mtxA_rotate_z
/* 00009574 C03D0024 */ lfs f1, 0x24(r29)
/* 00009578 4BFF6BED */ bl mathutil_mtxA_scale_s
/* 0000957C 387E0008 */ addi r3, r30, 8
/* 00009580 4BFF6BE5 */ bl mathutil_mtxA_translate_neg
/* 00009584 3C600000 */ lis r3, lbl_0001C10C@ha
/* 00009588 C03E0014 */ lfs f1, 0x14(r30)
/* 0000958C C0430000 */ lfs f2, lbl_0001C10C@l(r3)
/* 00009590 387E0008 */ addi r3, r30, 8
/* 00009594 4BFF6BD1 */ bl test_scaled_sphere_in_frustum
/* 00009598 2C030000 */ cmpwi r3, 0
/* 0000959C 41820034 */ beq lbl_000095D0
/* 000095A0 3C600000 */ lis r3, mathutilData@ha
/* 000095A4 3BE30000 */ addi r31, r3, mathutilData@l
/* 000095A8 807F0000 */ lwz r3, 0(r31)
/* 000095AC 38800000 */ li r4, 0
/* 000095B0 4BFF6BB5 */ bl GXLoadPosMtxImm
/* 000095B4 807F0000 */ lwz r3, 0(r31)
/* 000095B8 38800000 */ li r4, 0
/* 000095BC 4BFF6BA9 */ bl GXLoadNrmMtxImm
/* 000095C0 C03D0024 */ lfs f1, 0x24(r29)
/* 000095C4 4BFF6BA1 */ bl avdisp_set_bound_sphere_scale
/* 000095C8 7FC3F378 */ mr r3, r30
/* 000095CC 4BFF6B99 */ bl avdisp_draw_model_unculled_sort_translucent
lbl_000095D0:
/* 000095D0 80010024 */ lwz r0, 0x24(r1)
/* 000095D4 83E1001C */ lwz r31, 0x1c(r1)
/* 000095D8 83C10018 */ lwz r30, 0x18(r1)
/* 000095DC 7C0803A6 */ mtlr r0
/* 000095E0 83A10014 */ lwz r29, 0x14(r1)
/* 000095E4 38210020 */ addi r1, r1, 0x20
/* 000095E8 4E800020 */ blr 
