/* 0001199C 7C0802A6 */ mflr r0
/* 000119A0 3C600000 */ lis r3, g_poolInfo@ha
/* 000119A4 90010004 */ stw r0, 4(r1)
/* 000119A8 3CA00000 */ lis r5, lbl_10017664@ha
/* 000119AC 3C800000 */ lis r4, ballInfo@ha
/* 000119B0 9421FEA8 */ stwu r1, -0x158(r1)
/* 000119B4 39050000 */ addi r8, r5, lbl_10017664@l
/* 000119B8 38040000 */ addi r0, r4, ballInfo@l
/* 000119BC DBE10150 */ stfd f31, 0x150(r1)
/* 000119C0 38630000 */ addi r3, r3, g_poolInfo@l
/* 000119C4 3D200000 */ lis r9, lbl_0001C348@ha
/* 000119C8 DBC10148 */ stfd f30, 0x148(r1)
/* 000119CC 3C800000 */ lis r4, u_somePlayerId@ha
/* 000119D0 3CA00000 */ lis r5, lbl_0001D728@ha
/* 000119D4 DBA10140 */ stfd f29, 0x140(r1)
/* 000119D8 3CE00000 */ lis r7, lbl_802F1E60@ha
/* 000119DC 3CC00000 */ lis r6, lbl_802F1E9C@ha
/* 000119E0 DB810138 */ stfd f28, 0x138(r1)
/* 000119E4 BE0100F8 */ stmw r16, 0xf8(r1)
/* 000119E8 7C160378 */ mr r22, r0
/* 000119EC 3B490000 */ addi r26, r9, lbl_0001C348@l
/* 000119F0 3A480008 */ addi r18, r8, 8
/* 000119F4 3BC40000 */ addi r30, r4, u_somePlayerId@l
/* 000119F8 3BA50000 */ addi r29, r5, lbl_0001D728@l
/* 000119FC 3B670000 */ addi r27, r7, lbl_802F1E60@l
/* 00011A00 3B860000 */ addi r28, r6, lbl_802F1E9C@l
/* 00011A04 3B21002C */ addi r25, r1, 0x2c
/* 00011A08 82A3000C */ lwz r21, 0xc(r3)
/* 00011A0C 83030008 */ lwz r24, 8(r3)
/* 00011A10 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00011A14 3BE30000 */ addi r31, r3, lbl_802F1DFC@l
/* 00011A18 480006E8 */ b lbl_00012100
lbl_00011A1C:
/* 00011A1C 88150000 */ lbz r0, 0(r21)
/* 00011A20 7C000775 */ extsb. r0, r0
/* 00011A24 418206CC */ beq lbl_000120F0
/* 00011A28 80160094 */ lwz r0, 0x94(r22)
/* 00011A2C 54000319 */ rlwinm. r0, r0, 0, 0xc, 0xc
/* 00011A30 408206C0 */ bne lbl_000120F0
/* 00011A34 38760000 */ addi r3, r22, 0
/* 00011A38 38810094 */ addi r4, r1, 0x94
/* 00011A3C 4BFEE729 */ bl init_physball_from_ball
/* 00011A40 80160094 */ lwz r0, 0x94(r22)
/* 00011A44 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011A48 41820010 */ beq lbl_00011A58
/* 00011A4C 80010094 */ lwz r0, 0x94(r1)
/* 00011A50 60000001 */ ori r0, r0, 1
/* 00011A54 90010094 */ stw r0, 0x94(r1)
lbl_00011A58:
/* 00011A58 C0360074 */ lfs f1, 0x74(r22)
/* 00011A5C 3A320018 */ addi r17, r18, 0x18
/* 00011A60 3A9601A4 */ addi r20, r22, 0x1a4
/* 00011A64 EC010072 */ fmuls f0, f1, f1
/* 00011A68 3A750001 */ addi r19, r21, 1
/* 00011A6C 3AF8FFFF */ addi r23, r24, -1
/* 00011A70 EFC10032 */ fmuls f30, f1, f0
/* 00011A74 FFE0F050 */ fneg f31, f30
/* 00011A78 48000664 */ b lbl_000120DC
lbl_00011A7C:
/* 00011A7C 88130000 */ lbz r0, 0(r19)
/* 00011A80 2C000002 */ cmpwi r0, 2
/* 00011A84 40820648 */ bne lbl_000120CC
/* 00011A88 80140094 */ lwz r0, 0x94(r20)
/* 00011A8C 54000319 */ rlwinm. r0, r0, 0, 0xc, 0xc
/* 00011A90 4082063C */ bne lbl_000120CC
/* 00011A94 38740000 */ addi r3, r20, 0
/* 00011A98 38810038 */ addi r4, r1, 0x38
/* 00011A9C 4BFEE6C9 */ bl init_physball_from_ball
/* 00011AA0 80140094 */ lwz r0, 0x94(r20)
/* 00011AA4 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011AA8 41820010 */ beq lbl_00011AB8
/* 00011AAC 80010038 */ lwz r0, 0x38(r1)
/* 00011AB0 60000001 */ ori r0, r0, 1
/* 00011AB4 90010038 */ stw r0, 0x38(r1)
lbl_00011AB8:
/* 00011AB8 C0610048 */ lfs f3, 0x48(r1)
/* 00011ABC C04100A4 */ lfs f2, 0xa4(r1)
/* 00011AC0 C02100B0 */ lfs f1, 0xb0(r1)
/* 00011AC4 C0010054 */ lfs f0, 0x54(r1)
/* 00011AC8 ECC31028 */ fsubs f6, f3, f2
/* 00011ACC C081004C */ lfs f4, 0x4c(r1)
/* 00011AD0 EC610028 */ fsubs f3, f1, f0
/* 00011AD4 C04100A8 */ lfs f2, 0xa8(r1)
/* 00011AD8 C02100B4 */ lfs f1, 0xb4(r1)
/* 00011ADC C0010058 */ lfs f0, 0x58(r1)
/* 00011AE0 ECA41028 */ fsubs f5, f4, f2
/* 00011AE4 D0C1002C */ stfs f6, 0x2c(r1)
/* 00011AE8 EC410028 */ fsubs f2, f1, f0
/* 00011AEC C0810050 */ lfs f4, 0x50(r1)
/* 00011AF0 C00100AC */ lfs f0, 0xac(r1)
/* 00011AF4 D0610020 */ stfs f3, 0x20(r1)
/* 00011AF8 C02100B8 */ lfs f1, 0xb8(r1)
/* 00011AFC EC640028 */ fsubs f3, f4, f0
/* 00011B00 C001005C */ lfs f0, 0x5c(r1)
/* 00011B04 D0A10030 */ stfs f5, 0x30(r1)
/* 00011B08 EC010028 */ fsubs f0, f1, f0
/* 00011B0C D0410024 */ stfs f2, 0x24(r1)
/* 00011B10 D0610034 */ stfs f3, 0x34(r1)
/* 00011B14 D0010028 */ stfs f0, 0x28(r1)
/* 00011B18 C0A1002C */ lfs f5, 0x2c(r1)
/* 00011B1C C0410020 */ lfs f2, 0x20(r1)
/* 00011B20 C0810030 */ lfs f4, 0x30(r1)
/* 00011B24 C0210024 */ lfs f1, 0x24(r1)
/* 00011B28 C0610034 */ lfs f3, 0x34(r1)
/* 00011B2C C0010028 */ lfs f0, 0x28(r1)
/* 00011B30 EC4500B2 */ fmuls f2, f5, f2
/* 00011B34 EC44107A */ fmadds f2, f4, f1, f2
/* 00011B38 EC43103A */ fmadds f2, f3, f0, f2
/* 00011B3C C01A001C */ lfs f0, 0x1c(r26)
/* 00011B40 FC020040 */ fcmpo cr0, f2, f0
/* 00011B44 4081057C */ ble lbl_000120C0
/* 00011B48 C02100BC */ lfs f1, 0xbc(r1)
/* 00011B4C 386100A4 */ addi r3, r1, 0xa4
/* 00011B50 C0410060 */ lfs f2, 0x60(r1)
/* 00011B54 38810098 */ addi r4, r1, 0x98
/* 00011B58 38A10048 */ addi r5, r1, 0x48
/* 00011B5C 38C1003C */ addi r6, r1, 0x3c
/* 00011B60 4BFEE605 */ bl func_8006AAEC
/* 00011B64 28030000 */ cmplwi r3, 0
/* 00011B68 41820558 */ beq lbl_000120C0
/* 00011B6C C03A006C */ lfs f1, 0x6c(r26)
/* 00011B70 7F23CB78 */ mr r3, r25
/* 00011B74 C01B0000 */ lfs f0, 0(r27)
/* 00011B78 7F24CB78 */ mr r4, r25
/* 00011B7C 8814002E */ lbz r0, 0x2e(r20)
/* 00011B80 EC010032 */ fmuls f0, f1, f0
/* 00011B84 7C000774 */ extsb r0, r0
/* 00011B88 5400083C */ slwi r0, r0, 1
/* 00011B8C FC00001E */ fctiwz f0, f0
/* 00011B90 7CB20214 */ add r5, r18, r0
/* 00011B94 D80100F0 */ stfd f0, 0xf0(r1)
/* 00011B98 800100F4 */ lwz r0, 0xf4(r1)
/* 00011B9C 7C060734 */ extsh r6, r0
/* 00011BA0 B0C50008 */ sth r6, 8(r5)
/* 00011BA4 8816002E */ lbz r0, 0x2e(r22)
/* 00011BA8 7C000774 */ extsb r0, r0
/* 00011BAC 5400083C */ slwi r0, r0, 1
/* 00011BB0 7CB10214 */ add r5, r17, r0
/* 00011BB4 B0C50008 */ sth r6, 8(r5)
/* 00011BB8 C0210098 */ lfs f1, 0x98(r1)
/* 00011BBC C001003C */ lfs f0, 0x3c(r1)
/* 00011BC0 C061009C */ lfs f3, 0x9c(r1)
/* 00011BC4 EC810028 */ fsubs f4, f1, f0
/* 00011BC8 C0410040 */ lfs f2, 0x40(r1)
/* 00011BCC C02100A0 */ lfs f1, 0xa0(r1)
/* 00011BD0 C0010044 */ lfs f0, 0x44(r1)
/* 00011BD4 EC431028 */ fsubs f2, f3, f2
/* 00011BD8 D081002C */ stfs f4, 0x2c(r1)
/* 00011BDC EC010028 */ fsubs f0, f1, f0
/* 00011BE0 D0410030 */ stfs f2, 0x30(r1)
/* 00011BE4 D0010034 */ stfs f0, 0x34(r1)
/* 00011BE8 C03C0000 */ lfs f1, 0(r28)
/* 00011BEC 4BFEE579 */ bl mathutil_vec_set_len
/* 00011BF0 C0B40074 */ lfs f5, 0x74(r20)
/* 00011BF4 C02100B8 */ lfs f1, 0xb8(r1)
/* 00011BF8 EC850172 */ fmuls f4, f5, f5
/* 00011BFC C001005C */ lfs f0, 0x5c(r1)
/* 00011C00 C06100B4 */ lfs f3, 0xb4(r1)
/* 00011C04 C0410058 */ lfs f2, 0x58(r1)
/* 00011C08 ECC10028 */ fsubs f6, f1, f0
/* 00011C0C C02100B0 */ lfs f1, 0xb0(r1)
/* 00011C10 EFA50132 */ fmuls f29, f5, f4
/* 00011C14 C0010054 */ lfs f0, 0x54(r1)
/* 00011C18 EC831028 */ fsubs f4, f3, f2
/* 00011C1C C0410034 */ lfs f2, 0x34(r1)
/* 00011C20 EC610028 */ fsubs f3, f1, f0
/* 00011C24 C0010030 */ lfs f0, 0x30(r1)
/* 00011C28 C021002C */ lfs f1, 0x2c(r1)
/* 00011C2C EC2100F2 */ fmuls f1, f1, f3
/* 00011C30 EC20093A */ fmadds f1, f0, f4, f1
/* 00011C34 EC2209BA */ fmadds f1, f2, f6, f1
/* 00011C38 C01A00D8 */ lfs f0, 0xd8(r26)
/* 00011C3C FF800A10 */ fabs f28, f1
/* 00011C40 FF80E018 */ frsp f28, f28
/* 00011C44 FC1C0040 */ fcmpo cr0, f28, f0
/* 00011C48 40810120 */ ble lbl_00011D68
/* 00011C4C A8120014 */ lha r0, 0x14(r18)
/* 00011C50 2C000000 */ cmpwi r0, 0
/* 00011C54 41820010 */ beq lbl_00011C64
/* 00011C58 A8110014 */ lha r0, 0x14(r17)
/* 00011C5C 2C000000 */ cmpwi r0, 0
/* 00011C60 4082005C */ bne lbl_00011CBC
lbl_00011C64:
/* 00011C64 8816002E */ lbz r0, 0x2e(r22)
/* 00011C68 38600114 */ li r3, 0x114
/* 00011C6C 7C000774 */ extsb r0, r0
/* 00011C70 901E0000 */ stw r0, 0(r30)
/* 00011C74 4BFEE4F1 */ bl u_play_sound_1_dupe
/* 00011C78 C01A00D8 */ lfs f0, 0xd8(r26)
/* 00011C7C C05A00DC */ lfs f2, 0xdc(r26)
/* 00011C80 EC3C0028 */ fsubs f1, f28, f0
/* 00011C84 C01A00E0 */ lfs f0, 0xe0(r26)
/* 00011C88 EC220072 */ fmuls f1, f2, f1
/* 00011C8C FC010040 */ fcmpo cr0, f1, f0
/* 00011C90 40810008 */ ble lbl_00011C98
/* 00011C94 FC200090 */ fmr f1, f0
lbl_00011C98:
/* 00011C98 FC00081E */ fctiwz f0, f1
/* 00011C9C 8816002E */ lbz r0, 0x2e(r22)
/* 00011CA0 5463043E */ clrlwi r3, r3, 0x10
/* 00011CA4 7C040774 */ extsb r4, r0
/* 00011CA8 D80100F0 */ stfd f0, 0xf0(r1)
/* 00011CAC 800100F4 */ lwz r0, 0xf4(r1)
/* 00011CB0 909E0000 */ stw r4, 0(r30)
/* 00011CB4 540404BE */ clrlwi r4, r0, 0x12
/* 00011CB8 4BFEE4AD */ bl SoundPitch
lbl_00011CBC:
/* 00011CBC C01A00E4 */ lfs f0, 0xe4(r26)
/* 00011CC0 EC1C0024 */ fdivs f0, f28, f0
/* 00011CC4 FC00001E */ fctiwz f0, f0
/* 00011CC8 D80100F0 */ stfd f0, 0xf0(r1)
/* 00011CCC 820100F4 */ lwz r16, 0xf4(r1)
/* 00011CD0 2C100002 */ cmpwi r16, 2
/* 00011CD4 40810008 */ ble lbl_00011CDC
/* 00011CD8 3A000002 */ li r16, 2
lbl_00011CDC:
/* 00011CDC A8120014 */ lha r0, 0x14(r18)
/* 00011CE0 5603103A */ slwi r3, r16, 2
/* 00011CE4 7C7D1A14 */ add r3, r29, r3
/* 00011CE8 2C000000 */ cmpwi r0, 0
/* 00011CEC 82030000 */ lwz r16, 0(r3)
/* 00011CF0 40820038 */ bne lbl_00011D28
/* 00011CF4 80160094 */ lwz r0, 0x94(r22)
/* 00011CF8 38700000 */ addi r3, r16, 0
/* 00011CFC 60000020 */ ori r0, r0, 0x20
/* 00011D00 90160094 */ stw r0, 0x94(r22)
/* 00011D04 8816002E */ lbz r0, 0x2e(r22)
/* 00011D08 7C000774 */ extsb r0, r0
/* 00011D0C 901E0000 */ stw r0, 0(r30)
/* 00011D10 809600FC */ lwz r4, 0xfc(r22)
/* 00011D14 80040010 */ lwz r0, 0x10(r4)
/* 00011D18 901F0000 */ stw r0, 0(r31)
/* 00011D1C 4BFEE449 */ bl u_play_sound_0
/* 00011D20 3800000F */ li r0, 0xf
/* 00011D24 B0120014 */ sth r0, 0x14(r18)
lbl_00011D28:
/* 00011D28 A8110014 */ lha r0, 0x14(r17)
/* 00011D2C 2C000000 */ cmpwi r0, 0
/* 00011D30 40820038 */ bne lbl_00011D68
/* 00011D34 80140094 */ lwz r0, 0x94(r20)
/* 00011D38 38700000 */ addi r3, r16, 0
/* 00011D3C 60000020 */ ori r0, r0, 0x20
/* 00011D40 90140094 */ stw r0, 0x94(r20)
/* 00011D44 8814002E */ lbz r0, 0x2e(r20)
/* 00011D48 7C000774 */ extsb r0, r0
/* 00011D4C 901E0000 */ stw r0, 0(r30)
/* 00011D50 809400FC */ lwz r4, 0xfc(r20)
/* 00011D54 80040010 */ lwz r0, 0x10(r4)
/* 00011D58 901F0000 */ stw r0, 0(r31)
/* 00011D5C 4BFEE409 */ bl u_play_sound_0
/* 00011D60 3800000F */ li r0, 0xf
/* 00011D64 B0110014 */ sth r0, 0x14(r17)
lbl_00011D68:
/* 00011D68 FC20F090 */ fmr f1, f30
/* 00011D6C 3861002C */ addi r3, r1, 0x2c
/* 00011D70 FC40E890 */ fmr f2, f29
/* 00011D74 388100B0 */ addi r4, r1, 0xb0
/* 00011D78 38A10054 */ addi r5, r1, 0x54
/* 00011D7C 4BFEE3E9 */ bl func_8006AD3C
/* 00011D80 80010094 */ lwz r0, 0x94(r1)
/* 00011D84 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011D88 418200FC */ beq lbl_00011E84
/* 00011D8C 800100B0 */ lwz r0, 0xb0(r1)
/* 00011D90 806100B4 */ lwz r3, 0xb4(r1)
/* 00011D94 90010020 */ stw r0, 0x20(r1)
/* 00011D98 800100B8 */ lwz r0, 0xb8(r1)
/* 00011D9C 90610024 */ stw r3, 0x24(r1)
/* 00011DA0 90010028 */ stw r0, 0x28(r1)
/* 00011DA4 C0160114 */ lfs f0, 0x114(r22)
/* 00011DA8 FC000050 */ fneg f0, f0
/* 00011DAC D0010014 */ stfs f0, 0x14(r1)
/* 00011DB0 C0160118 */ lfs f0, 0x118(r22)
/* 00011DB4 FC000050 */ fneg f0, f0
/* 00011DB8 D0010018 */ stfs f0, 0x18(r1)
/* 00011DBC C016011C */ lfs f0, 0x11c(r22)
/* 00011DC0 FC000050 */ fneg f0, f0
/* 00011DC4 D001001C */ stfs f0, 0x1c(r1)
/* 00011DC8 C0A10014 */ lfs f5, 0x14(r1)
/* 00011DCC C0410020 */ lfs f2, 0x20(r1)
/* 00011DD0 C0810018 */ lfs f4, 0x18(r1)
/* 00011DD4 C0210024 */ lfs f1, 0x24(r1)
/* 00011DD8 C061001C */ lfs f3, 0x1c(r1)
/* 00011DDC C0010028 */ lfs f0, 0x28(r1)
/* 00011DE0 ED0500B2 */ fmuls f8, f5, f2
/* 00011DE4 ED04407A */ fmadds f8, f4, f1, f8
/* 00011DE8 ED03403A */ fmadds f8, f3, f0, f8
/* 00011DEC C01A001C */ lfs f0, 0x1c(r26)
/* 00011DF0 FC080040 */ fcmpo cr0, f8, f0
/* 00011DF4 40800090 */ bge lbl_00011E84
/* 00011DF8 EC1FE824 */ fdivs f0, f31, f29
/* 00011DFC C0610014 */ lfs f3, 0x14(r1)
/* 00011E00 C0C10018 */ lfs f6, 0x18(r1)
/* 00011E04 C081001C */ lfs f4, 0x1c(r1)
/* 00011E08 C0E10020 */ lfs f7, 0x20(r1)
/* 00011E0C EF880032 */ fmuls f28, f8, f0
/* 00011E10 C0210054 */ lfs f1, 0x54(r1)
/* 00011E14 EC4800F2 */ fmuls f2, f8, f3
/* 00011E18 ECA801B2 */ fmuls f5, f8, f6
/* 00011E1C EC1C00F2 */ fmuls f0, f28, f3
/* 00011E20 ECE71028 */ fsubs f7, f7, f2
/* 00011E24 EC680132 */ fmuls f3, f8, f4
/* 00011E28 EC41002A */ fadds f2, f1, f0
/* 00011E2C D0E10020 */ stfs f7, 0x20(r1)
/* 00011E30 EC3C01B2 */ fmuls f1, f28, f6
/* 00011E34 EC1C0132 */ fmuls f0, f28, f4
/* 00011E38 C0810024 */ lfs f4, 0x24(r1)
/* 00011E3C D0410054 */ stfs f2, 0x54(r1)
/* 00011E40 EC842828 */ fsubs f4, f4, f5
/* 00011E44 C0410058 */ lfs f2, 0x58(r1)
/* 00011E48 D0810024 */ stfs f4, 0x24(r1)
/* 00011E4C EC22082A */ fadds f1, f2, f1
/* 00011E50 C0410028 */ lfs f2, 0x28(r1)
/* 00011E54 D0210058 */ stfs f1, 0x58(r1)
/* 00011E58 EC421828 */ fsubs f2, f2, f3
/* 00011E5C C021005C */ lfs f1, 0x5c(r1)
/* 00011E60 D0410028 */ stfs f2, 0x28(r1)
/* 00011E64 EC01002A */ fadds f0, f1, f0
/* 00011E68 80010020 */ lwz r0, 0x20(r1)
/* 00011E6C 80610024 */ lwz r3, 0x24(r1)
/* 00011E70 900100B0 */ stw r0, 0xb0(r1)
/* 00011E74 80010028 */ lwz r0, 0x28(r1)
/* 00011E78 906100B4 */ stw r3, 0xb4(r1)
/* 00011E7C 900100B8 */ stw r0, 0xb8(r1)
/* 00011E80 D001005C */ stfs f0, 0x5c(r1)
lbl_00011E84:
/* 00011E84 80010038 */ lwz r0, 0x38(r1)
/* 00011E88 540007FF */ clrlwi. r0, r0, 0x1f
/* 00011E8C 41820100 */ beq lbl_00011F8C
/* 00011E90 80010054 */ lwz r0, 0x54(r1)
/* 00011E94 80610058 */ lwz r3, 0x58(r1)
/* 00011E98 90010020 */ stw r0, 0x20(r1)
/* 00011E9C 8001005C */ lwz r0, 0x5c(r1)
/* 00011EA0 90610024 */ stw r3, 0x24(r1)
/* 00011EA4 90010028 */ stw r0, 0x28(r1)
/* 00011EA8 C0140114 */ lfs f0, 0x114(r20)
/* 00011EAC FC000050 */ fneg f0, f0
/* 00011EB0 D0010008 */ stfs f0, 8(r1)
/* 00011EB4 C0140118 */ lfs f0, 0x118(r20)
/* 00011EB8 FC000050 */ fneg f0, f0
/* 00011EBC D001000C */ stfs f0, 0xc(r1)
/* 00011EC0 C014011C */ lfs f0, 0x11c(r20)
/* 00011EC4 FC000050 */ fneg f0, f0
/* 00011EC8 D0010010 */ stfs f0, 0x10(r1)
/* 00011ECC C0A10008 */ lfs f5, 8(r1)
/* 00011ED0 C0410020 */ lfs f2, 0x20(r1)
/* 00011ED4 C081000C */ lfs f4, 0xc(r1)
/* 00011ED8 C0210024 */ lfs f1, 0x24(r1)
/* 00011EDC C0610010 */ lfs f3, 0x10(r1)
/* 00011EE0 C0010028 */ lfs f0, 0x28(r1)
/* 00011EE4 ECE500B2 */ fmuls f7, f5, f2
/* 00011EE8 ECE4387A */ fmadds f7, f4, f1, f7
/* 00011EEC ECE3383A */ fmadds f7, f3, f0, f7
/* 00011EF0 C01A001C */ lfs f0, 0x1c(r26)
/* 00011EF4 FC070040 */ fcmpo cr0, f7, f0
/* 00011EF8 40800094 */ bge lbl_00011F8C
/* 00011EFC FC00E850 */ fneg f0, f29
/* 00011F00 C0C10008 */ lfs f6, 8(r1)
/* 00011F04 C021000C */ lfs f1, 0xc(r1)
/* 00011F08 C0810010 */ lfs f4, 0x10(r1)
/* 00011F0C EC6701B2 */ fmuls f3, f7, f6
/* 00011F10 EC00F024 */ fdivs f0, f0, f30
/* 00011F14 C0A10020 */ lfs f5, 0x20(r1)
/* 00011F18 C04100B0 */ lfs f2, 0xb0(r1)
/* 00011F1C EF870032 */ fmuls f28, f7, f0
/* 00011F20 EC651828 */ fsubs f3, f5, f3
/* 00011F24 ECA70072 */ fmuls f5, f7, f1
/* 00011F28 EC1C01B2 */ fmuls f0, f28, f6
/* 00011F2C D0610020 */ stfs f3, 0x20(r1)
/* 00011F30 EC670132 */ fmuls f3, f7, f4
/* 00011F34 EC3C0072 */ fmuls f1, f28, f1
/* 00011F38 C0C10024 */ lfs f6, 0x24(r1)
/* 00011F3C EC42002A */ fadds f2, f2, f0
/* 00011F40 ECA62828 */ fsubs f5, f6, f5
/* 00011F44 EC1C0132 */ fmuls f0, f28, f4
/* 00011F48 D04100B0 */ stfs f2, 0xb0(r1)
/* 00011F4C D0A10024 */ stfs f5, 0x24(r1)
/* 00011F50 C04100B4 */ lfs f2, 0xb4(r1)
/* 00011F54 C0810028 */ lfs f4, 0x28(r1)
/* 00011F58 EC22082A */ fadds f1, f2, f1
/* 00011F5C EC441828 */ fsubs f2, f4, f3
/* 00011F60 D02100B4 */ stfs f1, 0xb4(r1)
/* 00011F64 D0410028 */ stfs f2, 0x28(r1)
/* 00011F68 C02100B8 */ lfs f1, 0xb8(r1)
/* 00011F6C 80010020 */ lwz r0, 0x20(r1)
/* 00011F70 EC01002A */ fadds f0, f1, f0
/* 00011F74 80610024 */ lwz r3, 0x24(r1)
/* 00011F78 90010054 */ stw r0, 0x54(r1)
/* 00011F7C 80010028 */ lwz r0, 0x28(r1)
/* 00011F80 90610058 */ stw r3, 0x58(r1)
/* 00011F84 9001005C */ stw r0, 0x5c(r1)
/* 00011F88 D00100B8 */ stfs f0, 0xb8(r1)
lbl_00011F8C:
/* 00011F8C C0610098 */ lfs f3, 0x98(r1)
/* 00011F90 3861002C */ addi r3, r1, 0x2c
/* 00011F94 C04100B0 */ lfs f2, 0xb0(r1)
/* 00011F98 C021003C */ lfs f1, 0x3c(r1)
/* 00011F9C C0010054 */ lfs f0, 0x54(r1)
/* 00011FA0 EC43102A */ fadds f2, f3, f2
/* 00011FA4 EC01002A */ fadds f0, f1, f0
/* 00011FA8 D0410098 */ stfs f2, 0x98(r1)
/* 00011FAC D001003C */ stfs f0, 0x3c(r1)
/* 00011FB0 C061009C */ lfs f3, 0x9c(r1)
/* 00011FB4 C04100B4 */ lfs f2, 0xb4(r1)
/* 00011FB8 C0210040 */ lfs f1, 0x40(r1)
/* 00011FBC C0010058 */ lfs f0, 0x58(r1)
/* 00011FC0 EC43102A */ fadds f2, f3, f2
/* 00011FC4 EC01002A */ fadds f0, f1, f0
/* 00011FC8 D041009C */ stfs f2, 0x9c(r1)
/* 00011FCC D0010040 */ stfs f0, 0x40(r1)
/* 00011FD0 C06100A0 */ lfs f3, 0xa0(r1)
/* 00011FD4 C04100B8 */ lfs f2, 0xb8(r1)
/* 00011FD8 C0210044 */ lfs f1, 0x44(r1)
/* 00011FDC C001005C */ lfs f0, 0x5c(r1)
/* 00011FE0 EC43102A */ fadds f2, f3, f2
/* 00011FE4 EC01002A */ fadds f0, f1, f0
/* 00011FE8 D04100A0 */ stfs f2, 0xa0(r1)
/* 00011FEC D0010044 */ stfs f0, 0x44(r1)
/* 00011FF0 C0010098 */ lfs f0, 0x98(r1)
/* 00011FF4 C021003C */ lfs f1, 0x3c(r1)
/* 00011FF8 C0610040 */ lfs f3, 0x40(r1)
/* 00011FFC EC810028 */ fsubs f4, f1, f0
/* 00012000 C041009C */ lfs f2, 0x9c(r1)
/* 00012004 C0210044 */ lfs f1, 0x44(r1)
/* 00012008 C00100A0 */ lfs f0, 0xa0(r1)
/* 0001200C EC431028 */ fsubs f2, f3, f2
/* 00012010 D081002C */ stfs f4, 0x2c(r1)
/* 00012014 EC010028 */ fsubs f0, f1, f0
/* 00012018 C06100BC */ lfs f3, 0xbc(r1)
/* 0001201C C0210060 */ lfs f1, 0x60(r1)
/* 00012020 D0410030 */ stfs f2, 0x30(r1)
/* 00012024 EFA3082A */ fadds f29, f3, f1
/* 00012028 D0010034 */ stfs f0, 0x34(r1)
/* 0001202C 4BFEE139 */ bl mathutil_vec_normalize_len
/* 00012030 FC01E840 */ fcmpo cr0, f1, f29
/* 00012034 4080008C */ bge lbl_000120C0
/* 00012038 80010094 */ lwz r0, 0x94(r1)
/* 0001203C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00012040 41820044 */ beq lbl_00012084
/* 00012044 C001002C */ lfs f0, 0x2c(r1)
/* 00012048 C0210030 */ lfs f1, 0x30(r1)
/* 0001204C EC800772 */ fmuls f4, f0, f29
/* 00012050 C0A10098 */ lfs f5, 0x98(r1)
/* 00012054 C0010034 */ lfs f0, 0x34(r1)
/* 00012058 EC410772 */ fmuls f2, f1, f29
/* 0001205C C061009C */ lfs f3, 0x9c(r1)
/* 00012060 EC85202A */ fadds f4, f5, f4
/* 00012064 C02100A0 */ lfs f1, 0xa0(r1)
/* 00012068 EC000772 */ fmuls f0, f0, f29
/* 0001206C EC43102A */ fadds f2, f3, f2
/* 00012070 D081003C */ stfs f4, 0x3c(r1)
/* 00012074 EC01002A */ fadds f0, f1, f0
/* 00012078 D0410040 */ stfs f2, 0x40(r1)
/* 0001207C D0010044 */ stfs f0, 0x44(r1)
/* 00012080 48000040 */ b lbl_000120C0
lbl_00012084:
/* 00012084 C001002C */ lfs f0, 0x2c(r1)
/* 00012088 C0210030 */ lfs f1, 0x30(r1)
/* 0001208C EC800772 */ fmuls f4, f0, f29
/* 00012090 C0A1003C */ lfs f5, 0x3c(r1)
/* 00012094 C0010034 */ lfs f0, 0x34(r1)
/* 00012098 EC410772 */ fmuls f2, f1, f29
/* 0001209C C0610040 */ lfs f3, 0x40(r1)
/* 000120A0 EC852028 */ fsubs f4, f5, f4
/* 000120A4 C0210044 */ lfs f1, 0x44(r1)
/* 000120A8 EC000772 */ fmuls f0, f0, f29
/* 000120AC EC431028 */ fsubs f2, f3, f2
/* 000120B0 D0810098 */ stfs f4, 0x98(r1)
/* 000120B4 EC010028 */ fsubs f0, f1, f0
/* 000120B8 D041009C */ stfs f2, 0x9c(r1)
/* 000120BC D00100A0 */ stfs f0, 0xa0(r1)
lbl_000120C0:
/* 000120C0 38740000 */ addi r3, r20, 0
/* 000120C4 38810038 */ addi r4, r1, 0x38
/* 000120C8 4BFEE09D */ bl set_ball_pos_and_vel_from_physball
lbl_000120CC:
/* 000120CC 3AF7FFFF */ addi r23, r23, -1
/* 000120D0 3A9401A4 */ addi r20, r20, 0x1a4
/* 000120D4 3A730001 */ addi r19, r19, 1
/* 000120D8 3A310018 */ addi r17, r17, 0x18
lbl_000120DC:
/* 000120DC 2C170000 */ cmpwi r23, 0
/* 000120E0 4181F99C */ bgt lbl_00011A7C
/* 000120E4 38760000 */ addi r3, r22, 0
/* 000120E8 38810094 */ addi r4, r1, 0x94
/* 000120EC 4BFEE079 */ bl set_ball_pos_and_vel_from_physball
lbl_000120F0:
/* 000120F0 3B18FFFF */ addi r24, r24, -1
/* 000120F4 3AD601A4 */ addi r22, r22, 0x1a4
/* 000120F8 3AB50001 */ addi r21, r21, 1
/* 000120FC 3A520018 */ addi r18, r18, 0x18
lbl_00012100:
/* 00012100 2C180001 */ cmpwi r24, 1
/* 00012104 4181F918 */ bgt lbl_00011A1C
/* 00012108 BA0100F8 */ lmw r16, 0xf8(r1)
/* 0001210C 8001015C */ lwz r0, 0x15c(r1)
/* 00012110 CBE10150 */ lfd f31, 0x150(r1)
/* 00012114 CBC10148 */ lfd f30, 0x148(r1)
/* 00012118 7C0803A6 */ mtlr r0
/* 0001211C CBA10140 */ lfd f29, 0x140(r1)
/* 00012120 CB810138 */ lfd f28, 0x138(r1)
/* 00012124 38210158 */ addi r1, r1, 0x158
/* 00012128 4E800020 */ blr 
