/* 000089DC 7C0802A6 */ mflr r0
/* 000089E0 3C800001 */ lis r4, 1
/* 000089E4 90010004 */ stw r0, 4(r1)
/* 000089E8 3CA00000 */ lis r5, cameraInfo@ha
/* 000089EC 3804FFFF */ addi r0, r4, -1
/* 000089F0 9421FFB0 */ stwu r1, -0x50(r1)
/* 000089F4 3CC00000 */ lis r6, lbl_0001C108@ha
/* 000089F8 93E1004C */ stw r31, 0x4c(r1)
/* 000089FC 3BE30000 */ addi r31, r3, 0
/* 00008A00 93C10048 */ stw r30, 0x48(r1)
/* 00008A04 3BC50000 */ addi r30, r5, cameraInfo@l
/* 00008A08 93A10044 */ stw r29, 0x44(r1)
/* 00008A0C 3BA60000 */ addi r29, r6, lbl_0001C108@l
/* 00008A10 B0030016 */ sth r0, 0x16(r3)
/* 00008A14 387E0144 */ addi r3, r30, 0x144
/* 00008A18 4BFF774D */ bl mathutil_mtxA_from_mtx
/* 00008A1C 387F0034 */ addi r3, r31, 0x34
/* 00008A20 38830000 */ addi r4, r3, 0
/* 00008A24 4BFF7741 */ bl mathutil_mtxA_tf_point
/* 00008A28 387F0040 */ addi r3, r31, 0x40
/* 00008A2C 38830000 */ addi r4, r3, 0
/* 00008A30 4BFF7735 */ bl mathutil_mtxA_tf_vec
/* 00008A34 C85D0090 */ lfd f2, 0x90(r29)
/* 00008A38 C03F003C */ lfs f1, 0x3c(r31)
/* 00008A3C C01F0034 */ lfs f0, 0x34(r31)
/* 00008A40 FC820824 */ fdiv f4, f2, f1
/* 00008A44 FC802018 */ frsp f4, f4
/* 00008A48 EC000132 */ fmuls f0, f0, f4
/* 00008A4C D01F0034 */ stfs f0, 0x34(r31)
/* 00008A50 C01F0038 */ lfs f0, 0x38(r31)
/* 00008A54 EC000132 */ fmuls f0, f0, f4
/* 00008A58 D01F0038 */ stfs f0, 0x38(r31)
/* 00008A5C C01D007C */ lfs f0, 0x7c(r29)
/* 00008A60 D01F003C */ stfs f0, 0x3c(r31)
/* 00008A64 C01F0040 */ lfs f0, 0x40(r31)
/* 00008A68 EC000132 */ fmuls f0, f0, f4
/* 00008A6C D01F0040 */ stfs f0, 0x40(r31)
/* 00008A70 C01F0044 */ lfs f0, 0x44(r31)
/* 00008A74 EC000132 */ fmuls f0, f0, f4
/* 00008A78 D01F0044 */ stfs f0, 0x44(r31)
/* 00008A7C C01D0000 */ lfs f0, 0(r29)
/* 00008A80 D01F0048 */ stfs f0, 0x48(r31)
/* 00008A84 C01F0024 */ lfs f0, 0x24(r31)
/* 00008A88 EC000132 */ fmuls f0, f0, f4
/* 00008A8C D01F0024 */ stfs f0, 0x24(r31)
/* 00008A90 C01F0028 */ lfs f0, 0x28(r31)
/* 00008A94 EC000132 */ fmuls f0, f0, f4
/* 00008A98 D01F0028 */ stfs f0, 0x28(r31)
/* 00008A9C C01F002C */ lfs f0, 0x2c(r31)
/* 00008AA0 EC000132 */ fmuls f0, f0, f4
/* 00008AA4 D01F002C */ stfs f0, 0x2c(r31)
/* 00008AA8 A87F004E */ lha r3, 0x4e(r31)
/* 00008AAC 4BFF76B9 */ bl mathutil_mtxA_rotate_y
/* 00008AB0 A87F004C */ lha r3, 0x4c(r31)
/* 00008AB4 4BFF76B1 */ bl mathutil_mtxA_rotate_x
/* 00008AB8 A87F0050 */ lha r3, 0x50(r31)
/* 00008ABC 4BFF76A9 */ bl mathutil_mtxA_rotate_z
/* 00008AC0 387F004E */ addi r3, r31, 0x4e
/* 00008AC4 389F004C */ addi r4, r31, 0x4c
/* 00008AC8 38BF0050 */ addi r5, r31, 0x50
/* 00008ACC 4BFF7699 */ bl mathutil_mtxA_to_euler_yxz
/* 00008AD0 A81F0014 */ lha r0, 0x14(r31)
/* 00008AD4 3C600000 */ lis r3, modeCtrl@ha
/* 00008AD8 3CA00000 */ lis r5, lbl_0001C138@ha
/* 00008ADC C05D0010 */ lfs f2, 0x10(r29)
/* 00008AE0 6C008000 */ xoris r0, r0, 0x8000
/* 00008AE4 9001003C */ stw r0, 0x3c(r1)
/* 00008AE8 3C804330 */ lis r4, 0x4330
/* 00008AEC 38630000 */ addi r3, r3, modeCtrl@l
/* 00008AF0 C8250000 */ lfd f1, lbl_0001C138@l(r5)
/* 00008AF4 90810038 */ stw r4, 0x38(r1)
/* 00008AF8 80030024 */ lwz r0, 0x24(r3)
/* 00008AFC 3C600000 */ lis r3, lbl_0001C138@ha
/* 00008B00 C8010038 */ lfd f0, 0x38(r1)
/* 00008B04 6C008000 */ xoris r0, r0, 0x8000
/* 00008B08 C07D009C */ lfs f3, 0x9c(r29)
/* 00008B0C EC000828 */ fsubs f0, f0, f1
/* 00008B10 90010034 */ stw r0, 0x34(r1)
/* 00008B14 C8230000 */ lfd f1, lbl_0001C138@l(r3)
/* 00008B18 90810030 */ stw r4, 0x30(r1)
/* 00008B1C 389F0034 */ addi r4, r31, 0x34
/* 00008B20 EC42002A */ fadds f2, f2, f0
/* 00008B24 C8010030 */ lfd f0, 0x30(r1)
/* 00008B28 C09D0098 */ lfs f4, 0x98(r29)
/* 00008B2C EC000828 */ fsubs f0, f0, f1
/* 00008B30 EC2300B2 */ fmuls f1, f3, f2
/* 00008B34 EC010024 */ fdivs f0, f1, f0
/* 00008B38 EC04002A */ fadds f0, f4, f0
/* 00008B3C D01F0088 */ stfs f0, 0x88(r31)
/* 00008B40 C01D00A0 */ lfs f0, 0xa0(r29)
/* 00008B44 D01F008C */ stfs f0, 0x8c(r31)
/* 00008B48 C01D007C */ lfs f0, 0x7c(r29)
/* 00008B4C D01F0090 */ stfs f0, 0x90(r31)
/* 00008B50 807F0088 */ lwz r3, 0x88(r31)
/* 00008B54 801F008C */ lwz r0, 0x8c(r31)
/* 00008B58 9061000C */ stw r3, 0xc(r1)
/* 00008B5C 90010010 */ stw r0, 0x10(r1)
/* 00008B60 801F0090 */ lwz r0, 0x90(r31)
/* 00008B64 90010014 */ stw r0, 0x14(r1)
/* 00008B68 C0010014 */ lfs f0, 0x14(r1)
/* 00008B6C C061000C */ lfs f3, 0xc(r1)
/* 00008B70 D0010020 */ stfs f0, 0x20(r1)
/* 00008B74 FC800050 */ fneg f4, f0
/* 00008B78 C0210010 */ lfs f1, 0x10(r1)
/* 00008B7C C81D00A8 */ lfd f0, 0xa8(r29)
/* 00008B80 C85D00B0 */ lfd f2, 0xb0(r29)
/* 00008B84 FC630028 */ fsub f3, f3, f0
/* 00008B88 C0BE0038 */ lfs f5, 0x38(r30)
/* 00008B8C C01E0028 */ lfs f0, 0x28(r30)
/* 00008B90 EC850132 */ fmuls f4, f5, f4
/* 00008B94 FC431024 */ fdiv f2, f3, f2
/* 00008B98 FC020028 */ fsub f0, f2, f0
/* 00008B9C FC040032 */ fmul f0, f4, f0
/* 00008BA0 FC000018 */ frsp f0, f0
/* 00008BA4 D0010018 */ stfs f0, 0x18(r1)
/* 00008BA8 C85D00B0 */ lfd f2, 0xb0(r29)
/* 00008BAC C01E002C */ lfs f0, 0x2c(r30)
/* 00008BB0 FC211028 */ fsub f1, f1, f2
/* 00008BB4 FC200850 */ fneg f1, f1
/* 00008BB8 FC211024 */ fdiv f1, f1, f2
/* 00008BBC FC010028 */ fsub f0, f1, f0
/* 00008BC0 FC040032 */ fmul f0, f4, f0
/* 00008BC4 FC000018 */ frsp f0, f0
/* 00008BC8 D001001C */ stfs f0, 0x1c(r1)
/* 00008BCC C0A10018 */ lfs f5, 0x18(r1)
/* 00008BD0 C0440000 */ lfs f2, 0(r4)
/* 00008BD4 C081001C */ lfs f4, 0x1c(r1)
/* 00008BD8 C0240004 */ lfs f1, 4(r4)
/* 00008BDC C0610020 */ lfs f3, 0x20(r1)
/* 00008BE0 C0040008 */ lfs f0, 8(r4)
/* 00008BE4 ECA51028 */ fsubs f5, f5, f2
/* 00008BE8 EC840828 */ fsubs f4, f4, f1
/* 00008BEC EC630028 */ fsubs f3, f3, f0
/* 00008BF0 EC250172 */ fmuls f1, f5, f5
/* 00008BF4 EC24093A */ fmadds f1, f4, f4, f1
/* 00008BF8 EC2308FA */ fmadds f1, f3, f3, f1
/* 00008BFC 4BFF7569 */ bl mathutil_sqrt
/* 00008C00 C01D00BC */ lfs f0, 0xbc(r29)
/* 00008C04 C05D00B8 */ lfs f2, 0xb8(r29)
/* 00008C08 EC010024 */ fdivs f0, f1, f0
/* 00008C0C EC02002A */ fadds f0, f2, f0
/* 00008C10 FC00001E */ fctiwz f0, f0
/* 00008C14 D8010028 */ stfd f0, 0x28(r1)
/* 00008C18 8001002C */ lwz r0, 0x2c(r1)
/* 00008C1C 901F000C */ stw r0, 0xc(r31)
/* 00008C20 80010054 */ lwz r0, 0x54(r1)
/* 00008C24 83E1004C */ lwz r31, 0x4c(r1)
/* 00008C28 83C10048 */ lwz r30, 0x48(r1)
/* 00008C2C 83A10044 */ lwz r29, 0x44(r1)
/* 00008C30 38210050 */ addi r1, r1, 0x50
/* 00008C34 7C0803A6 */ mtlr r0
/* 00008C38 4E800020 */ blr 
