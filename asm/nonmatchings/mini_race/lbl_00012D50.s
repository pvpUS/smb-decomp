/* 00012D50 7C0802A6 */ mflr r0
/* 00012D54 3C600000 */ lis r3, lbl_00014060@ha
/* 00012D58 90010004 */ stw r0, 4(r1)
/* 00012D5C 9421FFC0 */ stwu r1, -0x40(r1)
/* 00012D60 93E1003C */ stw r31, 0x3c(r1)
/* 00012D64 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 00012D68 38810028 */ addi r4, r1, 0x28
/* 00012D6C 80BF0000 */ lwz r5, 0(r31)
/* 00012D70 38600026 */ li r3, 0x26
/* 00012D74 801F0004 */ lwz r0, 4(r31)
/* 00012D78 90A10028 */ stw r5, 0x28(r1)
/* 00012D7C 9001002C */ stw r0, 0x2c(r1)
/* 00012D80 80BF0008 */ lwz r5, 8(r31)
/* 00012D84 801F000C */ lwz r0, 0xc(r31)
/* 00012D88 90A10030 */ stw r5, 0x30(r1)
/* 00012D8C 90010034 */ stw r0, 0x34(r1)
/* 00012D90 4BFED3ED */ bl effect_replace_type_funcs
/* 00012D94 80BF0010 */ lwz r5, 0x10(r31)
/* 00012D98 38810018 */ addi r4, r1, 0x18
/* 00012D9C 801F0014 */ lwz r0, 0x14(r31)
/* 00012DA0 38600029 */ li r3, 0x29
/* 00012DA4 90A10018 */ stw r5, 0x18(r1)
/* 00012DA8 9001001C */ stw r0, 0x1c(r1)
/* 00012DAC 80BF0018 */ lwz r5, 0x18(r31)
/* 00012DB0 801F001C */ lwz r0, 0x1c(r31)
/* 00012DB4 90A10020 */ stw r5, 0x20(r1)
/* 00012DB8 90010024 */ stw r0, 0x24(r1)
/* 00012DBC 4BFED3C1 */ bl effect_replace_type_funcs
/* 00012DC0 80BF0020 */ lwz r5, 0x20(r31)
/* 00012DC4 38810008 */ addi r4, r1, 8
/* 00012DC8 801F0024 */ lwz r0, 0x24(r31)
/* 00012DCC 3860002C */ li r3, 0x2c
/* 00012DD0 90A10008 */ stw r5, 8(r1)
/* 00012DD4 9001000C */ stw r0, 0xc(r1)
/* 00012DD8 80BF0028 */ lwz r5, 0x28(r31)
/* 00012DDC 801F002C */ lwz r0, 0x2c(r31)
/* 00012DE0 90A10010 */ stw r5, 0x10(r1)
/* 00012DE4 90010014 */ stw r0, 0x14(r1)
/* 00012DE8 4BFED395 */ bl effect_replace_type_funcs
/* 00012DEC 80010044 */ lwz r0, 0x44(r1)
/* 00012DF0 83E1003C */ lwz r31, 0x3c(r1)
/* 00012DF4 38210040 */ addi r1, r1, 0x40
/* 00012DF8 7C0803A6 */ mtlr r0
/* 00012DFC 4E800020 */ blr 
lbl_00012E00:
/* 00012E00 7C0802A6 */ mflr r0
/* 00012E04 38800000 */ li r4, 0
/* 00012E08 90010004 */ stw r0, 4(r1)
/* 00012E0C 3800FFFF */ li r0, -1
/* 00012E10 38A000AC */ li r5, 0xac
/* 00012E14 9421FF20 */ stwu r1, -0xe0(r1)
/* 00012E18 93E100DC */ stw r31, 0xdc(r1)
/* 00012E1C 3BE30000 */ addi r31, r3, 0
/* 00012E20 90030010 */ stw r0, 0x10(r3)
/* 00012E24 38000064 */ li r0, 0x64
/* 00012E28 3861002C */ addi r3, r1, 0x2c
/* 00012E2C 901F000C */ stw r0, 0xc(r31)
/* 00012E30 4BFED34D */ bl memset
/* 00012E34 38000029 */ li r0, 0x29
/* 00012E38 B0010034 */ sth r0, 0x34(r1)
/* 00012E3C 3C800000 */ lis r4, lbl_00014090@ha
/* 00012E40 3C600000 */ lis r3, lbl_0001409C@ha
/* 00012E44 A81F0014 */ lha r0, 0x14(r31)
/* 00012E48 38C40000 */ addi r6, r4, lbl_00014090@l
/* 00012E4C 38A30000 */ addi r5, r3, lbl_0001409C@l
/* 00012E50 B0010040 */ sth r0, 0x40(r1)
/* 00012E54 3861002C */ addi r3, r1, 0x2c
/* 00012E58 80860000 */ lwz r4, 0(r6)
/* 00012E5C 80060004 */ lwz r0, 4(r6)
/* 00012E60 90810020 */ stw r4, 0x20(r1)
/* 00012E64 90010024 */ stw r0, 0x24(r1)
/* 00012E68 80060008 */ lwz r0, 8(r6)
/* 00012E6C 90010028 */ stw r0, 0x28(r1)
/* 00012E70 80010020 */ lwz r0, 0x20(r1)
/* 00012E74 80810024 */ lwz r4, 0x24(r1)
/* 00012E78 90010050 */ stw r0, 0x50(r1)
/* 00012E7C 80010028 */ lwz r0, 0x28(r1)
/* 00012E80 90810054 */ stw r4, 0x54(r1)
/* 00012E84 90010058 */ stw r0, 0x58(r1)
/* 00012E88 80850000 */ lwz r4, 0(r5)
/* 00012E8C 80050004 */ lwz r0, 4(r5)
/* 00012E90 90810014 */ stw r4, 0x14(r1)
/* 00012E94 90010018 */ stw r0, 0x18(r1)
/* 00012E98 80050008 */ lwz r0, 8(r5)
/* 00012E9C 9001001C */ stw r0, 0x1c(r1)
/* 00012EA0 80010014 */ lwz r0, 0x14(r1)
/* 00012EA4 80810018 */ lwz r4, 0x18(r1)
/* 00012EA8 900100B4 */ stw r0, 0xb4(r1)
/* 00012EAC 8001001C */ lwz r0, 0x1c(r1)
/* 00012EB0 908100B8 */ stw r4, 0xb8(r1)
/* 00012EB4 900100BC */ stw r0, 0xbc(r1)
/* 00012EB8 4BFED2C5 */ bl spawn_effect
/* 00012EBC 800100E4 */ lwz r0, 0xe4(r1)
/* 00012EC0 83E100DC */ lwz r31, 0xdc(r1)
/* 00012EC4 382100E0 */ addi r1, r1, 0xe0
/* 00012EC8 7C0803A6 */ mtlr r0
/* 00012ECC 4E800020 */ blr 
lbl_00012ED0:
/* 00012ED0 80830010 */ lwz r4, 0x10(r3)
/* 00012ED4 38040001 */ addi r0, r4, 1
/* 00012ED8 90030010 */ stw r0, 0x10(r3)
/* 00012EDC 80030010 */ lwz r0, 0x10(r3)
/* 00012EE0 28000027 */ cmplwi r0, 0x27
/* 00012EE4 40800034 */ bge lbl_00012F18
/* 00012EE8 3CA00000 */ lis r5, minigameGma@ha
/* 00012EEC 80C50000 */ lwz r6, minigameGma@l(r5)
/* 00012EF0 3C800000 */ lis r4, lbl_00015F50@ha
/* 00012EF4 5405083C */ slwi r5, r0, 1
/* 00012EF8 38040000 */ addi r0, r4, lbl_00015F50@l
/* 00012EFC 7C802A14 */ add r4, r0, r5
/* 00012F00 80A60008 */ lwz r5, 8(r6)
/* 00012F04 A8040000 */ lha r0, 0(r4)
/* 00012F08 54001838 */ slwi r0, r0, 3
/* 00012F0C 7C05002E */ lwzx r0, r5, r0
/* 00012F10 90030030 */ stw r0, 0x30(r3)
/* 00012F14 4E800020 */ blr 
lbl_00012F18:
/* 00012F18 3C800000 */ lis r4, g_poolInfo@ha
/* 00012F1C A8030000 */ lha r0, 0(r3)
/* 00012F20 38640000 */ addi r3, r4, g_poolInfo@l
/* 00012F24 8063004C */ lwz r3, 0x4c(r3)
/* 00012F28 38800003 */ li r4, 3
/* 00012F2C 7C8301AE */ stbx r4, r3, r0
/* 00012F30 4E800020 */ blr 
lbl_00012F34:
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
lbl_00013120:
/* 00013120 4E800020 */ blr 
lbl_00013124:
/* 00013124 7C0802A6 */ mflr r0
/* 00013128 38A00000 */ li r5, 0
/* 0001312C 90010004 */ stw r0, 4(r1)
/* 00013130 9421FFD0 */ stwu r1, -0x30(r1)
/* 00013134 93E1002C */ stw r31, 0x2c(r1)
/* 00013138 7C7F1B78 */ mr r31, r3
/* 0001313C A8830014 */ lha r4, 0x14(r3)
/* 00013140 3C600000 */ lis r3, ballInfo@ha
/* 00013144 38030000 */ addi r0, r3, ballInfo@l
/* 00013148 1C6401A4 */ mulli r3, r4, 0x1a4
/* 0001314C 7C601A14 */ add r3, r0, r3
/* 00013150 38630004 */ addi r3, r3, 4
/* 00013154 3881000C */ addi r4, r1, 0xc
/* 00013158 4BFED025 */ bl raycast_stage_down
/* 0001315C 28030000 */ cmplwi r3, 0
/* 00013160 40820020 */ bne lbl_00013180
/* 00013164 3C600000 */ lis r3, g_poolInfo@ha
/* 00013168 A81F0000 */ lha r0, 0(r31)
/* 0001316C 38630000 */ addi r3, r3, g_poolInfo@l
/* 00013170 8063004C */ lwz r3, 0x4c(r3)
/* 00013174 38800003 */ li r4, 3
/* 00013178 7C8301AE */ stbx r4, r3, r0
/* 0001317C 4800006C */ b lbl_000131E8
lbl_00013180:
/* 00013180 80810010 */ lwz r4, 0x10(r1)
/* 00013184 3C600000 */ lis r3, lbl_000140B8@ha
/* 00013188 80010014 */ lwz r0, 0x14(r1)
/* 0001318C 38C30000 */ addi r6, r3, lbl_000140B8@l
/* 00013190 3861001C */ addi r3, r1, 0x1c
/* 00013194 909F0034 */ stw r4, 0x34(r31)
/* 00013198 389F004C */ addi r4, r31, 0x4c
/* 0001319C 38BF004E */ addi r5, r31, 0x4e
/* 000131A0 901F0038 */ stw r0, 0x38(r31)
/* 000131A4 80010018 */ lwz r0, 0x18(r1)
/* 000131A8 901F003C */ stw r0, 0x3c(r31)
/* 000131AC C03F0038 */ lfs f1, 0x38(r31)
/* 000131B0 C8060000 */ lfd f0, 0(r6)
/* 000131B4 FC01002A */ fadd f0, f1, f0
/* 000131B8 FC000018 */ frsp f0, f0
/* 000131BC D01F0038 */ stfs f0, 0x38(r31)
/* 000131C0 4BFECFBD */ bl mathutil_vec_to_euler_xy
/* 000131C4 A89F004C */ lha r4, 0x4c(r31)
/* 000131C8 3C600000 */ lis r3, lbl_000140AC@ha
/* 000131CC 3C840001 */ addis r4, r4, 1
/* 000131D0 38048000 */ addi r0, r4, -32768
/* 000131D4 B01F004C */ sth r0, 0x4c(r31)
/* 000131D8 380003E8 */ li r0, 0x3e8
/* 000131DC C0030000 */ lfs f0, lbl_000140AC@l(r3)
/* 000131E0 D01F00A8 */ stfs f0, 0xa8(r31)
/* 000131E4 901F000C */ stw r0, 0xc(r31)
lbl_000131E8:
/* 000131E8 80010034 */ lwz r0, 0x34(r1)
/* 000131EC 83E1002C */ lwz r31, 0x2c(r1)
/* 000131F0 38210030 */ addi r1, r1, 0x30
/* 000131F4 7C0803A6 */ mtlr r0
/* 000131F8 4E800020 */ blr 
lbl_000131FC:
/* 000131FC C0230024 */ lfs f1, 0x24(r3)
/* 00013200 3C800000 */ lis r4, lbl_00014060@ha
/* 00013204 C003008C */ lfs f0, 0x8c(r3)
/* 00013208 38840000 */ addi r4, r4, lbl_00014060@l
/* 0001320C EC01002A */ fadds f0, f1, f0
/* 00013210 D0030024 */ stfs f0, 0x24(r3)
/* 00013214 C0030024 */ lfs f0, 0x24(r3)
/* 00013218 C0230088 */ lfs f1, 0x88(r3)
/* 0001321C FC000840 */ fcmpo cr0, f0, f1
/* 00013220 40810018 */ ble lbl_00013238
/* 00013224 D0230024 */ stfs f1, 0x24(r3)
/* 00013228 C023008C */ lfs f1, 0x8c(r3)
/* 0001322C C0040060 */ lfs f0, 0x60(r4)
/* 00013230 EC010032 */ fmuls f0, f1, f0
/* 00013234 D003008C */ stfs f0, 0x8c(r3)
lbl_00013238:
/* 00013238 C0230024 */ lfs f1, 0x24(r3)
/* 0001323C C0040054 */ lfs f0, 0x54(r4)
/* 00013240 FC010040 */ fcmpo cr0, f1, f0
/* 00013244 4C800020 */ bgelr 
/* 00013248 D0030024 */ stfs f0, 0x24(r3)
/* 0001324C 3C800000 */ lis r4, g_poolInfo@ha
/* 00013250 38840000 */ addi r4, r4, g_poolInfo@l
/* 00013254 8084004C */ lwz r4, 0x4c(r4)
/* 00013258 38A00003 */ li r5, 3
/* 0001325C A8030000 */ lha r0, 0(r3)
/* 00013260 7CA401AE */ stbx r5, r4, r0
/* 00013264 4E800020 */ blr 
lbl_00013268:
/* 00013268 7C0802A6 */ mflr r0
/* 0001326C 90010004 */ stw r0, 4(r1)
/* 00013270 9421FFE8 */ stwu r1, -0x18(r1)
/* 00013274 93E10014 */ stw r31, 0x14(r1)
/* 00013278 93C10010 */ stw r30, 0x10(r1)
/* 0001327C 3BC30000 */ addi r30, r3, 0
/* 00013280 3C600000 */ lis r3, lbl_00014060@ha
/* 00013284 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 00013288 387E0034 */ addi r3, r30, 0x34
/* 0001328C 4BFECEF1 */ bl mathutil_mtxA_from_mtxB_translate
/* 00013290 A87E004E */ lha r3, 0x4e(r30)
/* 00013294 4BFECEE9 */ bl mathutil_mtxA_rotate_y
/* 00013298 A87E004C */ lha r3, 0x4c(r30)
/* 0001329C 4BFECEE1 */ bl mathutil_mtxA_rotate_x
/* 000132A0 38600001 */ li r3, 1
/* 000132A4 38800003 */ li r4, 3
/* 000132A8 38A00000 */ li r5, 0
/* 000132AC 4BFECED1 */ bl avdisp_set_z_mode
/* 000132B0 C03E0024 */ lfs f1, 0x24(r30)
/* 000132B4 4BFECEC9 */ bl mathutil_mtxA_scale_s
/* 000132B8 C03E0024 */ lfs f1, 0x24(r30)
/* 000132BC 4BFECEC1 */ bl avdisp_set_bound_sphere_scale
/* 000132C0 C03F004C */ lfs f1, 0x4c(r31)
/* 000132C4 C07F0064 */ lfs f3, 0x64(r31)
/* 000132C8 FC400890 */ fmr f2, f1
/* 000132CC FC800890 */ fmr f4, f1
/* 000132D0 4BFECEAD */ bl avdisp_set_post_mult_color
/* 000132D4 3C600000 */ lis r3, commonGma@ha
/* 000132D8 38630000 */ addi r3, r3, commonGma@l
/* 000132DC 80630000 */ lwz r3, 0(r3)
/* 000132E0 80630008 */ lwz r3, 8(r3)
/* 000132E4 806302D0 */ lwz r3, 0x2d0(r3)
/* 000132E8 4BFECE95 */ bl avdisp_draw_model_unculled_sort_translucent
/* 000132EC 4BFECE91 */ bl fade_color_base_default
/* 000132F0 38600001 */ li r3, 1
/* 000132F4 38800003 */ li r4, 3
/* 000132F8 38A00001 */ li r5, 1
/* 000132FC 4BFECE81 */ bl avdisp_set_z_mode
/* 00013300 8001001C */ lwz r0, 0x1c(r1)
/* 00013304 83E10014 */ lwz r31, 0x14(r1)
/* 00013308 83C10010 */ lwz r30, 0x10(r1)
/* 0001330C 7C0803A6 */ mtlr r0
/* 00013310 38210018 */ addi r1, r1, 0x18
/* 00013314 4E800020 */ blr 
lbl_00013318:
/* 00013318 4E800020 */ blr 
lbl_0001331C:
/* 0001331C 38000014 */ li r0, 0x14
/* 00013320 9003000C */ stw r0, 0xc(r3)
/* 00013324 4E800020 */ blr 
lbl_00013328:
/* 00013328 7C0802A6 */ mflr r0
/* 0001332C 3CA00000 */ lis r5, lbl_00014060@ha
/* 00013330 90010004 */ stw r0, 4(r1)
/* 00013334 9421FF88 */ stwu r1, -0x78(r1)
/* 00013338 93E10074 */ stw r31, 0x74(r1)
/* 0001333C 3BE50000 */ addi r31, r5, lbl_00014060@l
/* 00013340 38A00000 */ li r5, 0
/* 00013344 93C10070 */ stw r30, 0x70(r1)
/* 00013348 7C7E1B78 */ mr r30, r3
/* 0001334C 93A1006C */ stw r29, 0x6c(r1)
/* 00013350 A8030014 */ lha r0, 0x14(r3)
/* 00013354 3C600000 */ lis r3, ballInfo@ha
/* 00013358 C03F0080 */ lfs f1, 0x80(r31)
/* 0001335C 1C8001A4 */ mulli r4, r0, 0x1a4
/* 00013360 38030000 */ addi r0, r3, ballInfo@l
/* 00013364 7FA02214 */ add r29, r0, r4
/* 00013368 C01D001C */ lfs f0, 0x1c(r29)
/* 0001336C 38610038 */ addi r3, r1, 0x38
/* 00013370 38810044 */ addi r4, r1, 0x44
/* 00013374 EC010032 */ fmuls f0, f1, f0
/* 00013378 D0010038 */ stfs f0, 0x38(r1)
/* 0001337C C03F0080 */ lfs f1, 0x80(r31)
/* 00013380 C01D0020 */ lfs f0, 0x20(r29)
/* 00013384 EC010032 */ fmuls f0, f1, f0
/* 00013388 D001003C */ stfs f0, 0x3c(r1)
/* 0001338C C03F0080 */ lfs f1, 0x80(r31)
/* 00013390 C01D0024 */ lfs f0, 0x24(r29)
/* 00013394 EC010032 */ fmuls f0, f1, f0
/* 00013398 D0010040 */ stfs f0, 0x40(r1)
/* 0001339C C0210038 */ lfs f1, 0x38(r1)
/* 000133A0 C01D0004 */ lfs f0, 4(r29)
/* 000133A4 EC01002A */ fadds f0, f1, f0
/* 000133A8 D0010038 */ stfs f0, 0x38(r1)
/* 000133AC C021003C */ lfs f1, 0x3c(r1)
/* 000133B0 C01D0008 */ lfs f0, 8(r29)
/* 000133B4 EC01002A */ fadds f0, f1, f0
/* 000133B8 D001003C */ stfs f0, 0x3c(r1)
/* 000133BC C0210040 */ lfs f1, 0x40(r1)
/* 000133C0 C01D000C */ lfs f0, 0xc(r29)
/* 000133C4 EC01002A */ fadds f0, f1, f0
/* 000133C8 D0010040 */ stfs f0, 0x40(r1)
/* 000133CC 4BFECDB1 */ bl raycast_stage_down
/* 000133D0 28030000 */ cmplwi r3, 0
/* 000133D4 41820134 */ beq lbl_00013508
/* 000133D8 80C10048 */ lwz r6, 0x48(r1)
/* 000133DC 38610054 */ addi r3, r1, 0x54
/* 000133E0 8001004C */ lwz r0, 0x4c(r1)
/* 000133E4 389E004C */ addi r4, r30, 0x4c
/* 000133E8 38BE004E */ addi r5, r30, 0x4e
/* 000133EC 90DE0034 */ stw r6, 0x34(r30)
/* 000133F0 901E0038 */ stw r0, 0x38(r30)
/* 000133F4 80010050 */ lwz r0, 0x50(r1)
/* 000133F8 901E003C */ stw r0, 0x3c(r30)
/* 000133FC 4BFECD81 */ bl mathutil_vec_to_euler_xy
/* 00013400 A87E004C */ lha r3, 0x4c(r30)
/* 00013404 3C630001 */ addis r3, r3, 1
/* 00013408 38038000 */ addi r0, r3, -32768
/* 0001340C B01E004C */ sth r0, 0x4c(r30)
/* 00013410 A87E004E */ lha r3, 0x4e(r30)
/* 00013414 4BFECD69 */ bl mathutil_mtxA_from_rotate_y
/* 00013418 A87E004C */ lha r3, 0x4c(r30)
/* 0001341C 4BFECD61 */ bl mathutil_mtxA_rotate_x
/* 00013420 387D001C */ addi r3, r29, 0x1c
/* 00013424 3881002C */ addi r4, r1, 0x2c
/* 00013428 4BFECD55 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 0001342C C0210030 */ lfs f1, 0x30(r1)
/* 00013430 C041002C */ lfs f2, 0x2c(r1)
/* 00013434 4BFECD49 */ bl mathutil_atan2
/* 00013438 B07E0050 */ sth r3, 0x50(r30)
/* 0001343C 807E000C */ lwz r3, 0xc(r30)
/* 00013440 2C03000A */ cmpwi r3, 0xa
/* 00013444 4081003C */ ble lbl_00013480
/* 00013448 3803FFF6 */ addi r0, r3, -10
/* 0001344C C01F0084 */ lfs f0, 0x84(r31)
/* 00013450 6C008000 */ xoris r0, r0, 0x8000
/* 00013454 C07F004C */ lfs f3, 0x4c(r31)
/* 00013458 90010064 */ stw r0, 0x64(r1)
/* 0001345C 3C004330 */ lis r0, 0x4330
/* 00013460 3C600000 */ lis r3, lbl_000140F8@ha
/* 00013464 90010060 */ stw r0, 0x60(r1)
/* 00013468 C8430000 */ lfd f2, lbl_000140F8@l(r3)
/* 0001346C C8210060 */ lfd f1, 0x60(r1)
/* 00013470 EC211028 */ fsubs f1, f1, f2
/* 00013474 EC010024 */ fdivs f0, f1, f0
/* 00013478 EC230028 */ fsubs f1, f3, f0
/* 0001347C 4800003C */ b lbl_000134B8
lbl_00013480:
/* 00013480 2C030005 */ cmpwi r3, 5
/* 00013484 4081000C */ ble lbl_00013490
/* 00013488 C03F004C */ lfs f1, 0x4c(r31)
/* 0001348C 4800002C */ b lbl_000134B8
lbl_00013490:
/* 00013490 6C608000 */ xoris r0, r3, 0x8000
/* 00013494 C01F0088 */ lfs f0, 0x88(r31)
/* 00013498 90010064 */ stw r0, 0x64(r1)
/* 0001349C 3C004330 */ lis r0, 0x4330
/* 000134A0 3C600000 */ lis r3, lbl_000140F8@ha
/* 000134A4 90010060 */ stw r0, 0x60(r1)
/* 000134A8 C8430000 */ lfd f2, lbl_000140F8@l(r3)
/* 000134AC C8210060 */ lfd f1, 0x60(r1)
/* 000134B0 EC211028 */ fsubs f1, f1, f2
/* 000134B4 EC210024 */ fdivs f1, f1, f0
lbl_000134B8:
/* 000134B8 C01F008C */ lfs f0, 0x8c(r31)
/* 000134BC 807F0068 */ lwz r3, 0x68(r31)
/* 000134C0 801F006C */ lwz r0, 0x6c(r31)
/* 000134C4 EC210032 */ fmuls f1, f1, f0
/* 000134C8 90610020 */ stw r3, 0x20(r1)
/* 000134CC 90010024 */ stw r0, 0x24(r1)
/* 000134D0 801F0070 */ lwz r0, 0x70(r31)
/* 000134D4 90010028 */ stw r0, 0x28(r1)
/* 000134D8 C01F0090 */ lfs f0, 0x90(r31)
/* 000134DC EC000072 */ fmuls f0, f0, f1
/* 000134E0 D0010020 */ stfs f0, 0x20(r1)
/* 000134E4 D0210024 */ stfs f1, 0x24(r1)
/* 000134E8 D0210028 */ stfs f1, 0x28(r1)
/* 000134EC 80610020 */ lwz r3, 0x20(r1)
/* 000134F0 80010024 */ lwz r0, 0x24(r1)
/* 000134F4 907E0024 */ stw r3, 0x24(r30)
/* 000134F8 901E0028 */ stw r0, 0x28(r30)
/* 000134FC 80010028 */ lwz r0, 0x28(r1)
/* 00013500 901E002C */ stw r0, 0x2c(r30)
/* 00013504 4800004C */ b lbl_00013550
lbl_00013508:
/* 00013508 807D0004 */ lwz r3, 4(r29)
/* 0001350C 801D0008 */ lwz r0, 8(r29)
/* 00013510 907E0034 */ stw r3, 0x34(r30)
/* 00013514 901E0038 */ stw r0, 0x38(r30)
/* 00013518 801D000C */ lwz r0, 0xc(r29)
/* 0001351C 901E003C */ stw r0, 0x3c(r30)
/* 00013520 807F0074 */ lwz r3, 0x74(r31)
/* 00013524 801F0078 */ lwz r0, 0x78(r31)
/* 00013528 90610014 */ stw r3, 0x14(r1)
/* 0001352C 90010018 */ stw r0, 0x18(r1)
/* 00013530 801F007C */ lwz r0, 0x7c(r31)
/* 00013534 9001001C */ stw r0, 0x1c(r1)
/* 00013538 80610014 */ lwz r3, 0x14(r1)
/* 0001353C 80010018 */ lwz r0, 0x18(r1)
/* 00013540 907E0024 */ stw r3, 0x24(r30)
/* 00013544 901E0028 */ stw r0, 0x28(r30)
/* 00013548 8001001C */ lwz r0, 0x1c(r1)
/* 0001354C 901E002C */ stw r0, 0x2c(r30)
lbl_00013550:
/* 00013550 8001007C */ lwz r0, 0x7c(r1)
/* 00013554 83E10074 */ lwz r31, 0x74(r1)
/* 00013558 83C10070 */ lwz r30, 0x70(r1)
/* 0001355C 7C0803A6 */ mtlr r0
/* 00013560 83A1006C */ lwz r29, 0x6c(r1)
/* 00013564 38210078 */ addi r1, r1, 0x78
/* 00013568 4E800020 */ blr 
lbl_0001356C:
/* 0001356C 7C0802A6 */ mflr r0
/* 00013570 90010004 */ stw r0, 4(r1)
/* 00013574 9421FFE8 */ stwu r1, -0x18(r1)
/* 00013578 93E10014 */ stw r31, 0x14(r1)
/* 0001357C 93C10010 */ stw r30, 0x10(r1)
/* 00013580 3BC30000 */ addi r30, r3, 0
/* 00013584 3C600000 */ lis r3, lbl_00014060@ha
/* 00013588 3BE30000 */ addi r31, r3, lbl_00014060@l
/* 0001358C 387E0034 */ addi r3, r30, 0x34
/* 00013590 4BFECBED */ bl mathutil_mtxA_from_mtxB_translate
/* 00013594 C03F0054 */ lfs f1, 0x54(r31)
/* 00013598 C05F00A0 */ lfs f2, 0xa0(r31)
/* 0001359C FC600890 */ fmr f3, f1
/* 000135A0 4BFECBDD */ bl mathutil_mtxA_translate_xyz
/* 000135A4 A87E004E */ lha r3, 0x4e(r30)
/* 000135A8 4BFECBD5 */ bl mathutil_mtxA_rotate_y
/* 000135AC A87E004C */ lha r3, 0x4c(r30)
/* 000135B0 4BFECBCD */ bl mathutil_mtxA_rotate_x
/* 000135B4 A87E0050 */ lha r3, 0x50(r30)
/* 000135B8 4BFECBC5 */ bl mathutil_mtxA_rotate_z
/* 000135BC 38600001 */ li r3, 1
/* 000135C0 38800003 */ li r4, 3
/* 000135C4 38A00000 */ li r5, 0
/* 000135C8 4BFECBB5 */ bl avdisp_set_z_mode
/* 000135CC 387E0024 */ addi r3, r30, 0x24
/* 000135D0 4BFECBAD */ bl mathutil_mtxA_scale
/* 000135D4 C05E0028 */ lfs f2, 0x28(r30)
/* 000135D8 C07E002C */ lfs f3, 0x2c(r30)
/* 000135DC FC021840 */ fcmpo cr0, f2, f3
/* 000135E0 4081000C */ ble lbl_000135EC
/* 000135E4 FC001090 */ fmr f0, f2
/* 000135E8 48000008 */ b lbl_000135F0
lbl_000135EC:
/* 000135EC FC001890 */ fmr f0, f3
lbl_000135F0:
/* 000135F0 C03E0024 */ lfs f1, 0x24(r30)
/* 000135F4 FC010040 */ fcmpo cr0, f1, f0
/* 000135F8 40810008 */ ble lbl_00013600
/* 000135FC 48000018 */ b lbl_00013614
lbl_00013600:
/* 00013600 FC021840 */ fcmpo cr0, f2, f3
/* 00013604 40810008 */ ble lbl_0001360C
/* 00013608 48000008 */ b lbl_00013610
lbl_0001360C:
/* 0001360C FC401890 */ fmr f2, f3
lbl_00013610:
/* 00013610 FC201090 */ fmr f1, f2
lbl_00013614:
/* 00013614 4BFECB69 */ bl avdisp_set_bound_sphere_scale
/* 00013618 C03F004C */ lfs f1, 0x4c(r31)
/* 0001361C C07F0064 */ lfs f3, 0x64(r31)
/* 00013620 FC400890 */ fmr f2, f1
/* 00013624 FC800890 */ fmr f4, f1
/* 00013628 4BFECB55 */ bl avdisp_set_post_mult_color
/* 0001362C 3C600000 */ lis r3, commonGma@ha
/* 00013630 38630000 */ addi r3, r3, commonGma@l
/* 00013634 80630000 */ lwz r3, 0(r3)
/* 00013638 80630008 */ lwz r3, 8(r3)
/* 0001363C 806302D0 */ lwz r3, 0x2d0(r3)
/* 00013640 4BFECB3D */ bl avdisp_draw_model_unculled_sort_translucent
/* 00013644 4BFECB39 */ bl fade_color_base_default
/* 00013648 38600001 */ li r3, 1
/* 0001364C 38800003 */ li r4, 3
/* 00013650 38A00001 */ li r5, 1
/* 00013654 4BFECB29 */ bl avdisp_set_z_mode
/* 00013658 8001001C */ lwz r0, 0x1c(r1)
/* 0001365C 83E10014 */ lwz r31, 0x14(r1)
/* 00013660 83C10010 */ lwz r30, 0x10(r1)
/* 00013664 7C0803A6 */ mtlr r0
/* 00013668 38210018 */ addi r1, r1, 0x18
/* 0001366C 4E800020 */ blr 
lbl_00013670:
/* 00013670 4E800020 */ blr 
