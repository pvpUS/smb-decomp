lbl_00002628:
/* 00002628 7C0802A6 */ mflr r0
/* 0000262C 3CA00000 */ lis r5, currentBall@ha
/* 00002630 90010004 */ stw r0, 4(r1)
/* 00002634 9421FEC8 */ stwu r1, -0x138(r1)
/* 00002638 DBE10130 */ stfd f31, 0x130(r1)
/* 0000263C DBC10128 */ stfd f30, 0x128(r1)
/* 00002640 DBA10120 */ stfd f29, 0x120(r1)
/* 00002644 BF210104 */ stmw r25, 0x104(r1)
/* 00002648 3B430000 */ addi r26, r3, 0
/* 0000264C 3C600000 */ lis r3, lbl_0001BF80@ha
/* 00002650 3B640000 */ addi r27, r4, 0
/* 00002654 3BC30000 */ addi r30, r3, lbl_0001BF80@l
/* 00002658 83A50000 */ lwz r29, currentBall@l(r5)
/* 0000265C 839A00A4 */ lwz r28, 0xa4(r26)
/* 00002660 801D0094 */ lwz r0, 0x94(r29)
/* 00002664 54000319 */ rlwinm. r0, r0, 0, 0xc, 0xc
/* 00002668 40820BD0 */ bne lbl_00003238
/* 0000266C A81C0016 */ lha r0, 0x16(r28)
/* 00002670 2C000000 */ cmpwi r0, 0
/* 00002674 418100E4 */ bgt lbl_00002758
/* 00002678 881D002E */ lbz r0, 0x2e(r29)
/* 0000267C 809C0000 */ lwz r4, 0(r28)
/* 00002680 7C000774 */ extsb r0, r0
/* 00002684 7C040000 */ cmpw r4, r0
/* 00002688 418200D0 */ beq lbl_00002758
/* 0000268C 801C001C */ lwz r0, 0x1c(r28)
/* 00002690 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002694 418200C4 */ beq lbl_00002758
/* 00002698 A81C0012 */ lha r0, 0x12(r28)
/* 0000269C 2C000000 */ cmpwi r0, 0
/* 000026A0 4081000C */ ble lbl_000026AC
/* 000026A4 386000FF */ li r3, 0xff
/* 000026A8 4800002C */ b lbl_000026D4
lbl_000026AC:
/* 000026AC 3C600000 */ lis r3, playerCharacterSelection@ha
/* 000026B0 5484103A */ slwi r4, r4, 2
/* 000026B4 38030000 */ addi r0, r3, playerCharacterSelection@l
/* 000026B8 7C602214 */ add r3, r0, r4
/* 000026BC 80830000 */ lwz r4, 0(r3)
/* 000026C0 3C600000 */ lis r3, lbl_0001C9D8@ha
/* 000026C4 38030000 */ addi r0, r3, lbl_0001C9D8@l
/* 000026C8 5483083C */ slwi r3, r4, 1
/* 000026CC 7C601A14 */ add r3, r0, r3
/* 000026D0 A8630000 */ lha r3, 0(r3)
lbl_000026D4:
/* 000026D4 A81C0014 */ lha r0, 0x14(r28)
/* 000026D8 2C000000 */ cmpwi r0, 0
/* 000026DC 40810008 */ ble lbl_000026E4
/* 000026E0 6063D800 */ ori r3, r3, 0xd800
lbl_000026E4:
/* 000026E4 801C0000 */ lwz r0, 0(r28)
/* 000026E8 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 000026EC 3CA00000 */ lis r5, playerCharacterSelection@ha
/* 000026F0 5406103A */ slwi r6, r0, 2
/* 000026F4 38050000 */ addi r0, r5, playerCharacterSelection@l
/* 000026F8 7CA03214 */ add r5, r0, r6
/* 000026FC 3BE40000 */ addi r31, r4, lbl_802F1DFC@l
/* 00002700 80050000 */ lwz r0, 0(r5)
/* 00002704 3C800000 */ lis r4, u_somePlayerId@ha
/* 00002708 901F0000 */ stw r0, 0(r31)
/* 0000270C 801C0000 */ lwz r0, 0(r28)
/* 00002710 90040000 */ stw r0, u_somePlayerId@l(r4)
/* 00002714 4BFFDA51 */ bl u_play_sound_0
/* 00002718 801D0094 */ lwz r0, 0x94(r29)
/* 0000271C 3C600000 */ lis r3, lbl_0001C9E4@ha
/* 00002720 3C800000 */ lis r4, globalAnimTimer@ha
/* 00002724 60000020 */ ori r0, r0, 0x20
/* 00002728 901D0094 */ stw r0, 0x94(r29)
/* 0000272C 38030000 */ addi r0, r3, lbl_0001C9E4@l
/* 00002730 807D00FC */ lwz r3, 0xfc(r29)
/* 00002734 80630010 */ lwz r3, 0x10(r3)
/* 00002738 907F0000 */ stw r3, 0(r31)
/* 0000273C 80640000 */ lwz r3, globalAnimTimer@l(r4)
/* 00002740 54630F3C */ rlwinm r3, r3, 1, 0x1c, 0x1e
/* 00002744 7C601A14 */ add r3, r0, r3
/* 00002748 A8630000 */ lha r3, 0(r3)
/* 0000274C 4BFFDA19 */ bl u_play_sound_0
/* 00002750 3800000F */ li r0, 0xf
/* 00002754 B01C0016 */ sth r0, 0x16(r28)
lbl_00002758:
/* 00002758 881D002E */ lbz r0, 0x2e(r29)
/* 0000275C 807C0000 */ lwz r3, 0(r28)
/* 00002760 7C040774 */ extsb r4, r0
/* 00002764 7C032000 */ cmpw r3, r4
/* 00002768 4182002C */ beq lbl_00002794
/* 0000276C 801C001C */ lwz r0, 0x1c(r28)
/* 00002770 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002774 41820020 */ beq lbl_00002794
/* 00002778 1C040018 */ mulli r0, r4, 0x18
/* 0000277C 3C600000 */ lis r3, lbl_10017664@ha
/* 00002780 38630000 */ addi r3, r3, lbl_10017664@l
/* 00002784 7C630214 */ add r3, r3, r0
/* 00002788 A803000E */ lha r0, 0xe(r3)
/* 0000278C 2C000000 */ cmpwi r0, 0
/* 00002790 408101A4 */ ble lbl_00002934
lbl_00002794:
/* 00002794 C03A001C */ lfs f1, 0x1c(r26)
/* 00002798 3B8100CC */ addi r28, r1, 0xcc
/* 0000279C C01B0004 */ lfs f0, 4(r27)
/* 000027A0 EC010028 */ fsubs f0, f1, f0
/* 000027A4 D00100CC */ stfs f0, 0xcc(r1)
/* 000027A8 C03A0020 */ lfs f1, 0x20(r26)
/* 000027AC C01B0008 */ lfs f0, 8(r27)
/* 000027B0 EC010028 */ fsubs f0, f1, f0
/* 000027B4 D00100D0 */ stfs f0, 0xd0(r1)
/* 000027B8 C03A0024 */ lfs f1, 0x24(r26)
/* 000027BC C01B000C */ lfs f0, 0xc(r27)
/* 000027C0 EC010028 */ fsubs f0, f1, f0
/* 000027C4 D00100D4 */ stfs f0, 0xd4(r1)
/* 000027C8 C03B0028 */ lfs f1, 0x28(r27)
/* 000027CC C01A0034 */ lfs f0, 0x34(r26)
/* 000027D0 EFA1002A */ fadds f29, f1, f0
/* 000027D4 C02100CC */ lfs f1, 0xcc(r1)
/* 000027D8 C04100D0 */ lfs f2, 0xd0(r1)
/* 000027DC C00100D4 */ lfs f0, 0xd4(r1)
/* 000027E0 EC210072 */ fmuls f1, f1, f1
/* 000027E4 EC2208BA */ fmadds f1, f2, f2, f1
/* 000027E8 EC20083A */ fmadds f1, f0, f0, f1
/* 000027EC 4BFFD979 */ bl mathutil_sqrt
/* 000027F0 FC01E840 */ fcmpo cr0, f1, f29
/* 000027F4 40800A44 */ bge lbl_00003238
/* 000027F8 800100CC */ lwz r0, 0xcc(r1)
/* 000027FC 386100C0 */ addi r3, r1, 0xc0
/* 00002800 80A100D0 */ lwz r5, 0xd0(r1)
/* 00002804 FC20E890 */ fmr f1, f29
/* 00002808 900100C0 */ stw r0, 0xc0(r1)
/* 0000280C 800100D4 */ lwz r0, 0xd4(r1)
/* 00002810 7C641B78 */ mr r4, r3
/* 00002814 90A100C4 */ stw r5, 0xc4(r1)
/* 00002818 900100C8 */ stw r0, 0xc8(r1)
/* 0000281C 4BFFD949 */ bl mathutil_vec_set_len
/* 00002820 C05B0004 */ lfs f2, 4(r27)
/* 00002824 7F83E378 */ mr r3, r28
/* 00002828 C00100C0 */ lfs f0, 0xc0(r1)
/* 0000282C C02100C4 */ lfs f1, 0xc4(r1)
/* 00002830 EC42002A */ fadds f2, f2, f0
/* 00002834 C00100C8 */ lfs f0, 0xc8(r1)
/* 00002838 D04100D8 */ stfs f2, 0xd8(r1)
/* 0000283C C05B0008 */ lfs f2, 8(r27)
/* 00002840 EC22082A */ fadds f1, f2, f1
/* 00002844 D02100DC */ stfs f1, 0xdc(r1)
/* 00002848 C03B000C */ lfs f1, 0xc(r27)
/* 0000284C EC01002A */ fadds f0, f1, f0
/* 00002850 D00100E0 */ stfs f0, 0xe0(r1)
/* 00002854 C02100D8 */ lfs f1, 0xd8(r1)
/* 00002858 C01A001C */ lfs f0, 0x1c(r26)
/* 0000285C C05A0058 */ lfs f2, 0x58(r26)
/* 00002860 EC010028 */ fsubs f0, f1, f0
/* 00002864 EC02002A */ fadds f0, f2, f0
/* 00002868 D01A0058 */ stfs f0, 0x58(r26)
/* 0000286C C02100DC */ lfs f1, 0xdc(r1)
/* 00002870 C01A0020 */ lfs f0, 0x20(r26)
/* 00002874 C05A005C */ lfs f2, 0x5c(r26)
/* 00002878 EC010028 */ fsubs f0, f1, f0
/* 0000287C EC02002A */ fadds f0, f2, f0
/* 00002880 D01A005C */ stfs f0, 0x5c(r26)
/* 00002884 C02100E0 */ lfs f1, 0xe0(r1)
/* 00002888 C01A0024 */ lfs f0, 0x24(r26)
/* 0000288C C05A0060 */ lfs f2, 0x60(r26)
/* 00002890 EC010028 */ fsubs f0, f1, f0
/* 00002894 EC02002A */ fadds f0, f2, f0
/* 00002898 D01A0060 */ stfs f0, 0x60(r26)
/* 0000289C C00100D8 */ lfs f0, 0xd8(r1)
/* 000028A0 D01A001C */ stfs f0, 0x1c(r26)
/* 000028A4 C00100DC */ lfs f0, 0xdc(r1)
/* 000028A8 D01A0020 */ stfs f0, 0x20(r26)
/* 000028AC C00100E0 */ lfs f0, 0xe0(r1)
/* 000028B0 D01A0024 */ stfs f0, 0x24(r26)
/* 000028B4 4BFFD8B1 */ bl mathutil_vec_normalize_len
/* 000028B8 387A0064 */ addi r3, r26, 0x64
/* 000028BC C0A100CC */ lfs f5, 0xcc(r1)
/* 000028C0 C0430000 */ lfs f2, 0(r3)
/* 000028C4 C08100D0 */ lfs f4, 0xd0(r1)
/* 000028C8 C0230004 */ lfs f1, 4(r3)
/* 000028CC C06100D4 */ lfs f3, 0xd4(r1)
/* 000028D0 C0030008 */ lfs f0, 8(r3)
/* 000028D4 EC4500B2 */ fmuls f2, f5, f2
/* 000028D8 EC44107A */ fmadds f2, f4, f1, f2
/* 000028DC EC43103A */ fmadds f2, f3, f0, f2
/* 000028E0 C01E0008 */ lfs f0, 8(r30)
/* 000028E4 FC020040 */ fcmpo cr0, f2, f0
/* 000028E8 40800950 */ bge lbl_00003238
/* 000028EC C03E0098 */ lfs f1, 0x98(r30)
/* 000028F0 C00100CC */ lfs f0, 0xcc(r1)
/* 000028F4 EFE20072 */ fmuls f31, f2, f1
/* 000028F8 C03A0064 */ lfs f1, 0x64(r26)
/* 000028FC EC0007F2 */ fmuls f0, f0, f31
/* 00002900 EC01002A */ fadds f0, f1, f0
/* 00002904 D01A0064 */ stfs f0, 0x64(r26)
/* 00002908 C00100D0 */ lfs f0, 0xd0(r1)
/* 0000290C C03A0068 */ lfs f1, 0x68(r26)
/* 00002910 EC0007F2 */ fmuls f0, f0, f31
/* 00002914 EC01002A */ fadds f0, f1, f0
/* 00002918 D01A0068 */ stfs f0, 0x68(r26)
/* 0000291C C00100D4 */ lfs f0, 0xd4(r1)
/* 00002920 C03A006C */ lfs f1, 0x6c(r26)
/* 00002924 EC0007F2 */ fmuls f0, f0, f31
/* 00002928 EC01002A */ fadds f0, f1, f0
/* 0000292C D01A006C */ stfs f0, 0x6c(r26)
/* 00002930 48000908 */ b lbl_00003238
lbl_00002934:
/* 00002934 5480083C */ slwi r0, r4, 1
/* 00002938 7C7C0214 */ add r3, r28, r0
/* 0000293C A8030004 */ lha r0, 4(r3)
/* 00002940 2C000000 */ cmpwi r0, 0
/* 00002944 40810120 */ ble lbl_00002A64
/* 00002948 C03A001C */ lfs f1, 0x1c(r26)
/* 0000294C C01B0004 */ lfs f0, 4(r27)
/* 00002950 EC010028 */ fsubs f0, f1, f0
/* 00002954 D00100CC */ stfs f0, 0xcc(r1)
/* 00002958 C03A0020 */ lfs f1, 0x20(r26)
/* 0000295C C01B0008 */ lfs f0, 8(r27)
/* 00002960 EC010028 */ fsubs f0, f1, f0
/* 00002964 D00100D0 */ stfs f0, 0xd0(r1)
/* 00002968 C03A0024 */ lfs f1, 0x24(r26)
/* 0000296C C01B000C */ lfs f0, 0xc(r27)
/* 00002970 EC010028 */ fsubs f0, f1, f0
/* 00002974 D00100D4 */ stfs f0, 0xd4(r1)
/* 00002978 C03B0028 */ lfs f1, 0x28(r27)
/* 0000297C C01A0034 */ lfs f0, 0x34(r26)
/* 00002980 EFA1002A */ fadds f29, f1, f0
/* 00002984 C02100CC */ lfs f1, 0xcc(r1)
/* 00002988 C04100D0 */ lfs f2, 0xd0(r1)
/* 0000298C C00100D4 */ lfs f0, 0xd4(r1)
/* 00002990 EC210072 */ fmuls f1, f1, f1
/* 00002994 EC2208BA */ fmadds f1, f2, f2, f1
/* 00002998 EC20083A */ fmadds f1, f0, f0, f1
/* 0000299C 4BFFD7C9 */ bl mathutil_sqrt
/* 000029A0 FC01E840 */ fcmpo cr0, f1, f29
/* 000029A4 40800894 */ bge lbl_00003238
/* 000029A8 800100CC */ lwz r0, 0xcc(r1)
/* 000029AC 386100C0 */ addi r3, r1, 0xc0
/* 000029B0 80A100D0 */ lwz r5, 0xd0(r1)
/* 000029B4 FC20E890 */ fmr f1, f29
/* 000029B8 900100C0 */ stw r0, 0xc0(r1)
/* 000029BC 800100D4 */ lwz r0, 0xd4(r1)
/* 000029C0 7C641B78 */ mr r4, r3
/* 000029C4 90A100C4 */ stw r5, 0xc4(r1)
/* 000029C8 900100C8 */ stw r0, 0xc8(r1)
/* 000029CC 4BFFD799 */ bl mathutil_vec_set_len
/* 000029D0 C05B0004 */ lfs f2, 4(r27)
/* 000029D4 C00100C0 */ lfs f0, 0xc0(r1)
/* 000029D8 C02100C4 */ lfs f1, 0xc4(r1)
/* 000029DC EC42002A */ fadds f2, f2, f0
/* 000029E0 C00100C8 */ lfs f0, 0xc8(r1)
/* 000029E4 D04100D8 */ stfs f2, 0xd8(r1)
/* 000029E8 C05B0008 */ lfs f2, 8(r27)
/* 000029EC EC22082A */ fadds f1, f2, f1
/* 000029F0 D02100DC */ stfs f1, 0xdc(r1)
/* 000029F4 C03B000C */ lfs f1, 0xc(r27)
/* 000029F8 EC01002A */ fadds f0, f1, f0
/* 000029FC D00100E0 */ stfs f0, 0xe0(r1)
/* 00002A00 C02100D8 */ lfs f1, 0xd8(r1)
/* 00002A04 C01A001C */ lfs f0, 0x1c(r26)
/* 00002A08 C05A0058 */ lfs f2, 0x58(r26)
/* 00002A0C EC010028 */ fsubs f0, f1, f0
/* 00002A10 EC02002A */ fadds f0, f2, f0
/* 00002A14 D01A0058 */ stfs f0, 0x58(r26)
/* 00002A18 C02100DC */ lfs f1, 0xdc(r1)
/* 00002A1C C01A0020 */ lfs f0, 0x20(r26)
/* 00002A20 C05A005C */ lfs f2, 0x5c(r26)
/* 00002A24 EC010028 */ fsubs f0, f1, f0
/* 00002A28 EC02002A */ fadds f0, f2, f0
/* 00002A2C D01A005C */ stfs f0, 0x5c(r26)
/* 00002A30 C02100E0 */ lfs f1, 0xe0(r1)
/* 00002A34 C01A0024 */ lfs f0, 0x24(r26)
/* 00002A38 C05A0060 */ lfs f2, 0x60(r26)
/* 00002A3C EC010028 */ fsubs f0, f1, f0
/* 00002A40 EC02002A */ fadds f0, f2, f0
/* 00002A44 D01A0060 */ stfs f0, 0x60(r26)
/* 00002A48 C00100D8 */ lfs f0, 0xd8(r1)
/* 00002A4C D01A001C */ stfs f0, 0x1c(r26)
/* 00002A50 C00100DC */ lfs f0, 0xdc(r1)
/* 00002A54 D01A0020 */ stfs f0, 0x20(r26)
/* 00002A58 C00100E0 */ lfs f0, 0xe0(r1)
/* 00002A5C D01A0024 */ stfs f0, 0x24(r26)
/* 00002A60 480007D8 */ b lbl_00003238
lbl_00002A64:
/* 00002A64 801C002C */ lwz r0, 0x2c(r28)
/* 00002A68 2C000000 */ cmpwi r0, 0
/* 00002A6C 4180000C */ blt lbl_00002A78
/* 00002A70 3800000F */ li r0, 0xf
/* 00002A74 901C0030 */ stw r0, 0x30(r28)
lbl_00002A78:
/* 00002A78 801C0000 */ lwz r0, 0(r28)
/* 00002A7C 3C800000 */ lis r4, ballInfo@ha
/* 00002A80 3C600000 */ lis r3, lbl_0001DB4C@ha
/* 00002A84 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00002A88 38840000 */ addi r4, r4, ballInfo@l
/* 00002A8C 7C840214 */ add r4, r4, r0
/* 00002A90 8884014A */ lbz r4, 0x14a(r4)
/* 00002A94 38030000 */ addi r0, r3, lbl_0001DB4C@l
/* 00002A98 38610014 */ addi r3, r1, 0x14
/* 00002A9C 5484103A */ slwi r4, r4, 2
/* 00002AA0 7C802214 */ add r4, r0, r4
/* 00002AA4 80040000 */ lwz r0, 0(r4)
/* 00002AA8 38800000 */ li r4, 0
/* 00002AAC 38A000AC */ li r5, 0xac
/* 00002AB0 90010010 */ stw r0, 0x10(r1)
/* 00002AB4 4BFFD6B1 */ bl memset
/* 00002AB8 801C0000 */ lwz r0, 0(r28)
/* 00002ABC 3FE04330 */ lis r31, 0x4330
/* 00002AC0 88E10010 */ lbz r7, 0x10(r1)
/* 00002AC4 3CC00000 */ lis r6, lbl_0001C048@ha
/* 00002AC8 7C000734 */ extsh r0, r0
/* 00002ACC B0010028 */ sth r0, 0x28(r1)
/* 00002AD0 38000002 */ li r0, 2
/* 00002AD4 88610011 */ lbz r3, 0x11(r1)
/* 00002AD8 3CA00000 */ lis r5, lbl_0001C048@ha
/* 00002ADC B001001C */ sth r0, 0x1c(r1)
/* 00002AE0 88010012 */ lbz r0, 0x12(r1)
/* 00002AE4 3C800000 */ lis r4, lbl_0001C048@ha
/* 00002AE8 C05A0034 */ lfs f2, 0x34(r26)
/* 00002AEC C01D0068 */ lfs f0, 0x68(r29)
/* 00002AF0 906100F4 */ stw r3, 0xf4(r1)
/* 00002AF4 386100CC */ addi r3, r1, 0xcc
/* 00002AF8 EC02002A */ fadds f0, f2, f0
/* 00002AFC C03E000C */ lfs f1, 0xc(r30)
/* 00002B00 90E100FC */ stw r7, 0xfc(r1)
/* 00002B04 C07A001C */ lfs f3, 0x1c(r26)
/* 00002B08 ECC20024 */ fdivs f6, f2, f0
/* 00002B0C C01D0004 */ lfs f0, 4(r29)
/* 00002B10 93E100F8 */ stw r31, 0xf8(r1)
/* 00002B14 900100EC */ stw r0, 0xec(r1)
/* 00002B18 C84100F8 */ lfd f2, 0xf8(r1)
/* 00002B1C EC213028 */ fsubs f1, f1, f6
/* 00002B20 93E100F0 */ stw r31, 0xf0(r1)
/* 00002B24 EC0001B2 */ fmuls f0, f0, f6
/* 00002B28 93E100E8 */ stw r31, 0xe8(r1)
/* 00002B2C EC630072 */ fmuls f3, f3, f1
/* 00002B30 C82100F0 */ lfd f1, 0xf0(r1)
/* 00002B34 EC63002A */ fadds f3, f3, f0
/* 00002B38 C80100E8 */ lfd f0, 0xe8(r1)
/* 00002B3C D0610048 */ stfs f3, 0x48(r1)
/* 00002B40 C09E000C */ lfs f4, 0xc(r30)
/* 00002B44 C07D0008 */ lfs f3, 8(r29)
/* 00002B48 EC843028 */ fsubs f4, f4, f6
/* 00002B4C C0BA0020 */ lfs f5, 0x20(r26)
/* 00002B50 EC6301B2 */ fmuls f3, f3, f6
/* 00002B54 EC850132 */ fmuls f4, f5, f4
/* 00002B58 EC64182A */ fadds f3, f4, f3
/* 00002B5C D061004C */ stfs f3, 0x4c(r1)
/* 00002B60 C09E000C */ lfs f4, 0xc(r30)
/* 00002B64 C07D000C */ lfs f3, 0xc(r29)
/* 00002B68 EC843028 */ fsubs f4, f4, f6
/* 00002B6C C0BA0024 */ lfs f5, 0x24(r26)
/* 00002B70 EC6301B2 */ fmuls f3, f3, f6
/* 00002B74 EC850132 */ fmuls f4, f5, f4
/* 00002B78 EC64182A */ fadds f3, f4, f3
/* 00002B7C D0610050 */ stfs f3, 0x50(r1)
/* 00002B80 C8660000 */ lfd f3, lbl_0001C048@l(r6)
/* 00002B84 C09E00A0 */ lfs f4, 0xa0(r30)
/* 00002B88 EC421828 */ fsubs f2, f2, f3
/* 00002B8C C07E009C */ lfs f3, 0x9c(r30)
/* 00002B90 EC44102A */ fadds f2, f4, f2
/* 00002B94 EC4300B2 */ fmuls f2, f3, f2
/* 00002B98 D041002C */ stfs f2, 0x2c(r1)
/* 00002B9C C8450000 */ lfd f2, lbl_0001C048@l(r5)
/* 00002BA0 C07E00A0 */ lfs f3, 0xa0(r30)
/* 00002BA4 EC211028 */ fsubs f1, f1, f2
/* 00002BA8 C05E009C */ lfs f2, 0x9c(r30)
/* 00002BAC EC23082A */ fadds f1, f3, f1
/* 00002BB0 EC220072 */ fmuls f1, f2, f1
/* 00002BB4 D0210030 */ stfs f1, 0x30(r1)
/* 00002BB8 C8240000 */ lfd f1, lbl_0001C048@l(r4)
/* 00002BBC C05E00A0 */ lfs f2, 0xa0(r30)
/* 00002BC0 EC000828 */ fsubs f0, f0, f1
/* 00002BC4 C03E009C */ lfs f1, 0x9c(r30)
/* 00002BC8 EC02002A */ fadds f0, f2, f0
/* 00002BCC EC010032 */ fmuls f0, f1, f0
/* 00002BD0 D0010034 */ stfs f0, 0x34(r1)
/* 00002BD4 C03D0004 */ lfs f1, 4(r29)
/* 00002BD8 C01A001C */ lfs f0, 0x1c(r26)
/* 00002BDC EC010028 */ fsubs f0, f1, f0
/* 00002BE0 D00100CC */ stfs f0, 0xcc(r1)
/* 00002BE4 C03D0008 */ lfs f1, 8(r29)
/* 00002BE8 C01A0020 */ lfs f0, 0x20(r26)
/* 00002BEC EC010028 */ fsubs f0, f1, f0
/* 00002BF0 D00100D0 */ stfs f0, 0xd0(r1)
/* 00002BF4 C03D000C */ lfs f1, 0xc(r29)
/* 00002BF8 C01A0024 */ lfs f0, 0x24(r26)
/* 00002BFC EC010028 */ fsubs f0, f1, f0
/* 00002C00 D00100D4 */ stfs f0, 0xd4(r1)
/* 00002C04 4BFFD561 */ bl mathutil_vec_normalize_len
/* 00002C08 386100CC */ addi r3, r1, 0xcc
/* 00002C0C 38810060 */ addi r4, r1, 0x60
/* 00002C10 38A10062 */ addi r5, r1, 0x62
/* 00002C14 4BFFD551 */ bl mathutil_vec_to_euler_xy
/* 00002C18 A8610062 */ lha r3, 0x62(r1)
/* 00002C1C 4BFFD549 */ bl mathutil_mtxA_from_rotate_y
/* 00002C20 A8610060 */ lha r3, 0x60(r1)
/* 00002C24 4BFFD541 */ bl mathutil_mtxA_rotate_x
/* 00002C28 387A0064 */ addi r3, r26, 0x64
/* 00002C2C C0A100CC */ lfs f5, 0xcc(r1)
/* 00002C30 C0430000 */ lfs f2, 0(r3)
/* 00002C34 C08100D0 */ lfs f4, 0xd0(r1)
/* 00002C38 C0230004 */ lfs f1, 4(r3)
/* 00002C3C C06100D4 */ lfs f3, 0xd4(r1)
/* 00002C40 C0030008 */ lfs f0, 8(r3)
/* 00002C44 ECA500B2 */ fmuls f5, f5, f2
/* 00002C48 ECA4287A */ fmadds f5, f4, f1, f5
/* 00002C4C ECA3283A */ fmadds f5, f3, f0, f5
/* 00002C50 C01E0060 */ lfs f0, 0x60(r30)
/* 00002C54 C04100CC */ lfs f2, 0xcc(r1)
/* 00002C58 3B200008 */ li r25, 8
/* 00002C5C C02100D0 */ lfs f1, 0xd0(r1)
/* 00002C60 EFE00172 */ fmuls f31, f0, f5
/* 00002C64 C00100D4 */ lfs f0, 0xd4(r1)
/* 00002C68 EC5F00B2 */ fmuls f2, f31, f2
/* 00002C6C EC3F0072 */ fmuls f1, f31, f1
/* 00002C70 EC1F0032 */ fmuls f0, f31, f0
/* 00002C74 D04100C0 */ stfs f2, 0xc0(r1)
/* 00002C78 D02100C4 */ stfs f1, 0xc4(r1)
/* 00002C7C D00100C8 */ stfs f0, 0xc8(r1)
lbl_00002C80:
/* 00002C80 38602000 */ li r3, 0x2000
/* 00002C84 4BFFD4E1 */ bl mathutil_mtxA_rotate_z
/* 00002C88 4BFFD4DD */ bl rand
/* 00002C8C 6C608000 */ xoris r0, r3, 0x8000
/* 00002C90 C03E0008 */ lfs f1, 8(r30)
/* 00002C94 900100EC */ stw r0, 0xec(r1)
/* 00002C98 3C600000 */ lis r3, lbl_0001C010@ha
/* 00002C9C C8A30000 */ lfd f5, lbl_0001C010@l(r3)
/* 00002CA0 FC600890 */ fmr f3, f1
/* 00002CA4 93E100E8 */ stw r31, 0xe8(r1)
/* 00002CA8 C09E00A4 */ lfs f4, 0xa4(r30)
/* 00002CAC 38610054 */ addi r3, r1, 0x54
/* 00002CB0 C80100E8 */ lfd f0, 0xe8(r1)
/* 00002CB4 C05E008C */ lfs f2, 0x8c(r30)
/* 00002CB8 ECA02828 */ fsubs f5, f0, f5
/* 00002CBC C01E000C */ lfs f0, 0xc(r30)
/* 00002CC0 EC852024 */ fdivs f4, f5, f4
/* 00002CC4 EC420132 */ fmuls f2, f2, f4
/* 00002CC8 EC00102A */ fadds f0, f0, f2
/* 00002CCC EC5F0032 */ fmuls f2, f31, f0
/* 00002CD0 4BFFD495 */ bl mathutil_mtxA_tf_vec_xyz
/* 00002CD4 C0410054 */ lfs f2, 0x54(r1)
/* 00002CD8 38610014 */ addi r3, r1, 0x14
/* 00002CDC C00100C0 */ lfs f0, 0xc0(r1)
/* 00002CE0 C02100C4 */ lfs f1, 0xc4(r1)
/* 00002CE4 EC42002A */ fadds f2, f2, f0
/* 00002CE8 C00100C8 */ lfs f0, 0xc8(r1)
/* 00002CEC D0410054 */ stfs f2, 0x54(r1)
/* 00002CF0 C0410058 */ lfs f2, 0x58(r1)
/* 00002CF4 EC22082A */ fadds f1, f2, f1
/* 00002CF8 D0210058 */ stfs f1, 0x58(r1)
/* 00002CFC C021005C */ lfs f1, 0x5c(r1)
/* 00002D00 EC01002A */ fadds f0, f1, f0
/* 00002D04 D001005C */ stfs f0, 0x5c(r1)
/* 00002D08 4BFFD45D */ bl spawn_effect
/* 00002D0C 3739FFFF */ addic. r25, r25, -1
/* 00002D10 4181FF70 */ bgt lbl_00002C80
/* 00002D14 3800002B */ li r0, 0x2b
/* 00002D18 B001001C */ sth r0, 0x1c(r1)
/* 00002D1C 3FE04330 */ lis r31, 0x4330
/* 00002D20 C01E00A8 */ lfs f0, 0xa8(r30)
/* 00002D24 EC0007F2 */ fmuls f0, f0, f31
/* 00002D28 FFC00210 */ fabs f30, f0
/* 00002D2C FFC0F018 */ frsp f30, f30
/* 00002D30 FC00F01E */ fctiwz f0, f30
/* 00002D34 D80100E8 */ stfd f0, 0xe8(r1)
/* 00002D38 832100EC */ lwz r25, 0xec(r1)
/* 00002D3C 48000110 */ b lbl_00002E4C
lbl_00002D40:
/* 00002D40 4BFFD425 */ bl rand
/* 00002D44 6C608000 */ xoris r0, r3, 0x8000
/* 00002D48 C05E00A4 */ lfs f2, 0xa4(r30)
/* 00002D4C 900100EC */ stw r0, 0xec(r1)
/* 00002D50 3C600000 */ lis r3, lbl_0001C010@ha
/* 00002D54 C8830000 */ lfd f4, lbl_0001C010@l(r3)
/* 00002D58 93E100E8 */ stw r31, 0xe8(r1)
/* 00002D5C C03E0060 */ lfs f1, 0x60(r30)
/* 00002D60 C86100E8 */ lfd f3, 0xe8(r1)
/* 00002D64 C01E00AC */ lfs f0, 0xac(r30)
/* 00002D68 EC632028 */ fsubs f3, f3, f4
/* 00002D6C EC431024 */ fdivs f2, f3, f2
/* 00002D70 EC220828 */ fsubs f1, f2, f1
/* 00002D74 EC000072 */ fmuls f0, f0, f1
/* 00002D78 EFBF0032 */ fmuls f29, f31, f0
/* 00002D7C 4BFFD3E9 */ bl rand
/* 00002D80 6C608000 */ xoris r0, r3, 0x8000
/* 00002D84 C09E00A4 */ lfs f4, 0xa4(r30)
/* 00002D88 900100F4 */ stw r0, 0xf4(r1)
/* 00002D8C 3C600000 */ lis r3, lbl_0001C010@ha
/* 00002D90 C8A30000 */ lfd f5, lbl_0001C010@l(r3)
/* 00002D94 FC40E890 */ fmr f2, f29
/* 00002D98 93E100F0 */ stw r31, 0xf0(r1)
/* 00002D9C C03E0060 */ lfs f1, 0x60(r30)
/* 00002DA0 38610054 */ addi r3, r1, 0x54
/* 00002DA4 C86100F0 */ lfd f3, 0xf0(r1)
/* 00002DA8 C01E00AC */ lfs f0, 0xac(r30)
/* 00002DAC ECA32828 */ fsubs f5, f3, f5
/* 00002DB0 C07E0008 */ lfs f3, 8(r30)
/* 00002DB4 EC852024 */ fdivs f4, f5, f4
/* 00002DB8 EC240828 */ fsubs f1, f4, f1
/* 00002DBC EC000072 */ fmuls f0, f0, f1
/* 00002DC0 EC3F0032 */ fmuls f1, f31, f0
/* 00002DC4 4BFFD3A1 */ bl mathutil_mtxA_tf_vec_xyz
/* 00002DC8 C01E00B0 */ lfs f0, 0xb0(r30)
/* 00002DCC 3819FFFF */ addi r0, r25, -1
/* 00002DD0 6C008000 */ xoris r0, r0, 0x8000
/* 00002DD4 C04100C0 */ lfs f2, 0xc0(r1)
/* 00002DD8 EC80F024 */ fdivs f4, f0, f30
/* 00002DDC 900100FC */ stw r0, 0xfc(r1)
/* 00002DE0 3C800000 */ lis r4, lbl_0001C010@ha
/* 00002DE4 C8A40000 */ lfd f5, lbl_0001C010@l(r4)
/* 00002DE8 38610014 */ addi r3, r1, 0x14
/* 00002DEC 93E100F8 */ stw r31, 0xf8(r1)
/* 00002DF0 C0610054 */ lfs f3, 0x54(r1)
/* 00002DF4 C80100F8 */ lfd f0, 0xf8(r1)
/* 00002DF8 C02100C4 */ lfs f1, 0xc4(r1)
/* 00002DFC ECA02828 */ fsubs f5, f0, f5
/* 00002E00 C00100C8 */ lfs f0, 0xc8(r1)
/* 00002E04 ECC50132 */ fmuls f6, f5, f4
/* 00002E08 EC4600B2 */ fmuls f2, f6, f2
/* 00002E0C EC260072 */ fmuls f1, f6, f1
/* 00002E10 EC060032 */ fmuls f0, f6, f0
/* 00002E14 EC43102A */ fadds f2, f3, f2
/* 00002E18 D0410054 */ stfs f2, 0x54(r1)
/* 00002E1C C0410058 */ lfs f2, 0x58(r1)
/* 00002E20 EC22082A */ fadds f1, f2, f1
/* 00002E24 D0210058 */ stfs f1, 0x58(r1)
/* 00002E28 C021005C */ lfs f1, 0x5c(r1)
/* 00002E2C EC01002A */ fadds f0, f1, f0
/* 00002E30 D001005C */ stfs f0, 0x5c(r1)
/* 00002E34 C0210058 */ lfs f1, 0x58(r1)
/* 00002E38 C01E0000 */ lfs f0, 0(r30)
/* 00002E3C EC010032 */ fmuls f0, f1, f0
/* 00002E40 D0010058 */ stfs f0, 0x58(r1)
/* 00002E44 4BFFD321 */ bl spawn_effect
/* 00002E48 3B39FFFF */ addi r25, r25, -1
lbl_00002E4C:
/* 00002E4C 2C190000 */ cmpwi r25, 0
/* 00002E50 4181FEF0 */ bgt lbl_00002D40
/* 00002E54 3860002A */ li r3, 0x2a
/* 00002E58 800100CC */ lwz r0, 0xcc(r1)
/* 00002E5C B061001C */ sth r3, 0x1c(r1)
/* 00002E60 3BE100CC */ addi r31, r1, 0xcc
/* 00002E64 806100D0 */ lwz r3, 0xd0(r1)
/* 00002E68 9001009C */ stw r0, 0x9c(r1)
/* 00002E6C 800100D4 */ lwz r0, 0xd4(r1)
/* 00002E70 906100A0 */ stw r3, 0xa0(r1)
/* 00002E74 C04100CC */ lfs f2, 0xcc(r1)
/* 00002E78 900100A4 */ stw r0, 0xa4(r1)
/* 00002E7C C02100D0 */ lfs f1, 0xd0(r1)
/* 00002E80 C07E0004 */ lfs f3, 4(r30)
/* 00002E84 C00100D4 */ lfs f0, 0xd4(r1)
/* 00002E88 EC6307F2 */ fmuls f3, f3, f31
/* 00002E8C EC4300B2 */ fmuls f2, f3, f2
/* 00002E90 D0410054 */ stfs f2, 0x54(r1)
/* 00002E94 C05E0004 */ lfs f2, 4(r30)
/* 00002E98 EC4207F2 */ fmuls f2, f2, f31
/* 00002E9C EC220072 */ fmuls f1, f2, f1
/* 00002EA0 D0210058 */ stfs f1, 0x58(r1)
/* 00002EA4 C03E0004 */ lfs f1, 4(r30)
/* 00002EA8 EC2107F2 */ fmuls f1, f1, f31
/* 00002EAC EC010032 */ fmuls f0, f1, f0
/* 00002EB0 D001005C */ stfs f0, 0x5c(r1)
/* 00002EB4 C03D001C */ lfs f1, 0x1c(r29)
/* 00002EB8 C01A0064 */ lfs f0, 0x64(r26)
/* 00002EBC EC010028 */ fsubs f0, f1, f0
/* 00002EC0 D00100C0 */ stfs f0, 0xc0(r1)
/* 00002EC4 C03D0020 */ lfs f1, 0x20(r29)
/* 00002EC8 C01A0068 */ lfs f0, 0x68(r26)
/* 00002ECC EC010028 */ fsubs f0, f1, f0
/* 00002ED0 D00100C4 */ stfs f0, 0xc4(r1)
/* 00002ED4 C03D0024 */ lfs f1, 0x24(r29)
/* 00002ED8 C01A006C */ lfs f0, 0x6c(r26)
/* 00002EDC EC010028 */ fsubs f0, f1, f0
/* 00002EE0 D00100C8 */ stfs f0, 0xc8(r1)
/* 00002EE4 C0A100CC */ lfs f5, 0xcc(r1)
/* 00002EE8 C04100C0 */ lfs f2, 0xc0(r1)
/* 00002EEC C08100D0 */ lfs f4, 0xd0(r1)
/* 00002EF0 C02100C4 */ lfs f1, 0xc4(r1)
/* 00002EF4 C06100D4 */ lfs f3, 0xd4(r1)
/* 00002EF8 C00100C8 */ lfs f0, 0xc8(r1)
/* 00002EFC EC4500B2 */ fmuls f2, f5, f2
/* 00002F00 EC44107A */ fmadds f2, f4, f1, f2
/* 00002F04 EC43103A */ fmadds f2, f3, f0, f2
/* 00002F08 C83E0028 */ lfd f1, 0x28(r30)
/* 00002F0C 38610014 */ addi r3, r1, 0x14
/* 00002F10 FC001210 */ fabs f0, f2
/* 00002F14 FC010032 */ fmul f0, f1, f0
/* 00002F18 FC000018 */ frsp f0, f0
/* 00002F1C D00100BC */ stfs f0, 0xbc(r1)
/* 00002F20 4BFFD245 */ bl spawn_effect
/* 00002F24 C03D001C */ lfs f1, 0x1c(r29)
/* 00002F28 7FE3FB78 */ mr r3, r31
/* 00002F2C C01A0064 */ lfs f0, 0x64(r26)
/* 00002F30 EC010028 */ fsubs f0, f1, f0
/* 00002F34 D00100C0 */ stfs f0, 0xc0(r1)
/* 00002F38 C03D0020 */ lfs f1, 0x20(r29)
/* 00002F3C C01A0068 */ lfs f0, 0x68(r26)
/* 00002F40 EC010028 */ fsubs f0, f1, f0
/* 00002F44 D00100C4 */ stfs f0, 0xc4(r1)
/* 00002F48 C03D0024 */ lfs f1, 0x24(r29)
/* 00002F4C C01A006C */ lfs f0, 0x6c(r26)
/* 00002F50 EC010028 */ fsubs f0, f1, f0
/* 00002F54 D00100C8 */ stfs f0, 0xc8(r1)
/* 00002F58 C03D0004 */ lfs f1, 4(r29)
/* 00002F5C C01A0058 */ lfs f0, 0x58(r26)
/* 00002F60 EC010028 */ fsubs f0, f1, f0
/* 00002F64 D00100CC */ stfs f0, 0xcc(r1)
/* 00002F68 C03D0008 */ lfs f1, 8(r29)
/* 00002F6C C01A005C */ lfs f0, 0x5c(r26)
/* 00002F70 EC010028 */ fsubs f0, f1, f0
/* 00002F74 D00100D4 */ stfs f0, 0xd4(r1)
/* 00002F78 C03D000C */ lfs f1, 0xc(r29)
/* 00002F7C C01A0060 */ lfs f0, 0x60(r26)
/* 00002F80 EC010028 */ fsubs f0, f1, f0
/* 00002F84 D00100D0 */ stfs f0, 0xd0(r1)
/* 00002F88 4BFFD1DD */ bl mathutil_vec_normalize_len
/* 00002F8C C0A100CC */ lfs f5, 0xcc(r1)
/* 00002F90 C04100C0 */ lfs f2, 0xc0(r1)
/* 00002F94 C08100D0 */ lfs f4, 0xd0(r1)
/* 00002F98 C02100C4 */ lfs f1, 0xc4(r1)
/* 00002F9C C06100D4 */ lfs f3, 0xd4(r1)
/* 00002FA0 C00100C8 */ lfs f0, 0xc8(r1)
/* 00002FA4 EC4500B2 */ fmuls f2, f5, f2
/* 00002FA8 EC44107A */ fmadds f2, f4, f1, f2
/* 00002FAC EC43103A */ fmadds f2, f3, f0, f2
/* 00002FB0 C83E00B8 */ lfd f1, 0xb8(r30)
/* 00002FB4 C01E0008 */ lfs f0, 8(r30)
/* 00002FB8 FC401210 */ fabs f2, f2
/* 00002FBC FFE20828 */ fsub f31, f2, f1
/* 00002FC0 FFE0F818 */ frsp f31, f31
/* 00002FC4 FC1F0040 */ fcmpo cr0, f31, f0
/* 00002FC8 408100B8 */ ble lbl_00003080
/* 00002FCC 809C0000 */ lwz r4, 0(r28)
/* 00002FD0 3C600000 */ lis r3, ballInfo@ha
/* 00002FD4 38030000 */ addi r0, r3, ballInfo@l
/* 00002FD8 1C6401A4 */ mulli r3, r4, 0x1a4
/* 00002FDC 7C801A14 */ add r4, r0, r3
/* 00002FE0 80040094 */ lwz r0, 0x94(r4)
/* 00002FE4 5400018D */ rlwinm. r0, r0, 0, 6, 6
/* 00002FE8 4082004C */ bne lbl_00003034
/* 00002FEC C01E0060 */ lfs f0, 0x60(r30)
/* 00002FF0 3C600000 */ lis r3, playerControllerIDs@ha
/* 00002FF4 8884002E */ lbz r4, 0x2e(r4)
/* 00002FF8 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00002FFC EC0007F2 */ fmuls f0, f0, f31
/* 00003000 C03E0074 */ lfs f1, 0x74(r30)
/* 00003004 7C830774 */ extsb r3, r4
/* 00003008 5463103A */ slwi r3, r3, 2
/* 0000300C C05E00C0 */ lfs f2, 0xc0(r30)
/* 00003010 EC01002A */ fadds f0, f1, f0
/* 00003014 7C601A14 */ add r3, r0, r3
/* 00003018 80630000 */ lwz r3, 0(r3)
/* 0000301C 38800001 */ li r4, 1
/* 00003020 EC020032 */ fmuls f0, f2, f0
/* 00003024 FC00001E */ fctiwz f0, f0
/* 00003028 D80100E8 */ stfd f0, 0xe8(r1)
/* 0000302C 80A100EC */ lwz r5, 0xec(r1)
/* 00003030 4BFFD135 */ bl vibration_control
lbl_00003034:
/* 00003034 801D0094 */ lwz r0, 0x94(r29)
/* 00003038 5400018D */ rlwinm. r0, r0, 0, 6, 6
/* 0000303C 40820044 */ bne lbl_00003080
/* 00003040 C01E0074 */ lfs f0, 0x74(r30)
/* 00003044 3C600000 */ lis r3, playerControllerIDs@ha
/* 00003048 889D002E */ lbz r4, 0x2e(r29)
/* 0000304C 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00003050 EC00F82A */ fadds f0, f0, f31
/* 00003054 C03E00C0 */ lfs f1, 0xc0(r30)
/* 00003058 7C830774 */ extsb r3, r4
/* 0000305C 5463103A */ slwi r3, r3, 2
/* 00003060 EC010032 */ fmuls f0, f1, f0
/* 00003064 7C601A14 */ add r3, r0, r3
/* 00003068 80630000 */ lwz r3, 0(r3)
/* 0000306C 38800001 */ li r4, 1
/* 00003070 FC00001E */ fctiwz f0, f0
/* 00003074 D80100E8 */ stfd f0, 0xe8(r1)
/* 00003078 80A100EC */ lwz r5, 0xec(r1)
/* 0000307C 4BFFD0E9 */ bl vibration_control
lbl_00003080:
/* 00003080 3C600000 */ lis r3, lbl_802F1E64@ha
/* 00003084 38A30000 */ addi r5, r3, lbl_802F1E64@l
/* 00003088 A8050000 */ lha r0, 0(r5)
/* 0000308C 2C000000 */ cmpwi r0, 0
/* 00003090 4182003C */ beq lbl_000030CC
/* 00003094 3C600000 */ lis r3, lbl_10017664@ha
/* 00003098 38830000 */ addi r4, r3, lbl_10017664@l
/* 0000309C 80040748 */ lwz r0, 0x748(r4)
/* 000030A0 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 000030A4 40820028 */ bne lbl_000030CC
/* 000030A8 38000001 */ li r0, 1
/* 000030AC 90040738 */ stw r0, 0x738(r4)
/* 000030B0 807C0000 */ lwz r3, 0(r28)
/* 000030B4 A8050000 */ lha r0, 0(r5)
/* 000030B8 1C630018 */ mulli r3, r3, 0x18
/* 000030BC 7C841A14 */ add r4, r4, r3
/* 000030C0 80640008 */ lwz r3, 8(r4)
/* 000030C4 7C030214 */ add r0, r3, r0
/* 000030C8 90040008 */ stw r0, 8(r4)
lbl_000030CC:
/* 000030CC 3C800000 */ lis r4, lbl_802F1E60@ha
/* 000030D0 887D002E */ lbz r3, 0x2e(r29)
/* 000030D4 C0040000 */ lfs f0, lbl_802F1E60@l(r4)
/* 000030D8 3C800000 */ lis r4, lbl_10017664@ha
/* 000030DC C03E00C0 */ lfs f1, 0xc0(r30)
/* 000030E0 7C630774 */ extsb r3, r3
/* 000030E4 801C0000 */ lwz r0, 0(r28)
/* 000030E8 EC010032 */ fmuls f0, f1, f0
/* 000030EC 38E40000 */ addi r7, r4, lbl_10017664@l
/* 000030F0 1C630018 */ mulli r3, r3, 0x18
/* 000030F4 FC00001E */ fctiwz f0, f0
/* 000030F8 7C671A14 */ add r3, r7, r3
/* 000030FC 5400083C */ slwi r0, r0, 1
/* 00003100 D80100E8 */ stfd f0, 0xe8(r1)
/* 00003104 7CC30214 */ add r6, r3, r0
/* 00003108 387B0010 */ addi r3, r27, 0x10
/* 0000310C 800100EC */ lwz r0, 0xec(r1)
/* 00003110 389B0004 */ addi r4, r27, 4
/* 00003114 38BA0028 */ addi r5, r26, 0x28
/* 00003118 B0060010 */ sth r0, 0x10(r6)
/* 0000311C 38C100D8 */ addi r6, r1, 0xd8
/* 00003120 881D002E */ lbz r0, 0x2e(r29)
/* 00003124 7C000774 */ extsb r0, r0
/* 00003128 1C0001B4 */ mulli r0, r0, 0x1b4
/* 0000312C 7CE70214 */ add r7, r7, r0
/* 00003130 80070084 */ lwz r0, 0x84(r7)
/* 00003134 60000001 */ ori r0, r0, 1
/* 00003138 90070084 */ stw r0, 0x84(r7)
/* 0000313C 80FA001C */ lwz r7, 0x1c(r26)
/* 00003140 801A0020 */ lwz r0, 0x20(r26)
/* 00003144 90E100D8 */ stw r7, 0xd8(r1)
/* 00003148 900100DC */ stw r0, 0xdc(r1)
/* 0000314C 801A0024 */ lwz r0, 0x24(r26)
/* 00003150 900100E0 */ stw r0, 0xe0(r1)
/* 00003154 C03B0028 */ lfs f1, 0x28(r27)
/* 00003158 C05A0034 */ lfs f2, 0x34(r26)
/* 0000315C 4BFFD009 */ bl func_8006AAEC
/* 00003160 C02100D8 */ lfs f1, 0xd8(r1)
/* 00003164 386100CC */ addi r3, r1, 0xcc
/* 00003168 C01A001C */ lfs f0, 0x1c(r26)
/* 0000316C C05A0058 */ lfs f2, 0x58(r26)
/* 00003170 EC010028 */ fsubs f0, f1, f0
/* 00003174 EC02002A */ fadds f0, f2, f0
/* 00003178 D01A0058 */ stfs f0, 0x58(r26)
/* 0000317C C02100DC */ lfs f1, 0xdc(r1)
/* 00003180 C01A0020 */ lfs f0, 0x20(r26)
/* 00003184 C05A005C */ lfs f2, 0x5c(r26)
/* 00003188 EC010028 */ fsubs f0, f1, f0
/* 0000318C EC02002A */ fadds f0, f2, f0
/* 00003190 D01A005C */ stfs f0, 0x5c(r26)
/* 00003194 C02100E0 */ lfs f1, 0xe0(r1)
/* 00003198 C01A0024 */ lfs f0, 0x24(r26)
/* 0000319C C05A0060 */ lfs f2, 0x60(r26)
/* 000031A0 EC010028 */ fsubs f0, f1, f0
/* 000031A4 EC02002A */ fadds f0, f2, f0
/* 000031A8 D01A0060 */ stfs f0, 0x60(r26)
/* 000031AC 808100D8 */ lwz r4, 0xd8(r1)
/* 000031B0 800100DC */ lwz r0, 0xdc(r1)
/* 000031B4 909A001C */ stw r4, 0x1c(r26)
/* 000031B8 901A0020 */ stw r0, 0x20(r26)
/* 000031BC 800100E0 */ lwz r0, 0xe0(r1)
/* 000031C0 901A0024 */ stw r0, 0x24(r26)
/* 000031C4 C05B0004 */ lfs f2, 4(r27)
/* 000031C8 C00100D8 */ lfs f0, 0xd8(r1)
/* 000031CC C02100DC */ lfs f1, 0xdc(r1)
/* 000031D0 EC420028 */ fsubs f2, f2, f0
/* 000031D4 C00100E0 */ lfs f0, 0xe0(r1)
/* 000031D8 D04100CC */ stfs f2, 0xcc(r1)
/* 000031DC C05B0008 */ lfs f2, 8(r27)
/* 000031E0 EC220828 */ fsubs f1, f2, f1
/* 000031E4 D02100D0 */ stfs f1, 0xd0(r1)
/* 000031E8 C03B000C */ lfs f1, 0xc(r27)
/* 000031EC EC010028 */ fsubs f0, f1, f0
/* 000031F0 D00100D4 */ stfs f0, 0xd4(r1)
/* 000031F4 4BFFCF71 */ bl mathutil_vec_normalize_len
/* 000031F8 C05E0004 */ lfs f2, 4(r30)
/* 000031FC 3C600000 */ lis r3, lbl_802F1E84@ha
/* 00003200 C01D0068 */ lfs f0, 0x68(r29)
/* 00003204 389A0064 */ addi r4, r26, 0x64
/* 00003208 C0230000 */ lfs f1, lbl_802F1E84@l(r3)
/* 0000320C EC020032 */ fmuls f0, f2, f0
/* 00003210 386100CC */ addi r3, r1, 0xcc
/* 00003214 38BB001C */ addi r5, r27, 0x1c
/* 00003218 EC400032 */ fmuls f2, f0, f0
/* 0000321C 4BFFCF49 */ bl func_8006AD3C
/* 00003220 881D002E */ lbz r0, 0x2e(r29)
/* 00003224 3880000C */ li r4, 0xc
/* 00003228 7C000774 */ extsb r0, r0
/* 0000322C 5400083C */ slwi r0, r0, 1
/* 00003230 7C7C0214 */ add r3, r28, r0
/* 00003234 B0830004 */ sth r4, 4(r3)
lbl_00003238:
/* 00003238 BB210104 */ lmw r25, 0x104(r1)
/* 0000323C 8001013C */ lwz r0, 0x13c(r1)
/* 00003240 CBE10130 */ lfd f31, 0x130(r1)
/* 00003244 CBC10128 */ lfd f30, 0x128(r1)
/* 00003248 7C0803A6 */ mtlr r0
/* 0000324C CBA10120 */ lfd f29, 0x120(r1)
/* 00003250 38210138 */ addi r1, r1, 0x138
/* 00003254 4E800020 */ blr 
