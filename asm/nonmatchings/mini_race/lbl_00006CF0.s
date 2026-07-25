/* 00006CF0 7C0802A6 */ mflr r0
/* 00006CF4 3C800000 */ lis r4, lbl_10001AF0@ha
/* 00006CF8 90010004 */ stw r0, 4(r1)
/* 00006CFC 3CA00000 */ lis r5, lbl_00013740@ha
/* 00006D00 9421FFB8 */ stwu r1, -0x48(r1)
/* 00006D04 BF610034 */ stmw r27, 0x34(r1)
/* 00006D08 3BC40000 */ addi r30, r4, lbl_10001AF0@l
/* 00006D0C 3B630000 */ addi r27, r3, 0
/* 00006D10 389E0000 */ addi r4, r30, 0
/* 00006D14 3BE50000 */ addi r31, r5, lbl_00013740@l
/* 00006D18 83A30144 */ lwz r29, 0x144(r3)
/* 00006D1C 48001E45 */ bl lbl_00008B60
/* 00006D20 387B001C */ addi r3, r27, 0x1c
/* 00006D24 C0430000 */ lfs f2, 0(r3)
/* 00006D28 C0230004 */ lfs f1, 4(r3)
/* 00006D2C C0030008 */ lfs f0, 8(r3)
/* 00006D30 EC4200B2 */ fmuls f2, f2, f2
/* 00006D34 EC41107A */ fmadds f2, f1, f1, f2
/* 00006D38 EC40103A */ fmadds f2, f0, f0, f2
/* 00006D3C C81F0118 */ lfd f0, 0x118(r31)
/* 00006D40 FC020040 */ fcmpo cr0, f2, f0
/* 00006D44 4081004C */ ble lbl_00006D90
/* 00006D48 C03B001C */ lfs f1, 0x1c(r27)
/* 00006D4C C05B0024 */ lfs f2, 0x24(r27)
/* 00006D50 4BFF942D */ bl mathutil_atan2
/* 00006D54 881B002E */ lbz r0, 0x2e(r27)
/* 00006D58 3C800000 */ lis r4, cameraInfo@ha
/* 00006D5C 38840000 */ addi r4, r4, cameraInfo@l
/* 00006D60 7C000774 */ extsb r0, r0
/* 00006D64 1C000284 */ mulli r0, r0, 0x284
/* 00006D68 7C840214 */ add r4, r4, r0
/* 00006D6C A804001A */ lha r0, 0x1a(r4)
/* 00006D70 3B838000 */ addi r28, r3, -32768
/* 00006D74 7F80E050 */ subf r28, r0, r28
/* 00006D78 387C0000 */ addi r3, r28, 0
/* 00006D7C 4BFF9401 */ bl mathutil_mtxA_from_rotate_y
/* 00006D80 387E0000 */ addi r3, r30, 0
/* 00006D84 389E0000 */ addi r4, r30, 0
/* 00006D88 4BFF93F5 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00006D8C 48000008 */ b lbl_00006D94
lbl_00006D90:
/* 00006D90 3B800000 */ li r28, 0
lbl_00006D94:
/* 00006D94 C01E0008 */ lfs f0, 8(r30)
/* 00006D98 C03E0000 */ lfs f1, 0(r30)
/* 00006D9C FC400050 */ fneg f2, f0
/* 00006DA0 4BFF93DD */ bl mathutil_atan2
/* 00006DA4 5460043E */ clrlwi r0, r3, 0x10
/* 00006DA8 28003000 */ cmplwi r0, 0x3000
/* 00006DAC 41800014 */ blt lbl_00006DC0
/* 00006DB0 2800D000 */ cmplwi r0, 0xd000
/* 00006DB4 40810030 */ ble lbl_00006DE4
/* 00006DB8 2800FFFF */ cmplwi r0, 0xffff
/* 00006DBC 40800028 */ bge lbl_00006DE4
lbl_00006DC0:
/* 00006DC0 5463043E */ clrlwi r3, r3, 0x10
/* 00006DC4 38634000 */ addi r3, r3, 0x4000
/* 00006DC8 4BFF93B5 */ bl mathutil_sin
/* 00006DCC C05F0020 */ lfs f2, 0x20(r31)
/* 00006DD0 C01E0008 */ lfs f0, 8(r30)
/* 00006DD4 EC220824 */ fdivs f1, f2, f1
/* 00006DD8 EC000072 */ fmuls f0, f0, f1
/* 00006DDC D01E0008 */ stfs f0, 8(r30)
/* 00006DE0 48000034 */ b lbl_00006E14
lbl_00006DE4:
/* 00006DE4 5460043E */ clrlwi r0, r3, 0x10
/* 00006DE8 28004000 */ cmplwi r0, 0x4000
/* 00006DEC 4081000C */ ble lbl_00006DF8
/* 00006DF0 28006000 */ cmplwi r0, 0x6000
/* 00006DF4 41800018 */ blt lbl_00006E0C
lbl_00006DF8:
/* 00006DF8 5460043E */ clrlwi r0, r3, 0x10
/* 00006DFC 2800A000 */ cmplwi r0, 0xa000
/* 00006E00 40810014 */ ble lbl_00006E14
/* 00006E04 2800C000 */ cmplwi r0, 0xc000
/* 00006E08 4080000C */ bge lbl_00006E14
lbl_00006E0C:
/* 00006E0C C01F0008 */ lfs f0, 8(r31)
/* 00006E10 D01E0008 */ stfs f0, 8(r30)
lbl_00006E14:
/* 00006E14 C03F028C */ lfs f1, 0x28c(r31)
/* 00006E18 C01D0270 */ lfs f0, 0x270(r29)
/* 00006E1C C05E0000 */ lfs f2, 0(r30)
/* 00006E20 EC010032 */ fmuls f0, f1, f0
/* 00006E24 EC020032 */ fmuls f0, f2, f0
/* 00006E28 D01E0000 */ stfs f0, 0(r30)
/* 00006E2C C05E0008 */ lfs f2, 8(r30)
/* 00006E30 C01F0008 */ lfs f0, 8(r31)
/* 00006E34 FC020040 */ fcmpo cr0, f2, f0
/* 00006E38 4C401382 */ cror 2, 0, 2
/* 00006E3C 4082001C */ bne lbl_00006E58
/* 00006E40 C03F028C */ lfs f1, 0x28c(r31)
/* 00006E44 C01D0270 */ lfs f0, 0x270(r29)
/* 00006E48 EC010032 */ fmuls f0, f1, f0
/* 00006E4C EC020032 */ fmuls f0, f2, f0
/* 00006E50 D01E0008 */ stfs f0, 8(r30)
/* 00006E54 48000018 */ b lbl_00006E6C
lbl_00006E58:
/* 00006E58 C03F0290 */ lfs f1, 0x290(r31)
/* 00006E5C C01D0270 */ lfs f0, 0x270(r29)
/* 00006E60 EC010032 */ fmuls f0, f1, f0
/* 00006E64 EC020032 */ fmuls f0, f2, f0
/* 00006E68 D01E0008 */ stfs f0, 8(r30)
lbl_00006E6C:
/* 00006E6C 807B00FC */ lwz r3, 0xfc(r27)
/* 00006E70 80030014 */ lwz r0, 0x14(r3)
/* 00006E74 64000002 */ oris r0, r0, 2
/* 00006E78 90030014 */ stw r0, 0x14(r3)
/* 00006E7C A81D026E */ lha r0, 0x26e(r29)
/* 00006E80 2C000000 */ cmpwi r0, 0
/* 00006E84 40810118 */ ble lbl_00006F9C
/* 00006E88 C03E0000 */ lfs f1, 0(r30)
/* 00006E8C C01F0140 */ lfs f0, 0x140(r31)
/* 00006E90 EC010032 */ fmuls f0, f1, f0
/* 00006E94 D01E0000 */ stfs f0, 0(r30)
/* 00006E98 C03E0008 */ lfs f1, 8(r30)
/* 00006E9C C01F0140 */ lfs f0, 0x140(r31)
/* 00006EA0 EC010032 */ fmuls f0, f1, f0
/* 00006EA4 D01E0008 */ stfs f0, 8(r30)
/* 00006EA8 881D0263 */ lbz r0, 0x263(r29)
/* 00006EAC 28000006 */ cmplwi r0, 6
/* 00006EB0 418200EC */ beq lbl_00006F9C
/* 00006EB4 387B001C */ addi r3, r27, 0x1c
/* 00006EB8 C0430000 */ lfs f2, 0(r3)
/* 00006EBC C0230004 */ lfs f1, 4(r3)
/* 00006EC0 C0030008 */ lfs f0, 8(r3)
/* 00006EC4 EC4200B2 */ fmuls f2, f2, f2
/* 00006EC8 EC41107A */ fmadds f2, f1, f1, f2
/* 00006ECC EC40103A */ fmadds f2, f0, f0, f2
/* 00006ED0 C01F0294 */ lfs f0, 0x294(r31)
/* 00006ED4 FC020040 */ fcmpo cr0, f2, f0
/* 00006ED8 408100C4 */ ble lbl_00006F9C
/* 00006EDC 807B00FC */ lwz r3, 0xfc(r27)
/* 00006EE0 80030014 */ lwz r0, 0x14(r3)
/* 00006EE4 540003DA */ rlwinm r0, r0, 0, 0xf, 0xd
/* 00006EE8 90030014 */ stw r0, 0x14(r3)
/* 00006EEC 4BFF9291 */ bl rand
/* 00006EF0 3C806666 */ lis r4, 0x6666
/* 00006EF4 5465047E */ clrlwi r5, r3, 0x11
/* 00006EF8 38046667 */ addi r0, r4, 0x6667
/* 00006EFC 7C002896 */ mulhw r0, r0, r5
/* 00006F00 7C000E70 */ srawi r0, r0, 1
/* 00006F04 54030FFE */ srwi r3, r0, 0x1f
/* 00006F08 7C001A14 */ add r0, r0, r3
/* 00006F0C 1C000005 */ mulli r0, r0, 5
/* 00006F10 3C600000 */ lis r3, globalAnimTimer@ha
/* 00006F14 38630000 */ addi r3, r3, globalAnimTimer@l
/* 00006F18 7C802850 */ subf r4, r0, r5
/* 00006F1C 80630000 */ lwz r3, 0(r3)
/* 00006F20 38840008 */ addi r4, r4, 8
/* 00006F24 7C032396 */ divwu r0, r3, r4
/* 00006F28 7C0021D6 */ mullw r0, r0, r4
/* 00006F2C 7C001851 */ subf. r0, r0, r3
/* 00006F30 4082006C */ bne lbl_00006F9C
/* 00006F34 807F026C */ lwz r3, 0x26c(r31)
/* 00006F38 801F0270 */ lwz r0, 0x270(r31)
/* 00006F3C 9061000C */ stw r3, 0xc(r1)
/* 00006F40 90010010 */ stw r0, 0x10(r1)
/* 00006F44 807F0274 */ lwz r3, 0x274(r31)
/* 00006F48 801F0278 */ lwz r0, 0x278(r31)
/* 00006F4C 90610014 */ stw r3, 0x14(r1)
/* 00006F50 90010018 */ stw r0, 0x18(r1)
/* 00006F54 807F027C */ lwz r3, 0x27c(r31)
/* 00006F58 801F0280 */ lwz r0, 0x280(r31)
/* 00006F5C 9061001C */ stw r3, 0x1c(r1)
/* 00006F60 90010020 */ stw r0, 0x20(r1)
/* 00006F64 807F0284 */ lwz r3, 0x284(r31)
/* 00006F68 801F0288 */ lwz r0, 0x288(r31)
/* 00006F6C 90610024 */ stw r3, 0x24(r1)
/* 00006F70 90010028 */ stw r0, 0x28(r1)
/* 00006F74 4BFF9209 */ bl rand
/* 00006F78 5463047E */ clrlwi r3, r3, 0x11
/* 00006F7C 7C601E70 */ srawi r0, r3, 3
/* 00006F80 7C000194 */ addze r0, r0
/* 00006F84 54001838 */ slwi r0, r0, 3
/* 00006F88 7C001810 */ subfc r0, r0, r3
/* 00006F8C 5400103A */ slwi r0, r0, 2
/* 00006F90 3861000C */ addi r3, r1, 0xc
/* 00006F94 7C63002E */ lwzx r3, r3, r0
/* 00006F98 4BFF91E5 */ bl u_play_sound_0
lbl_00006F9C:
/* 00006F9C 7F83E378 */ mr r3, r28
/* 00006FA0 4BFF91DD */ bl mathutil_mtxA_from_rotate_y
/* 00006FA4 387E0000 */ addi r3, r30, 0
/* 00006FA8 389E0000 */ addi r4, r30, 0
/* 00006FAC 4BFF91D1 */ bl mathutil_mtxA_tf_vec
/* 00006FB0 881B002E */ lbz r0, 0x2e(r27)
/* 00006FB4 3C600000 */ lis r3, cameraInfo@ha
/* 00006FB8 38630000 */ addi r3, r3, cameraInfo@l
/* 00006FBC 7C000774 */ extsb r0, r0
/* 00006FC0 1C000284 */ mulli r0, r0, 0x284
/* 00006FC4 7C630214 */ add r3, r3, r0
/* 00006FC8 A863001A */ lha r3, 0x1a(r3)
/* 00006FCC 4BFF91B1 */ bl mathutil_mtxA_from_rotate_y
/* 00006FD0 387E0000 */ addi r3, r30, 0
/* 00006FD4 389E0000 */ addi r4, r30, 0
/* 00006FD8 4BFF91A5 */ bl mathutil_mtxA_tf_vec
/* 00006FDC 7FC3F378 */ mr r3, r30
/* 00006FE0 BB610034 */ lmw r27, 0x34(r1)
/* 00006FE4 8001004C */ lwz r0, 0x4c(r1)
/* 00006FE8 38210048 */ addi r1, r1, 0x48
/* 00006FEC 7C0803A6 */ mtlr r0
/* 00006FF0 4E800020 */ blr 
