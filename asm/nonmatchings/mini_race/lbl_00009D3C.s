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
