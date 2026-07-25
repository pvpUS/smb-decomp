/* 0000F788 7C0802A6 */ mflr r0
/* 0000F78C 3C800000 */ lis r4, lbl_00012730@ha
/* 0000F790 90010004 */ stw r0, 4(r1)
/* 0000F794 3800040E */ li r0, 0x40e
/* 0000F798 9421FF48 */ stwu r1, -0xb8(r1)
/* 0000F79C BF4100A0 */ stmw r26, 0xa0(r1)
/* 0000F7A0 3B430000 */ addi r26, r3, 0
/* 0000F7A4 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000F7A8 3BC30000 */ addi r30, r3, lbl_00011CB0@l
/* 0000F7AC 3BA40000 */ addi r29, r4, lbl_00012730@l
/* 0000F7B0 3861000C */ addi r3, r1, 0xc
/* 0000F7B4 9001000C */ stw r0, 0xc(r1)
/* 0000F7B8 3800FFFF */ li r0, -1
/* 0000F7BC C01A0004 */ lfs f0, 4(r26)
/* 0000F7C0 D0010010 */ stfs f0, 0x10(r1)
/* 0000F7C4 C01A0008 */ lfs f0, 8(r26)
/* 0000F7C8 D0010014 */ stfs f0, 0x14(r1)
/* 0000F7CC C01A004C */ lfs f0, 0x4c(r26)
/* 0000F7D0 D0010018 */ stfs f0, 0x18(r1)
/* 0000F7D4 C01A0040 */ lfs f0, 0x40(r26)
/* 0000F7D8 D001001C */ stfs f0, 0x1c(r1)
/* 0000F7DC C01A0044 */ lfs f0, 0x44(r26)
/* 0000F7E0 D0010020 */ stfs f0, 0x20(r1)
/* 0000F7E4 C01E0008 */ lfs f0, 8(r30)
/* 0000F7E8 D0010024 */ stfs f0, 0x24(r1)
/* 0000F7EC C01E0008 */ lfs f0, 8(r30)
/* 0000F7F0 D0010028 */ stfs f0, 0x28(r1)
/* 0000F7F4 C01E000C */ lfs f0, 0xc(r30)
/* 0000F7F8 D001002C */ stfs f0, 0x2c(r1)
/* 0000F7FC C01E000C */ lfs f0, 0xc(r30)
/* 0000F800 D0010030 */ stfs f0, 0x30(r1)
/* 0000F804 A89A0068 */ lha r4, 0x68(r26)
/* 0000F808 90810034 */ stw r4, 0x34(r1)
/* 0000F80C C01A006C */ lfs f0, 0x6c(r26)
/* 0000F810 D0010038 */ stfs f0, 0x38(r1)
/* 0000F814 9001003C */ stw r0, 0x3c(r1)
/* 0000F818 801A0074 */ lwz r0, 0x74(r26)
/* 0000F81C 54000036 */ rlwinm r0, r0, 0, 0, 0x1b
/* 0000F820 6000000A */ ori r0, r0, 0xa
/* 0000F824 90010040 */ stw r0, 0x40(r1)
/* 0000F828 C03E0010 */ lfs f1, 0x10(r30)
/* 0000F82C C01A006C */ lfs f0, 0x6c(r26)
/* 0000F830 881A000C */ lbz r0, 0xc(r26)
/* 0000F834 EC010032 */ fmuls f0, f1, f0
/* 0000F838 88BA000D */ lbz r5, 0xd(r26)
/* 0000F83C 88DA000E */ lbz r6, 0xe(r26)
/* 0000F840 FC00001E */ fctiwz f0, f0
/* 0000F844 D8010098 */ stfd f0, 0x98(r1)
/* 0000F848 8081009C */ lwz r4, 0x9c(r1)
/* 0000F84C 5484C00E */ slwi r4, r4, 0x18
/* 0000F850 5004821E */ rlwimi r4, r0, 0x10, 8, 0xf
/* 0000F854 50A4442E */ rlwimi r4, r5, 8, 0x10, 0x17
/* 0000F858 7CC02378 */ or r0, r6, r4
/* 0000F85C 90010044 */ stw r0, 0x44(r1)
/* 0000F860 881A0071 */ lbz r0, 0x71(r26)
/* 0000F864 889A0070 */ lbz r4, 0x70(r26)
/* 0000F868 5400402E */ slwi r0, r0, 8
/* 0000F86C 88BA0072 */ lbz r5, 0x72(r26)
/* 0000F870 5080821E */ rlwimi r0, r4, 0x10, 8, 0xf
/* 0000F874 7CA00378 */ or r0, r5, r0
/* 0000F878 90010048 */ stw r0, 0x48(r1)
/* 0000F87C 4BFF090D */ bl nlSprPut
/* 0000F880 801A0048 */ lwz r0, 0x48(r26)
/* 0000F884 2C000001 */ cmpwi r0, 1
/* 0000F888 4082005C */ bne lbl_0000F8E4
/* 0000F88C 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000F890 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000F894 5403482C */ slwi r3, r0, 9
/* 0000F898 4BFF08F1 */ bl mathutil_sin
/* 0000F89C FC200A10 */ fabs f1, f1
/* 0000F8A0 C81E03F0 */ lfd f0, 0x3f0(r30)
/* 0000F8A4 FC000072 */ fmul f0, f0, f1
/* 0000F8A8 FC00001E */ fctiwz f0, f0
/* 0000F8AC D8010098 */ stfd f0, 0x98(r1)
/* 0000F8B0 8001009C */ lwz r0, 0x9c(r1)
/* 0000F8B4 981A0070 */ stb r0, 0x70(r26)
/* 0000F8B8 881A0070 */ lbz r0, 0x70(r26)
/* 0000F8BC 981A0071 */ stb r0, 0x71(r26)
/* 0000F8C0 881A0070 */ lbz r0, 0x70(r26)
/* 0000F8C4 981A0072 */ stb r0, 0x72(r26)
/* 0000F8C8 881A0071 */ lbz r0, 0x71(r26)
/* 0000F8CC 887A0070 */ lbz r3, 0x70(r26)
/* 0000F8D0 5400402E */ slwi r0, r0, 8
/* 0000F8D4 889A0072 */ lbz r4, 0x72(r26)
/* 0000F8D8 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000F8DC 7C800378 */ or r0, r4, r0
/* 0000F8E0 90010048 */ stw r0, 0x48(r1)
lbl_0000F8E4:
/* 0000F8E4 A01A003C */ lhz r0, 0x3c(r26)
/* 0000F8E8 3C600000 */ lis r3, bitmapGroups@ha
/* 0000F8EC 38630000 */ addi r3, r3, bitmapGroups@l
/* 0000F8F0 54002834 */ slwi r0, r0, 5
/* 0000F8F4 7F7D0214 */ add r27, r29, r0
/* 0000F8F8 801B4448 */ lwz r0, 0x4448(r27)
/* 0000F8FC 3B830010 */ addi r28, r3, 0x10
/* 0000F900 3FE04330 */ lis r31, 0x4330
/* 0000F904 9001000C */ stw r0, 0xc(r1)
/* 0000F908 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000F90C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F910 8101000C */ lwz r8, 0xc(r1)
/* 0000F914 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000F918 C03B4450 */ lfs f1, 0x4450(r27)
/* 0000F91C 3C800000 */ lis r4, lbl_00011EC8@ha
/* 0000F920 5500C63E */ rlwinm r0, r8, 0x18, 0x18, 0x1f
/* 0000F924 C01A0040 */ lfs f0, 0x40(r26)
/* 0000F928 1C000018 */ mulli r0, r0, 0x18
/* 0000F92C C05A0004 */ lfs f2, 4(r26)
/* 0000F930 EC010032 */ fmuls f0, f1, f0
/* 0000F934 7C7C002E */ lwzx r3, r28, r0
/* 0000F938 55002536 */ rlwinm r0, r8, 4, 0x14, 0x1b
/* 0000F93C 80630004 */ lwz r3, 4(r3)
/* 0000F940 EC02002A */ fadds f0, f2, f0
/* 0000F944 7D030214 */ add r8, r3, r0
/* 0000F948 D0010010 */ stfs f0, 0x10(r1)
/* 0000F94C 3861000C */ addi r3, r1, 0xc
/* 0000F950 C03B4454 */ lfs f1, 0x4454(r27)
/* 0000F954 C01A0044 */ lfs f0, 0x44(r26)
/* 0000F958 C05A0008 */ lfs f2, 8(r26)
/* 0000F95C EC010032 */ fmuls f0, f1, f0
/* 0000F960 EC02002A */ fadds f0, f2, f0
/* 0000F964 D0010014 */ stfs f0, 0x14(r1)
/* 0000F968 C03A004C */ lfs f1, 0x4c(r26)
/* 0000F96C C81E0190 */ lfd f0, 0x190(r30)
/* 0000F970 FC010028 */ fsub f0, f1, f0
/* 0000F974 FC000018 */ frsp f0, f0
/* 0000F978 D0010018 */ stfs f0, 0x18(r1)
/* 0000F97C A0080008 */ lhz r0, 8(r8)
/* 0000F980 C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 0000F984 9001009C */ stw r0, 0x9c(r1)
/* 0000F988 C05B4458 */ lfs f2, 0x4458(r27)
/* 0000F98C 93E10098 */ stw r31, 0x98(r1)
/* 0000F990 C8010098 */ lfd f0, 0x98(r1)
/* 0000F994 EC000828 */ fsubs f0, f0, f1
/* 0000F998 EC020024 */ fdivs f0, f2, f0
/* 0000F99C D0010024 */ stfs f0, 0x24(r1)
/* 0000F9A0 A008000A */ lhz r0, 0xa(r8)
/* 0000F9A4 C8260000 */ lfd f1, lbl_00011EC8@l(r6)
/* 0000F9A8 90010094 */ stw r0, 0x94(r1)
/* 0000F9AC C05B445C */ lfs f2, 0x445c(r27)
/* 0000F9B0 93E10090 */ stw r31, 0x90(r1)
/* 0000F9B4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F9B8 EC000828 */ fsubs f0, f0, f1
/* 0000F9BC EC020024 */ fdivs f0, f2, f0
/* 0000F9C0 D0010028 */ stfs f0, 0x28(r1)
/* 0000F9C4 A0080008 */ lhz r0, 8(r8)
/* 0000F9C8 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 0000F9CC 9001008C */ stw r0, 0x8c(r1)
/* 0000F9D0 C05B4460 */ lfs f2, 0x4460(r27)
/* 0000F9D4 93E10088 */ stw r31, 0x88(r1)
/* 0000F9D8 C0610024 */ lfs f3, 0x24(r1)
/* 0000F9DC C8010088 */ lfd f0, 0x88(r1)
/* 0000F9E0 EC000828 */ fsubs f0, f0, f1
/* 0000F9E4 EC020024 */ fdivs f0, f2, f0
/* 0000F9E8 EC03002A */ fadds f0, f3, f0
/* 0000F9EC D001002C */ stfs f0, 0x2c(r1)
/* 0000F9F0 A008000A */ lhz r0, 0xa(r8)
/* 0000F9F4 C05B4464 */ lfs f2, 0x4464(r27)
/* 0000F9F8 3B7B4448 */ addi r27, r27, 0x4448
/* 0000F9FC 90010084 */ stw r0, 0x84(r1)
/* 0000FA00 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 0000FA04 93E10080 */ stw r31, 0x80(r1)
/* 0000FA08 C0610028 */ lfs f3, 0x28(r1)
/* 0000FA0C C8010080 */ lfd f0, 0x80(r1)
/* 0000FA10 EC000828 */ fsubs f0, f0, f1
/* 0000FA14 EC020024 */ fdivs f0, f2, f0
/* 0000FA18 EC03002A */ fadds f0, f3, f0
/* 0000FA1C D0010030 */ stfs f0, 0x30(r1)
/* 0000FA20 C021002C */ lfs f1, 0x2c(r1)
/* 0000FA24 C0010024 */ lfs f0, 0x24(r1)
/* 0000FA28 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FA2C EC010028 */ fsubs f0, f1, f0
/* 0000FA30 EC020032 */ fmuls f0, f2, f0
/* 0000FA34 D001001C */ stfs f0, 0x1c(r1)
/* 0000FA38 C0210030 */ lfs f1, 0x30(r1)
/* 0000FA3C C0010028 */ lfs f0, 0x28(r1)
/* 0000FA40 C05A0044 */ lfs f2, 0x44(r26)
/* 0000FA44 EC010028 */ fsubs f0, f1, f0
/* 0000FA48 EC020032 */ fmuls f0, f2, f0
/* 0000FA4C D0010020 */ stfs f0, 0x20(r1)
/* 0000FA50 4BFF0739 */ bl nlSprPut
/* 0000FA54 801B0004 */ lwz r0, 4(r27)
/* 0000FA58 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000FA5C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000FA60 54002834 */ slwi r0, r0, 5
/* 0000FA64 7D3D0214 */ add r9, r29, r0
/* 0000FA68 80094788 */ lwz r0, 0x4788(r9)
/* 0000FA6C 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000FA70 3C800000 */ lis r4, lbl_00011EC8@ha
/* 0000FA74 9001000C */ stw r0, 0xc(r1)
/* 0000FA78 8101000C */ lwz r8, 0xc(r1)
/* 0000FA7C C0294790 */ lfs f1, 0x4790(r9)
/* 0000FA80 5500C63E */ rlwinm r0, r8, 0x18, 0x18, 0x1f
/* 0000FA84 C01A0040 */ lfs f0, 0x40(r26)
/* 0000FA88 1C000018 */ mulli r0, r0, 0x18
/* 0000FA8C C05A0004 */ lfs f2, 4(r26)
/* 0000FA90 EC010032 */ fmuls f0, f1, f0
/* 0000FA94 7C7C002E */ lwzx r3, r28, r0
/* 0000FA98 55002536 */ rlwinm r0, r8, 4, 0x14, 0x1b
/* 0000FA9C EC02002A */ fadds f0, f2, f0
/* 0000FAA0 81030004 */ lwz r8, 4(r3)
/* 0000FAA4 3861000C */ addi r3, r1, 0xc
/* 0000FAA8 D0010010 */ stfs f0, 0x10(r1)
/* 0000FAAC 7D080214 */ add r8, r8, r0
/* 0000FAB0 C0294794 */ lfs f1, 0x4794(r9)
/* 0000FAB4 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FAB8 C05A0008 */ lfs f2, 8(r26)
/* 0000FABC EC010032 */ fmuls f0, f1, f0
/* 0000FAC0 EC02002A */ fadds f0, f2, f0
/* 0000FAC4 D0010014 */ stfs f0, 0x14(r1)
/* 0000FAC8 C03A004C */ lfs f1, 0x4c(r26)
/* 0000FACC C81E0190 */ lfd f0, 0x190(r30)
/* 0000FAD0 FC010028 */ fsub f0, f1, f0
/* 0000FAD4 FC000018 */ frsp f0, f0
/* 0000FAD8 D0010018 */ stfs f0, 0x18(r1)
/* 0000FADC A0080008 */ lhz r0, 8(r8)
/* 0000FAE0 C8270000 */ lfd f1, lbl_00011EC8@l(r7)
/* 0000FAE4 9001007C */ stw r0, 0x7c(r1)
/* 0000FAE8 C0494798 */ lfs f2, 0x4798(r9)
/* 0000FAEC 93E10078 */ stw r31, 0x78(r1)
/* 0000FAF0 C8010078 */ lfd f0, 0x78(r1)
/* 0000FAF4 EC000828 */ fsubs f0, f0, f1
/* 0000FAF8 EC020024 */ fdivs f0, f2, f0
/* 0000FAFC D0010024 */ stfs f0, 0x24(r1)
/* 0000FB00 A008000A */ lhz r0, 0xa(r8)
/* 0000FB04 C8260000 */ lfd f1, lbl_00011EC8@l(r6)
/* 0000FB08 90010074 */ stw r0, 0x74(r1)
/* 0000FB0C C049479C */ lfs f2, 0x479c(r9)
/* 0000FB10 93E10070 */ stw r31, 0x70(r1)
/* 0000FB14 C8010070 */ lfd f0, 0x70(r1)
/* 0000FB18 EC000828 */ fsubs f0, f0, f1
/* 0000FB1C EC020024 */ fdivs f0, f2, f0
/* 0000FB20 D0010028 */ stfs f0, 0x28(r1)
/* 0000FB24 A0080008 */ lhz r0, 8(r8)
/* 0000FB28 C8250000 */ lfd f1, lbl_00011EC8@l(r5)
/* 0000FB2C 9001006C */ stw r0, 0x6c(r1)
/* 0000FB30 C04947A0 */ lfs f2, 0x47a0(r9)
/* 0000FB34 93E10068 */ stw r31, 0x68(r1)
/* 0000FB38 C0610024 */ lfs f3, 0x24(r1)
/* 0000FB3C C8010068 */ lfd f0, 0x68(r1)
/* 0000FB40 EC000828 */ fsubs f0, f0, f1
/* 0000FB44 EC020024 */ fdivs f0, f2, f0
/* 0000FB48 EC03002A */ fadds f0, f3, f0
/* 0000FB4C D001002C */ stfs f0, 0x2c(r1)
/* 0000FB50 A008000A */ lhz r0, 0xa(r8)
/* 0000FB54 C8240000 */ lfd f1, lbl_00011EC8@l(r4)
/* 0000FB58 90010064 */ stw r0, 0x64(r1)
/* 0000FB5C C04947A4 */ lfs f2, 0x47a4(r9)
/* 0000FB60 93E10060 */ stw r31, 0x60(r1)
/* 0000FB64 C0610028 */ lfs f3, 0x28(r1)
/* 0000FB68 C8010060 */ lfd f0, 0x60(r1)
/* 0000FB6C EC000828 */ fsubs f0, f0, f1
/* 0000FB70 EC020024 */ fdivs f0, f2, f0
/* 0000FB74 EC03002A */ fadds f0, f3, f0
/* 0000FB78 D0010030 */ stfs f0, 0x30(r1)
/* 0000FB7C C021002C */ lfs f1, 0x2c(r1)
/* 0000FB80 C0010024 */ lfs f0, 0x24(r1)
/* 0000FB84 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FB88 EC010028 */ fsubs f0, f1, f0
/* 0000FB8C EC020032 */ fmuls f0, f2, f0
/* 0000FB90 D001001C */ stfs f0, 0x1c(r1)
/* 0000FB94 C0210030 */ lfs f1, 0x30(r1)
/* 0000FB98 C0010028 */ lfs f0, 0x28(r1)
/* 0000FB9C C05A0044 */ lfs f2, 0x44(r26)
/* 0000FBA0 EC010028 */ fsubs f0, f1, f0
/* 0000FBA4 EC020032 */ fmuls f0, f2, f0
/* 0000FBA8 D0010020 */ stfs f0, 0x20(r1)
/* 0000FBAC 4BFF05DD */ bl nlSprPut
/* 0000FBB0 801A0048 */ lwz r0, 0x48(r26)
/* 0000FBB4 2C000001 */ cmpwi r0, 1
/* 0000FBB8 40820030 */ bne lbl_0000FBE8
/* 0000FBBC 38000000 */ li r0, 0
/* 0000FBC0 981A0070 */ stb r0, 0x70(r26)
/* 0000FBC4 981A0071 */ stb r0, 0x71(r26)
/* 0000FBC8 981A0072 */ stb r0, 0x72(r26)
/* 0000FBCC 881A0071 */ lbz r0, 0x71(r26)
/* 0000FBD0 887A0070 */ lbz r3, 0x70(r26)
/* 0000FBD4 5400402E */ slwi r0, r0, 8
/* 0000FBD8 889A0072 */ lbz r4, 0x72(r26)
/* 0000FBDC 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000FBE0 7C800378 */ or r0, r4, r0
/* 0000FBE4 90010048 */ stw r0, 0x48(r1)
lbl_0000FBE8:
/* 0000FBE8 807A0048 */ lwz r3, 0x48(r26)
/* 0000FBEC 2C030005 */ cmpwi r3, 5
/* 0000FBF0 41820010 */ beq lbl_0000FC00
/* 0000FBF4 3803FFF8 */ addi r0, r3, -8
/* 0000FBF8 28000001 */ cmplwi r0, 1
/* 0000FBFC 418100F8 */ bgt lbl_0000FCF4
lbl_0000FC00:
/* 0000FC00 38000410 */ li r0, 0x410
/* 0000FC04 9001000C */ stw r0, 0xc(r1)
/* 0000FC08 C01A0004 */ lfs f0, 4(r26)
/* 0000FC0C D0010010 */ stfs f0, 0x10(r1)
/* 0000FC10 C01A0008 */ lfs f0, 8(r26)
/* 0000FC14 D0010014 */ stfs f0, 0x14(r1)
/* 0000FC18 C03A004C */ lfs f1, 0x4c(r26)
/* 0000FC1C C81E0330 */ lfd f0, 0x330(r30)
/* 0000FC20 FC010028 */ fsub f0, f1, f0
/* 0000FC24 FC000018 */ frsp f0, f0
/* 0000FC28 D0010018 */ stfs f0, 0x18(r1)
/* 0000FC2C C83E03C8 */ lfd f1, 0x3c8(r30)
/* 0000FC30 C01A0040 */ lfs f0, 0x40(r26)
/* 0000FC34 FC010032 */ fmul f0, f1, f0
/* 0000FC38 FC000018 */ frsp f0, f0
/* 0000FC3C D001001C */ stfs f0, 0x1c(r1)
/* 0000FC40 C83E03C8 */ lfd f1, 0x3c8(r30)
/* 0000FC44 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FC48 FC010032 */ fmul f0, f1, f0
/* 0000FC4C FC000018 */ frsp f0, f0
/* 0000FC50 D0010020 */ stfs f0, 0x20(r1)
/* 0000FC54 C01E0008 */ lfs f0, 8(r30)
/* 0000FC58 D0010024 */ stfs f0, 0x24(r1)
/* 0000FC5C C01E0008 */ lfs f0, 8(r30)
/* 0000FC60 D0010028 */ stfs f0, 0x28(r1)
/* 0000FC64 C01E000C */ lfs f0, 0xc(r30)
/* 0000FC68 D001002C */ stfs f0, 0x2c(r1)
/* 0000FC6C C01E000C */ lfs f0, 0xc(r30)
/* 0000FC70 D0010030 */ stfs f0, 0x30(r1)
/* 0000FC74 801A0048 */ lwz r0, 0x48(r26)
/* 0000FC78 2C000005 */ cmpwi r0, 5
/* 0000FC7C 4082000C */ bne lbl_0000FC88
/* 0000FC80 C83E0030 */ lfd f1, 0x30(r30)
/* 0000FC84 48000028 */ b lbl_0000FCAC
lbl_0000FC88:
/* 0000FC88 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000FC8C 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000FC90 5403482C */ slwi r3, r0, 9
/* 0000FC94 4BFF04F5 */ bl mathutil_sin
/* 0000FC98 FC400A10 */ fabs f2, f1
/* 0000FC9C C83E0400 */ lfd f1, 0x400(r30)
/* 0000FCA0 C81E03F8 */ lfd f0, 0x3f8(r30)
/* 0000FCA4 FC2100B2 */ fmul f1, f1, f2
/* 0000FCA8 FC200828 */ fsub f1, f0, f1
lbl_0000FCAC:
/* 0000FCAC C01A006C */ lfs f0, 0x6c(r26)
/* 0000FCB0 38000000 */ li r0, 0
/* 0000FCB4 3861000C */ addi r3, r1, 0xc
/* 0000FCB8 FC000072 */ fmul f0, f0, f1
/* 0000FCBC FC000018 */ frsp f0, f0
/* 0000FCC0 D0010038 */ stfs f0, 0x38(r1)
/* 0000FCC4 C03E0010 */ lfs f1, 0x10(r30)
/* 0000FCC8 C01A006C */ lfs f0, 0x6c(r26)
/* 0000FCCC EC010032 */ fmuls f0, f1, f0
/* 0000FCD0 FC00001E */ fctiwz f0, f0
/* 0000FCD4 D8010060 */ stfd f0, 0x60(r1)
/* 0000FCD8 80810064 */ lwz r4, 0x64(r1)
/* 0000FCDC 5484C00E */ slwi r4, r4, 0x18
/* 0000FCE0 648400FF */ oris r4, r4, 0xff
/* 0000FCE4 6084FFFF */ ori r4, r4, 0xffff
/* 0000FCE8 90810044 */ stw r4, 0x44(r1)
/* 0000FCEC 90010048 */ stw r0, 0x48(r1)
/* 0000FCF0 4BFF0499 */ bl nlSprPut
lbl_0000FCF4:
/* 0000FCF4 807A0048 */ lwz r3, 0x48(r26)
/* 0000FCF8 2C030005 */ cmpwi r3, 5
/* 0000FCFC 41820010 */ beq lbl_0000FD0C
/* 0000FD00 3803FFF8 */ addi r0, r3, -8
/* 0000FD04 28000003 */ cmplwi r0, 3
/* 0000FD08 418100F0 */ bgt lbl_0000FDF8
lbl_0000FD0C:
/* 0000FD0C 881A000F */ lbz r0, 0xf(r26)
/* 0000FD10 7C000774 */ extsb r0, r0
/* 0000FD14 2C000040 */ cmpwi r0, 0x40
/* 0000FD18 41820038 */ beq lbl_0000FD50
/* 0000FD1C 40800010 */ bge lbl_0000FD2C
/* 0000FD20 2C00003F */ cmpwi r0, 0x3f
/* 0000FD24 40800018 */ bge lbl_0000FD3C
/* 0000FD28 480000D0 */ b lbl_0000FDF8
lbl_0000FD2C:
/* 0000FD2C 2C000042 */ cmpwi r0, 0x42
/* 0000FD30 408000C8 */ bge lbl_0000FDF8
/* 0000FD34 48000030 */ b lbl_0000FD64
/* 0000FD38 480000C0 */ b lbl_0000FDF8
lbl_0000FD3C:
/* 0000FD3C 38600006 */ li r3, 6
/* 0000FD40 4BFF0449 */ bl is_minigame_unlocked
/* 0000FD44 2C030000 */ cmpwi r3, 0
/* 0000FD48 4182002C */ beq lbl_0000FD74
/* 0000FD4C 480000AC */ b lbl_0000FDF8
lbl_0000FD50:
/* 0000FD50 38600007 */ li r3, 7
/* 0000FD54 4BFF0435 */ bl is_minigame_unlocked
/* 0000FD58 2C030000 */ cmpwi r3, 0
/* 0000FD5C 41820018 */ beq lbl_0000FD74
/* 0000FD60 48000098 */ b lbl_0000FDF8
lbl_0000FD64:
/* 0000FD64 38600008 */ li r3, 8
/* 0000FD68 4BFF0421 */ bl is_minigame_unlocked
/* 0000FD6C 2C030000 */ cmpwi r3, 0
/* 0000FD70 40820088 */ bne lbl_0000FDF8
lbl_0000FD74:
/* 0000FD74 4BFF0415 */ bl reset_text_draw_settings
/* 0000FD78 38600001 */ li r3, 1
/* 0000FD7C 4BFF040D */ bl set_text_font
/* 0000FD80 C85E0378 */ lfd f2, 0x378(r30)
/* 0000FD84 C03A0040 */ lfs f1, 0x40(r26)
/* 0000FD88 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FD8C FC220072 */ fmul f1, f2, f1
/* 0000FD90 FC420032 */ fmul f2, f2, f0
/* 0000FD94 FC200818 */ frsp f1, f1
/* 0000FD98 FC401018 */ frsp f2, f2
/* 0000FD9C 4BFF03ED */ bl set_text_scale
/* 0000FDA0 3C600100 */ lis r3, 0x100
/* 0000FDA4 3863FF00 */ addi r3, r3, -256
/* 0000FDA8 4BFF03E1 */ bl set_text_mul_color
/* 0000FDAC C03E003C */ lfs f1, 0x3c(r30)
/* 0000FDB0 4BFF03D9 */ bl func_80071B1C
/* 0000FDB4 C03A006C */ lfs f1, 0x6c(r26)
/* 0000FDB8 4BFF03D1 */ bl set_text_opacity
/* 0000FDBC C07E0408 */ lfs f3, 0x408(r30)
/* 0000FDC0 C05A0040 */ lfs f2, 0x40(r26)
/* 0000FDC4 C03E040C */ lfs f1, 0x40c(r30)
/* 0000FDC8 C01A0044 */ lfs f0, 0x44(r26)
/* 0000FDCC EC6300B2 */ fmuls f3, f3, f2
/* 0000FDD0 C09A0004 */ lfs f4, 4(r26)
/* 0000FDD4 EC010032 */ fmuls f0, f1, f0
/* 0000FDD8 C05A0008 */ lfs f2, 8(r26)
/* 0000FDDC EC24182A */ fadds f1, f4, f3
/* 0000FDE0 EC42002A */ fadds f2, f2, f0
/* 0000FDE4 4BFF03A5 */ bl set_text_pos
/* 0000FDE8 387D48E8 */ addi r3, r29, 0x48e8
/* 0000FDEC 4CC63182 */ crclr 6
/* 0000FDF0 388009C4 */ li r4, 0x9c4
/* 0000FDF4 4BFF0395 */ bl sprite_printf
lbl_0000FDF8:
/* 0000FDF8 BB4100A0 */ lmw r26, 0xa0(r1)
/* 0000FDFC 800100BC */ lwz r0, 0xbc(r1)
/* 0000FE00 382100B8 */ addi r1, r1, 0xb8
/* 0000FE04 7C0803A6 */ mtlr r0
/* 0000FE08 4E800020 */ blr 
