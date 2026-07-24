/* 0000CAA8 7C0802A6 */ mflr r0
/* 0000CAAC 1CA30184 */ mulli r5, r3, 0x184
/* 0000CAB0 90010004 */ stw r0, 4(r1)
/* 0000CAB4 9421FE78 */ stwu r1, -0x188(r1)
/* 0000CAB8 3C800000 */ lis r4, lbl_10018510@ha
/* 0000CABC DBE10180 */ stfd f31, 0x180(r1)
/* 0000CAC0 DBC10178 */ stfd f30, 0x178(r1)
/* 0000CAC4 DBA10170 */ stfd f29, 0x170(r1)
/* 0000CAC8 DB810168 */ stfd f28, 0x168(r1)
/* 0000CACC DB610160 */ stfd f27, 0x160(r1)
/* 0000CAD0 BE010120 */ stmw r16, 0x120(r1)
/* 0000CAD4 3B430001 */ addi r26, r3, 1
/* 0000CAD8 38640000 */ addi r3, r4, lbl_10018510@l
/* 0000CADC 7F232A14 */ add r25, r3, r5
/* 0000CAE0 1C1A0184 */ mulli r0, r26, 0x184
/* 0000CAE4 7F030214 */ add r24, r3, r0
/* 0000CAE8 3CA00000 */ lis r5, lbl_00014800@ha
/* 0000CAEC 3C800000 */ lis r4, cameraInfo@ha
/* 0000CAF0 3C600000 */ lis r3, modeCtrl@ha
/* 0000CAF4 3B850000 */ addi r28, r5, lbl_00014800@l
/* 0000CAF8 3BC40000 */ addi r30, r4, cameraInfo@l
/* 0000CAFC 3BE30000 */ addi r31, r3, modeCtrl@l
/* 0000CB00 3BA10040 */ addi r29, r1, 0x40
/* 0000CB04 3B790124 */ addi r27, r25, 0x124
/* 0000CB08 4800099C */ b lbl_0000D4A4
lbl_0000CB0C:
/* 0000CB0C 80780000 */ lwz r3, 0(r24)
/* 0000CB10 C3FC03E8 */ lfs f31, 0x3e8(r28)
/* 0000CB14 546007FF */ clrlwi. r0, r3, 0x1f
/* 0000CB18 41820984 */ beq lbl_0000D49C
/* 0000CB1C 546006F9 */ rlwinm. r0, r3, 0, 0x1b, 0x1c
/* 0000CB20 4082097C */ bne lbl_0000D49C
/* 0000CB24 38780124 */ addi r3, r24, 0x124
/* 0000CB28 C0BB0000 */ lfs f5, 0(r27)
/* 0000CB2C C0430000 */ lfs f2, 0(r3)
/* 0000CB30 C09B0004 */ lfs f4, 4(r27)
/* 0000CB34 C0230004 */ lfs f1, 4(r3)
/* 0000CB38 C07B0008 */ lfs f3, 8(r27)
/* 0000CB3C C0030008 */ lfs f0, 8(r3)
/* 0000CB40 ECA51028 */ fsubs f5, f5, f2
/* 0000CB44 EC840828 */ fsubs f4, f4, f1
/* 0000CB48 EC630028 */ fsubs f3, f3, f0
/* 0000CB4C EC250172 */ fmuls f1, f5, f5
/* 0000CB50 EC24093A */ fmadds f1, f4, f4, f1
/* 0000CB54 EC2308FA */ fmadds f1, f3, f3, f1
/* 0000CB58 C81C0538 */ lfd f0, 0x538(r28)
/* 0000CB5C FC000840 */ fcmpo cr0, f0, f1
/* 0000CB60 4180093C */ blt lbl_0000D49C
/* 0000CB64 3AE00000 */ li r23, 0
/* 0000CB68 3A600000 */ li r19, 0
/* 0000CB6C 3A400000 */ li r18, 0
/* 0000CB70 4800008C */ b lbl_0000CBFC
lbl_0000CB74:
/* 0000CB74 3AC00000 */ li r22, 0
/* 0000CB78 3A200000 */ li r17, 0
/* 0000CB7C 3A000000 */ li r16, 0
/* 0000CB80 48000064 */ b lbl_0000CBE4
lbl_0000CB84:
/* 0000CB84 801C03A8 */ lwz r0, 0x3a8(r28)
/* 0000CB88 38920094 */ addi r4, r18, 0x94
/* 0000CB8C 38B20004 */ addi r5, r18, 4
/* 0000CB90 7CC09A14 */ add r6, r0, r19
/* 0000CB94 7C608A14 */ add r3, r0, r17
/* 0000CB98 C026000C */ lfs f1, 0xc(r6)
/* 0000CB9C 38D00094 */ addi r6, r16, 0x94
/* 0000CBA0 C043000C */ lfs f2, 0xc(r3)
/* 0000CBA4 38F00004 */ addi r7, r16, 4
/* 0000CBA8 3861010C */ addi r3, r1, 0x10c
/* 0000CBAC 7C992214 */ add r4, r25, r4
/* 0000CBB0 7CB92A14 */ add r5, r25, r5
/* 0000CBB4 7CD83214 */ add r6, r24, r6
/* 0000CBB8 7CF83A14 */ add r7, r24, r7
/* 0000CBBC 480009DD */ bl lbl_0000D598
/* 0000CBC0 C001010C */ lfs f0, 0x10c(r1)
/* 0000CBC4 FC00F840 */ fcmpo cr0, f0, f31
/* 0000CBC8 40810010 */ ble lbl_0000CBD8
/* 0000CBCC FFE00090 */ fmr f31, f0
/* 0000CBD0 3AB70000 */ addi r21, r23, 0
/* 0000CBD4 3A960000 */ addi r20, r22, 0
lbl_0000CBD8:
/* 0000CBD8 3AD60001 */ addi r22, r22, 1
/* 0000CBDC 3A310014 */ addi r17, r17, 0x14
/* 0000CBE0 3A10000C */ addi r16, r16, 0xc
lbl_0000CBE4:
/* 0000CBE4 881C03AC */ lbz r0, 0x3ac(r28)
/* 0000CBE8 7C160000 */ cmpw r22, r0
/* 0000CBEC 4180FF98 */ blt lbl_0000CB84
/* 0000CBF0 3AF70001 */ addi r23, r23, 1
/* 0000CBF4 3A730014 */ addi r19, r19, 0x14
/* 0000CBF8 3A52000C */ addi r18, r18, 0xc
lbl_0000CBFC:
/* 0000CBFC 881C03AC */ lbz r0, 0x3ac(r28)
/* 0000CC00 7C170000 */ cmpw r23, r0
/* 0000CC04 4180FF70 */ blt lbl_0000CB74
/* 0000CC08 C81C0400 */ lfd f0, 0x400(r28)
/* 0000CC0C FC00F800 */ fcmpu cr0, f0, f31
/* 0000CC10 4182088C */ beq lbl_0000D49C
/* 0000CC14 80190000 */ lwz r0, 0(r25)
/* 0000CC18 1CD5000C */ mulli r6, r21, 0xc
/* 0000CC1C 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000CC20 90190000 */ stw r0, 0(r25)
/* 0000CC24 1C94000C */ mulli r4, r20, 0xc
/* 0000CC28 80180000 */ lwz r0, 0(r24)
/* 0000CC2C 38660094 */ addi r3, r6, 0x94
/* 0000CC30 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 0000CC34 90180000 */ stw r0, 0(r24)
/* 0000CC38 38A40094 */ addi r5, r4, 0x94
/* 0000CC3C 1D350014 */ mulli r9, r21, 0x14
/* 0000CC40 80190000 */ lwz r0, 0(r25)
/* 0000CC44 60000004 */ ori r0, r0, 4
/* 0000CC48 90190000 */ stw r0, 0(r25)
/* 0000CC4C 1C140014 */ mulli r0, r20, 0x14
/* 0000CC50 80F80000 */ lwz r7, 0(r24)
/* 0000CC54 7D193214 */ add r8, r25, r6
/* 0000CC58 60E60004 */ ori r6, r7, 4
/* 0000CC5C 90D80000 */ stw r6, 0(r24)
/* 0000CC60 7D582214 */ add r10, r24, r4
/* 0000CC64 1CF70014 */ mulli r7, r23, 0x14
/* 0000CC68 80DC03A8 */ lwz r6, 0x3a8(r28)
/* 0000CC6C C39C0398 */ lfs f28, 0x398(r28)
/* 0000CC70 7D264A14 */ add r9, r6, r9
/* 0000CC74 80880004 */ lwz r4, 4(r8)
/* 0000CC78 7CC60214 */ add r6, r6, r0
/* 0000CC7C C3C90010 */ lfs f30, 0x10(r9)
/* 0000CC80 C3A60010 */ lfs f29, 0x10(r6)
/* 0000CC84 1C160014 */ mulli r0, r22, 0x14
/* 0000CC88 80C80008 */ lwz r6, 8(r8)
/* 0000CC8C 908100A0 */ stw r4, 0xa0(r1)
/* 0000CC90 7C791A14 */ add r3, r25, r3
/* 0000CC94 388100A0 */ addi r4, r1, 0xa0
/* 0000CC98 90C100A4 */ stw r6, 0xa4(r1)
/* 0000CC9C 7CB82A14 */ add r5, r24, r5
/* 0000CCA0 38C10094 */ addi r6, r1, 0x94
/* 0000CCA4 8108000C */ lwz r8, 0xc(r8)
/* 0000CCA8 910100A8 */ stw r8, 0xa8(r1)
/* 0000CCAC 812A0004 */ lwz r9, 4(r10)
/* 0000CCB0 810A0008 */ lwz r8, 8(r10)
/* 0000CCB4 91210094 */ stw r9, 0x94(r1)
/* 0000CCB8 91010098 */ stw r8, 0x98(r1)
/* 0000CCBC 810A000C */ lwz r8, 0xc(r10)
/* 0000CCC0 9101009C */ stw r8, 0x9c(r1)
/* 0000CCC4 813C03A8 */ lwz r9, 0x3a8(r28)
/* 0000CCC8 7D093A14 */ add r8, r9, r7
/* 0000CCCC 7CE90214 */ add r7, r9, r0
/* 0000CCD0 C028000C */ lfs f1, 0xc(r8)
/* 0000CCD4 C047000C */ lfs f2, 0xc(r7)
/* 0000CCD8 4BFF3489 */ bl func_8006AAEC
/* 0000CCDC C02100A0 */ lfs f1, 0xa0(r1)
/* 0000CCE0 38610100 */ addi r3, r1, 0x100
/* 0000CCE4 C0010094 */ lfs f0, 0x94(r1)
/* 0000CCE8 C06100A4 */ lfs f3, 0xa4(r1)
/* 0000CCEC EC810028 */ fsubs f4, f1, f0
/* 0000CCF0 C0410098 */ lfs f2, 0x98(r1)
/* 0000CCF4 C02100A8 */ lfs f1, 0xa8(r1)
/* 0000CCF8 C001009C */ lfs f0, 0x9c(r1)
/* 0000CCFC EC431028 */ fsubs f2, f3, f2
/* 0000CD00 D0810100 */ stfs f4, 0x100(r1)
/* 0000CD04 EC010028 */ fsubs f0, f1, f0
/* 0000CD08 D0410104 */ stfs f2, 0x104(r1)
/* 0000CD0C D0010108 */ stfs f0, 0x108(r1)
/* 0000CD10 4BFF3451 */ bl mathutil_vec_normalize_len
/* 0000CD14 C81C0400 */ lfd f0, 0x400(r28)
/* 0000CD18 FC000800 */ fcmpu cr0, f0, f1
/* 0000CD1C 4082001C */ bne lbl_0000CD38
/* 0000CD20 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000CD24 D0010100 */ stfs f0, 0x100(r1)
/* 0000CD28 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000CD2C D0010104 */ stfs f0, 0x104(r1)
/* 0000CD30 C01C0540 */ lfs f0, 0x540(r28)
/* 0000CD34 D0010108 */ stfs f0, 0x108(r1)
lbl_0000CD38:
/* 0000CD38 1C15000C */ mulli r0, r21, 0xc
/* 0000CD3C 7C790214 */ add r3, r25, r0
/* 0000CD40 C0230004 */ lfs f1, 4(r3)
/* 0000CD44 C0030094 */ lfs f0, 0x94(r3)
/* 0000CD48 EC010028 */ fsubs f0, f1, f0
/* 0000CD4C D0010088 */ stfs f0, 0x88(r1)
/* 0000CD50 C0230008 */ lfs f1, 8(r3)
/* 0000CD54 C0030098 */ lfs f0, 0x98(r3)
/* 0000CD58 EC010028 */ fsubs f0, f1, f0
/* 0000CD5C D001008C */ stfs f0, 0x8c(r1)
/* 0000CD60 C023000C */ lfs f1, 0xc(r3)
/* 0000CD64 C003009C */ lfs f0, 0x9c(r3)
/* 0000CD68 EC010028 */ fsubs f0, f1, f0
/* 0000CD6C D0010090 */ stfs f0, 0x90(r1)
/* 0000CD70 C0A10100 */ lfs f5, 0x100(r1)
/* 0000CD74 C0410088 */ lfs f2, 0x88(r1)
/* 0000CD78 C0810104 */ lfs f4, 0x104(r1)
/* 0000CD7C C021008C */ lfs f1, 0x8c(r1)
/* 0000CD80 C0610108 */ lfs f3, 0x108(r1)
/* 0000CD84 C0010090 */ lfs f0, 0x90(r1)
/* 0000CD88 ECE500B2 */ fmuls f7, f5, f2
/* 0000CD8C ECE4387A */ fmadds f7, f4, f1, f7
/* 0000CD90 ECE3383A */ fmadds f7, f3, f0, f7
/* 0000CD94 C0A10100 */ lfs f5, 0x100(r1)
/* 0000CD98 C0410104 */ lfs f2, 0x104(r1)
/* 0000CD9C 1C14000C */ mulli r0, r20, 0xc
/* 0000CDA0 C0C10108 */ lfs f6, 0x108(r1)
/* 0000CDA4 EC6501F2 */ fmuls f3, f5, f7
/* 0000CDA8 7C780214 */ add r3, r24, r0
/* 0000CDAC EC2201F2 */ fmuls f1, f2, f7
/* 0000CDB0 EC0601F2 */ fmuls f0, f6, f7
/* 0000CDB4 D06100F4 */ stfs f3, 0xf4(r1)
/* 0000CDB8 D02100F8 */ stfs f1, 0xf8(r1)
/* 0000CDBC D00100FC */ stfs f0, 0xfc(r1)
/* 0000CDC0 C0230004 */ lfs f1, 4(r3)
/* 0000CDC4 C0030094 */ lfs f0, 0x94(r3)
/* 0000CDC8 EC010028 */ fsubs f0, f1, f0
/* 0000CDCC D0010088 */ stfs f0, 0x88(r1)
/* 0000CDD0 C0230008 */ lfs f1, 8(r3)
/* 0000CDD4 C0030098 */ lfs f0, 0x98(r3)
/* 0000CDD8 EC010028 */ fsubs f0, f1, f0
/* 0000CDDC D001008C */ stfs f0, 0x8c(r1)
/* 0000CDE0 C023000C */ lfs f1, 0xc(r3)
/* 0000CDE4 C003009C */ lfs f0, 0x9c(r3)
/* 0000CDE8 EC010028 */ fsubs f0, f1, f0
/* 0000CDEC D0010090 */ stfs f0, 0x90(r1)
/* 0000CDF0 C1010100 */ lfs f8, 0x100(r1)
/* 0000CDF4 C0610088 */ lfs f3, 0x88(r1)
/* 0000CDF8 C0E10104 */ lfs f7, 0x104(r1)
/* 0000CDFC C021008C */ lfs f1, 0x8c(r1)
/* 0000CE00 C0810108 */ lfs f4, 0x108(r1)
/* 0000CE04 C0010090 */ lfs f0, 0x90(r1)
/* 0000CE08 ED0800F2 */ fmuls f8, f8, f3
/* 0000CE0C ED07407A */ fmadds f8, f7, f1, f8
/* 0000CE10 ED04403A */ fmadds f8, f4, f0, f8
/* 0000CE14 C08100F4 */ lfs f4, 0xf4(r1)
/* 0000CE18 C06100F8 */ lfs f3, 0xf8(r1)
/* 0000CE1C C02100FC */ lfs f1, 0xfc(r1)
/* 0000CE20 ECA50232 */ fmuls f5, f5, f8
/* 0000CE24 EC420232 */ fmuls f2, f2, f8
/* 0000CE28 EC060232 */ fmuls f0, f6, f8
/* 0000CE2C D0A100E8 */ stfs f5, 0xe8(r1)
/* 0000CE30 D04100EC */ stfs f2, 0xec(r1)
/* 0000CE34 D00100F0 */ stfs f0, 0xf0(r1)
/* 0000CE38 C00100E8 */ lfs f0, 0xe8(r1)
/* 0000CE3C C04100EC */ lfs f2, 0xec(r1)
/* 0000CE40 EC840028 */ fsubs f4, f4, f0
/* 0000CE44 C00100F0 */ lfs f0, 0xf0(r1)
/* 0000CE48 EC431028 */ fsubs f2, f3, f2
/* 0000CE4C EC010028 */ fsubs f0, f1, f0
/* 0000CE50 D08100C4 */ stfs f4, 0xc4(r1)
/* 0000CE54 D04100C8 */ stfs f2, 0xc8(r1)
/* 0000CE58 D00100CC */ stfs f0, 0xcc(r1)
/* 0000CE5C 80190000 */ lwz r0, 0(r25)
/* 0000CE60 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000CE64 40820010 */ bne lbl_0000CE74
/* 0000CE68 80180000 */ lwz r0, 0(r24)
/* 0000CE6C 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 0000CE70 41820040 */ beq lbl_0000CEB0
lbl_0000CE74:
/* 0000CE74 C83C0548 */ lfd f1, 0x548(r28)
/* 0000CE78 C00100C4 */ lfs f0, 0xc4(r1)
/* 0000CE7C FC010032 */ fmul f0, f1, f0
/* 0000CE80 FC000018 */ frsp f0, f0
/* 0000CE84 D00100C4 */ stfs f0, 0xc4(r1)
/* 0000CE88 C83C0548 */ lfd f1, 0x548(r28)
/* 0000CE8C C00100C8 */ lfs f0, 0xc8(r1)
/* 0000CE90 FC010032 */ fmul f0, f1, f0
/* 0000CE94 FC000018 */ frsp f0, f0
/* 0000CE98 D00100C8 */ stfs f0, 0xc8(r1)
/* 0000CE9C C83C0548 */ lfd f1, 0x548(r28)
/* 0000CEA0 C00100CC */ lfs f0, 0xcc(r1)
/* 0000CEA4 FC010032 */ fmul f0, f1, f0
/* 0000CEA8 FC000018 */ frsp f0, f0
/* 0000CEAC D00100CC */ stfs f0, 0xcc(r1)
lbl_0000CEB0:
/* 0000CEB0 EC3EE82A */ fadds f1, f30, f29
/* 0000CEB4 C85C04A0 */ lfd f2, 0x4a0(r28)
/* 0000CEB8 C00100F4 */ lfs f0, 0xf4(r1)
/* 0000CEBC C10100E8 */ lfs f8, 0xe8(r1)
/* 0000CEC0 FF620824 */ fdiv f27, f2, f1
/* 0000CEC4 C04100C4 */ lfs f2, 0xc4(r1)
/* 0000CEC8 C0E100F8 */ lfs f7, 0xf8(r1)
/* 0000CECC C0C100EC */ lfs f6, 0xec(r1)
/* 0000CED0 C02100C8 */ lfs f1, 0xc8(r1)
/* 0000CED4 FF60D818 */ frsp f27, f27
/* 0000CED8 C0A100FC */ lfs f5, 0xfc(r1)
/* 0000CEDC EC7C00B2 */ fmuls f3, f28, f2
/* 0000CEE0 C08100F0 */ lfs f4, 0xf0(r1)
/* 0000CEE4 EC5C0072 */ fmuls f2, f28, f1
/* 0000CEE8 C02100CC */ lfs f1, 0xcc(r1)
/* 0000CEEC EC7B00F2 */ fmuls f3, f27, f3
/* 0000CEF0 ED3E0032 */ fmuls f9, f30, f0
/* 0000CEF4 ED1D0232 */ fmuls f8, f29, f8
/* 0000CEF8 EC3C0072 */ fmuls f1, f28, f1
/* 0000CEFC D06100AC */ stfs f3, 0xac(r1)
/* 0000CF00 EC5B00B2 */ fmuls f2, f27, f2
/* 0000CF04 ED09402A */ fadds f8, f9, f8
/* 0000CF08 ECFE01F2 */ fmuls f7, f30, f7
/* 0000CF0C EC7D01B2 */ fmuls f3, f29, f6
/* 0000CF10 D04100B0 */ stfs f2, 0xb0(r1)
/* 0000CF14 EC5B0232 */ fmuls f2, f27, f8
/* 0000CF18 EC3B0072 */ fmuls f1, f27, f1
/* 0000CF1C ECC7182A */ fadds f6, f7, f3
/* 0000CF20 EC7E0172 */ fmuls f3, f30, f5
/* 0000CF24 D04100B8 */ stfs f2, 0xb8(r1)
/* 0000CF28 EC5D0132 */ fmuls f2, f29, f4
/* 0000CF2C D02100B4 */ stfs f1, 0xb4(r1)
/* 0000CF30 EC9B01B2 */ fmuls f4, f27, f6
/* 0000CF34 C02100AC */ lfs f1, 0xac(r1)
/* 0000CF38 EC63102A */ fadds f3, f3, f2
/* 0000CF3C C04100B0 */ lfs f2, 0xb0(r1)
/* 0000CF40 C0A100B4 */ lfs f5, 0xb4(r1)
/* 0000CF44 EC7B00F2 */ fmuls f3, f27, f3
/* 0000CF48 D08100BC */ stfs f4, 0xbc(r1)
/* 0000CF4C EC810772 */ fmuls f4, f1, f29
/* 0000CF50 ECE20772 */ fmuls f7, f2, f29
/* 0000CF54 D06100C0 */ stfs f3, 0xc0(r1)
/* 0000CF58 EC2107B2 */ fmuls f1, f1, f30
/* 0000CF5C C14100B8 */ lfs f10, 0xb8(r1)
/* 0000CF60 EC650772 */ fmuls f3, f5, f29
/* 0000CF64 C10100BC */ lfs f8, 0xbc(r1)
/* 0000CF68 EC4207B2 */ fmuls f2, f2, f30
/* 0000CF6C ED2A2028 */ fsubs f9, f10, f4
/* 0000CF70 C0C100C0 */ lfs f6, 0xc0(r1)
/* 0000CF74 EC8A082A */ fadds f4, f10, f1
/* 0000CF78 EC2507B2 */ fmuls f1, f5, f30
/* 0000CF7C ECE83828 */ fsubs f7, f8, f7
/* 0000CF80 D12100DC */ stfs f9, 0xdc(r1)
/* 0000CF84 ECA61828 */ fsubs f5, f6, f3
/* 0000CF88 EC68102A */ fadds f3, f8, f2
/* 0000CF8C D0E100E0 */ stfs f7, 0xe0(r1)
/* 0000CF90 EC46082A */ fadds f2, f6, f1
/* 0000CF94 D08100D0 */ stfs f4, 0xd0(r1)
/* 0000CF98 D0A100E4 */ stfs f5, 0xe4(r1)
/* 0000CF9C D06100D4 */ stfs f3, 0xd4(r1)
/* 0000CFA0 C02100DC */ lfs f1, 0xdc(r1)
/* 0000CFA4 D04100D8 */ stfs f2, 0xd8(r1)
/* 0000CFA8 EC010028 */ fsubs f0, f1, f0
/* 0000CFAC C0390130 */ lfs f1, 0x130(r25)
/* 0000CFB0 EC01002A */ fadds f0, f1, f0
/* 0000CFB4 D0190130 */ stfs f0, 0x130(r25)
/* 0000CFB8 C02100E0 */ lfs f1, 0xe0(r1)
/* 0000CFBC C00100F8 */ lfs f0, 0xf8(r1)
/* 0000CFC0 C0590134 */ lfs f2, 0x134(r25)
/* 0000CFC4 EC010028 */ fsubs f0, f1, f0
/* 0000CFC8 EC02002A */ fadds f0, f2, f0
/* 0000CFCC D0190134 */ stfs f0, 0x134(r25)
/* 0000CFD0 C02100E4 */ lfs f1, 0xe4(r1)
/* 0000CFD4 C00100FC */ lfs f0, 0xfc(r1)
/* 0000CFD8 C0590138 */ lfs f2, 0x138(r25)
/* 0000CFDC EC010028 */ fsubs f0, f1, f0
/* 0000CFE0 EC02002A */ fadds f0, f2, f0
/* 0000CFE4 D0190138 */ stfs f0, 0x138(r25)
/* 0000CFE8 C02100D0 */ lfs f1, 0xd0(r1)
/* 0000CFEC C00100E8 */ lfs f0, 0xe8(r1)
/* 0000CFF0 C0580130 */ lfs f2, 0x130(r24)
/* 0000CFF4 EC010028 */ fsubs f0, f1, f0
/* 0000CFF8 EC02002A */ fadds f0, f2, f0
/* 0000CFFC D0180130 */ stfs f0, 0x130(r24)
/* 0000D000 C02100D4 */ lfs f1, 0xd4(r1)
/* 0000D004 C00100EC */ lfs f0, 0xec(r1)
/* 0000D008 C0580134 */ lfs f2, 0x134(r24)
/* 0000D00C EC010028 */ fsubs f0, f1, f0
/* 0000D010 EC02002A */ fadds f0, f2, f0
/* 0000D014 D0180134 */ stfs f0, 0x134(r24)
/* 0000D018 C02100D8 */ lfs f1, 0xd8(r1)
/* 0000D01C C00100F0 */ lfs f0, 0xf0(r1)
/* 0000D020 C0580138 */ lfs f2, 0x138(r24)
/* 0000D024 EC010028 */ fsubs f0, f1, f0
/* 0000D028 EC02002A */ fadds f0, f2, f0
/* 0000D02C D0180138 */ stfs f0, 0x138(r24)
/* 0000D030 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D034 1C14000C */ mulli r0, r20, 0xc
/* 0000D038 C06100C4 */ lfs f3, 0xc4(r1)
/* 0000D03C FC000772 */ fmul f0, f0, f29
/* 0000D040 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D044 C02100CC */ lfs f1, 0xcc(r1)
/* 0000D048 7CD80214 */ add r6, r24, r0
/* 0000D04C 38610030 */ addi r3, r1, 0x30
/* 0000D050 FC030032 */ fmul f0, f3, f0
/* 0000D054 3881007C */ addi r4, r1, 0x7c
/* 0000D058 38A10024 */ addi r5, r1, 0x24
/* 0000D05C FC000018 */ frsp f0, f0
/* 0000D060 D001007C */ stfs f0, 0x7c(r1)
/* 0000D064 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D068 FC000772 */ fmul f0, f0, f29
/* 0000D06C FC020032 */ fmul f0, f2, f0
/* 0000D070 FC000018 */ frsp f0, f0
/* 0000D074 D0010080 */ stfs f0, 0x80(r1)
/* 0000D078 C81C0550 */ lfd f0, 0x550(r28)
/* 0000D07C FC000772 */ fmul f0, f0, f29
/* 0000D080 FC010032 */ fmul f0, f1, f0
/* 0000D084 FC000018 */ frsp f0, f0
/* 0000D088 D0010084 */ stfs f0, 0x84(r1)
/* 0000D08C C0260004 */ lfs f1, 4(r6)
/* 0000D090 C0180124 */ lfs f0, 0x124(r24)
/* 0000D094 EC010028 */ fsubs f0, f1, f0
/* 0000D098 D0010030 */ stfs f0, 0x30(r1)
/* 0000D09C C0260008 */ lfs f1, 8(r6)
/* 0000D0A0 C0180128 */ lfs f0, 0x128(r24)
/* 0000D0A4 EC010028 */ fsubs f0, f1, f0
/* 0000D0A8 D0010034 */ stfs f0, 0x34(r1)
/* 0000D0AC C026000C */ lfs f1, 0xc(r6)
/* 0000D0B0 C018012C */ lfs f0, 0x12c(r24)
/* 0000D0B4 EC010028 */ fsubs f0, f1, f0
/* 0000D0B8 D0010038 */ stfs f0, 0x38(r1)
/* 0000D0BC 48000811 */ bl lbl_0000D8CC
/* 0000D0C0 1C140014 */ mulli r0, r20, 0x14
/* 0000D0C4 807C03A8 */ lwz r3, 0x3a8(r28)
/* 0000D0C8 C85C04D0 */ lfd f2, 0x4d0(r28)
/* 0000D0CC C87C04C8 */ lfd f3, 0x4c8(r28)
/* 0000D0D0 7C630214 */ add r3, r3, r0
/* 0000D0D4 C0230010 */ lfs f1, 0x10(r3)
/* 0000D0D8 1C15000C */ mulli r0, r21, 0xc
/* 0000D0DC C01C0388 */ lfs f0, 0x388(r28)
/* 0000D0E0 FC420824 */ fdiv f2, f2, f1
/* 0000D0E4 C0210024 */ lfs f1, 0x24(r1)
/* 0000D0E8 7CD90214 */ add r6, r25, r0
/* 0000D0EC 38610018 */ addi r3, r1, 0x18
/* 0000D0F0 3881007C */ addi r4, r1, 0x7c
/* 0000D0F4 FC43102A */ fadd f2, f3, f2
/* 0000D0F8 38A1000C */ addi r5, r1, 0xc
/* 0000D0FC FC401018 */ frsp f2, f2
/* 0000D100 EC0000B2 */ fmuls f0, f0, f2
/* 0000D104 EC010032 */ fmuls f0, f1, f0
/* 0000D108 D0010024 */ stfs f0, 0x24(r1)
/* 0000D10C C01C038C */ lfs f0, 0x38c(r28)
/* 0000D110 C0210028 */ lfs f1, 0x28(r1)
/* 0000D114 EC0000B2 */ fmuls f0, f0, f2
/* 0000D118 EC010032 */ fmuls f0, f1, f0
/* 0000D11C D0010028 */ stfs f0, 0x28(r1)
/* 0000D120 C01C0390 */ lfs f0, 0x390(r28)
/* 0000D124 C021002C */ lfs f1, 0x2c(r1)
/* 0000D128 EC0000B2 */ fmuls f0, f0, f2
/* 0000D12C EC010032 */ fmuls f0, f1, f0
/* 0000D130 D001002C */ stfs f0, 0x2c(r1)
/* 0000D134 80010024 */ lwz r0, 0x24(r1)
/* 0000D138 80E10028 */ lwz r7, 0x28(r1)
/* 0000D13C 90010070 */ stw r0, 0x70(r1)
/* 0000D140 8001002C */ lwz r0, 0x2c(r1)
/* 0000D144 90E10074 */ stw r7, 0x74(r1)
/* 0000D148 90010078 */ stw r0, 0x78(r1)
/* 0000D14C C0210070 */ lfs f1, 0x70(r1)
/* 0000D150 C018013C */ lfs f0, 0x13c(r24)
/* 0000D154 EC01002A */ fadds f0, f1, f0
/* 0000D158 D018013C */ stfs f0, 0x13c(r24)
/* 0000D15C C0210074 */ lfs f1, 0x74(r1)
/* 0000D160 C0180140 */ lfs f0, 0x140(r24)
/* 0000D164 EC01002A */ fadds f0, f1, f0
/* 0000D168 D0180140 */ stfs f0, 0x140(r24)
/* 0000D16C C0210078 */ lfs f1, 0x78(r1)
/* 0000D170 C0180144 */ lfs f0, 0x144(r24)
/* 0000D174 EC01002A */ fadds f0, f1, f0
/* 0000D178 D0180144 */ stfs f0, 0x144(r24)
/* 0000D17C C81C0558 */ lfd f0, 0x558(r28)
/* 0000D180 C06100C4 */ lfs f3, 0xc4(r1)
/* 0000D184 FC0007B2 */ fmul f0, f0, f30
/* 0000D188 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D18C C02100CC */ lfs f1, 0xcc(r1)
/* 0000D190 FC030032 */ fmul f0, f3, f0
/* 0000D194 FC000018 */ frsp f0, f0
/* 0000D198 D001007C */ stfs f0, 0x7c(r1)
/* 0000D19C C81C0558 */ lfd f0, 0x558(r28)
/* 0000D1A0 FC0007B2 */ fmul f0, f0, f30
/* 0000D1A4 FC020032 */ fmul f0, f2, f0
/* 0000D1A8 FC000018 */ frsp f0, f0
/* 0000D1AC D0010080 */ stfs f0, 0x80(r1)
/* 0000D1B0 C81C0558 */ lfd f0, 0x558(r28)
/* 0000D1B4 FC0007B2 */ fmul f0, f0, f30
/* 0000D1B8 FC010032 */ fmul f0, f1, f0
/* 0000D1BC FC000018 */ frsp f0, f0
/* 0000D1C0 D0010084 */ stfs f0, 0x84(r1)
/* 0000D1C4 C0260004 */ lfs f1, 4(r6)
/* 0000D1C8 C0190124 */ lfs f0, 0x124(r25)
/* 0000D1CC EC010028 */ fsubs f0, f1, f0
/* 0000D1D0 D0010018 */ stfs f0, 0x18(r1)
/* 0000D1D4 C0260008 */ lfs f1, 8(r6)
/* 0000D1D8 C0190128 */ lfs f0, 0x128(r25)
/* 0000D1DC EC010028 */ fsubs f0, f1, f0
/* 0000D1E0 D001001C */ stfs f0, 0x1c(r1)
/* 0000D1E4 C026000C */ lfs f1, 0xc(r6)
/* 0000D1E8 C019012C */ lfs f0, 0x12c(r25)
/* 0000D1EC EC010028 */ fsubs f0, f1, f0
/* 0000D1F0 D0010020 */ stfs f0, 0x20(r1)
/* 0000D1F4 480006D9 */ bl lbl_0000D8CC
/* 0000D1F8 1C150014 */ mulli r0, r21, 0x14
/* 0000D1FC 807C03A8 */ lwz r3, 0x3a8(r28)
/* 0000D200 C85C04D0 */ lfd f2, 0x4d0(r28)
/* 0000D204 C87C04C8 */ lfd f3, 0x4c8(r28)
/* 0000D208 7C630214 */ add r3, r3, r0
/* 0000D20C C0230010 */ lfs f1, 0x10(r3)
/* 0000D210 C01C0388 */ lfs f0, 0x388(r28)
/* 0000D214 FC420824 */ fdiv f2, f2, f1
/* 0000D218 C021000C */ lfs f1, 0xc(r1)
/* 0000D21C FC43102A */ fadd f2, f3, f2
/* 0000D220 FC401018 */ frsp f2, f2
/* 0000D224 EC0000B2 */ fmuls f0, f0, f2
/* 0000D228 EC010032 */ fmuls f0, f1, f0
/* 0000D22C D001000C */ stfs f0, 0xc(r1)
/* 0000D230 C01C038C */ lfs f0, 0x38c(r28)
/* 0000D234 C0210010 */ lfs f1, 0x10(r1)
/* 0000D238 EC0000B2 */ fmuls f0, f0, f2
/* 0000D23C EC010032 */ fmuls f0, f1, f0
/* 0000D240 D0010010 */ stfs f0, 0x10(r1)
/* 0000D244 C01C0390 */ lfs f0, 0x390(r28)
/* 0000D248 C0210014 */ lfs f1, 0x14(r1)
/* 0000D24C EC0000B2 */ fmuls f0, f0, f2
/* 0000D250 EC010032 */ fmuls f0, f1, f0
/* 0000D254 D0010014 */ stfs f0, 0x14(r1)
/* 0000D258 8001000C */ lwz r0, 0xc(r1)
/* 0000D25C 80610010 */ lwz r3, 0x10(r1)
/* 0000D260 90010070 */ stw r0, 0x70(r1)
/* 0000D264 80010014 */ lwz r0, 0x14(r1)
/* 0000D268 90610074 */ stw r3, 0x74(r1)
/* 0000D26C 90010078 */ stw r0, 0x78(r1)
/* 0000D270 C0210070 */ lfs f1, 0x70(r1)
/* 0000D274 C019013C */ lfs f0, 0x13c(r25)
/* 0000D278 EC01002A */ fadds f0, f1, f0
/* 0000D27C D019013C */ stfs f0, 0x13c(r25)
/* 0000D280 C0210074 */ lfs f1, 0x74(r1)
/* 0000D284 C0190140 */ lfs f0, 0x140(r25)
/* 0000D288 EC01002A */ fadds f0, f1, f0
/* 0000D28C D0190140 */ stfs f0, 0x140(r25)
/* 0000D290 C0210078 */ lfs f1, 0x78(r1)
/* 0000D294 C0190144 */ lfs f0, 0x144(r25)
/* 0000D298 EC01002A */ fadds f0, f1, f0
/* 0000D29C D0190144 */ stfs f0, 0x144(r25)
/* 0000D2A0 C0390124 */ lfs f1, 0x124(r25)
/* 0000D2A4 C0180124 */ lfs f0, 0x124(r24)
/* 0000D2A8 EC010028 */ fsubs f0, f1, f0
/* 0000D2AC D0010064 */ stfs f0, 0x64(r1)
/* 0000D2B0 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000D2B4 D0010068 */ stfs f0, 0x68(r1)
/* 0000D2B8 C039012C */ lfs f1, 0x12c(r25)
/* 0000D2BC C018012C */ lfs f0, 0x12c(r24)
/* 0000D2C0 EC010028 */ fsubs f0, f1, f0
/* 0000D2C4 D001006C */ stfs f0, 0x6c(r1)
/* 0000D2C8 C0410064 */ lfs f2, 0x64(r1)
/* 0000D2CC C0210068 */ lfs f1, 0x68(r1)
/* 0000D2D0 C001006C */ lfs f0, 0x6c(r1)
/* 0000D2D4 EC4200B2 */ fmuls f2, f2, f2
/* 0000D2D8 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D2DC EC40103A */ fmadds f2, f0, f0, f2
/* 0000D2E0 C01C0458 */ lfs f0, 0x458(r28)
/* 0000D2E4 FC201090 */ fmr f1, f2
/* 0000D2E8 FC010040 */ fcmpo cr0, f1, f0
/* 0000D2EC 4C401382 */ cror 2, 0, 2
/* 0000D2F0 40820018 */ bne lbl_0000D308
/* 0000D2F4 C01C03E8 */ lfs f0, 0x3e8(r28)
/* 0000D2F8 D0010064 */ stfs f0, 0x64(r1)
/* 0000D2FC C01C050C */ lfs f0, 0x50c(r28)
/* 0000D300 D001006C */ stfs f0, 0x6c(r1)
/* 0000D304 48000020 */ b lbl_0000D324
lbl_0000D308:
/* 0000D308 4BFF2E59 */ bl mathutil_rsqrt
/* 0000D30C C0010064 */ lfs f0, 0x64(r1)
/* 0000D310 EC000072 */ fmuls f0, f0, f1
/* 0000D314 D0010064 */ stfs f0, 0x64(r1)
/* 0000D318 C001006C */ lfs f0, 0x6c(r1)
/* 0000D31C EC000072 */ fmuls f0, f0, f1
/* 0000D320 D001006C */ stfs f0, 0x6c(r1)
lbl_0000D324:
/* 0000D324 EC5D06F2 */ fmuls f2, f29, f27
/* 0000D328 C8BC04B0 */ lfd f5, 0x4b0(r28)
/* 0000D32C EC7E06F2 */ fmuls f3, f30, f27
/* 0000D330 C0010064 */ lfs f0, 0x64(r1)
/* 0000D334 C0210068 */ lfs f1, 0x68(r1)
/* 0000D338 EC5F00B2 */ fmuls f2, f31, f2
/* 0000D33C C081006C */ lfs f4, 0x6c(r1)
/* 0000D340 EC7F00F2 */ fmuls f3, f31, f3
/* 0000D344 38790000 */ addi r3, r25, 0
/* 0000D348 38810058 */ addi r4, r1, 0x58
/* 0000D34C FC4500B2 */ fmul f2, f5, f2
/* 0000D350 FCC500F2 */ fmul f6, f5, f3
/* 0000D354 FC401018 */ frsp f2, f2
/* 0000D358 FCC03018 */ frsp f6, f6
/* 0000D35C FC401050 */ fneg f2, f2
/* 0000D360 EC6001B2 */ fmuls f3, f0, f6
/* 0000D364 EC0000B2 */ fmuls f0, f0, f2
/* 0000D368 ECA101B2 */ fmuls f5, f1, f6
/* 0000D36C D0610058 */ stfs f3, 0x58(r1)
/* 0000D370 EC2100B2 */ fmuls f1, f1, f2
/* 0000D374 EC6401B2 */ fmuls f3, f4, f6
/* 0000D378 D001004C */ stfs f0, 0x4c(r1)
/* 0000D37C EC0400B2 */ fmuls f0, f4, f2
/* 0000D380 D0A1005C */ stfs f5, 0x5c(r1)
/* 0000D384 D0210050 */ stfs f1, 0x50(r1)
/* 0000D388 D0610060 */ stfs f3, 0x60(r1)
/* 0000D38C D0010054 */ stfs f0, 0x54(r1)
/* 0000D390 48000145 */ bl lbl_0000D4D4
/* 0000D394 38780000 */ addi r3, r24, 0
/* 0000D398 3881004C */ addi r4, r1, 0x4c
/* 0000D39C 48000139 */ bl lbl_0000D4D4
/* 0000D3A0 C02100C4 */ lfs f1, 0xc4(r1)
/* 0000D3A4 C04100C8 */ lfs f2, 0xc8(r1)
/* 0000D3A8 C00100CC */ lfs f0, 0xcc(r1)
/* 0000D3AC EC210072 */ fmuls f1, f1, f1
/* 0000D3B0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D3B4 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D3B8 4BFF2DA9 */ bl mathutil_sqrt
/* 0000D3BC C81C0560 */ lfd f0, 0x560(r28)
/* 0000D3C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000D3C4 408100D8 */ ble lbl_0000D49C
/* 0000D3C8 807C0528 */ lwz r3, 0x528(r28)
/* 0000D3CC 801C052C */ lwz r0, 0x52c(r28)
/* 0000D3D0 90610040 */ stw r3, 0x40(r1)
/* 0000D3D4 90010044 */ stw r0, 0x44(r1)
/* 0000D3D8 801C0530 */ lwz r0, 0x530(r28)
/* 0000D3DC 90010048 */ stw r0, 0x48(r1)
/* 0000D3E0 C85C0568 */ lfd f2, 0x568(r28)
/* 0000D3E4 C81C03C0 */ lfd f0, 0x3c0(r28)
/* 0000D3E8 FC220072 */ fmul f1, f2, f1
/* 0000D3EC FC010040 */ fcmpo cr0, f1, f0
/* 0000D3F0 40800008 */ bge lbl_0000D3F8
/* 0000D3F4 48000008 */ b lbl_0000D3FC
lbl_0000D3F8:
/* 0000D3F8 FC200090 */ fmr f1, f0
lbl_0000D3FC:
/* 0000D3FC FC600818 */ frsp f3, f1
/* 0000D400 C05C0478 */ lfs f2, 0x478(r28)
/* 0000D404 C01C0480 */ lfs f0, 0x480(r28)
/* 0000D408 C03C047C */ lfs f1, 0x47c(r28)
/* 0000D40C EC4200F2 */ fmuls f2, f2, f3
/* 0000D410 EC0000F2 */ fmuls f0, f0, f3
/* 0000D414 EC220828 */ fsubs f1, f2, f1
/* 0000D418 FC00001E */ fctiwz f0, f0
/* 0000D41C FC20081E */ fctiwz f1, f1
/* 0000D420 D8010110 */ stfd f0, 0x110(r1)
/* 0000D424 80010114 */ lwz r0, 0x114(r1)
/* 0000D428 D8210118 */ stfd f1, 0x118(r1)
/* 0000D42C 7C000774 */ extsb r0, r0
/* 0000D430 8061011C */ lwz r3, 0x11c(r1)
/* 0000D434 5400103A */ slwi r0, r0, 2
/* 0000D438 7C1D002E */ lwzx r0, r29, r0
/* 0000D43C 54635BA8 */ rlwinm r3, r3, 0xb, 0xe, 0x14
/* 0000D440 7C630378 */ or r3, r3, r0
/* 0000D444 4BFF2D1D */ bl u_play_sound_1_dupe
/* 0000D448 3A030000 */ addi r16, r3, 0
/* 0000D44C 2C10FFFF */ cmpwi r16, -1
/* 0000D450 4182004C */ beq lbl_0000D49C
/* 0000D454 4BFF2D0D */ bl rand
/* 0000D458 5464053E */ clrlwi r4, r3, 0x14
/* 0000D45C 5603043E */ clrlwi r3, r16, 0x10
/* 0000D460 38841800 */ addi r4, r4, 0x1800
/* 0000D464 4BFF2CFD */ bl SoundDop
/* 0000D468 801F002C */ lwz r0, 0x2c(r31)
/* 0000D46C 38790124 */ addi r3, r25, 0x124
/* 0000D470 389C03B0 */ addi r4, r28, 0x3b0
/* 0000D474 1C000284 */ mulli r0, r0, 0x284
/* 0000D478 7CBE0214 */ add r5, r30, r0
/* 0000D47C A8A5001A */ lha r5, 0x1a(r5)
/* 0000D480 38C1003D */ addi r6, r1, 0x3d
/* 0000D484 38E1003C */ addi r7, r1, 0x3c
/* 0000D488 48000371 */ bl lbl_0000D7F8
/* 0000D48C 8881003D */ lbz r4, 0x3d(r1)
/* 0000D490 5603043E */ clrlwi r3, r16, 0x10
/* 0000D494 88A1003C */ lbz r5, 0x3c(r1)
/* 0000D498 4BFF2CC9 */ bl SoundPan
lbl_0000D49C:
/* 0000D49C 3B5A0001 */ addi r26, r26, 1
/* 0000D4A0 3B180184 */ addi r24, r24, 0x184
lbl_0000D4A4:
/* 0000D4A4 2C1A000A */ cmpwi r26, 0xa
/* 0000D4A8 4180F664 */ blt lbl_0000CB0C
/* 0000D4AC BA010120 */ lmw r16, 0x120(r1)
/* 0000D4B0 8001018C */ lwz r0, 0x18c(r1)
/* 0000D4B4 CBE10180 */ lfd f31, 0x180(r1)
/* 0000D4B8 CBC10178 */ lfd f30, 0x178(r1)
/* 0000D4BC 7C0803A6 */ mtlr r0
/* 0000D4C0 CBA10170 */ lfd f29, 0x170(r1)
/* 0000D4C4 CB810168 */ lfd f28, 0x168(r1)
/* 0000D4C8 CB610160 */ lfd f27, 0x160(r1)
/* 0000D4CC 38210188 */ addi r1, r1, 0x188
/* 0000D4D0 4E800020 */ blr 
