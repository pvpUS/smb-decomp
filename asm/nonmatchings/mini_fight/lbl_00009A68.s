/* 00009A68 7C0802A6 */ mflr r0
/* 00009A6C 3C800000 */ lis r4, polyDisp@ha
/* 00009A70 90010004 */ stw r0, 4(r1)
/* 00009A74 9421FFC8 */ stwu r1, -0x38(r1)
/* 00009A78 DBE10030 */ stfd f31, 0x30(r1)
/* 00009A7C 93E1002C */ stw r31, 0x2c(r1)
/* 00009A80 93C10028 */ stw r30, 0x28(r1)
/* 00009A84 93A10024 */ stw r29, 0x24(r1)
/* 00009A88 3BA30000 */ addi r29, r3, 0
/* 00009A8C 80040000 */ lwz r0, polyDisp@l(r4)
/* 00009A90 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009A94 3BC40000 */ addi r30, r4, lbl_0001C108@l
/* 00009A98 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00009A9C 408200D8 */ bne lbl_00009B74
/* 00009AA0 387D0034 */ addi r3, r29, 0x34
/* 00009AA4 4BFF66C1 */ bl mathutil_mtxA_from_translate
/* 00009AA8 C01D0090 */ lfs f0, 0x90(r29)
/* 00009AAC FC00001E */ fctiwz f0, f0
/* 00009AB0 D8010018 */ stfd f0, 0x18(r1)
/* 00009AB4 8001001C */ lwz r0, 0x1c(r1)
/* 00009AB8 7C030734 */ extsh r3, r0
/* 00009ABC 4BFF66A9 */ bl mathutil_mtxA_rotate_z
/* 00009AC0 C03D0024 */ lfs f1, 0x24(r29)
/* 00009AC4 4BFF66A1 */ bl mathutil_mtxA_scale_s
/* 00009AC8 3C600000 */ lis r3, mathutilData@ha
/* 00009ACC 3BE30000 */ addi r31, r3, mathutilData@l
/* 00009AD0 807F0000 */ lwz r3, 0(r31)
/* 00009AD4 38800000 */ li r4, 0
/* 00009AD8 4BFF668D */ bl GXLoadPosMtxImm
/* 00009ADC 807F0000 */ lwz r3, 0(r31)
/* 00009AE0 38800000 */ li r4, 0
/* 00009AE4 4BFF6681 */ bl GXLoadNrmMtxImm
/* 00009AE8 C03D0024 */ lfs f1, 0x24(r29)
/* 00009AEC 4BFF6679 */ bl avdisp_set_bound_sphere_scale
/* 00009AF0 C3FD00A8 */ lfs f31, 0xa8(r29)
/* 00009AF4 C01E0000 */ lfs f0, 0(r30)
/* 00009AF8 FC1F0040 */ fcmpo cr0, f31, f0
/* 00009AFC 40810054 */ ble lbl_00009B50
/* 00009B00 C01D0018 */ lfs f0, 0x18(r29)
/* 00009B04 C05D001C */ lfs f2, 0x1c(r29)
/* 00009B08 EC2007F2 */ fmuls f1, f0, f31
/* 00009B0C C01E0004 */ lfs f0, 4(r30)
/* 00009B10 C07D0020 */ lfs f3, 0x20(r29)
/* 00009B14 EC4207F2 */ fmuls f2, f2, f31
/* 00009B18 FC010040 */ fcmpo cr0, f1, f0
/* 00009B1C EC6307F2 */ fmuls f3, f3, f31
/* 00009B20 40810008 */ ble lbl_00009B28
/* 00009B24 FC200090 */ fmr f1, f0
lbl_00009B28:
/* 00009B28 C01E0004 */ lfs f0, 4(r30)
/* 00009B2C FC020040 */ fcmpo cr0, f2, f0
/* 00009B30 40810008 */ ble lbl_00009B38
/* 00009B34 FC400090 */ fmr f2, f0
lbl_00009B38:
/* 00009B38 C01E0004 */ lfs f0, 4(r30)
/* 00009B3C FC030040 */ fcmpo cr0, f3, f0
/* 00009B40 40810008 */ ble lbl_00009B48
/* 00009B44 FC600090 */ fmr f3, f0
lbl_00009B48:
/* 00009B48 C09E0000 */ lfs f4, 0(r30)
/* 00009B4C 4BFF6619 */ bl avdisp_set_post_add_color
lbl_00009B50:
/* 00009B50 807D0030 */ lwz r3, 0x30(r29)
/* 00009B54 4BFF6611 */ bl avdisp_draw_model_culled_sort_translucent
/* 00009B58 C03E0000 */ lfs f1, 0(r30)
/* 00009B5C FC1F0840 */ fcmpo cr0, f31, f1
/* 00009B60 40810014 */ ble lbl_00009B74
/* 00009B64 FC400890 */ fmr f2, f1
/* 00009B68 FC600890 */ fmr f3, f1
/* 00009B6C FC800890 */ fmr f4, f1
/* 00009B70 4BFF65F5 */ bl avdisp_set_post_add_color
lbl_00009B74:
/* 00009B74 8001003C */ lwz r0, 0x3c(r1)
/* 00009B78 CBE10030 */ lfd f31, 0x30(r1)
/* 00009B7C 83E1002C */ lwz r31, 0x2c(r1)
/* 00009B80 7C0803A6 */ mtlr r0
/* 00009B84 83C10028 */ lwz r30, 0x28(r1)
/* 00009B88 83A10024 */ lwz r29, 0x24(r1)
/* 00009B8C 38210038 */ addi r1, r1, 0x38
/* 00009B90 4E800020 */ blr 
