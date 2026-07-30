/* 00012E00 7C0802A6 */ mflr r0
/* 00012E04 3C800000 */ lis r4, debugFlags@ha
/* 00012E08 90010004 */ stw r0, 4(r1)
/* 00012E0C 9421FF70 */ stwu r1, -0x90(r1)
/* 00012E10 DBE10088 */ stfd f31, 0x88(r1)
/* 00012E14 DBC10080 */ stfd f30, 0x80(r1)
/* 00012E18 93E1007C */ stw r31, 0x7c(r1)
/* 00012E1C 93C10078 */ stw r30, 0x78(r1)
/* 00012E20 3BC30000 */ addi r30, r3, 0
/* 00012E24 80040000 */ lwz r0, debugFlags@l(r4)
/* 00012E28 3C800000 */ lis r4, lbl_0001C430@ha
/* 00012E2C 3BE40000 */ addi r31, r4, lbl_0001C430@l
/* 00012E30 7000000A */ andi. r0, r0, 0xa
/* 00012E34 40820258 */ bne lbl_0001308C
/* 00012E38 A87E0050 */ lha r3, 0x50(r30)
/* 00012E3C 3803FFFF */ addi r0, r3, -1
/* 00012E40 B01E0050 */ sth r0, 0x50(r30)
/* 00012E44 A81E0050 */ lha r0, 0x50(r30)
/* 00012E48 2C000000 */ cmpwi r0, 0
/* 00012E4C 4082000C */ bne lbl_00012E58
/* 00012E50 38000004 */ li r0, 4
/* 00012E54 981E001F */ stb r0, 0x1f(r30)
lbl_00012E58:
/* 00012E58 A89E0050 */ lha r4, 0x50(r30)
/* 00012E5C 3CA00000 */ lis r5, lbl_0001C470@ha
/* 00012E60 A81E0052 */ lha r0, 0x52(r30)
/* 00012E64 3C600000 */ lis r3, lbl_0001C470@ha
/* 00012E68 6C848000 */ xoris r4, r4, 0x8000
/* 00012E6C 6C008000 */ xoris r0, r0, 0x8000
/* 00012E70 90810074 */ stw r4, 0x74(r1)
/* 00012E74 3D004330 */ lis r8, 0x4330
/* 00012E78 C8850000 */ lfd f4, lbl_0001C470@l(r5)
/* 00012E7C 9001006C */ stw r0, 0x6c(r1)
/* 00012E80 3CE00000 */ lis r7, lbl_0001C470@ha
/* 00012E84 C8230000 */ lfd f1, lbl_0001C470@l(r3)
/* 00012E88 3C800000 */ lis r4, lbl_0001C470@ha
/* 00012E8C 91010070 */ stw r8, 0x70(r1)
/* 00012E90 C87F0050 */ lfd f3, 0x50(r31)
/* 00012E94 3C600000 */ lis r3, lbl_0001C470@ha
/* 00012E98 91010068 */ stw r8, 0x68(r1)
/* 00012E9C 3CA00000 */ lis r5, lbl_0001C470@ha
/* 00012EA0 C8410070 */ lfd f2, 0x70(r1)
/* 00012EA4 C8010068 */ lfd f0, 0x68(r1)
/* 00012EA8 EC422028 */ fsubs f2, f2, f4
/* 00012EAC C8BF0048 */ lfd f5, 0x48(r31)
/* 00012EB0 EC000828 */ fsubs f0, f0, f1
/* 00012EB4 C83F0058 */ lfd f1, 0x58(r31)
/* 00012EB8 ECC20024 */ fdivs f6, f2, f0
/* 00012EBC C05E0074 */ lfs f2, 0x74(r30)
/* 00012EC0 C01E0054 */ lfs f0, 0x54(r30)
/* 00012EC4 FC8301B2 */ fmul f4, f3, f6
/* 00012EC8 EC6601B2 */ fmuls f3, f6, f6
/* 00012ECC FC85202A */ fadd f4, f5, f4
/* 00012ED0 FFC400F2 */ fmul f30, f4, f3
/* 00012ED4 FFC0F018 */ frsp f30, f30
/* 00012ED8 FFE1F028 */ fsub f31, f1, f30
/* 00012EDC EC0007B2 */ fmuls f0, f0, f30
/* 00012EE0 FC2207F2 */ fmul f1, f2, f31
/* 00012EE4 FC01002A */ fadd f0, f1, f0
/* 00012EE8 FC000018 */ frsp f0, f0
/* 00012EEC D01E000C */ stfs f0, 0xc(r30)
/* 00012EF0 C03E0078 */ lfs f1, 0x78(r30)
/* 00012EF4 C01E0058 */ lfs f0, 0x58(r30)
/* 00012EF8 FC2107F2 */ fmul f1, f1, f31
/* 00012EFC EC0007B2 */ fmuls f0, f0, f30
/* 00012F00 FC01002A */ fadd f0, f1, f0
/* 00012F04 FC000018 */ frsp f0, f0
/* 00012F08 D01E0010 */ stfs f0, 0x10(r30)
/* 00012F0C C03E007C */ lfs f1, 0x7c(r30)
/* 00012F10 C01E005C */ lfs f0, 0x5c(r30)
/* 00012F14 FC2107F2 */ fmul f1, f1, f31
/* 00012F18 EC0007B2 */ fmuls f0, f0, f30
/* 00012F1C FC01002A */ fadd f0, f1, f0
/* 00012F20 FC000018 */ frsp f0, f0
/* 00012F24 D01E0014 */ stfs f0, 0x14(r30)
/* 00012F28 813E0068 */ lwz r9, 0x68(r30)
/* 00012F2C 801E0088 */ lwz r0, 0x88(r30)
/* 00012F30 6D268000 */ xoris r6, r9, 0x8000
/* 00012F34 C8470000 */ lfd f2, lbl_0001C470@l(r7)
/* 00012F38 7C090050 */ subf r0, r9, r0
/* 00012F3C 90C10064 */ stw r6, 0x64(r1)
/* 00012F40 7C000734 */ extsh r0, r0
/* 00012F44 C8240000 */ lfd f1, lbl_0001C470@l(r4)
/* 00012F48 6C008000 */ xoris r0, r0, 0x8000
/* 00012F4C 91010060 */ stw r8, 0x60(r1)
/* 00012F50 9001005C */ stw r0, 0x5c(r1)
/* 00012F54 C8010060 */ lfd f0, 0x60(r1)
/* 00012F58 91010058 */ stw r8, 0x58(r1)
/* 00012F5C FC401028 */ fsub f2, f0, f2
/* 00012F60 C8010058 */ lfd f0, 0x58(r1)
/* 00012F64 FC000828 */ fsub f0, f0, f1
/* 00012F68 FC1F0032 */ fmul f0, f31, f0
/* 00012F6C FC02002A */ fadd f0, f2, f0
/* 00012F70 FC00001E */ fctiwz f0, f0
/* 00012F74 D8010050 */ stfd f0, 0x50(r1)
/* 00012F78 80010054 */ lwz r0, 0x54(r1)
/* 00012F7C B01E0018 */ sth r0, 0x18(r30)
/* 00012F80 80DE006C */ lwz r6, 0x6c(r30)
/* 00012F84 801E008C */ lwz r0, 0x8c(r30)
/* 00012F88 6CC48000 */ xoris r4, r6, 0x8000
/* 00012F8C C8230000 */ lfd f1, lbl_0001C470@l(r3)
/* 00012F90 7C060050 */ subf r0, r6, r0
/* 00012F94 9081004C */ stw r4, 0x4c(r1)
/* 00012F98 6C008000 */ xoris r0, r0, 0x8000
/* 00012F9C C8450000 */ lfd f2, lbl_0001C470@l(r5)
/* 00012FA0 90010044 */ stw r0, 0x44(r1)
/* 00012FA4 91010040 */ stw r8, 0x40(r1)
/* 00012FA8 C8010040 */ lfd f0, 0x40(r1)
/* 00012FAC 91010048 */ stw r8, 0x48(r1)
/* 00012FB0 FC000828 */ fsub f0, f0, f1
/* 00012FB4 C8210048 */ lfd f1, 0x48(r1)
/* 00012FB8 FC1F0032 */ fmul f0, f31, f0
/* 00012FBC FC211028 */ fsub f1, f1, f2
/* 00012FC0 FC01002A */ fadd f0, f1, f0
/* 00012FC4 FC00001E */ fctiwz f0, f0
/* 00012FC8 D8010038 */ stfd f0, 0x38(r1)
/* 00012FCC 8001003C */ lwz r0, 0x3c(r1)
/* 00012FD0 B01E001A */ sth r0, 0x1a(r30)
/* 00012FD4 80BE0070 */ lwz r5, 0x70(r30)
/* 00012FD8 3C600000 */ lis r3, lbl_0001C470@ha
/* 00012FDC 801E0090 */ lwz r0, 0x90(r30)
/* 00012FE0 6CA48000 */ xoris r4, r5, 0x8000
/* 00012FE4 C8230000 */ lfd f1, lbl_0001C470@l(r3)
/* 00012FE8 7C050050 */ subf r0, r5, r0
/* 00012FEC 90810034 */ stw r4, 0x34(r1)
/* 00012FF0 7C000734 */ extsh r0, r0
/* 00012FF4 6C008000 */ xoris r0, r0, 0x8000
/* 00012FF8 91010030 */ stw r8, 0x30(r1)
/* 00012FFC 3C600000 */ lis r3, lbl_0001C470@ha
/* 00013000 9001002C */ stw r0, 0x2c(r1)
/* 00013004 C8630000 */ lfd f3, lbl_0001C470@l(r3)
/* 00013008 387E000C */ addi r3, r30, 0xc
/* 0001300C 91010028 */ stw r8, 0x28(r1)
/* 00013010 C8410030 */ lfd f2, 0x30(r1)
/* 00013014 C8010028 */ lfd f0, 0x28(r1)
/* 00013018 FC421828 */ fsub f2, f2, f3
/* 0001301C FC000828 */ fsub f0, f0, f1
/* 00013020 FC1F0032 */ fmul f0, f31, f0
/* 00013024 FC02002A */ fadd f0, f2, f0
/* 00013028 FC00001E */ fctiwz f0, f0
/* 0001302C D8010020 */ stfd f0, 0x20(r1)
/* 00013030 80010024 */ lwz r0, 0x24(r1)
/* 00013034 B01E001C */ sth r0, 0x1c(r30)
/* 00013038 4BFED12D */ bl mathutil_mtxA_from_translate
/* 0001303C A87E001A */ lha r3, 0x1a(r30)
/* 00013040 4BFED125 */ bl mathutil_mtxA_rotate_y
/* 00013044 A87E0018 */ lha r3, 0x18(r30)
/* 00013048 4BFED11D */ bl mathutil_mtxA_rotate_x
/* 0001304C A87E001C */ lha r3, 0x1c(r30)
/* 00013050 4BFED115 */ bl mathutil_mtxA_rotate_z
/* 00013054 C01F0018 */ lfs f0, 0x18(r31)
/* 00013058 389E0000 */ addi r4, r30, 0
/* 0001305C 38610010 */ addi r3, r1, 0x10
/* 00013060 D0010010 */ stfs f0, 0x10(r1)
/* 00013064 C01F0018 */ lfs f0, 0x18(r31)
/* 00013068 D0010014 */ stfs f0, 0x14(r1)
/* 0001306C C83F0060 */ lfd f1, 0x60(r31)
/* 00013070 C01E0060 */ lfs f0, 0x60(r30)
/* 00013074 FC2107F2 */ fmul f1, f1, f31
/* 00013078 EC0007B2 */ fmuls f0, f0, f30
/* 0001307C FC01002A */ fadd f0, f1, f0
/* 00013080 FC000018 */ frsp f0, f0
/* 00013084 D0010018 */ stfs f0, 0x18(r1)
/* 00013088 4BFED0DD */ bl mathutil_mtxA_tf_point
lbl_0001308C:
/* 0001308C 80010094 */ lwz r0, 0x94(r1)
/* 00013090 CBE10088 */ lfd f31, 0x88(r1)
/* 00013094 CBC10080 */ lfd f30, 0x80(r1)
/* 00013098 7C0803A6 */ mtlr r0
/* 0001309C 83E1007C */ lwz r31, 0x7c(r1)
/* 000130A0 83C10078 */ lwz r30, 0x78(r1)
/* 000130A4 38210090 */ addi r1, r1, 0x90
/* 000130A8 4E800020 */ blr 
