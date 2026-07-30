/* 00008CC8 7C0802A6 */ mflr r0
/* 00008CCC 3CC00000 */ lis r6, lbl_10001B18@ha
/* 00008CD0 90010004 */ stw r0, 4(r1)
/* 00008CD4 3CA00000 */ lis r5, lbl_00013AA0@ha
/* 00008CD8 9421FFB8 */ stwu r1, -0x48(r1)
/* 00008CDC 93E10044 */ stw r31, 0x44(r1)
/* 00008CE0 3BE60000 */ addi r31, r6, lbl_10001B18@l
/* 00008CE4 93C10040 */ stw r30, 0x40(r1)
/* 00008CE8 3BC30000 */ addi r30, r3, 0
/* 00008CEC 93A1003C */ stw r29, 0x3c(r1)
/* 00008CF0 3BA50000 */ addi r29, r5, lbl_00013AA0@l
/* 00008CF4 93810038 */ stw r28, 0x38(r1)
/* 00008CF8 3B840000 */ addi r28, r4, 0
/* 00008CFC 4BFF7481 */ bl camera_clear
/* 00008D00 C01C0004 */ lfs f0, 4(r28)
/* 00008D04 387E000C */ addi r3, r30, 0xc
/* 00008D08 D01E000C */ stfs f0, 0xc(r30)
/* 00008D0C C83D0018 */ lfd f1, 0x18(r29)
/* 00008D10 C01C0008 */ lfs f0, 8(r28)
/* 00008D14 FC01002A */ fadd f0, f1, f0
/* 00008D18 FC000018 */ frsp f0, f0
/* 00008D1C D01E0010 */ stfs f0, 0x10(r30)
/* 00008D20 C01C000C */ lfs f0, 0xc(r28)
/* 00008D24 D01E0014 */ stfs f0, 0x14(r30)
/* 00008D28 4BFF7455 */ bl mathutil_mtxA_from_translate
/* 00008D2C 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00008D30 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00008D34 80630000 */ lwz r3, 0(r3)
/* 00008D38 80630010 */ lwz r3, 0x10(r3)
/* 00008D3C A863000E */ lha r3, 0xe(r3)
/* 00008D40 4BFF743D */ bl mathutil_mtxA_rotate_y
/* 00008D44 80BD0000 */ lwz r5, 0(r29)
/* 00008D48 7FC4F378 */ mr r4, r30
/* 00008D4C 801D0004 */ lwz r0, 4(r29)
/* 00008D50 38610028 */ addi r3, r1, 0x28
/* 00008D54 90A1001C */ stw r5, 0x1c(r1)
/* 00008D58 90010020 */ stw r0, 0x20(r1)
/* 00008D5C 801D0008 */ lwz r0, 8(r29)
/* 00008D60 90010024 */ stw r0, 0x24(r1)
/* 00008D64 80A1001C */ lwz r5, 0x1c(r1)
/* 00008D68 80010020 */ lwz r0, 0x20(r1)
/* 00008D6C 90A10028 */ stw r5, 0x28(r1)
/* 00008D70 9001002C */ stw r0, 0x2c(r1)
/* 00008D74 80010024 */ lwz r0, 0x24(r1)
/* 00008D78 90010030 */ stw r0, 0x30(r1)
/* 00008D7C 4BFF7401 */ bl mathutil_mtxA_tf_point
/* 00008D80 80BD000C */ lwz r5, 0xc(r29)
/* 00008D84 38610028 */ addi r3, r1, 0x28
/* 00008D88 801D0010 */ lwz r0, 0x10(r29)
/* 00008D8C 389E00AC */ addi r4, r30, 0xac
/* 00008D90 90A10010 */ stw r5, 0x10(r1)
/* 00008D94 90010014 */ stw r0, 0x14(r1)
/* 00008D98 801D0014 */ lwz r0, 0x14(r29)
/* 00008D9C 90010018 */ stw r0, 0x18(r1)
/* 00008DA0 80A10010 */ lwz r5, 0x10(r1)
/* 00008DA4 80010014 */ lwz r0, 0x14(r1)
/* 00008DA8 90A10028 */ stw r5, 0x28(r1)
/* 00008DAC 9001002C */ stw r0, 0x2c(r1)
/* 00008DB0 80010018 */ lwz r0, 0x18(r1)
/* 00008DB4 90010030 */ stw r0, 0x30(r1)
/* 00008DB8 4BFF73C5 */ bl mathutil_mtxA_tf_point
/* 00008DBC C03E000C */ lfs f1, 0xc(r30)
/* 00008DC0 C01E0000 */ lfs f0, 0(r30)
/* 00008DC4 EC010028 */ fsubs f0, f1, f0
/* 00008DC8 D0010028 */ stfs f0, 0x28(r1)
/* 00008DCC C03E0010 */ lfs f1, 0x10(r30)
/* 00008DD0 C01E0004 */ lfs f0, 4(r30)
/* 00008DD4 EC010028 */ fsubs f0, f1, f0
/* 00008DD8 D001002C */ stfs f0, 0x2c(r1)
/* 00008DDC C03E0014 */ lfs f1, 0x14(r30)
/* 00008DE0 C01E0008 */ lfs f0, 8(r30)
/* 00008DE4 EC010028 */ fsubs f0, f1, f0
/* 00008DE8 D0010030 */ stfs f0, 0x30(r1)
/* 00008DEC C0210028 */ lfs f1, 0x28(r1)
/* 00008DF0 C0410030 */ lfs f2, 0x30(r1)
/* 00008DF4 4BFF7389 */ bl mathutil_atan2
/* 00008DF8 38038000 */ addi r0, r3, -32768
/* 00008DFC B01E001A */ sth r0, 0x1a(r30)
/* 00008E00 C0010030 */ lfs f0, 0x30(r1)
/* 00008E04 C0210028 */ lfs f1, 0x28(r1)
/* 00008E08 EC210072 */ fmuls f1, f1, f1
/* 00008E0C EC20083A */ fmadds f1, f0, f0, f1
/* 00008E10 4BFF736D */ bl mathutil_sqrt
/* 00008E14 FC400890 */ fmr f2, f1
/* 00008E18 C021002C */ lfs f1, 0x2c(r1)
/* 00008E1C 4BFF7361 */ bl mathutil_atan2
/* 00008E20 B07E0018 */ sth r3, 0x18(r30)
/* 00008E24 38000000 */ li r0, 0
/* 00008E28 3C800000 */ lis r4, modeCtrl@ha
/* 00008E2C B01E001C */ sth r0, 0x1c(r30)
/* 00008E30 3800000C */ li r0, 0xc
/* 00008E34 3C600000 */ lis r3, lbl_00015B08@ha
/* 00008E38 981E0026 */ stb r0, 0x26(r30)
/* 00008E3C 38840000 */ addi r4, r4, modeCtrl@l
/* 00008E40 38630000 */ addi r3, r3, lbl_00015B08@l
/* 00008E44 80840030 */ lwz r4, 0x30(r4)
/* 00008E48 38000002 */ li r0, 2
/* 00008E4C 3884FFFF */ addi r4, r4, -1
/* 00008E50 1C84000C */ mulli r4, r4, 0xc
/* 00008E54 7C632214 */ add r3, r3, r4
/* 00008E58 907F000C */ stw r3, 0xc(r31)
/* 00008E5C 807F000C */ lwz r3, 0xc(r31)
/* 00008E60 A0630000 */ lhz r3, 0(r3)
/* 00008E64 B07F0000 */ sth r3, 0(r31)
/* 00008E68 807F000C */ lwz r3, 0xc(r31)
/* 00008E6C A8630002 */ lha r3, 2(r3)
/* 00008E70 B07E0030 */ sth r3, 0x30(r30)
/* 00008E74 807F000C */ lwz r3, 0xc(r31)
/* 00008E78 C0030004 */ lfs f0, 4(r3)
/* 00008E7C D01E0028 */ stfs f0, 0x28(r30)
/* 00008E80 807F000C */ lwz r3, 0xc(r31)
/* 00008E84 C0030008 */ lfs f0, 8(r3)
/* 00008E88 D01E002C */ stfs f0, 0x2c(r30)
/* 00008E8C A87E0024 */ lha r3, 0x24(r30)
/* 00008E90 546307B8 */ rlwinm r3, r3, 0, 0x1e, 0x1c
/* 00008E94 B07E0024 */ sth r3, 0x24(r30)
/* 00008E98 A87E0024 */ lha r3, 0x24(r30)
/* 00008E9C 60630008 */ ori r3, r3, 8
/* 00008EA0 B07E0024 */ sth r3, 0x24(r30)
/* 00008EA4 981E001F */ stb r0, 0x1f(r30)
/* 00008EA8 8001004C */ lwz r0, 0x4c(r1)
/* 00008EAC 83E10044 */ lwz r31, 0x44(r1)
/* 00008EB0 83C10040 */ lwz r30, 0x40(r1)
/* 00008EB4 83A1003C */ lwz r29, 0x3c(r1)
/* 00008EB8 83810038 */ lwz r28, 0x38(r1)
/* 00008EBC 38210048 */ addi r1, r1, 0x48
/* 00008EC0 7C0803A6 */ mtlr r0
/* 00008EC4 4E800020 */ blr 
