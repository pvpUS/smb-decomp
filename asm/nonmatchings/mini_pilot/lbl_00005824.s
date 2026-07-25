/* 00005824 7C0802A6 */ mflr r0
/* 00005828 3C800000 */ lis r4, lbl_0000BE80@ha
/* 0000582C 90010004 */ stw r0, 4(r1)
/* 00005830 3CC00000 */ lis r6, lbl_10000000@ha
/* 00005834 9421FEF0 */ stwu r1, -0x110(r1)
/* 00005838 DBE10108 */ stfd f31, 0x108(r1)
/* 0000583C 93E10104 */ stw r31, 0x104(r1)
/* 00005840 3BE40000 */ addi r31, r4, lbl_0000BE80@l
/* 00005844 3C800000 */ lis r4, lbl_802F1FD0@ha
/* 00005848 93C10100 */ stw r30, 0x100(r1)
/* 0000584C 3BC60000 */ addi r30, r6, lbl_10000000@l
/* 00005850 93A100FC */ stw r29, 0xfc(r1)
/* 00005854 3BA30000 */ addi r29, r3, 0
/* 00005858 938100F8 */ stw r28, 0xf8(r1)
/* 0000585C 80BF0318 */ lwz r5, 0x318(r31)
/* 00005860 801F031C */ lwz r0, 0x31c(r31)
/* 00005864 90A100C8 */ stw r5, 0xc8(r1)
/* 00005868 900100CC */ stw r0, 0xcc(r1)
/* 0000586C 801F0320 */ lwz r0, 0x320(r31)
/* 00005870 900100D0 */ stw r0, 0xd0(r1)
/* 00005874 807F0324 */ lwz r3, 0x324(r31)
/* 00005878 801F0328 */ lwz r0, 0x328(r31)
/* 0000587C 906100BC */ stw r3, 0xbc(r1)
/* 00005880 900100C0 */ stw r0, 0xc0(r1)
/* 00005884 801F032C */ lwz r0, 0x32c(r31)
/* 00005888 900100C4 */ stw r0, 0xc4(r1)
/* 0000588C 807F0330 */ lwz r3, 0x330(r31)
/* 00005890 801F0334 */ lwz r0, 0x334(r31)
/* 00005894 906100B0 */ stw r3, 0xb0(r1)
/* 00005898 900100B4 */ stw r0, 0xb4(r1)
/* 0000589C 801F0338 */ lwz r0, 0x338(r31)
/* 000058A0 900100B8 */ stw r0, 0xb8(r1)
/* 000058A4 807F033C */ lwz r3, 0x33c(r31)
/* 000058A8 801F0340 */ lwz r0, 0x340(r31)
/* 000058AC 906100A4 */ stw r3, 0xa4(r1)
/* 000058B0 900100A8 */ stw r0, 0xa8(r1)
/* 000058B4 801F0344 */ lwz r0, 0x344(r31)
/* 000058B8 900100AC */ stw r0, 0xac(r1)
/* 000058BC 80040000 */ lwz r0, lbl_802F1FD0@l(r4)
/* 000058C0 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 000058C4 40820028 */ bne lbl_000058EC
/* 000058C8 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 000058CC C81F0198 */ lfd f0, 0x198(r31)
/* 000058D0 C4230000 */ lfsu f1, lbl_802F1FDC@l(r3)
/* 000058D4 FC010040 */ fcmpo cr0, f1, f0
/* 000058D8 40800014 */ bge lbl_000058EC
/* 000058DC C81F02A0 */ lfd f0, 0x2a0(r31)
/* 000058E0 FC01002A */ fadd f0, f1, f0
/* 000058E4 FC000018 */ frsp f0, f0
/* 000058E8 D0030000 */ stfs f0, 0(r3)
lbl_000058EC:
/* 000058EC 387D0030 */ addi r3, r29, 0x30
/* 000058F0 4BFFA85D */ bl mathutil_mtxA_from_mtx
/* 000058F4 386100A4 */ addi r3, r1, 0xa4
/* 000058F8 3881008C */ addi r4, r1, 0x8c
/* 000058FC 4BFFA851 */ bl mathutil_mtxA_tf_vec
/* 00005900 386100BC */ addi r3, r1, 0xbc
/* 00005904 38810074 */ addi r4, r1, 0x74
/* 00005908 4BFFA845 */ bl mathutil_mtxA_tf_vec
/* 0000590C 386100C8 */ addi r3, r1, 0xc8
/* 00005910 38810068 */ addi r4, r1, 0x68
/* 00005914 4BFFA839 */ bl mathutil_mtxA_tf_vec
/* 00005918 387D001C */ addi r3, r29, 0x1c
/* 0000591C 38810080 */ addi r4, r1, 0x80
/* 00005920 4BFFA82D */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005924 C03D001C */ lfs f1, 0x1c(r29)
/* 00005928 C01E0068 */ lfs f0, 0x68(r30)
/* 0000592C EC010028 */ fsubs f0, f1, f0
/* 00005930 D001005C */ stfs f0, 0x5c(r1)
/* 00005934 C03D0020 */ lfs f1, 0x20(r29)
/* 00005938 C01E006C */ lfs f0, 0x6c(r30)
/* 0000593C EC010028 */ fsubs f0, f1, f0
/* 00005940 D0010060 */ stfs f0, 0x60(r1)
/* 00005944 C03D0024 */ lfs f1, 0x24(r29)
/* 00005948 C01E0070 */ lfs f0, 0x70(r30)
/* 0000594C EC010028 */ fsubs f0, f1, f0
/* 00005950 D0010064 */ stfs f0, 0x64(r1)
/* 00005954 C0A1005C */ lfs f5, 0x5c(r1)
/* 00005958 C041008C */ lfs f2, 0x8c(r1)
/* 0000595C C0810060 */ lfs f4, 0x60(r1)
/* 00005960 C0210090 */ lfs f1, 0x90(r1)
/* 00005964 C0610064 */ lfs f3, 0x64(r1)
/* 00005968 C0010094 */ lfs f0, 0x94(r1)
/* 0000596C EC4500B2 */ fmuls f2, f5, f2
/* 00005970 EC44107A */ fmadds f2, f4, f1, f2
/* 00005974 EC43103A */ fmadds f2, f3, f0, f2
/* 00005978 D05E0004 */ stfs f2, 4(r30)
/* 0000597C C03E0004 */ lfs f1, 4(r30)
/* 00005980 4BFFA7CD */ bl mathutil_sqrt
/* 00005984 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00005988 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 0000598C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005990 41820010 */ beq lbl_000059A0
/* 00005994 C3FF0030 */ lfs f31, 0x30(r31)
/* 00005998 FC40F890 */ fmr f2, f31
/* 0000599C 4800007C */ b lbl_00005A18
lbl_000059A0:
/* 000059A0 881D002E */ lbz r0, 0x2e(r29)
/* 000059A4 3CA00000 */ lis r5, controllerInfo@ha
/* 000059A8 3C600000 */ lis r3, playerControllerIDs@ha
/* 000059AC 7C000774 */ extsb r0, r0
/* 000059B0 5404103A */ slwi r4, r0, 2
/* 000059B4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000059B8 7C602214 */ add r3, r0, r4
/* 000059BC 80030000 */ lwz r0, 0(r3)
/* 000059C0 3C800000 */ lis r4, lbl_0000BEE0@ha
/* 000059C4 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 000059C8 C8840000 */ lfd f4, lbl_0000BEE0@l(r4)
/* 000059CC 1C00003C */ mulli r0, r0, 0x3c
/* 000059D0 C8430000 */ lfd f2, lbl_0000BEE0@l(r3)
/* 000059D4 38A50000 */ addi r5, r5, controllerInfo@l
/* 000059D8 7CC50214 */ add r6, r5, r0
/* 000059DC 88A60002 */ lbz r5, 2(r6)
/* 000059E0 3C604330 */ lis r3, 0x4330
/* 000059E4 88060003 */ lbz r0, 3(r6)
/* 000059E8 7CA50774 */ extsb r5, r5
/* 000059EC 7C000774 */ extsb r0, r0
/* 000059F0 6CA48000 */ xoris r4, r5, 0x8000
/* 000059F4 6C008000 */ xoris r0, r0, 0x8000
/* 000059F8 908100F4 */ stw r4, 0xf4(r1)
/* 000059FC 900100EC */ stw r0, 0xec(r1)
/* 00005A00 906100F0 */ stw r3, 0xf0(r1)
/* 00005A04 906100E8 */ stw r3, 0xe8(r1)
/* 00005A08 C86100F0 */ lfd f3, 0xf0(r1)
/* 00005A0C C80100E8 */ lfd f0, 0xe8(r1)
/* 00005A10 EFE32028 */ fsubs f31, f3, f4
/* 00005A14 EC401028 */ fsubs f2, f0, f2
lbl_00005A18:
/* 00005A18 EC420072 */ fmuls f2, f2, f1
/* 00005A1C C81F0358 */ lfd f0, 0x358(r31)
/* 00005A20 EFFF0072 */ fmuls f31, f31, f1
/* 00005A24 38610040 */ addi r3, r1, 0x40
/* 00005A28 388100C8 */ addi r4, r1, 0xc8
/* 00005A2C FC0000B2 */ fmul f0, f0, f2
/* 00005A30 FC00001E */ fctiwz f0, f0
/* 00005A34 D80100E8 */ stfd f0, 0xe8(r1)
/* 00005A38 80A100EC */ lwz r5, 0xec(r1)
/* 00005A3C 4BFFA711 */ bl mathutil_quat_from_axis_angle
/* 00005A40 C81F0360 */ lfd f0, 0x360(r31)
/* 00005A44 38610030 */ addi r3, r1, 0x30
/* 00005A48 388100B0 */ addi r4, r1, 0xb0
/* 00005A4C FC0007F2 */ fmul f0, f0, f31
/* 00005A50 FC00001E */ fctiwz f0, f0
/* 00005A54 D80100F0 */ stfd f0, 0xf0(r1)
/* 00005A58 80A100F4 */ lwz r5, 0xf4(r1)
/* 00005A5C 4BFFA6F1 */ bl mathutil_quat_from_axis_angle
/* 00005A60 38610040 */ addi r3, r1, 0x40
/* 00005A64 38830000 */ addi r4, r3, 0
/* 00005A68 38A10030 */ addi r5, r1, 0x30
/* 00005A6C 4BFFA6E1 */ bl mathutil_quat_mult
/* 00005A70 C81F0368 */ lfd f0, 0x368(r31)
/* 00005A74 38610030 */ addi r3, r1, 0x30
/* 00005A78 388100BC */ addi r4, r1, 0xbc
/* 00005A7C FC0007F2 */ fmul f0, f0, f31
/* 00005A80 FC00001E */ fctiwz f0, f0
/* 00005A84 D80100E0 */ stfd f0, 0xe0(r1)
/* 00005A88 80A100E4 */ lwz r5, 0xe4(r1)
/* 00005A8C 4BFFA6C1 */ bl mathutil_quat_from_axis_angle
/* 00005A90 38610040 */ addi r3, r1, 0x40
/* 00005A94 38830000 */ addi r4, r3, 0
/* 00005A98 38A10030 */ addi r5, r1, 0x30
/* 00005A9C 4BFFA6B1 */ bl mathutil_quat_mult
/* 00005AA0 38610040 */ addi r3, r1, 0x40
/* 00005AA4 4BFFA6A9 */ bl mathutil_mtxA_from_quat
/* 00005AA8 387D0030 */ addi r3, r29, 0x30
/* 00005AAC 4BFFA6A1 */ bl mathutil_mtxA_mult_left
/* 00005AB0 387D0030 */ addi r3, r29, 0x30
/* 00005AB4 4BFFA699 */ bl mathutil_mtxA_sq_to_mtx
/* 00005AB8 3C600000 */ lis r3, lbl_802F1FD8@ha
/* 00005ABC C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00005AC0 38C30000 */ addi r6, r3, lbl_802F1FD8@l
/* 00005AC4 C0260000 */ lfs f1, 0(r6)
/* 00005AC8 FC010040 */ fcmpo cr0, f1, f0
/* 00005ACC 40810058 */ ble lbl_00005B24
/* 00005AD0 80BF0348 */ lwz r5, 0x348(r31)
/* 00005AD4 38610040 */ addi r3, r1, 0x40
/* 00005AD8 801F034C */ lwz r0, 0x34c(r31)
/* 00005ADC 38810024 */ addi r4, r1, 0x24
/* 00005AE0 90A10024 */ stw r5, 0x24(r1)
/* 00005AE4 90010028 */ stw r0, 0x28(r1)
/* 00005AE8 801F0350 */ lwz r0, 0x350(r31)
/* 00005AEC 9001002C */ stw r0, 0x2c(r1)
/* 00005AF0 C0260000 */ lfs f1, 0(r6)
/* 00005AF4 C81F0370 */ lfd f0, 0x370(r31)
/* 00005AF8 FC010032 */ fmul f0, f1, f0
/* 00005AFC FC000018 */ frsp f0, f0
/* 00005B00 D0060000 */ stfs f0, 0(r6)
/* 00005B04 C0260000 */ lfs f1, 0(r6)
/* 00005B08 4BFFA645 */ bl u_math_unk9_smth_w_quats
/* 00005B0C 38610040 */ addi r3, r1, 0x40
/* 00005B10 4BFFA63D */ bl mathutil_mtxA_from_quat
/* 00005B14 387D0030 */ addi r3, r29, 0x30
/* 00005B18 4BFFA635 */ bl mathutil_mtxA_mult_left
/* 00005B1C 387D0030 */ addi r3, r29, 0x30
/* 00005B20 4BFFA62D */ bl mathutil_mtxA_sq_to_mtx
lbl_00005B24:
/* 00005B24 3B8100C8 */ addi r28, r1, 0xc8
/* 00005B28 C0A10080 */ lfs f5, 0x80(r1)
/* 00005B2C C04100C8 */ lfs f2, 0xc8(r1)
/* 00005B30 C0810084 */ lfs f4, 0x84(r1)
/* 00005B34 C02100CC */ lfs f1, 0xcc(r1)
/* 00005B38 C0610088 */ lfs f3, 0x88(r1)
/* 00005B3C C00100D0 */ lfs f0, 0xd0(r1)
/* 00005B40 EC4500B2 */ fmuls f2, f5, f2
/* 00005B44 EC44107A */ fmadds f2, f4, f1, f2
/* 00005B48 EC43103A */ fmadds f2, f3, f0, f2
/* 00005B4C C81F0378 */ lfd f0, 0x378(r31)
/* 00005B50 38610040 */ addi r3, r1, 0x40
/* 00005B54 388100BC */ addi r4, r1, 0xbc
/* 00005B58 FC201050 */ fneg f1, f2
/* 00005B5C FC000072 */ fmul f0, f0, f1
/* 00005B60 FC00001E */ fctiwz f0, f0
/* 00005B64 D80100E0 */ stfd f0, 0xe0(r1)
/* 00005B68 80A100E4 */ lwz r5, 0xe4(r1)
/* 00005B6C 4BFFA5E1 */ bl mathutil_quat_from_axis_angle
/* 00005B70 C0A10080 */ lfs f5, 0x80(r1)
/* 00005B74 C04100BC */ lfs f2, 0xbc(r1)
/* 00005B78 C0810084 */ lfs f4, 0x84(r1)
/* 00005B7C C02100C0 */ lfs f1, 0xc0(r1)
/* 00005B80 C0610088 */ lfs f3, 0x88(r1)
/* 00005B84 C00100C4 */ lfs f0, 0xc4(r1)
/* 00005B88 ECA500B2 */ fmuls f5, f5, f2
/* 00005B8C ECA4287A */ fmadds f5, f4, f1, f5
/* 00005B90 ECA3283A */ fmadds f5, f3, f0, f5
/* 00005B94 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005B98 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00005B9C 389C0000 */ addi r4, r28, 0
/* 00005BA0 C83F0380 */ lfd f1, 0x380(r31)
/* 00005BA4 FC210028 */ fsub f1, f1, f0
/* 00005BA8 C85F0230 */ lfd f2, 0x230(r31)
/* 00005BAC C81F0388 */ lfd f0, 0x388(r31)
/* 00005BB0 38610030 */ addi r3, r1, 0x30
/* 00005BB4 FC220072 */ fmul f1, f2, f1
/* 00005BB8 FC250072 */ fmul f1, f5, f1
/* 00005BBC FC200818 */ frsp f1, f1
/* 00005BC0 FC000072 */ fmul f0, f0, f1
/* 00005BC4 FC00001E */ fctiwz f0, f0
/* 00005BC8 D80100E8 */ stfd f0, 0xe8(r1)
/* 00005BCC 80A100EC */ lwz r5, 0xec(r1)
/* 00005BD0 4BFFA57D */ bl mathutil_quat_from_axis_angle
/* 00005BD4 38610040 */ addi r3, r1, 0x40
/* 00005BD8 38830000 */ addi r4, r3, 0
/* 00005BDC 38A10030 */ addi r5, r1, 0x30
/* 00005BE0 4BFFA56D */ bl mathutil_quat_mult
/* 00005BE4 C0A100BC */ lfs f5, 0xbc(r1)
/* 00005BE8 C0410068 */ lfs f2, 0x68(r1)
/* 00005BEC C08100C0 */ lfs f4, 0xc0(r1)
/* 00005BF0 C021006C */ lfs f1, 0x6c(r1)
/* 00005BF4 C06100C4 */ lfs f3, 0xc4(r1)
/* 00005BF8 C0010070 */ lfs f0, 0x70(r1)
/* 00005BFC EC4500B2 */ fmuls f2, f5, f2
/* 00005C00 EC44107A */ fmadds f2, f4, f1, f2
/* 00005C04 EC43103A */ fmadds f2, f3, f0, f2
/* 00005C08 C81F0390 */ lfd f0, 0x390(r31)
/* 00005C0C 38610030 */ addi r3, r1, 0x30
/* 00005C10 388100B0 */ addi r4, r1, 0xb0
/* 00005C14 FC201050 */ fneg f1, f2
/* 00005C18 FC000072 */ fmul f0, f0, f1
/* 00005C1C FC00001E */ fctiwz f0, f0
/* 00005C20 D80100F0 */ stfd f0, 0xf0(r1)
/* 00005C24 80A100F4 */ lwz r5, 0xf4(r1)
/* 00005C28 4BFFA525 */ bl mathutil_quat_from_axis_angle
/* 00005C2C 38610040 */ addi r3, r1, 0x40
/* 00005C30 38830000 */ addi r4, r3, 0
/* 00005C34 38A10030 */ addi r5, r1, 0x30
/* 00005C38 4BFFA515 */ bl mathutil_quat_mult
/* 00005C3C C0A100BC */ lfs f5, 0xbc(r1)
/* 00005C40 C041008C */ lfs f2, 0x8c(r1)
/* 00005C44 C08100C0 */ lfs f4, 0xc0(r1)
/* 00005C48 C0210090 */ lfs f1, 0x90(r1)
/* 00005C4C C06100C4 */ lfs f3, 0xc4(r1)
/* 00005C50 C0010094 */ lfs f0, 0x94(r1)
/* 00005C54 EC4500B2 */ fmuls f2, f5, f2
/* 00005C58 EC44107A */ fmadds f2, f4, f1, f2
/* 00005C5C EC43103A */ fmadds f2, f3, f0, f2
/* 00005C60 C81F0398 */ lfd f0, 0x398(r31)
/* 00005C64 389C0000 */ addi r4, r28, 0
/* 00005C68 38610030 */ addi r3, r1, 0x30
/* 00005C6C FC201050 */ fneg f1, f2
/* 00005C70 FC000072 */ fmul f0, f0, f1
/* 00005C74 FC00001E */ fctiwz f0, f0
/* 00005C78 D80100D8 */ stfd f0, 0xd8(r1)
/* 00005C7C 80A100DC */ lwz r5, 0xdc(r1)
/* 00005C80 4BFFA4CD */ bl mathutil_quat_from_axis_angle
/* 00005C84 38610040 */ addi r3, r1, 0x40
/* 00005C88 38830000 */ addi r4, r3, 0
/* 00005C8C 38A10030 */ addi r5, r1, 0x30
/* 00005C90 4BFFA4BD */ bl mathutil_quat_mult
/* 00005C94 38610040 */ addi r3, r1, 0x40
/* 00005C98 4BFFA4B5 */ bl mathutil_mtxA_from_quat
/* 00005C9C 387D0030 */ addi r3, r29, 0x30
/* 00005CA0 4BFFA4AD */ bl mathutil_mtxA_mult_left
/* 00005CA4 387D0030 */ addi r3, r29, 0x30
/* 00005CA8 4BFFA4A5 */ bl mathutil_mtxA_sq_to_mtx
/* 00005CAC 387D0030 */ addi r3, r29, 0x30
/* 00005CB0 4BFFA49D */ bl mathutil_mtxA_from_mtx
/* 00005CB4 3861005C */ addi r3, r1, 0x5c
/* 00005CB8 38810050 */ addi r4, r1, 0x50
/* 00005CBC 4BFFA491 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005CC0 C0010058 */ lfs f0, 0x58(r1)
/* 00005CC4 C0210054 */ lfs f1, 0x54(r1)
/* 00005CC8 FC400050 */ fneg f2, f0
/* 00005CCC 4BFFA481 */ bl mathutil_atan2
/* 00005CD0 7C7C0734 */ extsh r28, r3
/* 00005CD4 5783083C */ slwi r3, r28, 1
/* 00005CD8 4BFFA475 */ bl mathutil_sin
/* 00005CDC FC000850 */ fneg f0, f1
/* 00005CE0 2C1C4000 */ cmpwi r28, 0x4000
/* 00005CE4 D01E0000 */ stfs f0, 0(r30)
/* 00005CE8 4181000C */ bgt lbl_00005CF4
/* 00005CEC 2C1CC000 */ cmpwi r28, -16384
/* 00005CF0 40800014 */ bge lbl_00005D04
lbl_00005CF4:
/* 00005CF4 C03E0000 */ lfs f1, 0(r30)
/* 00005CF8 C01F03A0 */ lfs f0, 0x3a0(r31)
/* 00005CFC EC010032 */ fmuls f0, f1, f0
/* 00005D00 D01E0000 */ stfs f0, 0(r30)
lbl_00005D04:
/* 00005D04 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00005D08 C01E0004 */ lfs f0, 4(r30)
/* 00005D0C C0630000 */ lfs f3, lbl_802F1FDC@l(r3)
/* 00005D10 387D001C */ addi r3, r29, 0x1c
/* 00005D14 C85F0198 */ lfd f2, 0x198(r31)
/* 00005D18 EC000032 */ fmuls f0, f0, f0
/* 00005D1C C03E0000 */ lfs f1, 0(r30)
/* 00005D20 FC431024 */ fdiv f2, f3, f2
/* 00005D24 C87F03A8 */ lfd f3, 0x3a8(r31)
/* 00005D28 EC010032 */ fmuls f0, f1, f0
/* 00005D2C FC020032 */ fmul f0, f2, f0
/* 00005D30 FC030032 */ fmul f0, f3, f0
/* 00005D34 FC000018 */ frsp f0, f0
/* 00005D38 D01E0000 */ stfs f0, 0(r30)
/* 00005D3C C0210074 */ lfs f1, 0x74(r1)
/* 00005D40 C01E0000 */ lfs f0, 0(r30)
/* 00005D44 EC010032 */ fmuls f0, f1, f0
/* 00005D48 D0010074 */ stfs f0, 0x74(r1)
/* 00005D4C C0210078 */ lfs f1, 0x78(r1)
/* 00005D50 C01E0000 */ lfs f0, 0(r30)
/* 00005D54 EC010032 */ fmuls f0, f1, f0
/* 00005D58 D0010078 */ stfs f0, 0x78(r1)
/* 00005D5C C021007C */ lfs f1, 0x7c(r1)
/* 00005D60 C01E0000 */ lfs f0, 0(r30)
/* 00005D64 EC010032 */ fmuls f0, f1, f0
/* 00005D68 D001007C */ stfs f0, 0x7c(r1)
/* 00005D6C C01D0004 */ lfs f0, 4(r29)
/* 00005D70 D01D0010 */ stfs f0, 0x10(r29)
/* 00005D74 C01D0008 */ lfs f0, 8(r29)
/* 00005D78 D01D0014 */ stfs f0, 0x14(r29)
/* 00005D7C C01D000C */ lfs f0, 0xc(r29)
/* 00005D80 D01D0018 */ stfs f0, 0x18(r29)
/* 00005D84 C0230000 */ lfs f1, 0(r3)
/* 00005D88 C0430004 */ lfs f2, 4(r3)
/* 00005D8C C0030008 */ lfs f0, 8(r3)
/* 00005D90 EC210072 */ fmuls f1, f1, f1
/* 00005D94 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005D98 EC20083A */ fmadds f1, f0, f0, f1
/* 00005D9C 4BFFA3B1 */ bl mathutil_sqrt
/* 00005DA0 D03D00F8 */ stfs f1, 0xf8(r29)
/* 00005DA4 801D0094 */ lwz r0, 0x94(r29)
/* 00005DA8 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00005DAC 901D0094 */ stw r0, 0x94(r29)
/* 00005DB0 C01F0030 */ lfs f0, 0x30(r31)
/* 00005DB4 D0010098 */ stfs f0, 0x98(r1)
/* 00005DB8 C01F03B0 */ lfs f0, 0x3b0(r31)
/* 00005DBC D001009C */ stfs f0, 0x9c(r1)
/* 00005DC0 C01F0030 */ lfs f0, 0x30(r31)
/* 00005DC4 D00100A0 */ stfs f0, 0xa0(r1)
/* 00005DC8 807D0094 */ lwz r3, 0x94(r29)
/* 00005DCC 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00005DD0 41820014 */ beq lbl_00005DE4
/* 00005DD4 C001009C */ lfs f0, 0x9c(r1)
/* 00005DD8 FC000050 */ fneg f0, f0
/* 00005DDC D001009C */ stfs f0, 0x9c(r1)
/* 00005DE0 48000014 */ b lbl_00005DF4
lbl_00005DE4:
/* 00005DE4 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00005DE8 4182000C */ beq lbl_00005DF4
/* 00005DEC C01F0030 */ lfs f0, 0x30(r31)
/* 00005DF0 D001009C */ stfs f0, 0x9c(r1)
lbl_00005DF4:
/* 00005DF4 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00005DF8 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00005DFC 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005E00 40820118 */ bne lbl_00005F18
/* 00005E04 C03E0068 */ lfs f1, 0x68(r30)
/* 00005E08 387D0030 */ addi r3, r29, 0x30
/* 00005E0C C01D001C */ lfs f0, 0x1c(r29)
/* 00005E10 EC010028 */ fsubs f0, f1, f0
/* 00005E14 D0010050 */ stfs f0, 0x50(r1)
/* 00005E18 C03E006C */ lfs f1, 0x6c(r30)
/* 00005E1C C01D0020 */ lfs f0, 0x20(r29)
/* 00005E20 EC010028 */ fsubs f0, f1, f0
/* 00005E24 D0010054 */ stfs f0, 0x54(r1)
/* 00005E28 C03E0070 */ lfs f1, 0x70(r30)
/* 00005E2C C01D0024 */ lfs f0, 0x24(r29)
/* 00005E30 EC010028 */ fsubs f0, f1, f0
/* 00005E34 D0010058 */ stfs f0, 0x58(r1)
/* 00005E38 4BFFA315 */ bl mathutil_mtxA_from_mtx
/* 00005E3C 38610050 */ addi r3, r1, 0x50
/* 00005E40 38830000 */ addi r4, r3, 0
/* 00005E44 4BFFA309 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005E48 C0210054 */ lfs f1, 0x54(r1)
/* 00005E4C 38610050 */ addi r3, r1, 0x50
/* 00005E50 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 00005E54 7C641B78 */ mr r4, r3
/* 00005E58 FC010032 */ fmul f0, f1, f0
/* 00005E5C FC000018 */ frsp f0, f0
/* 00005E60 D0010054 */ stfs f0, 0x54(r1)
/* 00005E64 C0210058 */ lfs f1, 0x58(r1)
/* 00005E68 C81F03B8 */ lfd f0, 0x3b8(r31)
/* 00005E6C FC010032 */ fmul f0, f1, f0
/* 00005E70 FC000018 */ frsp f0, f0
/* 00005E74 D0010058 */ stfs f0, 0x58(r1)
/* 00005E78 4BFFA2D5 */ bl mathutil_mtxA_tf_vec
/* 00005E7C C83F03C0 */ lfd f1, 0x3c0(r31)
/* 00005E80 C0010050 */ lfs f0, 0x50(r1)
/* 00005E84 C0A10098 */ lfs f5, 0x98(r1)
/* 00005E88 FC610032 */ fmul f3, f1, f0
/* 00005E8C C0410074 */ lfs f2, 0x74(r1)
/* 00005E90 C0210078 */ lfs f1, 0x78(r1)
/* 00005E94 C001007C */ lfs f0, 0x7c(r1)
/* 00005E98 FC601818 */ frsp f3, f3
/* 00005E9C D0610050 */ stfs f3, 0x50(r1)
/* 00005EA0 C89F03C0 */ lfd f4, 0x3c0(r31)
/* 00005EA4 C0610054 */ lfs f3, 0x54(r1)
/* 00005EA8 FC6400F2 */ fmul f3, f4, f3
/* 00005EAC FC601818 */ frsp f3, f3
/* 00005EB0 D0610054 */ stfs f3, 0x54(r1)
/* 00005EB4 C89F03C0 */ lfd f4, 0x3c0(r31)
/* 00005EB8 C0610058 */ lfs f3, 0x58(r1)
/* 00005EBC FC6400F2 */ fmul f3, f4, f3
/* 00005EC0 FC601818 */ frsp f3, f3
/* 00005EC4 D0610058 */ stfs f3, 0x58(r1)
/* 00005EC8 C0610050 */ lfs f3, 0x50(r1)
/* 00005ECC C0810054 */ lfs f4, 0x54(r1)
/* 00005ED0 ECA5182A */ fadds f5, f5, f3
/* 00005ED4 C0610058 */ lfs f3, 0x58(r1)
/* 00005ED8 D0A10098 */ stfs f5, 0x98(r1)
/* 00005EDC C0A1009C */ lfs f5, 0x9c(r1)
/* 00005EE0 EC85202A */ fadds f4, f5, f4
/* 00005EE4 D081009C */ stfs f4, 0x9c(r1)
/* 00005EE8 C08100A0 */ lfs f4, 0xa0(r1)
/* 00005EEC EC64182A */ fadds f3, f4, f3
/* 00005EF0 D06100A0 */ stfs f3, 0xa0(r1)
/* 00005EF4 C0610098 */ lfs f3, 0x98(r1)
/* 00005EF8 EC43102A */ fadds f2, f3, f2
/* 00005EFC D0410098 */ stfs f2, 0x98(r1)
/* 00005F00 C041009C */ lfs f2, 0x9c(r1)
/* 00005F04 EC22082A */ fadds f1, f2, f1
/* 00005F08 D021009C */ stfs f1, 0x9c(r1)
/* 00005F0C C02100A0 */ lfs f1, 0xa0(r1)
/* 00005F10 EC01002A */ fadds f0, f1, f0
/* 00005F14 D00100A0 */ stfs f0, 0xa0(r1)
lbl_00005F18:
/* 00005F18 807D0004 */ lwz r3, 4(r29)
/* 00005F1C 801D0008 */ lwz r0, 8(r29)
/* 00005F20 90610018 */ stw r3, 0x18(r1)
/* 00005F24 9001001C */ stw r0, 0x1c(r1)
/* 00005F28 801D000C */ lwz r0, 0xc(r29)
/* 00005F2C 90010020 */ stw r0, 0x20(r1)
/* 00005F30 C01F0030 */ lfs f0, 0x30(r31)
/* 00005F34 D001001C */ stfs f0, 0x1c(r1)
/* 00005F38 C0210018 */ lfs f1, 0x18(r1)
/* 00005F3C C041001C */ lfs f2, 0x1c(r1)
/* 00005F40 C0010020 */ lfs f0, 0x20(r1)
/* 00005F44 EC210072 */ fmuls f1, f1, f1
/* 00005F48 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005F4C EC20083A */ fmadds f1, f0, f0, f1
/* 00005F50 4BFFA1FD */ bl mathutil_sqrt
/* 00005F54 C85F03C8 */ lfd f2, 0x3c8(r31)
/* 00005F58 C81F01B0 */ lfd f0, 0x1b0(r31)
/* 00005F5C FFE11028 */ fsub f31, f1, f2
/* 00005F60 FFE0F818 */ frsp f31, f31
/* 00005F64 FC1F0040 */ fcmpo cr0, f31, f0
/* 00005F68 40810124 */ ble lbl_0000608C
/* 00005F6C 389D001C */ addi r4, r29, 0x1c
/* 00005F70 387D0004 */ addi r3, r29, 4
/* 00005F74 C0C30000 */ lfs f6, 0(r3)
/* 00005F78 C0640000 */ lfs f3, 0(r4)
/* 00005F7C C0A30004 */ lfs f5, 4(r3)
/* 00005F80 C0440004 */ lfs f2, 4(r4)
/* 00005F84 C0830008 */ lfs f4, 8(r3)
/* 00005F88 C0240008 */ lfs f1, 8(r4)
/* 00005F8C EC6600F2 */ fmuls f3, f6, f3
/* 00005F90 EC6518BA */ fmadds f3, f5, f2, f3
/* 00005F94 EC64187A */ fmadds f3, f4, f1, f3
/* 00005F98 FC030040 */ fcmpo cr0, f3, f0
/* 00005F9C 40800010 */ bge lbl_00005FAC
/* 00005FA0 C81F03D0 */ lfd f0, 0x3d0(r31)
/* 00005FA4 FFFF0032 */ fmul f31, f31, f0
/* 00005FA8 FFE0F818 */ frsp f31, f31
lbl_00005FAC:
/* 00005FAC 38610018 */ addi r3, r1, 0x18
/* 00005FB0 4BFFA19D */ bl mathutil_vec_normalize_len
/* 00005FB4 FC60F850 */ fneg f3, f31
/* 00005FB8 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FBC 3C600000 */ lis r3, lbl_100000B8@ha
/* 00005FC0 C0810018 */ lfs f4, 0x18(r1)
/* 00005FC4 C041001C */ lfs f2, 0x1c(r1)
/* 00005FC8 FC0000F2 */ fmul f0, f0, f3
/* 00005FCC C0210020 */ lfs f1, 0x20(r1)
/* 00005FD0 38830000 */ addi r4, r3, lbl_100000B8@l
/* 00005FD4 FC040032 */ fmul f0, f4, f0
/* 00005FD8 FC000018 */ frsp f0, f0
/* 00005FDC D001000C */ stfs f0, 0xc(r1)
/* 00005FE0 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FE4 FC0000F2 */ fmul f0, f0, f3
/* 00005FE8 FC020032 */ fmul f0, f2, f0
/* 00005FEC FC000018 */ frsp f0, f0
/* 00005FF0 D0010010 */ stfs f0, 0x10(r1)
/* 00005FF4 C81F03D8 */ lfd f0, 0x3d8(r31)
/* 00005FF8 FC0000F2 */ fmul f0, f0, f3
/* 00005FFC FC010032 */ fmul f0, f1, f0
/* 00006000 FC000018 */ frsp f0, f0
/* 00006004 D0010014 */ stfs f0, 0x14(r1)
/* 00006008 C03D001C */ lfs f1, 0x1c(r29)
/* 0000600C C001000C */ lfs f0, 0xc(r1)
/* 00006010 EC01002A */ fadds f0, f1, f0
/* 00006014 D01D001C */ stfs f0, 0x1c(r29)
/* 00006018 C03D0020 */ lfs f1, 0x20(r29)
/* 0000601C C0010010 */ lfs f0, 0x10(r1)
/* 00006020 EC01002A */ fadds f0, f1, f0
/* 00006024 D01D0020 */ stfs f0, 0x20(r29)
/* 00006028 C03D0024 */ lfs f1, 0x24(r29)
/* 0000602C C0010014 */ lfs f0, 0x14(r1)
/* 00006030 EC01002A */ fadds f0, f1, f0
/* 00006034 D01D0024 */ stfs f0, 0x24(r29)
/* 00006038 C01E0028 */ lfs f0, 0x28(r30)
/* 0000603C C0210018 */ lfs f1, 0x18(r1)
/* 00006040 FC000050 */ fneg f0, f0
/* 00006044 EC010032 */ fmuls f0, f1, f0
/* 00006048 D01E0068 */ stfs f0, 0x68(r30)
/* 0000604C C01E0028 */ lfs f0, 0x28(r30)
/* 00006050 C021001C */ lfs f1, 0x1c(r1)
/* 00006054 FC000050 */ fneg f0, f0
/* 00006058 EC010032 */ fmuls f0, f1, f0
/* 0000605C D01E006C */ stfs f0, 0x6c(r30)
/* 00006060 C01E0028 */ lfs f0, 0x28(r30)
/* 00006064 C0210020 */ lfs f1, 0x20(r1)
/* 00006068 FC000050 */ fneg f0, f0
/* 0000606C EC010032 */ fmuls f0, f1, f0
/* 00006070 D01E0070 */ stfs f0, 0x70(r30)
/* 00006074 807E0068 */ lwz r3, 0x68(r30)
/* 00006078 801E006C */ lwz r0, 0x6c(r30)
/* 0000607C 90640000 */ stw r3, 0(r4)
/* 00006080 90040004 */ stw r0, 4(r4)
/* 00006084 801E0070 */ lwz r0, 0x70(r30)
/* 00006088 90040008 */ stw r0, 8(r4)
lbl_0000608C:
/* 0000608C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00006090 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00006094 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00006098 41820038 */ beq lbl_000060D0
/* 0000609C C03D001C */ lfs f1, 0x1c(r29)
/* 000060A0 C81F03E0 */ lfd f0, 0x3e0(r31)
/* 000060A4 FC010032 */ fmul f0, f1, f0
/* 000060A8 FC000018 */ frsp f0, f0
/* 000060AC D01D001C */ stfs f0, 0x1c(r29)
/* 000060B0 C03D0024 */ lfs f1, 0x24(r29)
/* 000060B4 C81F03E0 */ lfd f0, 0x3e0(r31)
/* 000060B8 FC010032 */ fmul f0, f1, f0
/* 000060BC FC000018 */ frsp f0, f0
/* 000060C0 D01D0024 */ stfs f0, 0x24(r29)
/* 000060C4 C01D006C */ lfs f0, 0x6c(r29)
/* 000060C8 FC000050 */ fneg f0, f0
/* 000060CC D001009C */ stfs f0, 0x9c(r1)
lbl_000060D0:
/* 000060D0 C03D001C */ lfs f1, 0x1c(r29)
/* 000060D4 C0010098 */ lfs f0, 0x98(r1)
/* 000060D8 EC01002A */ fadds f0, f1, f0
/* 000060DC D01D001C */ stfs f0, 0x1c(r29)
/* 000060E0 C03D0020 */ lfs f1, 0x20(r29)
/* 000060E4 C001009C */ lfs f0, 0x9c(r1)
/* 000060E8 EC01002A */ fadds f0, f1, f0
/* 000060EC D01D0020 */ stfs f0, 0x20(r29)
/* 000060F0 C03D0024 */ lfs f1, 0x24(r29)
/* 000060F4 C00100A0 */ lfs f0, 0xa0(r1)
/* 000060F8 EC01002A */ fadds f0, f1, f0
/* 000060FC D01D0024 */ stfs f0, 0x24(r29)
/* 00006100 80010114 */ lwz r0, 0x114(r1)
/* 00006104 CBE10108 */ lfd f31, 0x108(r1)
/* 00006108 83E10104 */ lwz r31, 0x104(r1)
/* 0000610C 83C10100 */ lwz r30, 0x100(r1)
/* 00006110 83A100FC */ lwz r29, 0xfc(r1)
/* 00006114 838100F8 */ lwz r28, 0xf8(r1)
/* 00006118 38210110 */ addi r1, r1, 0x110
/* 0000611C 7C0803A6 */ mtlr r0
/* 00006120 4E800020 */ blr 
