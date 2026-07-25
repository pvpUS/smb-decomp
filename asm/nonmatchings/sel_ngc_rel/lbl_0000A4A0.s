/* 0000A4A0 7C0802A6 */ mflr r0
/* 0000A4A4 7C671B78 */ mr r7, r3
/* 0000A4A8 90010004 */ stw r0, 4(r1)
/* 0000A4AC 9421FFF8 */ stwu r1, -8(r1)
/* 0000A4B0 A003003C */ lhz r0, 0x3c(r3)
/* 0000A4B4 28000000 */ cmplwi r0, 0
/* 0000A4B8 40820030 */ bne lbl_0000A4E8
/* 0000A4BC 3C600000 */ lis r3, lbl_100000C0@ha
/* 0000A4C0 80030000 */ lwz r0, lbl_100000C0@l(r3)
/* 0000A4C4 2C000000 */ cmpwi r0, 0
/* 0000A4C8 40820020 */ bne lbl_0000A4E8
/* 0000A4CC 3C800000 */ lis r4, stageInfo@ha
/* 0000A4D0 3C600000 */ lis r3, lbl_00011C40@ha
/* 0000A4D4 38840000 */ addi r4, r4, stageInfo@l
/* 0000A4D8 C8030000 */ lfd f0, lbl_00011C40@l(r3)
/* 0000A4DC C0240004 */ lfs f1, 4(r4)
/* 0000A4E0 FC010040 */ fcmpo cr0, f1, f0
/* 0000A4E4 41810050 */ bgt lbl_0000A534
lbl_0000A4E8:
/* 0000A4E8 8887000D */ lbz r4, 0xd(r7)
/* 0000A4EC 88070071 */ lbz r0, 0x71(r7)
/* 0000A4F0 88A7000C */ lbz r5, 0xc(r7)
/* 0000A4F4 5484402E */ slwi r4, r4, 8
/* 0000A4F8 88670070 */ lbz r3, 0x70(r7)
/* 0000A4FC 5400402E */ slwi r0, r0, 8
/* 0000A500 50A4821E */ rlwimi r4, r5, 0x10, 8, 0xf
/* 0000A504 88C7000E */ lbz r6, 0xe(r7)
/* 0000A508 5060821E */ rlwimi r0, r3, 0x10, 8, 0xf
/* 0000A50C 88A70072 */ lbz r5, 0x72(r7)
/* 0000A510 8067002C */ lwz r3, 0x2c(r7)
/* 0000A514 7CC42378 */ or r4, r6, r4
/* 0000A518 C0270004 */ lfs f1, 4(r7)
/* 0000A51C 7CA50378 */ or r5, r5, r0
/* 0000A520 C0470008 */ lfs f2, 8(r7)
/* 0000A524 C067004C */ lfs f3, 0x4c(r7)
/* 0000A528 C0870040 */ lfs f4, 0x40(r7)
/* 0000A52C C0A70044 */ lfs f5, 0x44(r7)
/* 0000A530 4BFF5C59 */ bl preview_draw
lbl_0000A534:
/* 0000A534 8001000C */ lwz r0, 0xc(r1)
/* 0000A538 38210008 */ addi r1, r1, 8
/* 0000A53C 7C0803A6 */ mtlr r0
/* 0000A540 4E800020 */ blr 
