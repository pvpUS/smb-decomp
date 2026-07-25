/* 00009D3C 7C0802A6 */ mflr r0
/* 00009D40 3C800000 */ lis r4, debugFlags@ha
/* 00009D44 90010004 */ stw r0, 4(r1)
/* 00009D48 3CA00000 */ lis r5, decodedStageLzPtr@ha
/* 00009D4C 3CC00000 */ lis r6, lbl_00013AA0@ha
/* 00009D50 9421FFC0 */ stwu r1, -0x40(r1)
/* 00009D54 BF61002C */ stmw r27, 0x2c(r1)
/* 00009D58 3B630000 */ addi r27, r3, 0
/* 00009D5C 3BC60000 */ addi r30, r6, lbl_00013AA0@l
/* 00009D60 80040000 */ lwz r0, debugFlags@l(r4)
/* 00009D64 38850000 */ addi r4, r5, decodedStageLzPtr@l
/* 00009D68 80840000 */ lwz r4, 0(r4)
/* 00009D6C 3CA00000 */ lis r5, lbl_10000028@ha
/* 00009D70 7000000A */ andi. r0, r0, 0xa
/* 00009D74 83A40078 */ lwz r29, 0x78(r4)
/* 00009D78 3BE50000 */ addi r31, r5, lbl_10000028@l
/* 00009D7C 408202F8 */ bne lbl_0000A074
/* 00009D80 3C600000 */ lis r3, lbl_10001B24@ha
/* 00009D84 80830000 */ lwz r4, lbl_10001B24@l(r3)
/* 00009D88 3C600000 */ lis r3, lbl_10000054@ha
/* 00009D8C 38A30000 */ addi r5, r3, lbl_10000054@l
/* 00009D90 A8040002 */ lha r0, 2(r4)
/* 00009D94 B01B0030 */ sth r0, 0x30(r27)
/* 00009D98 80650000 */ lwz r3, 0(r5)
/* 00009D9C A003001E */ lhz r0, 0x1e(r3)
/* 00009DA0 28000000 */ cmplwi r0, 0
/* 00009DA4 40820014 */ bne lbl_00009DB8
/* 00009DA8 3C600000 */ lis r3, ballInfo@ha
/* 00009DAC 38630000 */ addi r3, r3, ballInfo@l
/* 00009DB0 83830144 */ lwz r28, 0x144(r3)
/* 00009DB4 4800006C */ b lbl_00009E20
lbl_00009DB8:
/* 00009DB8 3B830000 */ addi r28, r3, 0
/* 00009DBC 38C00000 */ li r6, 0
/* 00009DC0 48000054 */ b lbl_00009E14
lbl_00009DC4:
/* 00009DC4 7CC00734 */ extsh r0, r6
/* 00009DC8 5404103A */ slwi r4, r0, 2
/* 00009DCC 7C652214 */ add r3, r5, r4
/* 00009DD0 80630000 */ lwz r3, 0(r3)
/* 00009DD4 38000000 */ li r0, 0
/* 00009DD8 7C030040 */ cmplw r3, r0
/* 00009DDC 41820044 */ beq lbl_00009E20
/* 00009DE0 80630014 */ lwz r3, 0x14(r3)
/* 00009DE4 54600673 */ rlwinm. r0, r3, 0, 0x19, 0x19
/* 00009DE8 40820038 */ bne lbl_00009E20
/* 00009DEC 5460039D */ rlwinm. r0, r3, 0, 0xe, 0xe
/* 00009DF0 40820020 */ bne lbl_00009E10
/* 00009DF4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00009DF8 40820018 */ bne lbl_00009E10
/* 00009DFC 3C600000 */ lis r3, lbl_10000054@ha
/* 00009E00 38030000 */ addi r0, r3, lbl_10000054@l
/* 00009E04 7C602214 */ add r3, r0, r4
/* 00009E08 83830000 */ lwz r28, 0(r3)
/* 00009E0C 48000014 */ b lbl_00009E20
lbl_00009E10:
/* 00009E10 38C60001 */ addi r6, r6, 1
lbl_00009E14:
/* 00009E14 7CC00734 */ extsh r0, r6
/* 00009E18 2C000004 */ cmpwi r0, 4
/* 00009E1C 4180FFA8 */ blt lbl_00009DC4
lbl_00009E20:
/* 00009E20 A09C0000 */ lhz r4, 0(r28)
/* 00009E24 3C600000 */ lis r3, ballInfo@ha
/* 00009E28 38030000 */ addi r0, r3, ballInfo@l
/* 00009E2C C01B000C */ lfs f0, 0xc(r27)
/* 00009E30 1C6401A4 */ mulli r3, r4, 0x1a4
/* 00009E34 7C601A14 */ add r3, r0, r3
/* 00009E38 C0230004 */ lfs f1, 4(r3)
/* 00009E3C EC010028 */ fsubs f0, f1, f0
/* 00009E40 D0010010 */ stfs f0, 0x10(r1)
/* 00009E44 C0230008 */ lfs f1, 8(r3)
/* 00009E48 C01B0010 */ lfs f0, 0x10(r27)
/* 00009E4C EC010028 */ fsubs f0, f1, f0
/* 00009E50 D0010014 */ stfs f0, 0x14(r1)
/* 00009E54 C023000C */ lfs f1, 0xc(r3)
/* 00009E58 C01B0014 */ lfs f0, 0x14(r27)
/* 00009E5C EC010028 */ fsubs f0, f1, f0
/* 00009E60 D0010018 */ stfs f0, 0x18(r1)
/* 00009E64 C0210010 */ lfs f1, 0x10(r1)
/* 00009E68 C0410014 */ lfs f2, 0x14(r1)
/* 00009E6C C0010018 */ lfs f0, 0x18(r1)
/* 00009E70 EC210072 */ fmuls f1, f1, f1
/* 00009E74 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009E78 EC20083A */ fmadds f1, f0, f0, f1
/* 00009E7C 4BFF6301 */ bl mathutil_sqrt
/* 00009E80 C01E009C */ lfs f0, 0x9c(r30)
/* 00009E84 FC010040 */ fcmpo cr0, f1, f0
/* 00009E88 40810074 */ ble lbl_00009EFC
/* 00009E8C C85E00E0 */ lfd f2, 0xe0(r30)
/* 00009E90 C81E00E8 */ lfd f0, 0xe8(r30)
/* 00009E94 FC211024 */ fdiv f1, f1, f2
/* 00009E98 FC200818 */ frsp f1, f1
/* 00009E9C FC010040 */ fcmpo cr0, f1, f0
/* 00009EA0 40810008 */ ble lbl_00009EA8
/* 00009EA4 C03E00F0 */ lfs f1, 0xf0(r30)
lbl_00009EA8:
/* 00009EA8 C0010010 */ lfs f0, 0x10(r1)
/* 00009EAC EC000072 */ fmuls f0, f0, f1
/* 00009EB0 D0010010 */ stfs f0, 0x10(r1)
/* 00009EB4 C0010014 */ lfs f0, 0x14(r1)
/* 00009EB8 EC000072 */ fmuls f0, f0, f1
/* 00009EBC D0010014 */ stfs f0, 0x14(r1)
/* 00009EC0 C0010018 */ lfs f0, 0x18(r1)
/* 00009EC4 EC000072 */ fmuls f0, f0, f1
/* 00009EC8 D0010018 */ stfs f0, 0x18(r1)
/* 00009ECC C03B000C */ lfs f1, 0xc(r27)
/* 00009ED0 C0010010 */ lfs f0, 0x10(r1)
/* 00009ED4 EC01002A */ fadds f0, f1, f0
/* 00009ED8 D01B000C */ stfs f0, 0xc(r27)
/* 00009EDC C03B0010 */ lfs f1, 0x10(r27)
/* 00009EE0 C0010014 */ lfs f0, 0x14(r1)
/* 00009EE4 EC01002A */ fadds f0, f1, f0
/* 00009EE8 D01B0010 */ stfs f0, 0x10(r27)
/* 00009EEC C03B0014 */ lfs f1, 0x14(r27)
/* 00009EF0 C0010018 */ lfs f0, 0x18(r1)
/* 00009EF4 EC01002A */ fadds f0, f1, f0
/* 00009EF8 D01B0014 */ stfs f0, 0x14(r27)
lbl_00009EFC:
/* 00009EFC C83E00D0 */ lfd f1, 0xd0(r30)
/* 00009F00 C01F0008 */ lfs f0, 8(r31)
/* 00009F04 C85E00C8 */ lfd f2, 0xc8(r30)
/* 00009F08 FC010024 */ fdiv f0, f1, f0
/* 00009F0C C03C01D4 */ lfs f1, 0x1d4(r28)
/* 00009F10 FC020032 */ fmul f0, f2, f0
/* 00009F14 FC21002A */ fadd f1, f1, f0
/* 00009F18 FC200818 */ frsp f1, f1
/* 00009F1C 4BFF931D */ bl lbl_00003238
/* 00009F20 387D0000 */ addi r3, r29, 0
/* 00009F24 3881001C */ addi r4, r1, 0x1c
/* 00009F28 4BFF9299 */ bl lbl_000031C0
/* 00009F2C C0210020 */ lfs f1, 0x20(r1)
/* 00009F30 C01E00D8 */ lfs f0, 0xd8(r30)
/* 00009F34 EC01002A */ fadds f0, f1, f0
/* 00009F38 D0010020 */ stfs f0, 0x20(r1)
/* 00009F3C C021001C */ lfs f1, 0x1c(r1)
/* 00009F40 C01B0000 */ lfs f0, 0(r27)
/* 00009F44 C0410020 */ lfs f2, 0x20(r1)
/* 00009F48 EC010028 */ fsubs f0, f1, f0
/* 00009F4C C0210024 */ lfs f1, 0x24(r1)
/* 00009F50 D0010010 */ stfs f0, 0x10(r1)
/* 00009F54 C01B0004 */ lfs f0, 4(r27)
/* 00009F58 EC020028 */ fsubs f0, f2, f0
/* 00009F5C D0010014 */ stfs f0, 0x14(r1)
/* 00009F60 C01B0008 */ lfs f0, 8(r27)
/* 00009F64 EC010028 */ fsubs f0, f1, f0
/* 00009F68 D0010018 */ stfs f0, 0x18(r1)
/* 00009F6C C0210010 */ lfs f1, 0x10(r1)
/* 00009F70 C0410014 */ lfs f2, 0x14(r1)
/* 00009F74 C0010018 */ lfs f0, 0x18(r1)
/* 00009F78 EC210072 */ fmuls f1, f1, f1
/* 00009F7C EC2208BA */ fmadds f1, f2, f2, f1
/* 00009F80 EC20083A */ fmadds f1, f0, f0, f1
/* 00009F84 4BFF61F9 */ bl mathutil_sqrt
/* 00009F88 C01E009C */ lfs f0, 0x9c(r30)
/* 00009F8C FC010040 */ fcmpo cr0, f1, f0
/* 00009F90 40810074 */ ble lbl_0000A004
/* 00009F94 C85E00E0 */ lfd f2, 0xe0(r30)
/* 00009F98 C81E00E8 */ lfd f0, 0xe8(r30)
/* 00009F9C FC211024 */ fdiv f1, f1, f2
/* 00009FA0 FC200818 */ frsp f1, f1
/* 00009FA4 FC010040 */ fcmpo cr0, f1, f0
/* 00009FA8 40810008 */ ble lbl_00009FB0
/* 00009FAC C03E00F0 */ lfs f1, 0xf0(r30)
lbl_00009FB0:
/* 00009FB0 C0010010 */ lfs f0, 0x10(r1)
/* 00009FB4 EC000072 */ fmuls f0, f0, f1
/* 00009FB8 D0010010 */ stfs f0, 0x10(r1)
/* 00009FBC C0010014 */ lfs f0, 0x14(r1)
/* 00009FC0 EC000072 */ fmuls f0, f0, f1
/* 00009FC4 D0010014 */ stfs f0, 0x14(r1)
/* 00009FC8 C0010018 */ lfs f0, 0x18(r1)
/* 00009FCC EC000072 */ fmuls f0, f0, f1
/* 00009FD0 D0010018 */ stfs f0, 0x18(r1)
/* 00009FD4 C03B0000 */ lfs f1, 0(r27)
/* 00009FD8 C0010010 */ lfs f0, 0x10(r1)
/* 00009FDC EC01002A */ fadds f0, f1, f0
/* 00009FE0 D01B0000 */ stfs f0, 0(r27)
/* 00009FE4 C03B0004 */ lfs f1, 4(r27)
/* 00009FE8 C0010014 */ lfs f0, 0x14(r1)
/* 00009FEC EC01002A */ fadds f0, f1, f0
/* 00009FF0 D01B0004 */ stfs f0, 4(r27)
/* 00009FF4 C03B0008 */ lfs f1, 8(r27)
/* 00009FF8 C0010018 */ lfs f0, 0x18(r1)
/* 00009FFC EC01002A */ fadds f0, f1, f0
/* 0000A000 D01B0008 */ stfs f0, 8(r27)
lbl_0000A004:
/* 0000A004 C03B000C */ lfs f1, 0xc(r27)
/* 0000A008 C01B0000 */ lfs f0, 0(r27)
/* 0000A00C EC010028 */ fsubs f0, f1, f0
/* 0000A010 D0010010 */ stfs f0, 0x10(r1)
/* 0000A014 C03B0010 */ lfs f1, 0x10(r27)
/* 0000A018 C01B0004 */ lfs f0, 4(r27)
/* 0000A01C EC010028 */ fsubs f0, f1, f0
/* 0000A020 D0010014 */ stfs f0, 0x14(r1)
/* 0000A024 C03B0014 */ lfs f1, 0x14(r27)
/* 0000A028 C01B0008 */ lfs f0, 8(r27)
/* 0000A02C EC010028 */ fsubs f0, f1, f0
/* 0000A030 D0010018 */ stfs f0, 0x18(r1)
/* 0000A034 C0210010 */ lfs f1, 0x10(r1)
/* 0000A038 C0410018 */ lfs f2, 0x18(r1)
/* 0000A03C 4BFF6141 */ bl mathutil_atan2
/* 0000A040 38038000 */ addi r0, r3, -32768
/* 0000A044 B01B001A */ sth r0, 0x1a(r27)
/* 0000A048 C0010018 */ lfs f0, 0x18(r1)
/* 0000A04C C0210010 */ lfs f1, 0x10(r1)
/* 0000A050 EC210072 */ fmuls f1, f1, f1
/* 0000A054 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A058 4BFF6125 */ bl mathutil_sqrt
/* 0000A05C FC400890 */ fmr f2, f1
/* 0000A060 C0210014 */ lfs f1, 0x14(r1)
/* 0000A064 4BFF6119 */ bl mathutil_atan2
/* 0000A068 B07B0018 */ sth r3, 0x18(r27)
/* 0000A06C 38000000 */ li r0, 0
/* 0000A070 B01B001C */ sth r0, 0x1c(r27)
lbl_0000A074:
/* 0000A074 BB61002C */ lmw r27, 0x2c(r1)
/* 0000A078 80010044 */ lwz r0, 0x44(r1)
/* 0000A07C 38210040 */ addi r1, r1, 0x40
/* 0000A080 7C0803A6 */ mtlr r0
/* 0000A084 4E800020 */ blr 
lbl_0000A088:
/* 0000A088 7C0802A6 */ mflr r0
/* 0000A08C 3CA00000 */ lis r5, debugFlags@ha
/* 0000A090 90010004 */ stw r0, 4(r1)
/* 0000A094 9421FF90 */ stwu r1, -0x70(r1)
/* 0000A098 BF410058 */ stmw r26, 0x58(r1)
/* 0000A09C 3B630000 */ addi r27, r3, 0
/* 0000A0A0 80050000 */ lwz r0, debugFlags@l(r5)
/* 0000A0A4 3CA00000 */ lis r5, lbl_00013AA0@ha
/* 0000A0A8 80C40144 */ lwz r6, 0x144(r4)
/* 0000A0AC 3BE50000 */ addi r31, r5, lbl_00013AA0@l
/* 0000A0B0 7000000A */ andi. r0, r0, 0xa
/* 0000A0B4 40820254 */ bne lbl_0000A308
/* 0000A0B8 80BB0000 */ lwz r5, 0(r27)
/* 0000A0BC 3C600000 */ lis r3, lbl_10001B24@ha
/* 0000A0C0 801B0004 */ lwz r0, 4(r27)
/* 0000A0C4 38630000 */ addi r3, r3, lbl_10001B24@l
/* 0000A0C8 90A10034 */ stw r5, 0x34(r1)
/* 0000A0CC 90010038 */ stw r0, 0x38(r1)
/* 0000A0D0 801B0008 */ lwz r0, 8(r27)
/* 0000A0D4 9001003C */ stw r0, 0x3c(r1)
/* 0000A0D8 80BB000C */ lwz r5, 0xc(r27)
/* 0000A0DC 801B0010 */ lwz r0, 0x10(r27)
/* 0000A0E0 90A10028 */ stw r5, 0x28(r1)
/* 0000A0E4 9001002C */ stw r0, 0x2c(r1)
/* 0000A0E8 801B0014 */ lwz r0, 0x14(r27)
/* 0000A0EC 90010030 */ stw r0, 0x30(r1)
/* 0000A0F0 80630000 */ lwz r3, 0(r3)
/* 0000A0F4 ABDB0018 */ lha r30, 0x18(r27)
/* 0000A0F8 ABBB001A */ lha r29, 0x1a(r27)
/* 0000A0FC AB9B001C */ lha r28, 0x1c(r27)
/* 0000A100 A8030002 */ lha r0, 2(r3)
/* 0000A104 B01B0030 */ sth r0, 0x30(r27)
/* 0000A108 80060014 */ lwz r0, 0x14(r6)
/* 0000A10C 5400039D */ rlwinm. r0, r0, 0, 0xe, 0xe
/* 0000A110 41820070 */ beq lbl_0000A180
/* 0000A114 A806001C */ lha r0, 0x1c(r6)
/* 0000A118 3C600000 */ lis r3, lbl_00013B10@ha
/* 0000A11C C8430000 */ lfd f2, lbl_00013B10@l(r3)
/* 0000A120 2000003C */ subfic r0, r0, 0x3c
/* 0000A124 A8BB0030 */ lha r5, 0x30(r27)
/* 0000A128 6C008000 */ xoris r0, r0, 0x8000
/* 0000A12C C01F0104 */ lfs f0, 0x104(r31)
/* 0000A130 9001004C */ stw r0, 0x4c(r1)
/* 0000A134 6CA38000 */ xoris r3, r5, 0x8000
/* 0000A138 3C004330 */ lis r0, 0x4330
/* 0000A13C C07F0100 */ lfs f3, 0x100(r31)
/* 0000A140 90010048 */ stw r0, 0x48(r1)
/* 0000A144 3CA00000 */ lis r5, lbl_00013B10@ha
/* 0000A148 C8210048 */ lfd f1, 0x48(r1)
/* 0000A14C 90610054 */ stw r3, 0x54(r1)
/* 0000A150 EC211028 */ fsubs f1, f1, f2
/* 0000A154 C8450000 */ lfd f2, lbl_00013B10@l(r5)
/* 0000A158 90010050 */ stw r0, 0x50(r1)
/* 0000A15C EC010024 */ fdivs f0, f1, f0
/* 0000A160 C8210050 */ lfd f1, 0x50(r1)
/* 0000A164 EC211028 */ fsubs f1, f1, f2
/* 0000A168 EC030032 */ fmuls f0, f3, f0
/* 0000A16C EC01002A */ fadds f0, f1, f0
/* 0000A170 FC00001E */ fctiwz f0, f0
/* 0000A174 D8010040 */ stfd f0, 0x40(r1)
/* 0000A178 80010044 */ lwz r0, 0x44(r1)
/* 0000A17C B01B0030 */ sth r0, 0x30(r27)
lbl_0000A180:
/* 0000A180 C03B0000 */ lfs f1, 0(r27)
/* 0000A184 C01B0094 */ lfs f0, 0x94(r27)
/* 0000A188 EC01002A */ fadds f0, f1, f0
/* 0000A18C D01B0000 */ stfs f0, 0(r27)
/* 0000A190 C03B0004 */ lfs f1, 4(r27)
/* 0000A194 C01B0098 */ lfs f0, 0x98(r27)
/* 0000A198 EC01002A */ fadds f0, f1, f0
/* 0000A19C D01B0004 */ stfs f0, 4(r27)
/* 0000A1A0 C03B0008 */ lfs f1, 8(r27)
/* 0000A1A4 C01B009C */ lfs f0, 0x9c(r27)
/* 0000A1A8 EC01002A */ fadds f0, f1, f0
/* 0000A1AC D01B0008 */ stfs f0, 8(r27)
/* 0000A1B0 80640004 */ lwz r3, 4(r4)
/* 0000A1B4 80040008 */ lwz r0, 8(r4)
/* 0000A1B8 907B000C */ stw r3, 0xc(r27)
/* 0000A1BC 901B0010 */ stw r0, 0x10(r27)
/* 0000A1C0 8004000C */ lwz r0, 0xc(r4)
/* 0000A1C4 901B0014 */ stw r0, 0x14(r27)
/* 0000A1C8 C03B0010 */ lfs f1, 0x10(r27)
/* 0000A1CC C81F0018 */ lfd f0, 0x18(r31)
/* 0000A1D0 FC01002A */ fadd f0, f1, f0
/* 0000A1D4 FC000018 */ frsp f0, f0
/* 0000A1D8 D01B0010 */ stfs f0, 0x10(r27)
/* 0000A1DC C03B000C */ lfs f1, 0xc(r27)
/* 0000A1E0 C01B0000 */ lfs f0, 0(r27)
/* 0000A1E4 EC010028 */ fsubs f0, f1, f0
/* 0000A1E8 D001001C */ stfs f0, 0x1c(r1)
/* 0000A1EC C03B0010 */ lfs f1, 0x10(r27)
/* 0000A1F0 C01B0004 */ lfs f0, 4(r27)
/* 0000A1F4 EC010028 */ fsubs f0, f1, f0
/* 0000A1F8 D0010020 */ stfs f0, 0x20(r1)
/* 0000A1FC C03B0014 */ lfs f1, 0x14(r27)
/* 0000A200 C01B0008 */ lfs f0, 8(r27)
/* 0000A204 EC010028 */ fsubs f0, f1, f0
/* 0000A208 D0010024 */ stfs f0, 0x24(r1)
/* 0000A20C A81B001A */ lha r0, 0x1a(r27)
/* 0000A210 C021001C */ lfs f1, 0x1c(r1)
/* 0000A214 C0410024 */ lfs f2, 0x24(r1)
/* 0000A218 7F4000D0 */ neg r26, r0
/* 0000A21C 4BFF5F61 */ bl mathutil_atan2
/* 0000A220 38038000 */ addi r0, r3, -32768
/* 0000A224 B01B001A */ sth r0, 0x1a(r27)
/* 0000A228 C0010024 */ lfs f0, 0x24(r1)
/* 0000A22C C021001C */ lfs f1, 0x1c(r1)
/* 0000A230 EC210072 */ fmuls f1, f1, f1
/* 0000A234 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A238 4BFF5F45 */ bl mathutil_sqrt
/* 0000A23C FC400890 */ fmr f2, f1
/* 0000A240 C0210020 */ lfs f1, 0x20(r1)
/* 0000A244 4BFF5F39 */ bl mathutil_atan2
/* 0000A248 B07B0018 */ sth r3, 0x18(r27)
/* 0000A24C 38000000 */ li r0, 0
/* 0000A250 B01B001C */ sth r0, 0x1c(r27)
/* 0000A254 A81B001A */ lha r0, 0x1a(r27)
/* 0000A258 7F5A0215 */ add. r26, r26, r0
/* 0000A25C 40800008 */ bge lbl_0000A264
/* 0000A260 7F5A00D0 */ neg r26, r26
lbl_0000A264:
/* 0000A264 2C1A0100 */ cmpwi r26, 0x100
/* 0000A268 40810070 */ ble lbl_0000A2D8
/* 0000A26C 80610034 */ lwz r3, 0x34(r1)
/* 0000A270 80010038 */ lwz r0, 0x38(r1)
/* 0000A274 907B0000 */ stw r3, 0(r27)
/* 0000A278 901B0004 */ stw r0, 4(r27)
/* 0000A27C 8001003C */ lwz r0, 0x3c(r1)
/* 0000A280 901B0008 */ stw r0, 8(r27)
/* 0000A284 80610028 */ lwz r3, 0x28(r1)
/* 0000A288 8001002C */ lwz r0, 0x2c(r1)
/* 0000A28C 907B000C */ stw r3, 0xc(r27)
/* 0000A290 901B0010 */ stw r0, 0x10(r27)
/* 0000A294 80010030 */ lwz r0, 0x30(r1)
/* 0000A298 901B0014 */ stw r0, 0x14(r27)
/* 0000A29C B3DB0018 */ sth r30, 0x18(r27)
/* 0000A2A0 B3BB001A */ sth r29, 0x1a(r27)
/* 0000A2A4 B39B001C */ sth r28, 0x1c(r27)
/* 0000A2A8 807F00F4 */ lwz r3, 0xf4(r31)
/* 0000A2AC 801F00F8 */ lwz r0, 0xf8(r31)
/* 0000A2B0 90610010 */ stw r3, 0x10(r1)
/* 0000A2B4 90010014 */ stw r0, 0x14(r1)
/* 0000A2B8 801F00FC */ lwz r0, 0xfc(r31)
/* 0000A2BC 90010018 */ stw r0, 0x18(r1)
/* 0000A2C0 80610010 */ lwz r3, 0x10(r1)
/* 0000A2C4 80010014 */ lwz r0, 0x14(r1)
/* 0000A2C8 907B0094 */ stw r3, 0x94(r27)
/* 0000A2CC 901B0098 */ stw r0, 0x98(r27)
/* 0000A2D0 80010018 */ lwz r0, 0x18(r1)
/* 0000A2D4 901B009C */ stw r0, 0x9c(r27)
lbl_0000A2D8:
/* 0000A2D8 C03F0108 */ lfs f1, 0x108(r31)
/* 0000A2DC C01B0094 */ lfs f0, 0x94(r27)
/* 0000A2E0 EC010032 */ fmuls f0, f1, f0
/* 0000A2E4 D01B0094 */ stfs f0, 0x94(r27)
/* 0000A2E8 C03F0108 */ lfs f1, 0x108(r31)
/* 0000A2EC C01B0098 */ lfs f0, 0x98(r27)
/* 0000A2F0 EC010032 */ fmuls f0, f1, f0
/* 0000A2F4 D01B0098 */ stfs f0, 0x98(r27)
/* 0000A2F8 C03F0108 */ lfs f1, 0x108(r31)
/* 0000A2FC C01B009C */ lfs f0, 0x9c(r27)
/* 0000A300 EC010032 */ fmuls f0, f1, f0
/* 0000A304 D01B009C */ stfs f0, 0x9c(r27)
lbl_0000A308:
/* 0000A308 BB410058 */ lmw r26, 0x58(r1)
/* 0000A30C 80010074 */ lwz r0, 0x74(r1)
/* 0000A310 38210070 */ addi r1, r1, 0x70
/* 0000A314 7C0803A6 */ mtlr r0
/* 0000A318 4E800020 */ blr 
lbl_0000A31C:
/* 0000A31C 7C0802A6 */ mflr r0
/* 0000A320 3CA00000 */ lis r5, lbl_10001B1C@ha
/* 0000A324 90010004 */ stw r0, 4(r1)
/* 0000A328 9421FFF8 */ stwu r1, -8(r1)
/* 0000A32C 8804002E */ lbz r0, 0x2e(r4)
/* 0000A330 A0E4002A */ lhz r7, 0x2a(r4)
/* 0000A334 7C000774 */ extsb r0, r0
/* 0000A338 5406083C */ slwi r6, r0, 1
/* 0000A33C 38050000 */ addi r0, r5, lbl_10001B1C@l
/* 0000A340 7CA03214 */ add r5, r0, r6
/* 0000A344 B0E50000 */ sth r7, 0(r5)
/* 0000A348 38000009 */ li r0, 9
/* 0000A34C 9803001F */ stb r0, 0x1f(r3)
/* 0000A350 48000015 */ bl lbl_0000A364
/* 0000A354 8001000C */ lwz r0, 0xc(r1)
/* 0000A358 38210008 */ addi r1, r1, 8
/* 0000A35C 7C0803A6 */ mtlr r0
/* 0000A360 4E800020 */ blr 
