/* 0000ECB0 9421FF58 */ stwu r1, -0xa8(r1)
/* 0000ECB4 3CA00000 */ lis r5, lbl_00012730@ha
/* 0000ECB8 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000ECBC 93E100A4 */ stw r31, 0xa4(r1)
/* 0000ECC0 38050000 */ addi r0, r5, lbl_00012730@l
/* 0000ECC4 38630000 */ addi r3, r3, lbl_00011CB0@l
/* 0000ECC8 80E40048 */ lwz r7, 0x48(r4)
/* 0000ECCC 2807000B */ cmplwi r7, 0xb
/* 0000ECD0 41810A90 */ bgt lbl_0000F760
/* 0000ECD4 3CA00000 */ lis r5, lbl_00016B48@ha
/* 0000ECD8 38C50000 */ addi r6, r5, lbl_00016B48@l
/* 0000ECDC 54E5103A */ slwi r5, r7, 2
/* 0000ECE0 7CA6282E */ lwzx r5, r6, r5
/* 0000ECE4 7CA903A6 */ mtctr r5
/* 0000ECE8 4E800420 */ bctr 
lbl_0000ECEC:
/* 0000ECEC A0C4003C */ lhz r6, 0x3c(r4)
/* 0000ECF0 28060003 */ cmplwi r6, 3
/* 0000ECF4 41800080 */ blt lbl_0000ED74
/* 0000ECF8 28060006 */ cmplwi r6, 6
/* 0000ECFC 41810078 */ bgt lbl_0000ED74
/* 0000ED00 3CA00000 */ lis r5, lbl_801EEDA8@ha
/* 0000ED04 38A50000 */ addi r5, r5, lbl_801EEDA8@l
/* 0000ED08 80A50040 */ lwz r5, 0x40(r5)
/* 0000ED0C 2C050002 */ cmpwi r5, 2
/* 0000ED10 40820064 */ bne lbl_0000ED74
/* 0000ED14 54C51838 */ slwi r5, r6, 3
/* 0000ED18 C00303B8 */ lfs f0, 0x3b8(r3)
/* 0000ED1C 7CA02A14 */ add r5, r0, r5
/* 0000ED20 C0640004 */ lfs f3, 4(r4)
/* 0000ED24 C025432C */ lfs f1, 0x432c(r5)
/* 0000ED28 C8430000 */ lfd f2, 0(r3)
/* 0000ED2C EC010028 */ fsubs f0, f1, f0
/* 0000ED30 EC001828 */ fsubs f0, f0, f3
/* 0000ED34 FC020032 */ fmul f0, f2, f0
/* 0000ED38 FC03002A */ fadd f0, f3, f0
/* 0000ED3C FC000018 */ frsp f0, f0
/* 0000ED40 D0040004 */ stfs f0, 4(r4)
/* 0000ED44 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000ED48 C0440008 */ lfs f2, 8(r4)
/* 0000ED4C 54A51838 */ slwi r5, r5, 3
/* 0000ED50 C8230000 */ lfd f1, 0(r3)
/* 0000ED54 7CA02A14 */ add r5, r0, r5
/* 0000ED58 C0054330 */ lfs f0, 0x4330(r5)
/* 0000ED5C EC001028 */ fsubs f0, f0, f2
/* 0000ED60 FC010032 */ fmul f0, f1, f0
/* 0000ED64 FC02002A */ fadd f0, f2, f0
/* 0000ED68 FC000018 */ frsp f0, f0
/* 0000ED6C D0040008 */ stfs f0, 8(r4)
/* 0000ED70 480000DC */ b lbl_0000EE4C
lbl_0000ED74:
/* 0000ED74 28060003 */ cmplwi r6, 3
/* 0000ED78 41800080 */ blt lbl_0000EDF8
/* 0000ED7C 28060006 */ cmplwi r6, 6
/* 0000ED80 41810078 */ bgt lbl_0000EDF8
/* 0000ED84 3CA00000 */ lis r5, modeCtrl@ha
/* 0000ED88 38A50000 */ addi r5, r5, modeCtrl@l
/* 0000ED8C 80A50028 */ lwz r5, 0x28(r5)
/* 0000ED90 2C050006 */ cmpwi r5, 6
/* 0000ED94 40820064 */ bne lbl_0000EDF8
/* 0000ED98 54C51838 */ slwi r5, r6, 3
/* 0000ED9C C02303BC */ lfs f1, 0x3bc(r3)
/* 0000EDA0 7CA02A14 */ add r5, r0, r5
/* 0000EDA4 C0640004 */ lfs f3, 4(r4)
/* 0000EDA8 C005432C */ lfs f0, 0x432c(r5)
/* 0000EDAC C8430000 */ lfd f2, 0(r3)
/* 0000EDB0 EC01002A */ fadds f0, f1, f0
/* 0000EDB4 EC001828 */ fsubs f0, f0, f3
/* 0000EDB8 FC020032 */ fmul f0, f2, f0
/* 0000EDBC FC03002A */ fadd f0, f3, f0
/* 0000EDC0 FC000018 */ frsp f0, f0
/* 0000EDC4 D0040004 */ stfs f0, 4(r4)
/* 0000EDC8 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000EDCC C0440008 */ lfs f2, 8(r4)
/* 0000EDD0 54A51838 */ slwi r5, r5, 3
/* 0000EDD4 C8230000 */ lfd f1, 0(r3)
/* 0000EDD8 7CA02A14 */ add r5, r0, r5
/* 0000EDDC C0054330 */ lfs f0, 0x4330(r5)
/* 0000EDE0 EC001028 */ fsubs f0, f0, f2
/* 0000EDE4 FC010032 */ fmul f0, f1, f0
/* 0000EDE8 FC02002A */ fadd f0, f2, f0
/* 0000EDEC FC000018 */ frsp f0, f0
/* 0000EDF0 D0040008 */ stfs f0, 8(r4)
/* 0000EDF4 48000058 */ b lbl_0000EE4C
lbl_0000EDF8:
/* 0000EDF8 54C51838 */ slwi r5, r6, 3
/* 0000EDFC C0440004 */ lfs f2, 4(r4)
/* 0000EE00 7CA02A14 */ add r5, r0, r5
/* 0000EE04 C8230000 */ lfd f1, 0(r3)
/* 0000EE08 C005432C */ lfs f0, 0x432c(r5)
/* 0000EE0C EC001028 */ fsubs f0, f0, f2
/* 0000EE10 FC010032 */ fmul f0, f1, f0
/* 0000EE14 FC02002A */ fadd f0, f2, f0
/* 0000EE18 FC000018 */ frsp f0, f0
/* 0000EE1C D0040004 */ stfs f0, 4(r4)
/* 0000EE20 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000EE24 C0440008 */ lfs f2, 8(r4)
/* 0000EE28 54A51838 */ slwi r5, r5, 3
/* 0000EE2C C8230000 */ lfd f1, 0(r3)
/* 0000EE30 7CA02A14 */ add r5, r0, r5
/* 0000EE34 C0054330 */ lfs f0, 0x4330(r5)
/* 0000EE38 EC001028 */ fsubs f0, f0, f2
/* 0000EE3C FC010032 */ fmul f0, f1, f0
/* 0000EE40 FC02002A */ fadd f0, f2, f0
/* 0000EE44 FC000018 */ frsp f0, f0
/* 0000EE48 D0040008 */ stfs f0, 8(r4)
lbl_0000EE4C:
/* 0000EE4C 88C4000C */ lbz r6, 0xc(r4)
/* 0000EE50 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EE54 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000EE58 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000EE5C 20060080 */ subfic r0, r6, 0x80
/* 0000EE60 6C008000 */ xoris r0, r0, 0x8000
/* 0000EE64 90C1009C */ stw r6, 0x9c(r1)
/* 0000EE68 3D404330 */ lis r10, 0x4330
/* 0000EE6C C8650000 */ lfd f3, lbl_00011EC8@l(r5)
/* 0000EE70 90010094 */ stw r0, 0x94(r1)
/* 0000EE74 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000EE78 C8430000 */ lfd f2, 0(r3)
/* 0000EE7C 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000EE80 91410090 */ stw r10, 0x90(r1)
/* 0000EE84 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000EE88 C8010090 */ lfd f0, 0x90(r1)
/* 0000EE8C 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000EE90 91410098 */ stw r10, 0x98(r1)
/* 0000EE94 38000000 */ li r0, 0
/* 0000EE98 FC000828 */ fsub f0, f0, f1
/* 0000EE9C C8210098 */ lfd f1, 0x98(r1)
/* 0000EEA0 FC020032 */ fmul f0, f2, f0
/* 0000EEA4 FC211828 */ fsub f1, f1, f3
/* 0000EEA8 FC01002A */ fadd f0, f1, f0
/* 0000EEAC FC00001E */ fctiwz f0, f0
/* 0000EEB0 D8010088 */ stfd f0, 0x88(r1)
/* 0000EEB4 8121008C */ lwz r9, 0x8c(r1)
/* 0000EEB8 9924000C */ stb r9, 0xc(r4)
/* 0000EEBC 8924000D */ lbz r9, 0xd(r4)
/* 0000EEC0 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000EEC4 20E90080 */ subfic r7, r9, 0x80
/* 0000EEC8 91210084 */ stw r9, 0x84(r1)
/* 0000EECC 6CE78000 */ xoris r7, r7, 0x8000
/* 0000EED0 C8430000 */ lfd f2, 0(r3)
/* 0000EED4 90E1007C */ stw r7, 0x7c(r1)
/* 0000EED8 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000EEDC 91410078 */ stw r10, 0x78(r1)
/* 0000EEE0 C8010078 */ lfd f0, 0x78(r1)
/* 0000EEE4 91410080 */ stw r10, 0x80(r1)
/* 0000EEE8 FC000828 */ fsub f0, f0, f1
/* 0000EEEC C8210080 */ lfd f1, 0x80(r1)
/* 0000EEF0 FC020032 */ fmul f0, f2, f0
/* 0000EEF4 FC211828 */ fsub f1, f1, f3
/* 0000EEF8 FC01002A */ fadd f0, f1, f0
/* 0000EEFC FC00001E */ fctiwz f0, f0
/* 0000EF00 D8010070 */ stfd f0, 0x70(r1)
/* 0000EF04 80E10074 */ lwz r7, 0x74(r1)
/* 0000EF08 98E4000D */ stb r7, 0xd(r4)
/* 0000EF0C 88E4000E */ lbz r7, 0xe(r4)
/* 0000EF10 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000EF14 20A70080 */ subfic r5, r7, 0x80
/* 0000EF18 90E1006C */ stw r7, 0x6c(r1)
/* 0000EF1C 6CA58000 */ xoris r5, r5, 0x8000
/* 0000EF20 C8430000 */ lfd f2, 0(r3)
/* 0000EF24 90A10064 */ stw r5, 0x64(r1)
/* 0000EF28 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000EF2C 91410060 */ stw r10, 0x60(r1)
/* 0000EF30 C8010060 */ lfd f0, 0x60(r1)
/* 0000EF34 91410068 */ stw r10, 0x68(r1)
/* 0000EF38 FC000828 */ fsub f0, f0, f1
/* 0000EF3C C8210068 */ lfd f1, 0x68(r1)
/* 0000EF40 FC020032 */ fmul f0, f2, f0
/* 0000EF44 FC211828 */ fsub f1, f1, f3
/* 0000EF48 FC01002A */ fadd f0, f1, f0
/* 0000EF4C FC00001E */ fctiwz f0, f0
/* 0000EF50 D8010058 */ stfd f0, 0x58(r1)
/* 0000EF54 80A1005C */ lwz r5, 0x5c(r1)
/* 0000EF58 98A4000E */ stb r5, 0xe(r4)
/* 0000EF5C 98040070 */ stb r0, 0x70(r4)
/* 0000EF60 98040071 */ stb r0, 0x71(r4)
/* 0000EF64 98040072 */ stb r0, 0x72(r4)
/* 0000EF68 C0440040 */ lfs f2, 0x40(r4)
/* 0000EF6C C80303C0 */ lfd f0, 0x3c0(r3)
/* 0000EF70 C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000EF74 FC001028 */ fsub f0, f0, f2
/* 0000EF78 FC010032 */ fmul f0, f1, f0
/* 0000EF7C FC02002A */ fadd f0, f2, f0
/* 0000EF80 FC000018 */ frsp f0, f0
/* 0000EF84 D0040040 */ stfs f0, 0x40(r4)
/* 0000EF88 C0040040 */ lfs f0, 0x40(r4)
/* 0000EF8C D0040044 */ stfs f0, 0x44(r4)
/* 0000EF90 C044006C */ lfs f2, 0x6c(r4)
/* 0000EF94 C8030030 */ lfd f0, 0x30(r3)
/* 0000EF98 C8230000 */ lfd f1, 0(r3)
/* 0000EF9C FC001028 */ fsub f0, f0, f2
/* 0000EFA0 FC010032 */ fmul f0, f1, f0
/* 0000EFA4 FC02002A */ fadd f0, f2, f0
/* 0000EFA8 FC000018 */ frsp f0, f0
/* 0000EFAC D004006C */ stfs f0, 0x6c(r4)
/* 0000EFB0 480007B0 */ b lbl_0000F760
lbl_0000EFB4:
/* 0000EFB4 A0C4003C */ lhz r6, 0x3c(r4)
/* 0000EFB8 28060003 */ cmplwi r6, 3
/* 0000EFBC 41800088 */ blt lbl_0000F044
/* 0000EFC0 28060006 */ cmplwi r6, 6
/* 0000EFC4 41810080 */ bgt lbl_0000F044
/* 0000EFC8 3CA00000 */ lis r5, lbl_801EEDA8@ha
/* 0000EFCC 38A50000 */ addi r5, r5, lbl_801EEDA8@l
/* 0000EFD0 80A50040 */ lwz r5, 0x40(r5)
/* 0000EFD4 2C050002 */ cmpwi r5, 2
/* 0000EFD8 4082006C */ bne lbl_0000F044
/* 0000EFDC 54C51838 */ slwi r5, r6, 3
/* 0000EFE0 C00303B8 */ lfs f0, 0x3b8(r3)
/* 0000EFE4 7CA02A14 */ add r5, r0, r5
/* 0000EFE8 C0640004 */ lfs f3, 4(r4)
/* 0000EFEC C025432C */ lfs f1, 0x432c(r5)
/* 0000EFF0 C8430000 */ lfd f2, 0(r3)
/* 0000EFF4 EC010028 */ fsubs f0, f1, f0
/* 0000EFF8 EC001828 */ fsubs f0, f0, f3
/* 0000EFFC FC020032 */ fmul f0, f2, f0
/* 0000F000 FC03002A */ fadd f0, f3, f0
/* 0000F004 FC000018 */ frsp f0, f0
/* 0000F008 D0040004 */ stfs f0, 4(r4)
/* 0000F00C A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F010 C0030094 */ lfs f0, 0x94(r3)
/* 0000F014 54A51838 */ slwi r5, r5, 3
/* 0000F018 C0640008 */ lfs f3, 8(r4)
/* 0000F01C 7CA02A14 */ add r5, r0, r5
/* 0000F020 C8430000 */ lfd f2, 0(r3)
/* 0000F024 C0254330 */ lfs f1, 0x4330(r5)
/* 0000F028 EC010028 */ fsubs f0, f1, f0
/* 0000F02C EC001828 */ fsubs f0, f0, f3
/* 0000F030 FC020032 */ fmul f0, f2, f0
/* 0000F034 FC03002A */ fadd f0, f3, f0
/* 0000F038 FC000018 */ frsp f0, f0
/* 0000F03C D0040008 */ stfs f0, 8(r4)
/* 0000F040 480000E4 */ b lbl_0000F124
lbl_0000F044:
/* 0000F044 28060003 */ cmplwi r6, 3
/* 0000F048 41800080 */ blt lbl_0000F0C8
/* 0000F04C 28060006 */ cmplwi r6, 6
/* 0000F050 41810078 */ bgt lbl_0000F0C8
/* 0000F054 3CA00000 */ lis r5, modeCtrl@ha
/* 0000F058 38A50000 */ addi r5, r5, modeCtrl@l
/* 0000F05C 80A50028 */ lwz r5, 0x28(r5)
/* 0000F060 2C050006 */ cmpwi r5, 6
/* 0000F064 40820064 */ bne lbl_0000F0C8
/* 0000F068 54C51838 */ slwi r5, r6, 3
/* 0000F06C C02303BC */ lfs f1, 0x3bc(r3)
/* 0000F070 7CA02A14 */ add r5, r0, r5
/* 0000F074 C0640004 */ lfs f3, 4(r4)
/* 0000F078 C005432C */ lfs f0, 0x432c(r5)
/* 0000F07C C8430000 */ lfd f2, 0(r3)
/* 0000F080 EC01002A */ fadds f0, f1, f0
/* 0000F084 EC001828 */ fsubs f0, f0, f3
/* 0000F088 FC020032 */ fmul f0, f2, f0
/* 0000F08C FC03002A */ fadd f0, f3, f0
/* 0000F090 FC000018 */ frsp f0, f0
/* 0000F094 D0040004 */ stfs f0, 4(r4)
/* 0000F098 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F09C C0440008 */ lfs f2, 8(r4)
/* 0000F0A0 54A51838 */ slwi r5, r5, 3
/* 0000F0A4 C8230000 */ lfd f1, 0(r3)
/* 0000F0A8 7CA02A14 */ add r5, r0, r5
/* 0000F0AC C0054330 */ lfs f0, 0x4330(r5)
/* 0000F0B0 EC001028 */ fsubs f0, f0, f2
/* 0000F0B4 FC010032 */ fmul f0, f1, f0
/* 0000F0B8 FC02002A */ fadd f0, f2, f0
/* 0000F0BC FC000018 */ frsp f0, f0
/* 0000F0C0 D0040008 */ stfs f0, 8(r4)
/* 0000F0C4 48000060 */ b lbl_0000F124
lbl_0000F0C8:
/* 0000F0C8 54C51838 */ slwi r5, r6, 3
/* 0000F0CC C0440004 */ lfs f2, 4(r4)
/* 0000F0D0 7CA02A14 */ add r5, r0, r5
/* 0000F0D4 C8230000 */ lfd f1, 0(r3)
/* 0000F0D8 C005432C */ lfs f0, 0x432c(r5)
/* 0000F0DC EC001028 */ fsubs f0, f0, f2
/* 0000F0E0 FC010032 */ fmul f0, f1, f0
/* 0000F0E4 FC02002A */ fadd f0, f2, f0
/* 0000F0E8 FC000018 */ frsp f0, f0
/* 0000F0EC D0040004 */ stfs f0, 4(r4)
/* 0000F0F0 A0A4003C */ lhz r5, 0x3c(r4)
/* 0000F0F4 C0030094 */ lfs f0, 0x94(r3)
/* 0000F0F8 54A51838 */ slwi r5, r5, 3
/* 0000F0FC C0640008 */ lfs f3, 8(r4)
/* 0000F100 7CA02A14 */ add r5, r0, r5
/* 0000F104 C8430000 */ lfd f2, 0(r3)
/* 0000F108 C0254330 */ lfs f1, 0x4330(r5)
/* 0000F10C EC010028 */ fsubs f0, f1, f0
/* 0000F110 EC001828 */ fsubs f0, f0, f3
/* 0000F114 FC020032 */ fmul f0, f2, f0
/* 0000F118 FC03002A */ fadd f0, f3, f0
/* 0000F11C FC000018 */ frsp f0, f0
/* 0000F120 D0040008 */ stfs f0, 8(r4)
lbl_0000F124:
/* 0000F124 88C4000C */ lbz r6, 0xc(r4)
/* 0000F128 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F12C C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F130 3CA00000 */ lis r5, lbl_00011EC8@ha
/* 0000F134 200600FF */ subfic r0, r6, 0xff
/* 0000F138 6C008000 */ xoris r0, r0, 0x8000
/* 0000F13C 90C1005C */ stw r6, 0x5c(r1)
/* 0000F140 3D404330 */ lis r10, 0x4330
/* 0000F144 C8650000 */ lfd f3, lbl_00011EC8@l(r5)
/* 0000F148 90010064 */ stw r0, 0x64(r1)
/* 0000F14C 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F150 C8430000 */ lfd f2, 0(r3)
/* 0000F154 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F158 91410060 */ stw r10, 0x60(r1)
/* 0000F15C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F160 C8010060 */ lfd f0, 0x60(r1)
/* 0000F164 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F168 91410058 */ stw r10, 0x58(r1)
/* 0000F16C 38000000 */ li r0, 0
/* 0000F170 FC000828 */ fsub f0, f0, f1
/* 0000F174 C8210058 */ lfd f1, 0x58(r1)
/* 0000F178 FC020032 */ fmul f0, f2, f0
/* 0000F17C FC211828 */ fsub f1, f1, f3
/* 0000F180 FC01002A */ fadd f0, f1, f0
/* 0000F184 FC00001E */ fctiwz f0, f0
/* 0000F188 D8010068 */ stfd f0, 0x68(r1)
/* 0000F18C 8121006C */ lwz r9, 0x6c(r1)
/* 0000F190 9924000C */ stb r9, 0xc(r4)
/* 0000F194 8924000D */ lbz r9, 0xd(r4)
/* 0000F198 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F19C 20E900FF */ subfic r7, r9, 0xff
/* 0000F1A0 91210074 */ stw r9, 0x74(r1)
/* 0000F1A4 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F1A8 C8430000 */ lfd f2, 0(r3)
/* 0000F1AC 90E1007C */ stw r7, 0x7c(r1)
/* 0000F1B0 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F1B4 91410078 */ stw r10, 0x78(r1)
/* 0000F1B8 C8010078 */ lfd f0, 0x78(r1)
/* 0000F1BC 91410070 */ stw r10, 0x70(r1)
/* 0000F1C0 FC000828 */ fsub f0, f0, f1
/* 0000F1C4 C8210070 */ lfd f1, 0x70(r1)
/* 0000F1C8 FC020032 */ fmul f0, f2, f0
/* 0000F1CC FC211828 */ fsub f1, f1, f3
/* 0000F1D0 FC01002A */ fadd f0, f1, f0
/* 0000F1D4 FC00001E */ fctiwz f0, f0
/* 0000F1D8 D8010080 */ stfd f0, 0x80(r1)
/* 0000F1DC 80E10084 */ lwz r7, 0x84(r1)
/* 0000F1E0 98E4000D */ stb r7, 0xd(r4)
/* 0000F1E4 88E4000E */ lbz r7, 0xe(r4)
/* 0000F1E8 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F1EC 20A700FF */ subfic r5, r7, 0xff
/* 0000F1F0 90E1008C */ stw r7, 0x8c(r1)
/* 0000F1F4 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F1F8 C8430000 */ lfd f2, 0(r3)
/* 0000F1FC 90A10094 */ stw r5, 0x94(r1)
/* 0000F200 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F204 91410090 */ stw r10, 0x90(r1)
/* 0000F208 C8010090 */ lfd f0, 0x90(r1)
/* 0000F20C 91410088 */ stw r10, 0x88(r1)
/* 0000F210 FC000828 */ fsub f0, f0, f1
/* 0000F214 C8210088 */ lfd f1, 0x88(r1)
/* 0000F218 FC020032 */ fmul f0, f2, f0
/* 0000F21C FC211828 */ fsub f1, f1, f3
/* 0000F220 FC01002A */ fadd f0, f1, f0
/* 0000F224 FC00001E */ fctiwz f0, f0
/* 0000F228 D8010098 */ stfd f0, 0x98(r1)
/* 0000F22C 80A1009C */ lwz r5, 0x9c(r1)
/* 0000F230 98A4000E */ stb r5, 0xe(r4)
/* 0000F234 98040070 */ stb r0, 0x70(r4)
/* 0000F238 98040071 */ stb r0, 0x71(r4)
/* 0000F23C 98040072 */ stb r0, 0x72(r4)
/* 0000F240 C0440040 */ lfs f2, 0x40(r4)
/* 0000F244 C80303C8 */ lfd f0, 0x3c8(r3)
/* 0000F248 C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000F24C FC001028 */ fsub f0, f0, f2
/* 0000F250 FC010032 */ fmul f0, f1, f0
/* 0000F254 FC02002A */ fadd f0, f2, f0
/* 0000F258 FC000018 */ frsp f0, f0
/* 0000F25C D0040040 */ stfs f0, 0x40(r4)
/* 0000F260 C0040040 */ lfs f0, 0x40(r4)
/* 0000F264 D0040044 */ stfs f0, 0x44(r4)
/* 0000F268 C044006C */ lfs f2, 0x6c(r4)
/* 0000F26C C8030030 */ lfd f0, 0x30(r3)
/* 0000F270 C8230000 */ lfd f1, 0(r3)
/* 0000F274 FC001028 */ fsub f0, f0, f2
/* 0000F278 FC010032 */ fmul f0, f1, f0
/* 0000F27C FC02002A */ fadd f0, f2, f0
/* 0000F280 FC000018 */ frsp f0, f0
/* 0000F284 D004006C */ stfs f0, 0x6c(r4)
/* 0000F288 480004D8 */ b lbl_0000F760
lbl_0000F28C:
/* 0000F28C 3800000F */ li r0, 0xf
/* 0000F290 B0040010 */ sth r0, 0x10(r4)
/* 0000F294 38000004 */ li r0, 4
/* 0000F298 90040048 */ stw r0, 0x48(r4)
/* 0000F29C 480004C4 */ b lbl_0000F760
lbl_0000F2A0:
/* 0000F2A0 C0440004 */ lfs f2, 4(r4)
/* 0000F2A4 3D604330 */ lis r11, 0x4330
/* 0000F2A8 C0030014 */ lfs f0, 0x14(r3)
/* 0000F2AC 3D400000 */ lis r10, lbl_00011D00@ha
/* 0000F2B0 C8230000 */ lfd f1, 0(r3)
/* 0000F2B4 EC001028 */ fsubs f0, f0, f2
/* 0000F2B8 3D800000 */ lis r12, lbl_00011EC8@ha
/* 0000F2BC 3D000000 */ lis r8, lbl_00011D00@ha
/* 0000F2C0 3D200000 */ lis r9, lbl_00011EC8@ha
/* 0000F2C4 FC010032 */ fmul f0, f1, f0
/* 0000F2C8 3CC00000 */ lis r6, lbl_00011D00@ha
/* 0000F2CC 3CE00000 */ lis r7, lbl_00011EC8@ha
/* 0000F2D0 3CA00000 */ lis r5, globalAnimTimer@ha
/* 0000F2D4 FC02002A */ fadd f0, f2, f0
/* 0000F2D8 FC000018 */ frsp f0, f0
/* 0000F2DC D0040004 */ stfs f0, 4(r4)
/* 0000F2E0 C0440008 */ lfs f2, 8(r4)
/* 0000F2E4 C00303D0 */ lfs f0, 0x3d0(r3)
/* 0000F2E8 C8230000 */ lfd f1, 0(r3)
/* 0000F2EC EC001028 */ fsubs f0, f0, f2
/* 0000F2F0 FC010032 */ fmul f0, f1, f0
/* 0000F2F4 FC02002A */ fadd f0, f2, f0
/* 0000F2F8 FC000018 */ frsp f0, f0
/* 0000F2FC D0040008 */ stfs f0, 8(r4)
/* 0000F300 8BE4000C */ lbz r31, 0xc(r4)
/* 0000F304 C82A0000 */ lfd f1, lbl_00011D00@l(r10)
/* 0000F308 201F00FF */ subfic r0, r31, 0xff
/* 0000F30C 93E1005C */ stw r31, 0x5c(r1)
/* 0000F310 6C008000 */ xoris r0, r0, 0x8000
/* 0000F314 C8430000 */ lfd f2, 0(r3)
/* 0000F318 90010064 */ stw r0, 0x64(r1)
/* 0000F31C C86C0000 */ lfd f3, lbl_00011EC8@l(r12)
/* 0000F320 91610060 */ stw r11, 0x60(r1)
/* 0000F324 C8010060 */ lfd f0, 0x60(r1)
/* 0000F328 91610058 */ stw r11, 0x58(r1)
/* 0000F32C FC000828 */ fsub f0, f0, f1
/* 0000F330 C8210058 */ lfd f1, 0x58(r1)
/* 0000F334 FC020032 */ fmul f0, f2, f0
/* 0000F338 FC211828 */ fsub f1, f1, f3
/* 0000F33C FC01002A */ fadd f0, f1, f0
/* 0000F340 FC00001E */ fctiwz f0, f0
/* 0000F344 D8010068 */ stfd f0, 0x68(r1)
/* 0000F348 8001006C */ lwz r0, 0x6c(r1)
/* 0000F34C 9804000C */ stb r0, 0xc(r4)
/* 0000F350 8944000D */ lbz r10, 0xd(r4)
/* 0000F354 C8280000 */ lfd f1, lbl_00011D00@l(r8)
/* 0000F358 200A00FF */ subfic r0, r10, 0xff
/* 0000F35C 91410074 */ stw r10, 0x74(r1)
/* 0000F360 6C008000 */ xoris r0, r0, 0x8000
/* 0000F364 C8430000 */ lfd f2, 0(r3)
/* 0000F368 9001007C */ stw r0, 0x7c(r1)
/* 0000F36C C8690000 */ lfd f3, lbl_00011EC8@l(r9)
/* 0000F370 91610078 */ stw r11, 0x78(r1)
/* 0000F374 C8010078 */ lfd f0, 0x78(r1)
/* 0000F378 91610070 */ stw r11, 0x70(r1)
/* 0000F37C FC000828 */ fsub f0, f0, f1
/* 0000F380 C8210070 */ lfd f1, 0x70(r1)
/* 0000F384 FC020032 */ fmul f0, f2, f0
/* 0000F388 FC211828 */ fsub f1, f1, f3
/* 0000F38C FC01002A */ fadd f0, f1, f0
/* 0000F390 FC00001E */ fctiwz f0, f0
/* 0000F394 D8010080 */ stfd f0, 0x80(r1)
/* 0000F398 80010084 */ lwz r0, 0x84(r1)
/* 0000F39C 9804000D */ stb r0, 0xd(r4)
/* 0000F3A0 8904000E */ lbz r8, 0xe(r4)
/* 0000F3A4 C8260000 */ lfd f1, lbl_00011D00@l(r6)
/* 0000F3A8 200800FF */ subfic r0, r8, 0xff
/* 0000F3AC 9101008C */ stw r8, 0x8c(r1)
/* 0000F3B0 6C008000 */ xoris r0, r0, 0x8000
/* 0000F3B4 C8430000 */ lfd f2, 0(r3)
/* 0000F3B8 90010094 */ stw r0, 0x94(r1)
/* 0000F3BC C8670000 */ lfd f3, lbl_00011EC8@l(r7)
/* 0000F3C0 91610090 */ stw r11, 0x90(r1)
/* 0000F3C4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F3C8 91610088 */ stw r11, 0x88(r1)
/* 0000F3CC FC000828 */ fsub f0, f0, f1
/* 0000F3D0 C8210088 */ lfd f1, 0x88(r1)
/* 0000F3D4 FC020032 */ fmul f0, f2, f0
/* 0000F3D8 FC211828 */ fsub f1, f1, f3
/* 0000F3DC FC01002A */ fadd f0, f1, f0
/* 0000F3E0 FC00001E */ fctiwz f0, f0
/* 0000F3E4 D8010098 */ stfd f0, 0x98(r1)
/* 0000F3E8 8001009C */ lwz r0, 0x9c(r1)
/* 0000F3EC 9804000E */ stb r0, 0xe(r4)
/* 0000F3F0 84050000 */ lwzu r0, globalAnimTimer@l(r5)
/* 0000F3F4 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F3F8 98040070 */ stb r0, 0x70(r4)
/* 0000F3FC 80050000 */ lwz r0, 0(r5)
/* 0000F400 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F404 98040071 */ stb r0, 0x71(r4)
/* 0000F408 80050000 */ lwz r0, 0(r5)
/* 0000F40C 54002E30 */ rlwinm r0, r0, 5, 0x18, 0x18
/* 0000F410 98040072 */ stb r0, 0x72(r4)
/* 0000F414 C0440040 */ lfs f2, 0x40(r4)
/* 0000F418 C80303D8 */ lfd f0, 0x3d8(r3)
/* 0000F41C C82301B0 */ lfd f1, 0x1b0(r3)
/* 0000F420 FC001028 */ fsub f0, f0, f2
/* 0000F424 FC010032 */ fmul f0, f1, f0
/* 0000F428 FC02002A */ fadd f0, f2, f0
/* 0000F42C FC000018 */ frsp f0, f0
/* 0000F430 D0040040 */ stfs f0, 0x40(r4)
/* 0000F434 C0040040 */ lfs f0, 0x40(r4)
/* 0000F438 D0040044 */ stfs f0, 0x44(r4)
/* 0000F43C C044006C */ lfs f2, 0x6c(r4)
/* 0000F440 C8030030 */ lfd f0, 0x30(r3)
/* 0000F444 C8230000 */ lfd f1, 0(r3)
/* 0000F448 FC001028 */ fsub f0, f0, f2
/* 0000F44C FC010032 */ fmul f0, f1, f0
/* 0000F450 FC02002A */ fadd f0, f2, f0
/* 0000F454 FC000018 */ frsp f0, f0
/* 0000F458 D004006C */ stfs f0, 0x6c(r4)
/* 0000F45C 48000304 */ b lbl_0000F760
lbl_0000F460:
/* 0000F460 A8C40010 */ lha r6, 0x10(r4)
/* 0000F464 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F468 3C004330 */ lis r0, 0x4330
/* 0000F46C 38C6FFFF */ addi r6, r6, -1
/* 0000F470 B0C40010 */ sth r6, 0x10(r4)
/* 0000F474 A8C40010 */ lha r6, 0x10(r4)
/* 0000F478 C8450000 */ lfd f2, lbl_00011D00@l(r5)
/* 0000F47C 6CC58000 */ xoris r5, r6, 0x8000
/* 0000F480 C0030094 */ lfs f0, 0x94(r3)
/* 0000F484 90A1005C */ stw r5, 0x5c(r1)
/* 0000F488 90010058 */ stw r0, 0x58(r1)
/* 0000F48C C8210058 */ lfd f1, 0x58(r1)
/* 0000F490 EC211028 */ fsubs f1, f1, f2
/* 0000F494 EC010024 */ fdivs f0, f1, f0
/* 0000F498 D004006C */ stfs f0, 0x6c(r4)
/* 0000F49C A8040010 */ lha r0, 0x10(r4)
/* 0000F4A0 2C000000 */ cmpwi r0, 0
/* 0000F4A4 408202BC */ bne lbl_0000F760
/* 0000F4A8 38000006 */ li r0, 6
/* 0000F4AC 90040048 */ stw r0, 0x48(r4)
/* 0000F4B0 480002B0 */ b lbl_0000F760
lbl_0000F4B4:
/* 0000F4B4 88A40003 */ lbz r5, 3(r4)
/* 0000F4B8 3D200000 */ lis r9, lbl_00011D00@ha
/* 0000F4BC C0440004 */ lfs f2, 4(r4)
/* 0000F4C0 3D400000 */ lis r10, lbl_00011EC8@ha
/* 0000F4C4 7CA50774 */ extsb r5, r5
/* 0000F4C8 54A5103A */ slwi r5, r5, 2
/* 0000F4CC C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F4D0 7CA02A14 */ add r5, r0, r5
/* 0000F4D4 C0054408 */ lfs f0, 0x4408(r5)
/* 0000F4D8 3C004330 */ lis r0, 0x4330
/* 0000F4DC 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F4E0 EC001028 */ fsubs f0, f0, f2
/* 0000F4E4 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F4E8 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F4EC 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F4F0 FC010032 */ fmul f0, f1, f0
/* 0000F4F4 FC02002A */ fadd f0, f2, f0
/* 0000F4F8 FC000018 */ frsp f0, f0
/* 0000F4FC D0040004 */ stfs f0, 4(r4)
/* 0000F500 C0440008 */ lfs f2, 8(r4)
/* 0000F504 C00303E0 */ lfs f0, 0x3e0(r3)
/* 0000F508 C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F50C EC001028 */ fsubs f0, f0, f2
/* 0000F510 FC010032 */ fmul f0, f1, f0
/* 0000F514 FC02002A */ fadd f0, f2, f0
/* 0000F518 FC000018 */ frsp f0, f0
/* 0000F51C D0040008 */ stfs f0, 8(r4)
/* 0000F520 8964000C */ lbz r11, 0xc(r4)
/* 0000F524 C8290000 */ lfd f1, lbl_00011D00@l(r9)
/* 0000F528 212B0080 */ subfic r9, r11, 0x80
/* 0000F52C 9161005C */ stw r11, 0x5c(r1)
/* 0000F530 6D298000 */ xoris r9, r9, 0x8000
/* 0000F534 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F538 91210064 */ stw r9, 0x64(r1)
/* 0000F53C C86A0000 */ lfd f3, lbl_00011EC8@l(r10)
/* 0000F540 90010060 */ stw r0, 0x60(r1)
/* 0000F544 C8010060 */ lfd f0, 0x60(r1)
/* 0000F548 90010058 */ stw r0, 0x58(r1)
/* 0000F54C FC000828 */ fsub f0, f0, f1
/* 0000F550 C8210058 */ lfd f1, 0x58(r1)
/* 0000F554 FC020032 */ fmul f0, f2, f0
/* 0000F558 FC211828 */ fsub f1, f1, f3
/* 0000F55C FC01002A */ fadd f0, f1, f0
/* 0000F560 FC00001E */ fctiwz f0, f0
/* 0000F564 D8010068 */ stfd f0, 0x68(r1)
/* 0000F568 8121006C */ lwz r9, 0x6c(r1)
/* 0000F56C 9924000C */ stb r9, 0xc(r4)
/* 0000F570 8924000D */ lbz r9, 0xd(r4)
/* 0000F574 C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F578 20E90080 */ subfic r7, r9, 0x80
/* 0000F57C 91210074 */ stw r9, 0x74(r1)
/* 0000F580 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F584 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F588 90E1007C */ stw r7, 0x7c(r1)
/* 0000F58C C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F590 90010078 */ stw r0, 0x78(r1)
/* 0000F594 C8010078 */ lfd f0, 0x78(r1)
/* 0000F598 90010070 */ stw r0, 0x70(r1)
/* 0000F59C FC000828 */ fsub f0, f0, f1
/* 0000F5A0 C8210070 */ lfd f1, 0x70(r1)
/* 0000F5A4 FC020032 */ fmul f0, f2, f0
/* 0000F5A8 FC211828 */ fsub f1, f1, f3
/* 0000F5AC FC01002A */ fadd f0, f1, f0
/* 0000F5B0 FC00001E */ fctiwz f0, f0
/* 0000F5B4 D8010080 */ stfd f0, 0x80(r1)
/* 0000F5B8 80E10084 */ lwz r7, 0x84(r1)
/* 0000F5BC 98E4000D */ stb r7, 0xd(r4)
/* 0000F5C0 88E4000E */ lbz r7, 0xe(r4)
/* 0000F5C4 C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F5C8 20A70080 */ subfic r5, r7, 0x80
/* 0000F5CC 90E1008C */ stw r7, 0x8c(r1)
/* 0000F5D0 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F5D4 C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F5D8 90A10094 */ stw r5, 0x94(r1)
/* 0000F5DC C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F5E0 90010090 */ stw r0, 0x90(r1)
/* 0000F5E4 C8010090 */ lfd f0, 0x90(r1)
/* 0000F5E8 90010088 */ stw r0, 0x88(r1)
/* 0000F5EC FC000828 */ fsub f0, f0, f1
/* 0000F5F0 C8210088 */ lfd f1, 0x88(r1)
/* 0000F5F4 FC020032 */ fmul f0, f2, f0
/* 0000F5F8 FC211828 */ fsub f1, f1, f3
/* 0000F5FC FC01002A */ fadd f0, f1, f0
/* 0000F600 FC00001E */ fctiwz f0, f0
/* 0000F604 D8010098 */ stfd f0, 0x98(r1)
/* 0000F608 80A1009C */ lwz r5, 0x9c(r1)
/* 0000F60C 98A4000E */ stb r5, 0xe(r4)
/* 0000F610 88E40070 */ lbz r7, 0x70(r4)
/* 0000F614 3CC00000 */ lis r6, lbl_00011D00@ha
/* 0000F618 C8260000 */ lfd f1, lbl_00011D00@l(r6)
/* 0000F61C 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F620 7CA700D0 */ neg r5, r7
/* 0000F624 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F628 90E10054 */ stw r7, 0x54(r1)
/* 0000F62C C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F630 3CE00000 */ lis r7, lbl_00011D00@ha
/* 0000F634 90A1004C */ stw r5, 0x4c(r1)
/* 0000F638 3D000000 */ lis r8, lbl_00011EC8@ha
/* 0000F63C C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F640 90010048 */ stw r0, 0x48(r1)
/* 0000F644 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000F648 3CC00000 */ lis r6, lbl_00011EC8@ha
/* 0000F64C C8010048 */ lfd f0, 0x48(r1)
/* 0000F650 90010050 */ stw r0, 0x50(r1)
/* 0000F654 FC000828 */ fsub f0, f0, f1
/* 0000F658 C8210050 */ lfd f1, 0x50(r1)
/* 0000F65C FC020032 */ fmul f0, f2, f0
/* 0000F660 FC211828 */ fsub f1, f1, f3
/* 0000F664 FC01002A */ fadd f0, f1, f0
/* 0000F668 FC00001E */ fctiwz f0, f0
/* 0000F66C D8010040 */ stfd f0, 0x40(r1)
/* 0000F670 81210044 */ lwz r9, 0x44(r1)
/* 0000F674 99240070 */ stb r9, 0x70(r4)
/* 0000F678 89240071 */ lbz r9, 0x71(r4)
/* 0000F67C C8270000 */ lfd f1, lbl_00011D00@l(r7)
/* 0000F680 7CE900D0 */ neg r7, r9
/* 0000F684 9121003C */ stw r9, 0x3c(r1)
/* 0000F688 6CE78000 */ xoris r7, r7, 0x8000
/* 0000F68C C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F690 90E10034 */ stw r7, 0x34(r1)
/* 0000F694 C8680000 */ lfd f3, lbl_00011EC8@l(r8)
/* 0000F698 90010030 */ stw r0, 0x30(r1)
/* 0000F69C C8010030 */ lfd f0, 0x30(r1)
/* 0000F6A0 90010038 */ stw r0, 0x38(r1)
/* 0000F6A4 FC000828 */ fsub f0, f0, f1
/* 0000F6A8 C8210038 */ lfd f1, 0x38(r1)
/* 0000F6AC FC020032 */ fmul f0, f2, f0
/* 0000F6B0 FC211828 */ fsub f1, f1, f3
/* 0000F6B4 FC01002A */ fadd f0, f1, f0
/* 0000F6B8 FC00001E */ fctiwz f0, f0
/* 0000F6BC D8010028 */ stfd f0, 0x28(r1)
/* 0000F6C0 80E1002C */ lwz r7, 0x2c(r1)
/* 0000F6C4 98E40071 */ stb r7, 0x71(r4)
/* 0000F6C8 88E40072 */ lbz r7, 0x72(r4)
/* 0000F6CC C8250000 */ lfd f1, lbl_00011D00@l(r5)
/* 0000F6D0 7CA700D0 */ neg r5, r7
/* 0000F6D4 90E10024 */ stw r7, 0x24(r1)
/* 0000F6D8 6CA58000 */ xoris r5, r5, 0x8000
/* 0000F6DC C84302E8 */ lfd f2, 0x2e8(r3)
/* 0000F6E0 90A1001C */ stw r5, 0x1c(r1)
/* 0000F6E4 C8660000 */ lfd f3, lbl_00011EC8@l(r6)
/* 0000F6E8 90010018 */ stw r0, 0x18(r1)
/* 0000F6EC C8010018 */ lfd f0, 0x18(r1)
/* 0000F6F0 90010020 */ stw r0, 0x20(r1)
/* 0000F6F4 FC000828 */ fsub f0, f0, f1
/* 0000F6F8 C8210020 */ lfd f1, 0x20(r1)
/* 0000F6FC FC020032 */ fmul f0, f2, f0
/* 0000F700 FC211828 */ fsub f1, f1, f3
/* 0000F704 FC01002A */ fadd f0, f1, f0
/* 0000F708 FC00001E */ fctiwz f0, f0
/* 0000F70C D8010010 */ stfd f0, 0x10(r1)
/* 0000F710 80010014 */ lwz r0, 0x14(r1)
/* 0000F714 98040072 */ stb r0, 0x72(r4)
/* 0000F718 C0440040 */ lfs f2, 0x40(r4)
/* 0000F71C C8030098 */ lfd f0, 0x98(r3)
/* 0000F720 C8230000 */ lfd f1, 0(r3)
/* 0000F724 FC001028 */ fsub f0, f0, f2
/* 0000F728 FC010032 */ fmul f0, f1, f0
/* 0000F72C FC02002A */ fadd f0, f2, f0
/* 0000F730 FC000018 */ frsp f0, f0
/* 0000F734 D0040040 */ stfs f0, 0x40(r4)
/* 0000F738 C0040040 */ lfs f0, 0x40(r4)
/* 0000F73C D0040044 */ stfs f0, 0x44(r4)
/* 0000F740 C044006C */ lfs f2, 0x6c(r4)
/* 0000F744 C8030030 */ lfd f0, 0x30(r3)
/* 0000F748 C82302E8 */ lfd f1, 0x2e8(r3)
/* 0000F74C FC001028 */ fsub f0, f0, f2
/* 0000F750 FC010032 */ fmul f0, f1, f0
/* 0000F754 FC02002A */ fadd f0, f2, f0
/* 0000F758 FC000018 */ frsp f0, f0
/* 0000F75C D004006C */ stfs f0, 0x6c(r4)
lbl_0000F760:
/* 0000F760 C023003C */ lfs f1, 0x3c(r3)
/* 0000F764 C004006C */ lfs f0, 0x6c(r4)
/* 0000F768 C84303E8 */ lfd f2, 0x3e8(r3)
/* 0000F76C EC010032 */ fmuls f0, f1, f0
/* 0000F770 FC020028 */ fsub f0, f2, f0
/* 0000F774 FC000018 */ frsp f0, f0
/* 0000F778 D004004C */ stfs f0, 0x4c(r4)
/* 0000F77C 83E100A4 */ lwz r31, 0xa4(r1)
/* 0000F780 382100A8 */ addi r1, r1, 0xa8
/* 0000F784 4E800020 */ blr 
