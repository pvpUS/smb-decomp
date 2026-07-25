/* 00007D4C 7C0802A6 */ mflr r0
/* 00007D50 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 00007D54 90010004 */ stw r0, 4(r1)
/* 00007D58 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 00007D5C 3CA00000 */ lis r5, lbl_00013740@ha
/* 00007D60 9421FFB8 */ stwu r1, -0x48(r1)
/* 00007D64 BF21002C */ stmw r25, 0x2c(r1)
/* 00007D68 3BE50000 */ addi r31, r5, lbl_00013740@l
/* 00007D6C 7C7D1B78 */ mr r29, r3
/* 00007D70 80840000 */ lwz r4, 0(r4)
/* 00007D74 83C30144 */ lwz r30, 0x144(r3)
/* 00007D78 83640078 */ lwz r27, 0x78(r4)
/* 00007D7C 807F02E8 */ lwz r3, 0x2e8(r31)
/* 00007D80 835B0024 */ lwz r26, 0x24(r27)
/* 00007D84 801F02EC */ lwz r0, 0x2ec(r31)
/* 00007D88 9061000C */ stw r3, 0xc(r1)
/* 00007D8C 90010010 */ stw r0, 0x10(r1)
/* 00007D90 801F02F0 */ lwz r0, 0x2f0(r31)
/* 00007D94 90010014 */ stw r0, 0x14(r1)
/* 00007D98 807E0014 */ lwz r3, 0x14(r30)
/* 00007D9C 54600295 */ rlwinm. r0, r3, 0, 0xa, 0xa
/* 00007DA0 41820010 */ beq lbl_00007DB0
/* 00007DA4 64600040 */ oris r0, r3, 0x40
/* 00007DA8 901E0014 */ stw r0, 0x14(r30)
/* 00007DAC 4800000C */ b lbl_00007DB8
lbl_00007DB0:
/* 00007DB0 54600290 */ rlwinm r0, r3, 0, 0xa, 8
/* 00007DB4 901E0014 */ stw r0, 0x14(r30)
lbl_00007DB8:
/* 00007DB8 801E0014 */ lwz r0, 0x14(r30)
/* 00007DBC 3B9D0004 */ addi r28, r29, 4
/* 00007DC0 3B200000 */ li r25, 0
/* 00007DC4 540002D2 */ rlwinm r0, r0, 0, 0xb, 9
/* 00007DC8 901E0014 */ stw r0, 0x14(r30)
/* 00007DCC 48000198 */ b lbl_00007F64
lbl_00007DD0:
/* 00007DD0 C0BC0000 */ lfs f5, 0(r28)
/* 00007DD4 C05A0000 */ lfs f2, 0(r26)
/* 00007DD8 C09C0004 */ lfs f4, 4(r28)
/* 00007DDC C03A0004 */ lfs f1, 4(r26)
/* 00007DE0 C07C0008 */ lfs f3, 8(r28)
/* 00007DE4 C01A0008 */ lfs f0, 8(r26)
/* 00007DE8 ECA51028 */ fsubs f5, f5, f2
/* 00007DEC EC840828 */ fsubs f4, f4, f1
/* 00007DF0 EC630028 */ fsubs f3, f3, f0
/* 00007DF4 EC250172 */ fmuls f1, f5, f5
/* 00007DF8 EC24093A */ fmadds f1, f4, f4, f1
/* 00007DFC EC2308FA */ fmadds f1, f3, f3, f1
/* 00007E00 C01F02F4 */ lfs f0, 0x2f4(r31)
/* 00007E04 FC010040 */ fcmpo cr0, f1, f0
/* 00007E08 4C401382 */ cror 2, 0, 2
/* 00007E0C 40820150 */ bne lbl_00007F5C
/* 00007E10 7F43D378 */ mr r3, r26
/* 00007E14 4BFF8369 */ bl mathutil_mtxA_from_translate
/* 00007E18 A87A0010 */ lha r3, 0x10(r26)
/* 00007E1C 4BFF8361 */ bl mathutil_mtxA_rotate_z
/* 00007E20 A87A000E */ lha r3, 0xe(r26)
/* 00007E24 4BFF8359 */ bl mathutil_mtxA_rotate_y
/* 00007E28 A87A000C */ lha r3, 0xc(r26)
/* 00007E2C 4BFF8351 */ bl mathutil_mtxA_rotate_x
/* 00007E30 387C0000 */ addi r3, r28, 0
/* 00007E34 38810018 */ addi r4, r1, 0x18
/* 00007E38 4BFF8345 */ bl mathutil_mtxA_rigid_inv_tf_point
/* 00007E3C C0210020 */ lfs f1, 0x20(r1)
/* 00007E40 C81F02F8 */ lfd f0, 0x2f8(r31)
/* 00007E44 FC010032 */ fmul f0, f1, f0
/* 00007E48 FC000018 */ frsp f0, f0
/* 00007E4C D0010020 */ stfs f0, 0x20(r1)
/* 00007E50 C05F0070 */ lfs f2, 0x70(r31)
/* 00007E54 C0010018 */ lfs f0, 0x18(r1)
/* 00007E58 FC020040 */ fcmpo cr0, f2, f0
/* 00007E5C 4C401382 */ cror 2, 0, 2
/* 00007E60 408200FC */ bne lbl_00007F5C
/* 00007E64 C03F0020 */ lfs f1, 0x20(r31)
/* 00007E68 FC000840 */ fcmpo cr0, f0, f1
/* 00007E6C 4C401382 */ cror 2, 0, 2
/* 00007E70 408200EC */ bne lbl_00007F5C
/* 00007E74 C0010020 */ lfs f0, 0x20(r1)
/* 00007E78 FC020040 */ fcmpo cr0, f2, f0
/* 00007E7C 4C401382 */ cror 2, 0, 2
/* 00007E80 408200DC */ bne lbl_00007F5C
/* 00007E84 FC000840 */ fcmpo cr0, f0, f1
/* 00007E88 4C401382 */ cror 2, 0, 2
/* 00007E8C 408200D0 */ bne lbl_00007F5C
/* 00007E90 801E0014 */ lwz r0, 0x14(r30)
/* 00007E94 3B9D001C */ addi r28, r29, 0x1c
/* 00007E98 64000020 */ oris r0, r0, 0x20
/* 00007E9C 901E0014 */ stw r0, 0x14(r30)
/* 00007EA0 C03C0000 */ lfs f1, 0(r28)
/* 00007EA4 C05C0004 */ lfs f2, 4(r28)
/* 00007EA8 C01C0008 */ lfs f0, 8(r28)
/* 00007EAC EC210072 */ fmuls f1, f1, f1
/* 00007EB0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007EB4 EC20083A */ fmadds f1, f0, f0, f1
/* 00007EB8 4BFF82C5 */ bl mathutil_sqrt
/* 00007EBC C01F0300 */ lfs f0, 0x300(r31)
/* 00007EC0 3861000C */ addi r3, r1, 0xc
/* 00007EC4 C0410014 */ lfs f2, 0x14(r1)
/* 00007EC8 7C641B78 */ mr r4, r3
/* 00007ECC EC000072 */ fmuls f0, f0, f1
/* 00007ED0 EC020032 */ fmuls f0, f2, f0
/* 00007ED4 D0010014 */ stfs f0, 0x14(r1)
/* 00007ED8 4BFF82A5 */ bl mathutil_mtxA_tf_vec
/* 00007EDC 801E0014 */ lwz r0, 0x14(r30)
/* 00007EE0 54000253 */ rlwinm. r0, r0, 0, 9, 9
/* 00007EE4 40820044 */ bne lbl_00007F28
/* 00007EE8 387C0000 */ addi r3, r28, 0
/* 00007EEC 3881000C */ addi r4, r1, 0xc
/* 00007EF0 4BFF828D */ bl mathutil_vec_dot_normalized_safe
/* 00007EF4 C01F0008 */ lfs f0, 8(r31)
/* 00007EF8 FC010040 */ fcmpo cr0, f1, f0
/* 00007EFC 4C411382 */ cror 2, 1, 2
/* 00007F00 4082001C */ bne lbl_00007F1C
/* 00007F04 38605052 */ li r3, 0x5052
/* 00007F08 4BFF8275 */ bl u_play_sound_0
/* 00007F0C 3C600004 */ lis r3, 4
/* 00007F10 3863B0D2 */ addi r3, r3, -20270
/* 00007F14 4BFF8269 */ bl u_play_sound_0
/* 00007F18 48000010 */ b lbl_00007F28
lbl_00007F1C:
/* 00007F1C 3C600004 */ lis r3, 4
/* 00007F20 3863B0DD */ addi r3, r3, -20259
/* 00007F24 4BFF8259 */ bl u_play_sound_0
lbl_00007F28:
/* 00007F28 C03D001C */ lfs f1, 0x1c(r29)
/* 00007F2C C001000C */ lfs f0, 0xc(r1)
/* 00007F30 EC01002A */ fadds f0, f1, f0
/* 00007F34 D01D001C */ stfs f0, 0x1c(r29)
/* 00007F38 C03D0020 */ lfs f1, 0x20(r29)
/* 00007F3C C0010010 */ lfs f0, 0x10(r1)
/* 00007F40 EC01002A */ fadds f0, f1, f0
/* 00007F44 D01D0020 */ stfs f0, 0x20(r29)
/* 00007F48 C03D0024 */ lfs f1, 0x24(r29)
/* 00007F4C C0010014 */ lfs f0, 0x14(r1)
/* 00007F50 EC01002A */ fadds f0, f1, f0
/* 00007F54 D01D0024 */ stfs f0, 0x24(r29)
/* 00007F58 4800001C */ b lbl_00007F74
lbl_00007F5C:
/* 00007F5C 3B390001 */ addi r25, r25, 1
/* 00007F60 3B5A0014 */ addi r26, r26, 0x14
lbl_00007F64:
/* 00007F64 801B0020 */ lwz r0, 0x20(r27)
/* 00007F68 7F230734 */ extsh r3, r25
/* 00007F6C 7C030000 */ cmpw r3, r0
/* 00007F70 4180FE60 */ blt lbl_00007DD0
lbl_00007F74:
/* 00007F74 BB21002C */ lmw r25, 0x2c(r1)
/* 00007F78 8001004C */ lwz r0, 0x4c(r1)
/* 00007F7C 38210048 */ addi r1, r1, 0x48
/* 00007F80 7C0803A6 */ mtlr r0
/* 00007F84 4E800020 */ blr 
