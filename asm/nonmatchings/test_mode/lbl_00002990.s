lbl_00002990:
/* 00002990 3C600000 */ lis r3, debugFlags@ha
/* 00002994 80030000 */ lwz r0, debugFlags@l(r3)
/* 00002998 3C800000 */ lis r4, lbl_0000FE78@ha
/* 0000299C 3C600000 */ lis r3, lbl_10000000@ha
/* 000029A0 7000000A */ andi. r0, r0, 0xa
/* 000029A4 38E40000 */ addi r7, r4, lbl_0000FE78@l
/* 000029A8 38C30000 */ addi r6, r3, lbl_10000000@l
/* 000029AC 4C820020 */ bnelr 
/* 000029B0 38A00000 */ li r5, 0
/* 000029B4 90A6007C */ stw r5, 0x7c(r6)
/* 000029B8 38000001 */ li r0, 1
/* 000029BC 388000FF */ li r4, 0xff
/* 000029C0 90A60080 */ stw r5, 0x80(r6)
/* 000029C4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000029C8 90060084 */ stw r0, 0x84(r6)
/* 000029CC 38000072 */ li r0, 0x72
/* 000029D0 98860088 */ stb r4, 0x88(r6)
/* 000029D4 98860089 */ stb r4, 0x89(r6)
/* 000029D8 9886008A */ stb r4, 0x8a(r6)
/* 000029DC 98A6008B */ stb r5, 0x8b(r6)
/* 000029E0 98A6008C */ stb r5, 0x8c(r6)
/* 000029E4 98A6008D */ stb r5, 0x8d(r6)
/* 000029E8 B0A6008E */ sth r5, 0x8e(r6)
/* 000029EC C00700B8 */ lfs f0, 0xb8(r7)
/* 000029F0 D0060090 */ stfs f0, 0x90(r6)
/* 000029F4 C00700B8 */ lfs f0, 0xb8(r7)
/* 000029F8 D0060094 */ stfs f0, 0x94(r6)
/* 000029FC C00700B8 */ lfs f0, 0xb8(r7)
/* 00002A00 D0060098 */ stfs f0, 0x98(r6)
/* 00002A04 C00700BC */ lfs f0, 0xbc(r7)
/* 00002A08 D006009C */ stfs f0, 0x9c(r6)
/* 00002A0C C0070060 */ lfs f0, 0x60(r7)
/* 00002A10 D00600A4 */ stfs f0, 0xa4(r6)
/* 00002A14 D00600A0 */ stfs f0, 0xa0(r6)
/* 00002A18 C00700B8 */ lfs f0, 0xb8(r7)
/* 00002A1C D00600AC */ stfs f0, 0xac(r6)
/* 00002A20 D00600A8 */ stfs f0, 0xa8(r6)
/* 00002A24 90A600B0 */ stw r5, 0xb0(r6)
/* 00002A28 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A2C 4E800020 */ blr 
