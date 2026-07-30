/* 00012F34 7C0802A6 */ mflr r0
/* 00012F38 3C800000 */ lis r4, currentBall@ha
/* 00012F3C 90010004 */ stw r0, 4(r1)
/* 00012F40 3CC00000 */ lis r6, lbl_00014060@ha
/* 00012F44 9421FFB8 */ stwu r1, -0x48(r1)
/* 00012F48 DBE10040 */ stfd f31, 0x40(r1)
/* 00012F4C DBC10038 */ stfd f30, 0x38(r1)
/* 00012F50 93E10034 */ stw r31, 0x34(r1)
/* 00012F54 3BE60000 */ addi r31, r6, lbl_00014060@l
/* 00012F58 93C10030 */ stw r30, 0x30(r1)
/* 00012F5C 3BC30000 */ addi r30, r3, 0
/* 00012F60 93A1002C */ stw r29, 0x2c(r1)
/* 00012F64 80A40000 */ lwz r5, currentBall@l(r4)
/* 00012F68 3C800000 */ lis r4, cameraInfo@ha
/* 00012F6C C05F0048 */ lfs f2, 0x48(r31)
/* 00012F70 8805002E */ lbz r0, 0x2e(r5)
/* 00012F74 C01F004C */ lfs f0, 0x4c(r31)
/* 00012F78 7C000774 */ extsb r0, r0
/* 00012F7C 1C600284 */ mulli r3, r0, 0x284
/* 00012F80 38040000 */ addi r0, r4, cameraInfo@l
/* 00012F84 7FA01A14 */ add r29, r0, r3
/* 00012F88 C03D004C */ lfs f1, 0x4c(r29)
/* 00012F8C 387E0034 */ addi r3, r30, 0x34
/* 00012F90 EFE20072 */ fmuls f31, f2, f1
/* 00012F94 EFC0F824 */ fdivs f30, f0, f31
/* 00012F98 C0BD0000 */ lfs f5, 0(r29)
/* 00012F9C C0430000 */ lfs f2, 0(r3)
/* 00012FA0 C09D0004 */ lfs f4, 4(r29)
/* 00012FA4 C0230004 */ lfs f1, 4(r3)
/* 00012FA8 C07D0008 */ lfs f3, 8(r29)
/* 00012FAC C0030008 */ lfs f0, 8(r3)
/* 00012FB0 ECA51028 */ fsubs f5, f5, f2
/* 00012FB4 EC840828 */ fsubs f4, f4, f1
/* 00012FB8 EC630028 */ fsubs f3, f3, f0
/* 00012FBC EC250172 */ fmuls f1, f5, f5
/* 00012FC0 EC24093A */ fmadds f1, f4, f4, f1
/* 00012FC4 EC2308FA */ fmadds f1, f3, f3, f1
/* 00012FC8 4BFED1B5 */ bl mathutil_sqrt
/* 00012FCC C05D0038 */ lfs f2, 0x38(r29)
/* 00012FD0 C01F0050 */ lfs f0, 0x50(r31)
/* 00012FD4 EC220072 */ fmuls f1, f2, f1
/* 00012FD8 EC5F0824 */ fdivs f2, f31, f1
/* 00012FDC FC020040 */ fcmpo cr0, f2, f0
/* 00012FE0 40800010 */ bge lbl_00012FF0
/* 00012FE4 EC000072 */ fmuls f0, f0, f1
/* 00012FE8 EFC007B2 */ fmuls f30, f0, f30
/* 00012FEC 48000008 */ b lbl_00012FF4
lbl_00012FF0:
/* 00012FF0 C3DF004C */ lfs f30, 0x4c(r31)
lbl_00012FF4:
/* 00012FF4 3C600000 */ lis r3, currentBall@ha
/* 00012FF8 A89E0014 */ lha r4, 0x14(r30)
/* 00012FFC 38630000 */ addi r3, r3, currentBall@l
/* 00013000 80630000 */ lwz r3, 0(r3)
/* 00013004 8803002E */ lbz r0, 0x2e(r3)
/* 00013008 7C000774 */ extsb r0, r0
/* 0001300C 7C040000 */ cmpw r4, r0
/* 00013010 40820040 */ bne lbl_00013050
/* 00013014 1C0401A4 */ mulli r0, r4, 0x1a4
/* 00013018 3C600000 */ lis r3, ballInfo@ha
/* 0001301C 38630000 */ addi r3, r3, ballInfo@l
/* 00013020 7C830214 */ add r4, r3, r0
/* 00013024 80640004 */ lwz r3, 4(r4)
/* 00013028 80040008 */ lwz r0, 8(r4)
/* 0001302C 90610018 */ stw r3, 0x18(r1)
/* 00013030 9001001C */ stw r0, 0x1c(r1)
/* 00013034 8004000C */ lwz r0, 0xc(r4)
/* 00013038 90010020 */ stw r0, 0x20(r1)
/* 0001303C C021001C */ lfs f1, 0x1c(r1)
/* 00013040 C01F004C */ lfs f0, 0x4c(r31)
/* 00013044 EC010028 */ fsubs f0, f1, f0
/* 00013048 D001001C */ stfs f0, 0x1c(r1)
/* 0001304C 4800001C */ b lbl_00013068
lbl_00013050:
/* 00013050 807E0034 */ lwz r3, 0x34(r30)
/* 00013054 801E0038 */ lwz r0, 0x38(r30)
/* 00013058 90610018 */ stw r3, 0x18(r1)
/* 0001305C 9001001C */ stw r0, 0x1c(r1)
/* 00013060 801E003C */ lwz r0, 0x3c(r30)
/* 00013064 90010020 */ stw r0, 0x20(r1)
lbl_00013068:
/* 00013068 38610018 */ addi r3, r1, 0x18
/* 0001306C 4BFED111 */ bl mathutil_mtxA_from_mtxB_translate
/* 00013070 4BFED10D */ bl mathutil_mtxA_sq_from_identity
/* 00013074 C03F0054 */ lfs f1, 0x54(r31)
/* 00013078 C07F004C */ lfs f3, 0x4c(r31)
/* 0001307C FC400890 */ fmr f2, f1
/* 00013080 4BFED0FD */ bl mathutil_mtxA_translate_xyz
/* 00013084 C01E0024 */ lfs f0, 0x24(r30)
/* 00013088 3861000C */ addi r3, r1, 0xc
/* 0001308C EC0007B2 */ fmuls f0, f0, f30
/* 00013090 D001000C */ stfs f0, 0xc(r1)
/* 00013094 C01E0028 */ lfs f0, 0x28(r30)
/* 00013098 EC0007B2 */ fmuls f0, f0, f30
/* 0001309C D0010010 */ stfs f0, 0x10(r1)
/* 000130A0 C01E002C */ lfs f0, 0x2c(r30)
/* 000130A4 EC0007B2 */ fmuls f0, f0, f30
/* 000130A8 D0010014 */ stfs f0, 0x14(r1)
/* 000130AC 4BFED0D1 */ bl mathutil_mtxA_scale
/* 000130B0 C0410010 */ lfs f2, 0x10(r1)
/* 000130B4 C0010014 */ lfs f0, 0x14(r1)
/* 000130B8 FC020040 */ fcmpo cr0, f2, f0
/* 000130BC 40810008 */ ble lbl_000130C4
/* 000130C0 48000008 */ b lbl_000130C8
lbl_000130C4:
/* 000130C4 FC400090 */ fmr f2, f0
lbl_000130C8:
/* 000130C8 C021000C */ lfs f1, 0xc(r1)
/* 000130CC FC011040 */ fcmpo cr0, f1, f2
/* 000130D0 40810008 */ ble lbl_000130D8
/* 000130D4 4800001C */ b lbl_000130F0
lbl_000130D8:
/* 000130D8 C0210010 */ lfs f1, 0x10(r1)
/* 000130DC C0010014 */ lfs f0, 0x14(r1)
/* 000130E0 FC010040 */ fcmpo cr0, f1, f0
/* 000130E4 40810008 */ ble lbl_000130EC
/* 000130E8 48000008 */ b lbl_000130F0
lbl_000130EC:
/* 000130EC FC200090 */ fmr f1, f0
lbl_000130F0:
/* 000130F0 4BFED08D */ bl avdisp_set_bound_sphere_scale
/* 000130F4 807E0030 */ lwz r3, 0x30(r30)
/* 000130F8 4BFED085 */ bl avdisp_draw_model_culled_sort_translucent
/* 000130FC 8001004C */ lwz r0, 0x4c(r1)
/* 00013100 CBE10040 */ lfd f31, 0x40(r1)
/* 00013104 CBC10038 */ lfd f30, 0x38(r1)
/* 00013108 7C0803A6 */ mtlr r0
/* 0001310C 83E10034 */ lwz r31, 0x34(r1)
/* 00013110 83C10030 */ lwz r30, 0x30(r1)
/* 00013114 83A1002C */ lwz r29, 0x2c(r1)
/* 00013118 38210048 */ addi r1, r1, 0x48
/* 0001311C 4E800020 */ blr 
