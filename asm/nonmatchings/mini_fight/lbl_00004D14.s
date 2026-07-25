/* 00004D14 7C0802A6 */ mflr r0
/* 00004D18 3C600000 */ lis r3, g_poolInfo@ha
/* 00004D1C 90010004 */ stw r0, 4(r1)
/* 00004D20 3C800000 */ lis r4, lbl_10000118@ha
/* 00004D24 38630000 */ addi r3, r3, g_poolInfo@l
/* 00004D28 9421FF68 */ stwu r1, -0x98(r1)
/* 00004D2C 38040000 */ addi r0, r4, lbl_10000118@l
/* 00004D30 DBE10090 */ stfd f31, 0x90(r1)
/* 00004D34 BEC10068 */ stmw r22, 0x68(r1)
/* 00004D38 7C170378 */ mr r23, r0
/* 00004D3C 3B610020 */ addi r27, r1, 0x20
/* 00004D40 3B81002C */ addi r28, r1, 0x2c
/* 00004D44 3B410038 */ addi r26, r1, 0x38
/* 00004D48 83230028 */ lwz r25, 0x28(r3)
/* 00004D4C 3C600000 */ lis r3, lbl_0001C068@ha
/* 00004D50 3BA30000 */ addi r29, r3, lbl_0001C068@l
/* 00004D54 48000678 */ b lbl_000053CC
lbl_00004D58:
/* 00004D58 83D70000 */ lwz r30, 0(r23)
/* 00004D5C 281E0000 */ cmplwi r30, 0
/* 00004D60 41820664 */ beq lbl_000053C4
/* 00004D64 3AD702E8 */ addi r22, r23, 0x2e8
/* 00004D68 3B19FFFF */ addi r24, r25, -1
/* 00004D6C 48000650 */ b lbl_000053BC
lbl_00004D70:
/* 00004D70 83F60000 */ lwz r31, 0(r22)
/* 00004D74 281F0000 */ cmplwi r31, 0
/* 00004D78 4182063C */ beq lbl_000053B4
/* 00004D7C 80DE001C */ lwz r6, 0x1c(r30)
/* 00004D80 387E0028 */ addi r3, r30, 0x28
/* 00004D84 801E0020 */ lwz r0, 0x20(r30)
/* 00004D88 3881005C */ addi r4, r1, 0x5c
/* 00004D8C 38BF0028 */ addi r5, r31, 0x28
/* 00004D90 90C1005C */ stw r6, 0x5c(r1)
/* 00004D94 38C10050 */ addi r6, r1, 0x50
/* 00004D98 90010060 */ stw r0, 0x60(r1)
/* 00004D9C 801E0024 */ lwz r0, 0x24(r30)
/* 00004DA0 90010064 */ stw r0, 0x64(r1)
/* 00004DA4 80FF001C */ lwz r7, 0x1c(r31)
/* 00004DA8 801F0020 */ lwz r0, 0x20(r31)
/* 00004DAC 90E10050 */ stw r7, 0x50(r1)
/* 00004DB0 90010054 */ stw r0, 0x54(r1)
/* 00004DB4 801F0024 */ lwz r0, 0x24(r31)
/* 00004DB8 90010058 */ stw r0, 0x58(r1)
/* 00004DBC C03E0034 */ lfs f1, 0x34(r30)
/* 00004DC0 C05F0034 */ lfs f2, 0x34(r31)
/* 00004DC4 4BFFB3A1 */ bl func_8006AAEC
/* 00004DC8 28030000 */ cmplwi r3, 0
/* 00004DCC 418205E8 */ beq lbl_000053B4
/* 00004DD0 A81F0000 */ lha r0, 0(r31)
/* 00004DD4 7C770214 */ add r3, r23, r0
/* 00004DD8 8803000C */ lbz r0, 0xc(r3)
/* 00004DDC 7C000775 */ extsb. r0, r0
/* 00004DE0 40810120 */ ble lbl_00004F00
/* 00004DE4 C03E001C */ lfs f1, 0x1c(r30)
/* 00004DE8 C01F001C */ lfs f0, 0x1c(r31)
/* 00004DEC EC010028 */ fsubs f0, f1, f0
/* 00004DF0 D0010044 */ stfs f0, 0x44(r1)
/* 00004DF4 C03E0020 */ lfs f1, 0x20(r30)
/* 00004DF8 C01F0020 */ lfs f0, 0x20(r31)
/* 00004DFC EC010028 */ fsubs f0, f1, f0
/* 00004E00 D0010048 */ stfs f0, 0x48(r1)
/* 00004E04 C03E0024 */ lfs f1, 0x24(r30)
/* 00004E08 C01F0024 */ lfs f0, 0x24(r31)
/* 00004E0C EC010028 */ fsubs f0, f1, f0
/* 00004E10 D001004C */ stfs f0, 0x4c(r1)
/* 00004E14 C03E0034 */ lfs f1, 0x34(r30)
/* 00004E18 C01F0034 */ lfs f0, 0x34(r31)
/* 00004E1C EFE1002A */ fadds f31, f1, f0
/* 00004E20 C0210044 */ lfs f1, 0x44(r1)
/* 00004E24 C0410048 */ lfs f2, 0x48(r1)
/* 00004E28 C001004C */ lfs f0, 0x4c(r1)
/* 00004E2C EC210072 */ fmuls f1, f1, f1
/* 00004E30 EC2208BA */ fmadds f1, f2, f2, f1
/* 00004E34 EC20083A */ fmadds f1, f0, f0, f1
/* 00004E38 4BFFB32D */ bl mathutil_sqrt
/* 00004E3C FC01F840 */ fcmpo cr0, f1, f31
/* 00004E40 40800574 */ bge lbl_000053B4
/* 00004E44 80010044 */ lwz r0, 0x44(r1)
/* 00004E48 38610038 */ addi r3, r1, 0x38
/* 00004E4C 80A10048 */ lwz r5, 0x48(r1)
/* 00004E50 FC20F890 */ fmr f1, f31
/* 00004E54 90010038 */ stw r0, 0x38(r1)
/* 00004E58 8001004C */ lwz r0, 0x4c(r1)
/* 00004E5C 7C641B78 */ mr r4, r3
/* 00004E60 90A1003C */ stw r5, 0x3c(r1)
/* 00004E64 90010040 */ stw r0, 0x40(r1)
/* 00004E68 4BFFB2FD */ bl mathutil_vec_set_len
/* 00004E6C C0210038 */ lfs f1, 0x38(r1)
/* 00004E70 C01F001C */ lfs f0, 0x1c(r31)
/* 00004E74 EC01002A */ fadds f0, f1, f0
/* 00004E78 D0010038 */ stfs f0, 0x38(r1)
/* 00004E7C C021003C */ lfs f1, 0x3c(r1)
/* 00004E80 C01F0020 */ lfs f0, 0x20(r31)
/* 00004E84 EC01002A */ fadds f0, f1, f0
/* 00004E88 D001003C */ stfs f0, 0x3c(r1)
/* 00004E8C C0210040 */ lfs f1, 0x40(r1)
/* 00004E90 C01F0024 */ lfs f0, 0x24(r31)
/* 00004E94 EC01002A */ fadds f0, f1, f0
/* 00004E98 D0010040 */ stfs f0, 0x40(r1)
/* 00004E9C C0210038 */ lfs f1, 0x38(r1)
/* 00004EA0 C01E001C */ lfs f0, 0x1c(r30)
/* 00004EA4 C05E0058 */ lfs f2, 0x58(r30)
/* 00004EA8 EC010028 */ fsubs f0, f1, f0
/* 00004EAC EC02002A */ fadds f0, f2, f0
/* 00004EB0 D01E0058 */ stfs f0, 0x58(r30)
/* 00004EB4 C021003C */ lfs f1, 0x3c(r1)
/* 00004EB8 C01E0020 */ lfs f0, 0x20(r30)
/* 00004EBC C05E005C */ lfs f2, 0x5c(r30)
/* 00004EC0 EC010028 */ fsubs f0, f1, f0
/* 00004EC4 EC02002A */ fadds f0, f2, f0
/* 00004EC8 D01E005C */ stfs f0, 0x5c(r30)
/* 00004ECC C0210040 */ lfs f1, 0x40(r1)
/* 00004ED0 C01E0024 */ lfs f0, 0x24(r30)
/* 00004ED4 C05E0060 */ lfs f2, 0x60(r30)
/* 00004ED8 EC010028 */ fsubs f0, f1, f0
/* 00004EDC EC02002A */ fadds f0, f2, f0
/* 00004EE0 D01E0060 */ stfs f0, 0x60(r30)
/* 00004EE4 C0010038 */ lfs f0, 0x38(r1)
/* 00004EE8 D01E001C */ stfs f0, 0x1c(r30)
/* 00004EEC C001003C */ lfs f0, 0x3c(r1)
/* 00004EF0 D01E0020 */ stfs f0, 0x20(r30)
/* 00004EF4 C0010040 */ lfs f0, 0x40(r1)
/* 00004EF8 D01E0024 */ stfs f0, 0x24(r30)
/* 00004EFC 480004B8 */ b lbl_000053B4
lbl_00004F00:
/* 00004F00 C021005C */ lfs f1, 0x5c(r1)
/* 00004F04 38610044 */ addi r3, r1, 0x44
/* 00004F08 C01E001C */ lfs f0, 0x1c(r30)
/* 00004F0C C05E0058 */ lfs f2, 0x58(r30)
/* 00004F10 EC010028 */ fsubs f0, f1, f0
/* 00004F14 EC02002A */ fadds f0, f2, f0
/* 00004F18 D01E0058 */ stfs f0, 0x58(r30)
/* 00004F1C C0210060 */ lfs f1, 0x60(r1)
/* 00004F20 C01E0020 */ lfs f0, 0x20(r30)
/* 00004F24 C05E005C */ lfs f2, 0x5c(r30)
/* 00004F28 EC010028 */ fsubs f0, f1, f0
/* 00004F2C EC02002A */ fadds f0, f2, f0
/* 00004F30 D01E005C */ stfs f0, 0x5c(r30)
/* 00004F34 C0210064 */ lfs f1, 0x64(r1)
/* 00004F38 C01E0024 */ lfs f0, 0x24(r30)
/* 00004F3C C05E0060 */ lfs f2, 0x60(r30)
/* 00004F40 EC010028 */ fsubs f0, f1, f0
/* 00004F44 EC02002A */ fadds f0, f2, f0
/* 00004F48 D01E0060 */ stfs f0, 0x60(r30)
/* 00004F4C 8081005C */ lwz r4, 0x5c(r1)
/* 00004F50 80010060 */ lwz r0, 0x60(r1)
/* 00004F54 909E001C */ stw r4, 0x1c(r30)
/* 00004F58 901E0020 */ stw r0, 0x20(r30)
/* 00004F5C 80010064 */ lwz r0, 0x64(r1)
/* 00004F60 901E0024 */ stw r0, 0x24(r30)
/* 00004F64 C0210050 */ lfs f1, 0x50(r1)
/* 00004F68 C01F001C */ lfs f0, 0x1c(r31)
/* 00004F6C C05F0058 */ lfs f2, 0x58(r31)
/* 00004F70 EC010028 */ fsubs f0, f1, f0
/* 00004F74 EC02002A */ fadds f0, f2, f0
/* 00004F78 D01F0058 */ stfs f0, 0x58(r31)
/* 00004F7C C0210054 */ lfs f1, 0x54(r1)
/* 00004F80 C01F0020 */ lfs f0, 0x20(r31)
/* 00004F84 C05F005C */ lfs f2, 0x5c(r31)
/* 00004F88 EC010028 */ fsubs f0, f1, f0
/* 00004F8C EC02002A */ fadds f0, f2, f0
/* 00004F90 D01F005C */ stfs f0, 0x5c(r31)
/* 00004F94 C0210058 */ lfs f1, 0x58(r1)
/* 00004F98 C01F0024 */ lfs f0, 0x24(r31)
/* 00004F9C C05F0060 */ lfs f2, 0x60(r31)
/* 00004FA0 EC010028 */ fsubs f0, f1, f0
/* 00004FA4 EC02002A */ fadds f0, f2, f0
/* 00004FA8 D01F0060 */ stfs f0, 0x60(r31)
/* 00004FAC 80810050 */ lwz r4, 0x50(r1)
/* 00004FB0 80010054 */ lwz r0, 0x54(r1)
/* 00004FB4 909F001C */ stw r4, 0x1c(r31)
/* 00004FB8 901F0020 */ stw r0, 0x20(r31)
/* 00004FBC 80010058 */ lwz r0, 0x58(r1)
/* 00004FC0 901F0024 */ stw r0, 0x24(r31)
/* 00004FC4 C021005C */ lfs f1, 0x5c(r1)
/* 00004FC8 C0010050 */ lfs f0, 0x50(r1)
/* 00004FCC C0610060 */ lfs f3, 0x60(r1)
/* 00004FD0 EC810028 */ fsubs f4, f1, f0
/* 00004FD4 C0410054 */ lfs f2, 0x54(r1)
/* 00004FD8 C0210064 */ lfs f1, 0x64(r1)
/* 00004FDC C0010058 */ lfs f0, 0x58(r1)
/* 00004FE0 EC431028 */ fsubs f2, f3, f2
/* 00004FE4 D0810044 */ stfs f4, 0x44(r1)
/* 00004FE8 EC010028 */ fsubs f0, f1, f0
/* 00004FEC D0410048 */ stfs f2, 0x48(r1)
/* 00004FF0 D001004C */ stfs f0, 0x4c(r1)
/* 00004FF4 4BFFB171 */ bl mathutil_vec_normalize_len
/* 00004FF8 A87E0072 */ lha r3, 0x72(r30)
/* 00004FFC 4BFFB169 */ bl mathutil_mtxA_from_rotate_y
/* 00005000 A87E0070 */ lha r3, 0x70(r30)
/* 00005004 4BFFB161 */ bl mathutil_mtxA_rotate_x
/* 00005008 A87E0074 */ lha r3, 0x74(r30)
/* 0000500C 4BFFB159 */ bl mathutil_mtxA_rotate_z
/* 00005010 38610044 */ addi r3, r1, 0x44
/* 00005014 3881002C */ addi r4, r1, 0x2c
/* 00005018 4BFFB14D */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 0000501C C03F0064 */ lfs f1, 0x64(r31)
/* 00005020 38610020 */ addi r3, r1, 0x20
/* 00005024 C01E0064 */ lfs f0, 0x64(r30)
/* 00005028 7C641B78 */ mr r4, r3
/* 0000502C EC010028 */ fsubs f0, f1, f0
/* 00005030 D0010020 */ stfs f0, 0x20(r1)
/* 00005034 C03F0068 */ lfs f1, 0x68(r31)
/* 00005038 C01E0068 */ lfs f0, 0x68(r30)
/* 0000503C EC010028 */ fsubs f0, f1, f0
/* 00005040 D0010024 */ stfs f0, 0x24(r1)
/* 00005044 C03F006C */ lfs f1, 0x6c(r31)
/* 00005048 C01E006C */ lfs f0, 0x6c(r30)
/* 0000504C EC010028 */ fsubs f0, f1, f0
/* 00005050 D0010028 */ stfs f0, 0x28(r1)
/* 00005054 4BFFB111 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005058 C0A1002C */ lfs f5, 0x2c(r1)
/* 0000505C C0410020 */ lfs f2, 0x20(r1)
/* 00005060 C0810030 */ lfs f4, 0x30(r1)
/* 00005064 C0210024 */ lfs f1, 0x24(r1)
/* 00005068 C0610034 */ lfs f3, 0x34(r1)
/* 0000506C C0010028 */ lfs f0, 0x28(r1)
/* 00005070 ECA500B2 */ fmuls f5, f5, f2
/* 00005074 ECA4287A */ fmadds f5, f4, f1, f5
/* 00005078 ECA3283A */ fmadds f5, f3, f0, f5
/* 0000507C C041002C */ lfs f2, 0x2c(r1)
/* 00005080 C0210030 */ lfs f1, 0x30(r1)
/* 00005084 C0010034 */ lfs f0, 0x34(r1)
/* 00005088 EC4500B2 */ fmuls f2, f5, f2
/* 0000508C C0610020 */ lfs f3, 0x20(r1)
/* 00005090 EC250072 */ fmuls f1, f5, f1
/* 00005094 EC050032 */ fmuls f0, f5, f0
/* 00005098 EC431028 */ fsubs f2, f3, f2
/* 0000509C D0410020 */ stfs f2, 0x20(r1)
/* 000050A0 C0410024 */ lfs f2, 0x24(r1)
/* 000050A4 EC220828 */ fsubs f1, f2, f1
/* 000050A8 D0210024 */ stfs f1, 0x24(r1)
/* 000050AC C0210028 */ lfs f1, 0x28(r1)
/* 000050B0 EC010028 */ fsubs f0, f1, f0
/* 000050B4 D0010028 */ stfs f0, 0x28(r1)
/* 000050B8 C0E10030 */ lfs f7, 0x30(r1)
/* 000050BC C0610028 */ lfs f3, 0x28(r1)
/* 000050C0 C0C10034 */ lfs f6, 0x34(r1)
/* 000050C4 C0A10020 */ lfs f5, 0x20(r1)
/* 000050C8 C101002C */ lfs f8, 0x2c(r1)
/* 000050CC C0810024 */ lfs f4, 0x24(r1)
/* 000050D0 EC4700F2 */ fmuls f2, f7, f3
/* 000050D4 EC260172 */ fmuls f1, f6, f5
/* 000050D8 EC080132 */ fmuls f0, f8, f4
/* 000050DC EC46113C */ fnmsubs f2, f6, f4, f2
/* 000050E0 D0410038 */ stfs f2, 0x38(r1)
/* 000050E4 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 000050E8 D021003C */ stfs f1, 0x3c(r1)
/* 000050EC EC07017C */ fnmsubs f0, f7, f5, f0
/* 000050F0 D0010040 */ stfs f0, 0x40(r1)
/* 000050F4 C0210020 */ lfs f1, 0x20(r1)
/* 000050F8 C0410024 */ lfs f2, 0x24(r1)
/* 000050FC C0010028 */ lfs f0, 0x28(r1)
/* 00005100 EC210072 */ fmuls f1, f1, f1
/* 00005104 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005108 EC20083A */ fmadds f1, f0, f0, f1
/* 0000510C 4BFFB059 */ bl mathutil_sqrt
/* 00005110 C05D001C */ lfs f2, 0x1c(r29)
/* 00005114 C01E0034 */ lfs f0, 0x34(r30)
/* 00005118 EC020024 */ fdivs f0, f2, f0
/* 0000511C EC200072 */ fmuls f1, f0, f1
/* 00005120 4BFFB045 */ bl mathutil_atan
/* 00005124 7C600734 */ extsh r0, r3
/* 00005128 7C000E70 */ srawi r0, r0, 1
/* 0000512C 7C000734 */ extsh r0, r0
/* 00005130 B0010008 */ sth r0, 8(r1)
/* 00005134 A8610008 */ lha r3, 8(r1)
/* 00005138 38634000 */ addi r3, r3, 0x4000
/* 0000513C 4BFFB029 */ bl mathutil_sin
/* 00005140 D021001C */ stfs f1, 0x1c(r1)
/* 00005144 A8610008 */ lha r3, 8(r1)
/* 00005148 4BFFB01D */ bl mathutil_sin
/* 0000514C 387A0000 */ addi r3, r26, 0
/* 00005150 389A0000 */ addi r4, r26, 0
/* 00005154 4BFFB011 */ bl mathutil_vec_set_len
/* 00005158 C0010038 */ lfs f0, 0x38(r1)
/* 0000515C 38610010 */ addi r3, r1, 0x10
/* 00005160 C021003C */ lfs f1, 0x3c(r1)
/* 00005164 D0010010 */ stfs f0, 0x10(r1)
/* 00005168 C0010040 */ lfs f0, 0x40(r1)
/* 0000516C D0210014 */ stfs f1, 0x14(r1)
/* 00005170 D0010018 */ stfs f0, 0x18(r1)
/* 00005174 4BFFAFF1 */ bl mathutil_mtxA_from_quat
/* 00005178 38610008 */ addi r3, r1, 8
/* 0000517C 4BFFAFE9 */ bl mathutil_mtxA_to_euler
/* 00005180 A87E0076 */ lha r3, 0x76(r30)
/* 00005184 A8010008 */ lha r0, 8(r1)
/* 00005188 7C030214 */ add r0, r3, r0
/* 0000518C B01E0076 */ sth r0, 0x76(r30)
/* 00005190 A87E0078 */ lha r3, 0x78(r30)
/* 00005194 A801000A */ lha r0, 0xa(r1)
/* 00005198 7C030214 */ add r0, r3, r0
/* 0000519C B01E0078 */ sth r0, 0x78(r30)
/* 000051A0 A87E007A */ lha r3, 0x7a(r30)
/* 000051A4 A801000C */ lha r0, 0xc(r1)
/* 000051A8 7C030214 */ add r0, r3, r0
/* 000051AC B01E007A */ sth r0, 0x7a(r30)
/* 000051B0 C0010044 */ lfs f0, 0x44(r1)
/* 000051B4 FC000050 */ fneg f0, f0
/* 000051B8 D0010044 */ stfs f0, 0x44(r1)
/* 000051BC C0010048 */ lfs f0, 0x48(r1)
/* 000051C0 FC000050 */ fneg f0, f0
/* 000051C4 D0010048 */ stfs f0, 0x48(r1)
/* 000051C8 C001004C */ lfs f0, 0x4c(r1)
/* 000051CC FC000050 */ fneg f0, f0
/* 000051D0 D001004C */ stfs f0, 0x4c(r1)
/* 000051D4 A87F0072 */ lha r3, 0x72(r31)
/* 000051D8 4BFFAF8D */ bl mathutil_mtxA_from_rotate_y
/* 000051DC A87F0070 */ lha r3, 0x70(r31)
/* 000051E0 4BFFAF85 */ bl mathutil_mtxA_rotate_x
/* 000051E4 A87F0074 */ lha r3, 0x74(r31)
/* 000051E8 4BFFAF7D */ bl mathutil_mtxA_rotate_z
/* 000051EC 38610044 */ addi r3, r1, 0x44
/* 000051F0 389C0000 */ addi r4, r28, 0
/* 000051F4 4BFFAF71 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 000051F8 C03E0064 */ lfs f1, 0x64(r30)
/* 000051FC 7F63DB78 */ mr r3, r27
/* 00005200 C01F0064 */ lfs f0, 0x64(r31)
/* 00005204 7F64DB78 */ mr r4, r27
/* 00005208 EC010028 */ fsubs f0, f1, f0
/* 0000520C D0010020 */ stfs f0, 0x20(r1)
/* 00005210 C03E0068 */ lfs f1, 0x68(r30)
/* 00005214 C01F0068 */ lfs f0, 0x68(r31)
/* 00005218 EC010028 */ fsubs f0, f1, f0
/* 0000521C D0010024 */ stfs f0, 0x24(r1)
/* 00005220 C03E006C */ lfs f1, 0x6c(r30)
/* 00005224 C01F006C */ lfs f0, 0x6c(r31)
/* 00005228 EC010028 */ fsubs f0, f1, f0
/* 0000522C D0010028 */ stfs f0, 0x28(r1)
/* 00005230 4BFFAF35 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00005234 C0A1002C */ lfs f5, 0x2c(r1)
/* 00005238 C0410020 */ lfs f2, 0x20(r1)
/* 0000523C C0810030 */ lfs f4, 0x30(r1)
/* 00005240 C0210024 */ lfs f1, 0x24(r1)
/* 00005244 C0610034 */ lfs f3, 0x34(r1)
/* 00005248 C0010028 */ lfs f0, 0x28(r1)
/* 0000524C ECA500B2 */ fmuls f5, f5, f2
/* 00005250 ECA4287A */ fmadds f5, f4, f1, f5
/* 00005254 ECA3283A */ fmadds f5, f3, f0, f5
/* 00005258 C041002C */ lfs f2, 0x2c(r1)
/* 0000525C C0210030 */ lfs f1, 0x30(r1)
/* 00005260 C0010034 */ lfs f0, 0x34(r1)
/* 00005264 EC4500B2 */ fmuls f2, f5, f2
/* 00005268 C0610020 */ lfs f3, 0x20(r1)
/* 0000526C EC250072 */ fmuls f1, f5, f1
/* 00005270 EC050032 */ fmuls f0, f5, f0
/* 00005274 EC431028 */ fsubs f2, f3, f2
/* 00005278 D0410020 */ stfs f2, 0x20(r1)
/* 0000527C C0410024 */ lfs f2, 0x24(r1)
/* 00005280 EC220828 */ fsubs f1, f2, f1
/* 00005284 D0210024 */ stfs f1, 0x24(r1)
/* 00005288 C0210028 */ lfs f1, 0x28(r1)
/* 0000528C EC010028 */ fsubs f0, f1, f0
/* 00005290 D0010028 */ stfs f0, 0x28(r1)
/* 00005294 C0E10030 */ lfs f7, 0x30(r1)
/* 00005298 C0610028 */ lfs f3, 0x28(r1)
/* 0000529C C0C10034 */ lfs f6, 0x34(r1)
/* 000052A0 C0A10020 */ lfs f5, 0x20(r1)
/* 000052A4 C101002C */ lfs f8, 0x2c(r1)
/* 000052A8 C0810024 */ lfs f4, 0x24(r1)
/* 000052AC EC4700F2 */ fmuls f2, f7, f3
/* 000052B0 EC260172 */ fmuls f1, f6, f5
/* 000052B4 EC080132 */ fmuls f0, f8, f4
/* 000052B8 EC46113C */ fnmsubs f2, f6, f4, f2
/* 000052BC D0410038 */ stfs f2, 0x38(r1)
/* 000052C0 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 000052C4 D021003C */ stfs f1, 0x3c(r1)
/* 000052C8 EC07017C */ fnmsubs f0, f7, f5, f0
/* 000052CC D0010040 */ stfs f0, 0x40(r1)
/* 000052D0 C0210020 */ lfs f1, 0x20(r1)
/* 000052D4 C0410024 */ lfs f2, 0x24(r1)
/* 000052D8 C0010028 */ lfs f0, 0x28(r1)
/* 000052DC EC210072 */ fmuls f1, f1, f1
/* 000052E0 EC2208BA */ fmadds f1, f2, f2, f1
/* 000052E4 EC20083A */ fmadds f1, f0, f0, f1
/* 000052E8 4BFFAE7D */ bl mathutil_sqrt
/* 000052EC C05D001C */ lfs f2, 0x1c(r29)
/* 000052F0 C01F0034 */ lfs f0, 0x34(r31)
/* 000052F4 EC020024 */ fdivs f0, f2, f0
/* 000052F8 EC200072 */ fmuls f1, f0, f1
/* 000052FC 4BFFAE69 */ bl mathutil_atan
/* 00005300 7C600734 */ extsh r0, r3
/* 00005304 7C000E70 */ srawi r0, r0, 1
/* 00005308 7C000734 */ extsh r0, r0
/* 0000530C B0010008 */ sth r0, 8(r1)
/* 00005310 A8610008 */ lha r3, 8(r1)
/* 00005314 38634000 */ addi r3, r3, 0x4000
/* 00005318 4BFFAE4D */ bl mathutil_sin
/* 0000531C D021001C */ stfs f1, 0x1c(r1)
/* 00005320 A8610008 */ lha r3, 8(r1)
/* 00005324 4BFFAE41 */ bl mathutil_sin
/* 00005328 387A0000 */ addi r3, r26, 0
/* 0000532C 389A0000 */ addi r4, r26, 0
/* 00005330 4BFFAE35 */ bl mathutil_vec_set_len
/* 00005334 C0010038 */ lfs f0, 0x38(r1)
/* 00005338 38610010 */ addi r3, r1, 0x10
/* 0000533C C021003C */ lfs f1, 0x3c(r1)
/* 00005340 D0010010 */ stfs f0, 0x10(r1)
/* 00005344 C0010040 */ lfs f0, 0x40(r1)
/* 00005348 D0210014 */ stfs f1, 0x14(r1)
/* 0000534C D0010018 */ stfs f0, 0x18(r1)
/* 00005350 4BFFAE15 */ bl mathutil_mtxA_from_quat
/* 00005354 38610008 */ addi r3, r1, 8
/* 00005358 4BFFAE0D */ bl mathutil_mtxA_to_euler
/* 0000535C A8DF0076 */ lha r6, 0x76(r31)
/* 00005360 38610044 */ addi r3, r1, 0x44
/* 00005364 A8010008 */ lha r0, 8(r1)
/* 00005368 389E0064 */ addi r4, r30, 0x64
/* 0000536C 38BF0064 */ addi r5, r31, 0x64
/* 00005370 7C060214 */ add r0, r6, r0
/* 00005374 B01F0076 */ sth r0, 0x76(r31)
/* 00005378 A8DF0078 */ lha r6, 0x78(r31)
/* 0000537C A801000A */ lha r0, 0xa(r1)
/* 00005380 7C060214 */ add r0, r6, r0
/* 00005384 B01F0078 */ sth r0, 0x78(r31)
/* 00005388 A8DF007A */ lha r6, 0x7a(r31)
/* 0000538C A801000C */ lha r0, 0xc(r1)
/* 00005390 7C060214 */ add r0, r6, r0
/* 00005394 B01F007A */ sth r0, 0x7a(r31)
/* 00005398 C03D0008 */ lfs f1, 8(r29)
/* 0000539C FC400890 */ fmr f2, f1
/* 000053A0 4BFFADC5 */ bl func_8006AD3C
/* 000053A4 A81F0000 */ lha r0, 0(r31)
/* 000053A8 38800008 */ li r4, 8
/* 000053AC 7C770214 */ add r3, r23, r0
/* 000053B0 9883000C */ stb r4, 0xc(r3)
lbl_000053B4:
/* 000053B4 3B18FFFF */ addi r24, r24, -1
/* 000053B8 3AD602E8 */ addi r22, r22, 0x2e8
lbl_000053BC:
/* 000053BC 2C180000 */ cmpwi r24, 0
/* 000053C0 4181F9B0 */ bgt lbl_00004D70
lbl_000053C4:
/* 000053C4 3B39FFFF */ addi r25, r25, -1
/* 000053C8 3AF702E8 */ addi r23, r23, 0x2e8
lbl_000053CC:
/* 000053CC 2C190000 */ cmpwi r25, 0
/* 000053D0 4181F988 */ bgt lbl_00004D58
/* 000053D4 BAC10068 */ lmw r22, 0x68(r1)
/* 000053D8 8001009C */ lwz r0, 0x9c(r1)
/* 000053DC CBE10090 */ lfd f31, 0x90(r1)
/* 000053E0 38210098 */ addi r1, r1, 0x98
/* 000053E4 7C0803A6 */ mtlr r0
/* 000053E8 4E800020 */ blr 
