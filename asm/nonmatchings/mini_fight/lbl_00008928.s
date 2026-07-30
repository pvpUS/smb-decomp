/* 00008928 7C0802A6 */ mflr r0
/* 0000892C 3C800000 */ lis r4, lbl_0001C108@ha
/* 00008930 90010004 */ stw r0, 4(r1)
/* 00008934 9421FFD8 */ stwu r1, -0x28(r1)
/* 00008938 DBE10020 */ stfd f31, 0x20(r1)
/* 0000893C 93E1001C */ stw r31, 0x1c(r1)
/* 00008940 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 00008944 93C10018 */ stw r30, 0x18(r1)
/* 00008948 3BC30000 */ addi r30, r3, 0
/* 0000894C C00300A8 */ lfs f0, 0xa8(r3)
/* 00008950 387E0034 */ addi r3, r30, 0x34
/* 00008954 C03F0078 */ lfs f1, 0x78(r31)
/* 00008958 EFE10032 */ fmuls f31, f1, f0
/* 0000895C 4BFF7809 */ bl mathutil_mtxA_from_mtxB_translate
/* 00008960 C03F0078 */ lfs f1, 0x78(r31)
/* 00008964 C01E00A8 */ lfs f0, 0xa8(r30)
/* 00008968 EC210032 */ fmuls f1, f1, f0
/* 0000896C 4BFF77F9 */ bl mathutil_mtxA_scale_s
/* 00008970 C03F0088 */ lfs f1, 0x88(r31)
/* 00008974 C01E00A8 */ lfs f0, 0xa8(r30)
/* 00008978 EC010032 */ fmuls f0, f1, f0
/* 0000897C FC00001E */ fctiwz f0, f0
/* 00008980 D8010010 */ stfd f0, 0x10(r1)
/* 00008984 80610014 */ lwz r3, 0x14(r1)
/* 00008988 4BFF77DD */ bl mathutil_mtxA_rotate_y
/* 0000898C 3C600000 */ lis r3, mathutilData@ha
/* 00008990 3BE30000 */ addi r31, r3, mathutilData@l
/* 00008994 807F0000 */ lwz r3, 0(r31)
/* 00008998 38800000 */ li r4, 0
/* 0000899C 4BFF77C9 */ bl GXLoadPosMtxImm
/* 000089A0 807F0000 */ lwz r3, 0(r31)
/* 000089A4 38800000 */ li r4, 0
/* 000089A8 4BFF77BD */ bl GXLoadNrmMtxImm
/* 000089AC FC20F890 */ fmr f1, f31
/* 000089B0 4BFF77B5 */ bl avdisp_set_bound_sphere_scale
/* 000089B4 807E0030 */ lwz r3, 0x30(r30)
/* 000089B8 4BFF77AD */ bl avdisp_draw_model_culled_sort_translucent
/* 000089BC 8001002C */ lwz r0, 0x2c(r1)
/* 000089C0 CBE10020 */ lfd f31, 0x20(r1)
/* 000089C4 83E1001C */ lwz r31, 0x1c(r1)
/* 000089C8 7C0803A6 */ mtlr r0
/* 000089CC 83C10018 */ lwz r30, 0x18(r1)
/* 000089D0 38210028 */ addi r1, r1, 0x28
/* 000089D4 4E800020 */ blr 
