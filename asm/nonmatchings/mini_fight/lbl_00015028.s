lbl_00015028:
/* 00015028 7C0802A6 */ mflr r0
/* 0001502C 90010004 */ stw r0, 4(r1)
/* 00015030 9421FFC8 */ stwu r1, -0x38(r1)
/* 00015034 DBE10030 */ stfd f31, 0x30(r1)
/* 00015038 DBC10028 */ stfd f30, 0x28(r1)
/* 0001503C 93E10024 */ stw r31, 0x24(r1)
/* 00015040 93C10020 */ stw r30, 0x20(r1)
/* 00015044 93A1001C */ stw r29, 0x1c(r1)
/* 00015048 3BA30000 */ addi r29, r3, 0
/* 0001504C 3C600000 */ lis r3, lbl_0001C5B0@ha
/* 00015050 C3DD0014 */ lfs f30, 0x14(r29)
/* 00015054 3BC30000 */ addi r30, r3, lbl_0001C5B0@l
/* 00015058 4BFEB10D */ bl mathutil_mtxA_from_mtxB
/* 0001505C 387D0020 */ addi r3, r29, 0x20
/* 00015060 4BFEB105 */ bl mathutil_mtxA_translate
/* 00015064 3C600000 */ lis r3, userWork@ha
/* 00015068 38630000 */ addi r3, r3, userWork@l
/* 0001506C 80630000 */ lwz r3, 0(r3)
/* 00015070 38630060 */ addi r3, r3, 0x60
/* 00015074 4BFEB0F1 */ bl mathutil_mtxA_sq_from_mtx
/* 00015078 A87D003A */ lha r3, 0x3a(r29)
/* 0001507C 4BFEB0E9 */ bl mathutil_mtxA_rotate_y
/* 00015080 A87D0038 */ lha r3, 0x38(r29)
/* 00015084 4BFEB0E1 */ bl mathutil_mtxA_rotate_x
/* 00015088 A87D003C */ lha r3, 0x3c(r29)
/* 0001508C 4BFEB0D9 */ bl mathutil_mtxA_rotate_z
/* 00015090 83BD001C */ lwz r29, 0x1c(r29)
/* 00015094 C85E0050 */ lfd f2, 0x50(r30)
/* 00015098 C03D0014 */ lfs f1, 0x14(r29)
/* 0001509C 387D0008 */ addi r3, r29, 8
/* 000150A0 EC1E0824 */ fdivs f0, f30, f1
/* 000150A4 FFE20032 */ fmul f31, f2, f0
/* 000150A8 FFE0F818 */ frsp f31, f31
/* 000150AC FC40F890 */ fmr f2, f31
/* 000150B0 4BFEB0B5 */ bl test_scaled_sphere_in_frustum
/* 000150B4 2C030000 */ cmpwi r3, 0
/* 000150B8 418200BC */ beq lbl_00015174
/* 000150BC C81E0058 */ lfd f0, 0x58(r30)
/* 000150C0 FC00F800 */ fcmpu cr0, f0, f31
/* 000150C4 41820014 */ beq lbl_000150D8
/* 000150C8 FC20F890 */ fmr f1, f31
/* 000150CC FC40F890 */ fmr f2, f31
/* 000150D0 FC60F890 */ fmr f3, f31
/* 000150D4 4BFEB091 */ bl mathutil_mtxA_scale_xyz
lbl_000150D8:
/* 000150D8 3861000C */ addi r3, r1, 0xc
/* 000150DC 38830004 */ addi r4, r3, 4
/* 000150E0 38630008 */ addi r3, r3, 8
/* 000150E4 3CA0E000 */ lis r5, 0xe000
/* 000150E8 C045000C */ lfs f2, 0xc(r5)
/* 000150EC C025001C */ lfs f1, 0x1c(r5)
/* 000150F0 C005002C */ lfs f0, 0x2c(r5)
/* 000150F4 D041000C */ stfs f2, 0xc(r1)
/* 000150F8 D0240000 */ stfs f1, 0(r4)
/* 000150FC D0030000 */ stfs f0, 0(r3)
/* 00015100 C0010014 */ lfs f0, 0x14(r1)
/* 00015104 C05E0060 */ lfs f2, 0x60(r30)
/* 00015108 EC20F02A */ fadds f1, f0, f30
/* 0001510C C01E0038 */ lfs f0, 0x38(r30)
/* 00015110 EC22082A */ fadds f1, f2, f1
/* 00015114 EC21F024 */ fdivs f1, f1, f30
/* 00015118 FFC00850 */ fneg f30, f1
/* 0001511C FC1E0040 */ fcmpo cr0, f30, f0
/* 00015120 40810054 */ ble lbl_00015174
/* 00015124 FC20F890 */ fmr f1, f31
/* 00015128 4BFEB03D */ bl avdisp_set_bound_sphere_scale
/* 0001512C 3C600000 */ lis r3, mathutilData@ha
/* 00015130 3BE30000 */ addi r31, r3, mathutilData@l
/* 00015134 807F0000 */ lwz r3, 0(r31)
/* 00015138 38800000 */ li r4, 0
/* 0001513C 4BFEB029 */ bl GXLoadPosMtxImm
/* 00015140 807F0000 */ lwz r3, 0(r31)
/* 00015144 38800000 */ li r4, 0
/* 00015148 4BFEB01D */ bl GXLoadNrmMtxImm
/* 0001514C C01E001C */ lfs f0, 0x1c(r30)
/* 00015150 FC1E0040 */ fcmpo cr0, f30, f0
/* 00015154 40800018 */ bge lbl_0001516C
/* 00015158 FC20F090 */ fmr f1, f30
/* 0001515C 4BFEB009 */ bl avdisp_set_alpha
/* 00015160 7FA3EB78 */ mr r3, r29
/* 00015164 4BFEB001 */ bl avdisp_draw_model_unculled_sort_all
/* 00015168 4800000C */ b lbl_00015174
lbl_0001516C:
/* 0001516C 7FA3EB78 */ mr r3, r29
/* 00015170 4BFEAFF5 */ bl avdisp_draw_model_unculled_sort_none
lbl_00015174:
/* 00015174 8001003C */ lwz r0, 0x3c(r1)
/* 00015178 CBE10030 */ lfd f31, 0x30(r1)
/* 0001517C CBC10028 */ lfd f30, 0x28(r1)
/* 00015180 7C0803A6 */ mtlr r0
/* 00015184 83E10024 */ lwz r31, 0x24(r1)
/* 00015188 83C10020 */ lwz r30, 0x20(r1)
/* 0001518C 83A1001C */ lwz r29, 0x1c(r1)
/* 00015190 38210038 */ addi r1, r1, 0x38
/* 00015194 4E800020 */ blr 
