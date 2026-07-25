/* 00007F7C 7C0802A6 */ mflr r0
/* 00007F80 90010004 */ stw r0, 4(r1)
/* 00007F84 9421FFD8 */ stwu r1, -0x28(r1)
/* 00007F88 DBE10020 */ stfd f31, 0x20(r1)
/* 00007F8C 93E1001C */ stw r31, 0x1c(r1)
/* 00007F90 7C7F1B78 */ mr r31, r3
/* 00007F94 93C10018 */ stw r30, 0x18(r1)
/* 00007F98 C3E30024 */ lfs f31, 0x24(r3)
/* 00007F9C 387F0034 */ addi r3, r31, 0x34
/* 00007FA0 83DF0030 */ lwz r30, 0x30(r31)
/* 00007FA4 4BFF81C1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00007FA8 A87F004E */ lha r3, 0x4e(r31)
/* 00007FAC 4BFF81B9 */ bl mathutil_mtxA_rotate_y
/* 00007FB0 A87F004C */ lha r3, 0x4c(r31)
/* 00007FB4 4BFF81B1 */ bl mathutil_mtxA_rotate_x
/* 00007FB8 A87F0050 */ lha r3, 0x50(r31)
/* 00007FBC 4BFF81A9 */ bl mathutil_mtxA_rotate_z
/* 00007FC0 FC20F890 */ fmr f1, f31
/* 00007FC4 4BFF81A1 */ bl mathutil_mtxA_scale_s
/* 00007FC8 3C600000 */ lis r3, mathutilData@ha
/* 00007FCC 3BE30000 */ addi r31, r3, mathutilData@l
/* 00007FD0 807F0000 */ lwz r3, 0(r31)
/* 00007FD4 38800000 */ li r4, 0
/* 00007FD8 4BFF818D */ bl GXLoadPosMtxImm
/* 00007FDC 807F0000 */ lwz r3, 0(r31)
/* 00007FE0 38800000 */ li r4, 0
/* 00007FE4 4BFF8181 */ bl GXLoadNrmMtxImm
/* 00007FE8 FC20F890 */ fmr f1, f31
/* 00007FEC 4BFF8179 */ bl avdisp_set_bound_sphere_scale
/* 00007FF0 7FC3F378 */ mr r3, r30
/* 00007FF4 4BFF8171 */ bl avdisp_draw_model_culled_sort_translucent
/* 00007FF8 3861000C */ addi r3, r1, 0xc
/* 00007FFC 38A30004 */ addi r5, r3, 4
/* 00008000 38830008 */ addi r4, r3, 8
/* 00008004 3CC0E000 */ lis r6, 0xe000
/* 00008008 C046000C */ lfs f2, 0xc(r6)
/* 0000800C C026001C */ lfs f1, 0x1c(r6)
/* 00008010 C006002C */ lfs f0, 0x2c(r6)
/* 00008014 D041000C */ stfs f2, 0xc(r1)
/* 00008018 D0250000 */ stfs f1, 0(r5)
/* 0000801C D0040000 */ stfs f0, 0(r4)
/* 00008020 3C800000 */ lis r4, lbl_0001C128@ha
/* 00008024 C0010014 */ lfs f0, 0x14(r1)
/* 00008028 C03E0014 */ lfs f1, 0x14(r30)
/* 0000802C FC400050 */ fneg f2, f0
/* 00008030 C001000C */ lfs f0, 0xc(r1)
/* 00008034 EC2107F2 */ fmuls f1, f1, f31
/* 00008038 EC220828 */ fsubs f1, f2, f1
/* 0000803C EC411024 */ fdivs f2, f1, f2
/* 00008040 EC0000B2 */ fmuls f0, f0, f2
/* 00008044 D001000C */ stfs f0, 0xc(r1)
/* 00008048 C0010010 */ lfs f0, 0x10(r1)
/* 0000804C EC0000B2 */ fmuls f0, f0, f2
/* 00008050 D0010010 */ stfs f0, 0x10(r1)
/* 00008054 C0010014 */ lfs f0, 0x14(r1)
/* 00008058 EC0000B2 */ fmuls f0, f0, f2
/* 0000805C D0010014 */ stfs f0, 0x14(r1)
/* 00008060 C01E0014 */ lfs f0, 0x14(r30)
/* 00008064 C0240000 */ lfs f1, lbl_0001C128@l(r4)
/* 00008068 EC0000B2 */ fmuls f0, f0, f2
/* 0000806C EC010032 */ fmuls f0, f1, f0
/* 00008070 EFFF0032 */ fmuls f31, f31, f0
/* 00008074 4BFF80F1 */ bl mathutil_mtxA_from_translate
/* 00008078 FC20F890 */ fmr f1, f31
/* 0000807C 4BFF80E9 */ bl mathutil_mtxA_scale_s
/* 00008080 807F0000 */ lwz r3, 0(r31)
/* 00008084 38800000 */ li r4, 0
/* 00008088 4BFF80DD */ bl GXLoadPosMtxImm
/* 0000808C 807F0000 */ lwz r3, 0(r31)
/* 00008090 38800000 */ li r4, 0
/* 00008094 4BFF80D1 */ bl GXLoadNrmMtxImm
/* 00008098 FC20F890 */ fmr f1, f31
/* 0000809C 4BFF80C9 */ bl avdisp_set_bound_sphere_scale
/* 000080A0 3C600000 */ lis r3, commonGma@ha
/* 000080A4 38630000 */ addi r3, r3, commonGma@l
/* 000080A8 80630000 */ lwz r3, 0(r3)
/* 000080AC 80630008 */ lwz r3, 8(r3)
/* 000080B0 806302D0 */ lwz r3, 0x2d0(r3)
/* 000080B4 4BFF80B1 */ bl avdisp_draw_model_culled_sort_translucent
/* 000080B8 8001002C */ lwz r0, 0x2c(r1)
/* 000080BC CBE10020 */ lfd f31, 0x20(r1)
/* 000080C0 83E1001C */ lwz r31, 0x1c(r1)
/* 000080C4 7C0803A6 */ mtlr r0
/* 000080C8 83C10018 */ lwz r30, 0x18(r1)
/* 000080CC 38210028 */ addi r1, r1, 0x28
/* 000080D0 4E800020 */ blr 
