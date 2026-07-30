/* 00008DD0 7C0802A6 */ mflr r0
/* 00008DD4 90010004 */ stw r0, 4(r1)
/* 00008DD8 9421FFE8 */ stwu r1, -0x18(r1)
/* 00008DDC 93E10014 */ stw r31, 0x14(r1)
/* 00008DE0 93C10010 */ stw r30, 0x10(r1)
/* 00008DE4 3BC30000 */ addi r30, r3, 0
/* 00008DE8 387E0034 */ addi r3, r30, 0x34
/* 00008DEC 4BFF7379 */ bl mathutil_mtxA_from_translate
/* 00008DF0 A87E004E */ lha r3, 0x4e(r30)
/* 00008DF4 4BFF7371 */ bl mathutil_mtxA_rotate_y
/* 00008DF8 A87E004C */ lha r3, 0x4c(r30)
/* 00008DFC 4BFF7369 */ bl mathutil_mtxA_rotate_x
/* 00008E00 A87E0050 */ lha r3, 0x50(r30)
/* 00008E04 4BFF7361 */ bl mathutil_mtxA_rotate_z
/* 00008E08 C03E0024 */ lfs f1, 0x24(r30)
/* 00008E0C C05E0028 */ lfs f2, 0x28(r30)
/* 00008E10 C07E002C */ lfs f3, 0x2c(r30)
/* 00008E14 4BFF7351 */ bl mathutil_mtxA_scale_xyz
/* 00008E18 3C600000 */ lis r3, mathutilData@ha
/* 00008E1C 3BE30000 */ addi r31, r3, mathutilData@l
/* 00008E20 807F0000 */ lwz r3, 0(r31)
/* 00008E24 38800000 */ li r4, 0
/* 00008E28 4BFF733D */ bl GXLoadPosMtxImm
/* 00008E2C 807F0000 */ lwz r3, 0(r31)
/* 00008E30 38800000 */ li r4, 0
/* 00008E34 4BFF7331 */ bl GXLoadNrmMtxImm
/* 00008E38 C03E0024 */ lfs f1, 0x24(r30)
/* 00008E3C 4BFF7329 */ bl avdisp_set_bound_sphere_scale
/* 00008E40 807E0030 */ lwz r3, 0x30(r30)
/* 00008E44 4BFF7321 */ bl avdisp_draw_model_culled_sort_none
/* 00008E48 8001001C */ lwz r0, 0x1c(r1)
/* 00008E4C 83E10014 */ lwz r31, 0x14(r1)
/* 00008E50 83C10010 */ lwz r30, 0x10(r1)
/* 00008E54 7C0803A6 */ mtlr r0
/* 00008E58 38210018 */ addi r1, r1, 0x18
/* 00008E5C 4E800020 */ blr 
