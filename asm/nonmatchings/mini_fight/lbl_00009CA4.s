/* 00009CA4 7C0802A6 */ mflr r0
/* 00009CA8 3C800000 */ lis r4, lbl_0001C108@ha
/* 00009CAC 90010004 */ stw r0, 4(r1)
/* 00009CB0 9421FFD8 */ stwu r1, -0x28(r1)
/* 00009CB4 93E10024 */ stw r31, 0x24(r1)
/* 00009CB8 3BE40000 */ addi r31, r4, lbl_0001C108@l
/* 00009CBC 93C10020 */ stw r30, 0x20(r1)
/* 00009CC0 3BC30000 */ addi r30, r3, 0
/* 00009CC4 4BFF64A1 */ bl rand
/* 00009CC8 6C608000 */ xoris r0, r3, 0x8000
/* 00009CCC C05F0018 */ lfs f2, 0x18(r31)
/* 00009CD0 9001001C */ stw r0, 0x1c(r1)
/* 00009CD4 3C004330 */ lis r0, 0x4330
/* 00009CD8 3C600000 */ lis r3, lbl_0001C138@ha
/* 00009CDC C03F004C */ lfs f1, 0x4c(r31)
/* 00009CE0 90010018 */ stw r0, 0x18(r1)
/* 00009CE4 C8830000 */ lfd f4, lbl_0001C138@l(r3)
/* 00009CE8 3C600000 */ lis r3, g_commonNlObj@ha
/* 00009CEC C8610018 */ lfd f3, 0x18(r1)
/* 00009CF0 38630000 */ addi r3, r3, g_commonNlObj@l
/* 00009CF4 C01F010C */ lfs f0, 0x10c(r31)
/* 00009CF8 EC632028 */ fsubs f3, f3, f4
/* 00009CFC EC431024 */ fdivs f2, f3, f2
/* 00009D00 EC21102A */ fadds f1, f1, f2
/* 00009D04 EC000072 */ fmuls f0, f0, f1
/* 00009D08 FC00001E */ fctiwz f0, f0
/* 00009D0C D8010010 */ stfd f0, 0x10(r1)
/* 00009D10 80010014 */ lwz r0, 0x14(r1)
/* 00009D14 901E000C */ stw r0, 0xc(r30)
/* 00009D18 80630000 */ lwz r3, 0(r3)
/* 00009D1C 800300D8 */ lwz r0, 0xd8(r3)
/* 00009D20 901E0030 */ stw r0, 0x30(r30)
/* 00009D24 4BFF6441 */ bl rand
/* 00009D28 5460047E */ clrlwi r0, r3, 0x11
/* 00009D2C B01E00A4 */ sth r0, 0xa4(r30)
/* 00009D30 8001002C */ lwz r0, 0x2c(r1)
/* 00009D34 83E10024 */ lwz r31, 0x24(r1)
/* 00009D38 83C10020 */ lwz r30, 0x20(r1)
/* 00009D3C 7C0803A6 */ mtlr r0
/* 00009D40 38210028 */ addi r1, r1, 0x28
/* 00009D44 4E800020 */ blr 
