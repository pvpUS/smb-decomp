/* 0000D19C 7C0802A6 */ mflr r0
/* 0000D1A0 3C600000 */ lis r3, ballInfo@ha
/* 0000D1A4 90010004 */ stw r0, 4(r1)
/* 0000D1A8 38630000 */ addi r3, r3, ballInfo@l
/* 0000D1AC 9421FFF8 */ stwu r1, -8(r1)
/* 0000D1B0 80040048 */ lwz r0, 0x48(r4)
/* 0000D1B4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000D1B8 7C630214 */ add r3, r3, r0
/* 0000D1BC 80A30144 */ lwz r5, 0x144(r3)
/* 0000D1C0 A005001E */ lhz r0, 0x1e(r5)
/* 0000D1C4 28000000 */ cmplwi r0, 0
/* 0000D1C8 7C060378 */ mr r6, r0
/* 0000D1CC 40820014 */ bne lbl_0000D1E0
/* 0000D1D0 3C600000 */ lis r3, lbl_10000046@ha
/* 0000D1D4 A0A50000 */ lhz r5, 0(r5)
/* 0000D1D8 A8030000 */ lha r0, lbl_10000046@l(r3)
/* 0000D1DC 7CC50050 */ subf r6, r5, r0
lbl_0000D1E0:
/* 0000D1E0 3C600000 */ lis r3, lbl_00015CA8@ha
/* 0000D1E4 4CC63182 */ crclr 6
/* 0000D1E8 38030000 */ addi r0, r3, lbl_00015CA8@l
/* 0000D1EC 3864008C */ addi r3, r4, 0x8c
/* 0000D1F0 7C040378 */ mr r4, r0
/* 0000D1F4 54C5043E */ clrlwi r5, r6, 0x10
/* 0000D1F8 4BFF2F85 */ bl sprintf
/* 0000D1FC 8001000C */ lwz r0, 0xc(r1)
/* 0000D200 38210008 */ addi r1, r1, 8
/* 0000D204 7C0803A6 */ mtlr r0
/* 0000D208 4E800020 */ blr 
