lbl_000147E0:
/* 000147E0 7C0802A6 */ mflr r0
/* 000147E4 90010004 */ stw r0, 4(r1)
/* 000147E8 9421FFC8 */ stwu r1, -0x38(r1)
/* 000147EC DBE10030 */ stfd f31, 0x30(r1)
/* 000147F0 DBC10028 */ stfd f30, 0x28(r1)
/* 000147F4 93E10024 */ stw r31, 0x24(r1)
/* 000147F8 93C10020 */ stw r30, 0x20(r1)
/* 000147FC 93A1001C */ stw r29, 0x1c(r1)
/* 00014800 3BA30000 */ addi r29, r3, 0
/* 00014804 3C600000 */ lis r3, lbl_0001C540@ha
/* 00014808 C3DD0014 */ lfs f30, 0x14(r29)
/* 0001480C 3BC30000 */ addi r30, r3, lbl_0001C540@l
/* 00014810 4BFEB955 */ bl mathutil_mtxA_from_mtxB
/* 00014814 387D0020 */ addi r3, r29, 0x20
/* 00014818 4BFEB94D */ bl mathutil_mtxA_translate
/* 0001481C 3C600000 */ lis r3, userWork@ha
/* 00014820 38630000 */ addi r3, r3, userWork@l
/* 00014824 80630000 */ lwz r3, 0(r3)
/* 00014828 38630060 */ addi r3, r3, 0x60
/* 0001482C 4BFEB939 */ bl mathutil_mtxA_sq_from_mtx
/* 00014830 A87D003A */ lha r3, 0x3a(r29)
/* 00014834 4BFEB931 */ bl mathutil_mtxA_rotate_y
/* 00014838 A87D0038 */ lha r3, 0x38(r29)
/* 0001483C 4BFEB929 */ bl mathutil_mtxA_rotate_x
/* 00014840 A87D003C */ lha r3, 0x3c(r29)
/* 00014844 4BFEB921 */ bl mathutil_mtxA_rotate_z
/* 00014848 807D001C */ lwz r3, 0x1c(r29)
/* 0001484C 4BFEB919 */ bl get_lod
/* 00014850 C0230014 */ lfs f1, 0x14(r3)
/* 00014854 7C7D1B78 */ mr r29, r3
/* 00014858 C85E0050 */ lfd f2, 0x50(r30)
/* 0001485C 387D0008 */ addi r3, r29, 8
/* 00014860 EC1E0824 */ fdivs f0, f30, f1
/* 00014864 FFE20032 */ fmul f31, f2, f0
/* 00014868 FFE0F818 */ frsp f31, f31
/* 0001486C FC40F890 */ fmr f2, f31
/* 00014870 4BFEB8F5 */ bl test_scaled_sphere_in_frustum
/* 00014874 2C030000 */ cmpwi r3, 0
/* 00014878 418200BC */ beq lbl_00014934
/* 0001487C C81E0058 */ lfd f0, 0x58(r30)
/* 00014880 FC00F800 */ fcmpu cr0, f0, f31
/* 00014884 41820014 */ beq lbl_00014898
/* 00014888 FC20F890 */ fmr f1, f31
/* 0001488C FC40F890 */ fmr f2, f31
/* 00014890 FC60F890 */ fmr f3, f31
/* 00014894 4BFEB8D1 */ bl mathutil_mtxA_scale_xyz
lbl_00014898:
/* 00014898 3861000C */ addi r3, r1, 0xc
/* 0001489C 38830004 */ addi r4, r3, 4
/* 000148A0 38630008 */ addi r3, r3, 8
/* 000148A4 3CA0E000 */ lis r5, 0xe000
/* 000148A8 C045000C */ lfs f2, 0xc(r5)
/* 000148AC C025001C */ lfs f1, 0x1c(r5)
/* 000148B0 C005002C */ lfs f0, 0x2c(r5)
/* 000148B4 D041000C */ stfs f2, 0xc(r1)
/* 000148B8 D0240000 */ stfs f1, 0(r4)
/* 000148BC D0030000 */ stfs f0, 0(r3)
/* 000148C0 C0010014 */ lfs f0, 0x14(r1)
/* 000148C4 C05E001C */ lfs f2, 0x1c(r30)
/* 000148C8 EC20F02A */ fadds f1, f0, f30
/* 000148CC C01E0038 */ lfs f0, 0x38(r30)
/* 000148D0 EC22082A */ fadds f1, f2, f1
/* 000148D4 EC21F024 */ fdivs f1, f1, f30
/* 000148D8 FFC00850 */ fneg f30, f1
/* 000148DC FC1E0040 */ fcmpo cr0, f30, f0
/* 000148E0 40810054 */ ble lbl_00014934
/* 000148E4 FC20F890 */ fmr f1, f31
/* 000148E8 4BFEB87D */ bl avdisp_set_bound_sphere_scale
/* 000148EC 3C600000 */ lis r3, mathutilData@ha
/* 000148F0 3BE30000 */ addi r31, r3, mathutilData@l
/* 000148F4 807F0000 */ lwz r3, 0(r31)
/* 000148F8 38800000 */ li r4, 0
/* 000148FC 4BFEB869 */ bl GXLoadPosMtxImm
/* 00014900 807F0000 */ lwz r3, 0(r31)
/* 00014904 38800000 */ li r4, 0
/* 00014908 4BFEB85D */ bl GXLoadNrmMtxImm
/* 0001490C C01E0010 */ lfs f0, 0x10(r30)
/* 00014910 FC1E0040 */ fcmpo cr0, f30, f0
/* 00014914 40800018 */ bge lbl_0001492C
/* 00014918 FC20F090 */ fmr f1, f30
/* 0001491C 4BFEB849 */ bl avdisp_set_alpha
/* 00014920 7FA3EB78 */ mr r3, r29
/* 00014924 4BFEB841 */ bl avdisp_draw_model_unculled_sort_all
/* 00014928 4800000C */ b lbl_00014934
lbl_0001492C:
/* 0001492C 7FA3EB78 */ mr r3, r29
/* 00014930 4BFEB835 */ bl avdisp_draw_model_unculled_sort_none
lbl_00014934:
/* 00014934 8001003C */ lwz r0, 0x3c(r1)
/* 00014938 CBE10030 */ lfd f31, 0x30(r1)
/* 0001493C CBC10028 */ lfd f30, 0x28(r1)
/* 00014940 7C0803A6 */ mtlr r0
/* 00014944 83E10024 */ lwz r31, 0x24(r1)
/* 00014948 83C10020 */ lwz r30, 0x20(r1)
/* 0001494C 83A1001C */ lwz r29, 0x1c(r1)
/* 00014950 38210038 */ addi r1, r1, 0x38
/* 00014954 4E800020 */ blr 
