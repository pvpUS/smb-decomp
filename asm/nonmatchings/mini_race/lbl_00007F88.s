/* 00007F88 7C0802A6 */ mflr r0
/* 00007F8C 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 00007F90 90010004 */ stw r0, 4(r1)
/* 00007F94 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 00007F98 9421FFB8 */ stwu r1, -0x48(r1)
/* 00007F9C BF21002C */ stmw r25, 0x2c(r1)
/* 00007FA0 3B230000 */ addi r25, r3, 0
/* 00007FA4 3C600000 */ lis r3, lbl_00013740@ha
/* 00007FA8 3BE30000 */ addi r31, r3, lbl_00013740@l
/* 00007FAC 3BD90004 */ addi r30, r25, 4
/* 00007FB0 3B400000 */ li r26, 0
/* 00007FB4 80840000 */ lwz r4, 0(r4)
/* 00007FB8 83790144 */ lwz r27, 0x144(r25)
/* 00007FBC 83A40078 */ lwz r29, 0x78(r4)
/* 00007FC0 807F0304 */ lwz r3, 0x304(r31)
/* 00007FC4 839D002C */ lwz r28, 0x2c(r29)
/* 00007FC8 801F0308 */ lwz r0, 0x308(r31)
/* 00007FCC 9061000C */ stw r3, 0xc(r1)
/* 00007FD0 90010010 */ stw r0, 0x10(r1)
/* 00007FD4 801F030C */ lwz r0, 0x30c(r31)
/* 00007FD8 90010014 */ stw r0, 0x14(r1)
/* 00007FDC 48000160 */ b lbl_0000813C
lbl_00007FE0:
/* 00007FE0 C0BE0000 */ lfs f5, 0(r30)
/* 00007FE4 C05C0000 */ lfs f2, 0(r28)
/* 00007FE8 C09E0004 */ lfs f4, 4(r30)
/* 00007FEC C03C0004 */ lfs f1, 4(r28)
/* 00007FF0 C07E0008 */ lfs f3, 8(r30)
/* 00007FF4 C01C0008 */ lfs f0, 8(r28)
/* 00007FF8 ECA51028 */ fsubs f5, f5, f2
/* 00007FFC EC840828 */ fsubs f4, f4, f1
/* 00008000 EC630028 */ fsubs f3, f3, f0
/* 00008004 EC250172 */ fmuls f1, f5, f5
/* 00008008 EC24093A */ fmadds f1, f4, f4, f1
/* 0000800C EC2308FA */ fmadds f1, f3, f3, f1
/* 00008010 C01F0310 */ lfs f0, 0x310(r31)
/* 00008014 FC010040 */ fcmpo cr0, f1, f0
/* 00008018 4181011C */ bgt lbl_00008134
/* 0000801C 7F83E378 */ mr r3, r28
/* 00008020 4BFF815D */ bl mathutil_mtxA_from_translate
/* 00008024 A87C0010 */ lha r3, 0x10(r28)
/* 00008028 4BFF8155 */ bl mathutil_mtxA_rotate_z
/* 0000802C A87C000E */ lha r3, 0xe(r28)
/* 00008030 4BFF814D */ bl mathutil_mtxA_rotate_y
/* 00008034 A87C000C */ lha r3, 0xc(r28)
/* 00008038 4BFF8145 */ bl mathutil_mtxA_rotate_x
/* 0000803C 387E0000 */ addi r3, r30, 0
/* 00008040 38810018 */ addi r4, r1, 0x18
/* 00008044 4BFF8139 */ bl mathutil_mtxA_rigid_inv_tf_point
/* 00008048 C0210018 */ lfs f1, 0x18(r1)
/* 0000804C C81F0318 */ lfd f0, 0x318(r31)
/* 00008050 FC010032 */ fmul f0, f1, f0
/* 00008054 FC000018 */ frsp f0, f0
/* 00008058 D0010018 */ stfs f0, 0x18(r1)
/* 0000805C C0210020 */ lfs f1, 0x20(r1)
/* 00008060 C81F0320 */ lfd f0, 0x320(r31)
/* 00008064 FC010032 */ fmul f0, f1, f0
/* 00008068 FC000018 */ frsp f0, f0
/* 0000806C D0010020 */ stfs f0, 0x20(r1)
/* 00008070 C0810018 */ lfs f4, 0x18(r1)
/* 00008074 C01F0070 */ lfs f0, 0x70(r31)
/* 00008078 FC040040 */ fcmpo cr0, f4, f0
/* 0000807C 418000B8 */ blt lbl_00008134
/* 00008080 C05F0020 */ lfs f2, 0x20(r31)
/* 00008084 FC041040 */ fcmpo cr0, f4, f2
/* 00008088 418100AC */ bgt lbl_00008134
/* 0000808C C0210020 */ lfs f1, 0x20(r1)
/* 00008090 FC010040 */ fcmpo cr0, f1, f0
/* 00008094 418000A0 */ blt lbl_00008134
/* 00008098 C01F0008 */ lfs f0, 8(r31)
/* 0000809C FC010040 */ fcmpo cr0, f1, f0
/* 000080A0 41810094 */ bgt lbl_00008134
/* 000080A4 EC22082A */ fadds f1, f2, f1
/* 000080A8 C0410014 */ lfs f2, 0x14(r1)
/* 000080AC FC002050 */ fneg f0, f4
/* 000080B0 3861000C */ addi r3, r1, 0xc
/* 000080B4 38830000 */ addi r4, r3, 0
/* 000080B8 EC220072 */ fmuls f1, f2, f1
/* 000080BC EC000132 */ fmuls f0, f0, f4
/* 000080C0 D0210014 */ stfs f1, 0x14(r1)
/* 000080C4 C05F0020 */ lfs f2, 0x20(r31)
/* 000080C8 C0610014 */ lfs f3, 0x14(r1)
/* 000080CC EC241028 */ fsubs f1, f4, f2
/* 000080D0 EC42202A */ fadds f2, f2, f4
/* 000080D4 EC010032 */ fmuls f0, f1, f0
/* 000080D8 EC020032 */ fmuls f0, f2, f0
/* 000080DC EC030032 */ fmuls f0, f3, f0
/* 000080E0 D0010014 */ stfs f0, 0x14(r1)
/* 000080E4 C03F01F8 */ lfs f1, 0x1f8(r31)
/* 000080E8 C01B0010 */ lfs f0, 0x10(r27)
/* 000080EC C0410014 */ lfs f2, 0x14(r1)
/* 000080F0 EC010024 */ fdivs f0, f1, f0
/* 000080F4 EC020032 */ fmuls f0, f2, f0
/* 000080F8 D0010014 */ stfs f0, 0x14(r1)
/* 000080FC 4BFF8081 */ bl mathutil_mtxA_tf_vec
/* 00008100 C039001C */ lfs f1, 0x1c(r25)
/* 00008104 C001000C */ lfs f0, 0xc(r1)
/* 00008108 EC01002A */ fadds f0, f1, f0
/* 0000810C D019001C */ stfs f0, 0x1c(r25)
/* 00008110 C0390020 */ lfs f1, 0x20(r25)
/* 00008114 C0010010 */ lfs f0, 0x10(r1)
/* 00008118 EC01002A */ fadds f0, f1, f0
/* 0000811C D0190020 */ stfs f0, 0x20(r25)
/* 00008120 C0390024 */ lfs f1, 0x24(r25)
/* 00008124 C0010014 */ lfs f0, 0x14(r1)
/* 00008128 EC01002A */ fadds f0, f1, f0
/* 0000812C D0190024 */ stfs f0, 0x24(r25)
/* 00008130 4800001C */ b lbl_0000814C
lbl_00008134:
/* 00008134 3B5A0001 */ addi r26, r26, 1
/* 00008138 3B9C0014 */ addi r28, r28, 0x14
lbl_0000813C:
/* 0000813C 801D0028 */ lwz r0, 0x28(r29)
/* 00008140 7F430734 */ extsh r3, r26
/* 00008144 7C030000 */ cmpw r3, r0
/* 00008148 4180FE98 */ blt lbl_00007FE0
lbl_0000814C:
/* 0000814C BB21002C */ lmw r25, 0x2c(r1)
/* 00008150 8001004C */ lwz r0, 0x4c(r1)
/* 00008154 38210048 */ addi r1, r1, 0x48
/* 00008158 7C0803A6 */ mtlr r0
/* 0000815C 4E800020 */ blr 
