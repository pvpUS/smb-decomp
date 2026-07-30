/* 00009F68 7C0802A6 */ mflr r0
/* 00009F6C 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009F70 90010004 */ stw r0, 4(r1)
/* 00009F74 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009F78 93E10024 */ stw r31, 0x24(r1)
/* 00009F7C 3BE30000 */ addi r31, r3, 0
/* 00009F80 93C10020 */ stw r30, 0x20(r1)
/* 00009F84 3BC40000 */ addi r30, r4, lbl_0001C108@l
/* 00009F88 4BFF61DD */ bl rand
/* 00009F8C 6C608000 */ xoris r0, r3, 0x8000
/* 00009F90 C07E0018 */ lfs f3, 0x18(r30)
/* 00009F94 9001001C */ stw r0, 0x1c(r1)
/* 00009F98 3C004330 */ lis r0, 0x4330
/* 00009F9C 3C600000 */ lis r3, lbl_0001C138@ha
/* 00009FA0 C05E0114 */ lfs f2, 0x114(r30)
/* 00009FA4 90010018 */ stw r0, 0x18(r1)
/* 00009FA8 C8A30000 */ lfd f5, lbl_0001C138@l(r3)
/* 00009FAC 3C600000 */ lis r3, commonGma@ha
/* 00009FB0 C8810018 */ lfd f4, 0x18(r1)
/* 00009FB4 38630000 */ addi r3, r3, commonGma@l
/* 00009FB8 C03E0040 */ lfs f1, 0x40(r30)
/* 00009FBC EC842828 */ fsubs f4, f4, f5
/* 00009FC0 C01E0080 */ lfs f0, 0x80(r30)
/* 00009FC4 EC641824 */ fdivs f3, f4, f3
/* 00009FC8 EC4200F2 */ fmuls f2, f2, f3
/* 00009FCC EC21102A */ fadds f1, f1, f2
/* 00009FD0 EC000072 */ fmuls f0, f0, f1
/* 00009FD4 FC00001E */ fctiwz f0, f0
/* 00009FD8 D8010010 */ stfd f0, 0x10(r1)
/* 00009FDC 80010014 */ lwz r0, 0x14(r1)
/* 00009FE0 901F000C */ stw r0, 0xc(r31)
/* 00009FE4 80630000 */ lwz r3, 0(r3)
/* 00009FE8 80630008 */ lwz r3, 8(r3)
/* 00009FEC 800302D8 */ lwz r0, 0x2d8(r3)
/* 00009FF0 901F0030 */ stw r0, 0x30(r31)
/* 00009FF4 C03E0118 */ lfs f1, 0x118(r30)
/* 00009FF8 C01F00A8 */ lfs f0, 0xa8(r31)
/* 00009FFC EC010032 */ fmuls f0, f1, f0
/* 0000A000 FC200210 */ fabs f1, f0
/* 0000A004 FC200818 */ frsp f1, f1
/* 0000A008 4BFF615D */ bl mathutil_sqrt
/* 0000A00C C05E0010 */ lfs f2, 0x10(r30)
/* 0000A010 3C600000 */ lis r3, backgroundInfo@ha
/* 0000A014 C01E0114 */ lfs f0, 0x114(r30)
/* 0000A018 EC22082A */ fadds f1, f2, f1
/* 0000A01C EC000072 */ fmuls f0, f0, f1
/* 0000A020 D01F0024 */ stfs f0, 0x24(r31)
/* 0000A024 D03F0028 */ stfs f1, 0x28(r31)
/* 0000A028 A8030000 */ lha r0, backgroundInfo@l(r3)
/* 0000A02C 2C000013 */ cmpwi r0, 0x13
/* 0000A030 41820008 */ beq lbl_0000A038
/* 0000A034 48000010 */ b lbl_0000A044
lbl_0000A038:
/* 0000A038 C01E002C */ lfs f0, 0x2c(r30)
/* 0000A03C D01F0018 */ stfs f0, 0x18(r31)
/* 0000A040 4800000C */ b lbl_0000A04C
lbl_0000A044:
/* 0000A044 C01E0004 */ lfs f0, 4(r30)
/* 0000A048 D01F0018 */ stfs f0, 0x18(r31)
lbl_0000A04C:
/* 0000A04C A81F0014 */ lha r0, 0x14(r31)
/* 0000A050 38800001 */ li r4, 1
/* 0000A054 387F0088 */ addi r3, r31, 0x88
/* 0000A058 7C800030 */ slw r0, r4, r0
/* 0000A05C B01F0016 */ sth r0, 0x16(r31)
/* 0000A060 389F004C */ addi r4, r31, 0x4c
/* 0000A064 38BF004E */ addi r5, r31, 0x4e
/* 0000A068 4BFF60FD */ bl mathutil_vec_to_euler_xy
/* 0000A06C A87F004C */ lha r3, 0x4c(r31)
/* 0000A070 3C630001 */ addis r3, r3, 1
/* 0000A074 38038000 */ addi r0, r3, -32768
/* 0000A078 B01F004C */ sth r0, 0x4c(r31)
/* 0000A07C 8001002C */ lwz r0, 0x2c(r1)
/* 0000A080 83E10024 */ lwz r31, 0x24(r1)
/* 0000A084 83C10020 */ lwz r30, 0x20(r1)
/* 0000A088 38210028 */ addi r1, r1, 0x28
/* 0000A08C 7C0803A6 */ mtlr r0
/* 0000A090 4E800020 */ blr 
