/* 0000C9B0 7C0802A6 */ mflr r0
/* 0000C9B4 3C600000 */ lis r3, ballInfo@ha
/* 0000C9B8 90010004 */ stw r0, 4(r1)
/* 0000C9BC 3CA00000 */ lis r5, lbl_10000028@ha
/* 0000C9C0 38630000 */ addi r3, r3, ballInfo@l
/* 0000C9C4 9421FFF8 */ stwu r1, -8(r1)
/* 0000C9C8 38A50000 */ addi r5, r5, lbl_10000028@l
/* 0000C9CC 80040048 */ lwz r0, 0x48(r4)
/* 0000C9D0 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000C9D4 7C630214 */ add r3, r3, r0
/* 0000C9D8 A0050004 */ lhz r0, 4(r5)
/* 0000C9DC 80630144 */ lwz r3, 0x144(r3)
/* 0000C9E0 A8630022 */ lha r3, 0x22(r3)
/* 0000C9E4 38630001 */ addi r3, r3, 1
/* 0000C9E8 7C660734 */ extsh r6, r3
/* 0000C9EC 7C060000 */ cmpw r6, r0
/* 0000C9F0 41800008 */ blt lbl_0000C9F8
/* 0000C9F4 A8C50004 */ lha r6, 4(r5)
lbl_0000C9F8:
/* 0000C9F8 3C600000 */ lis r3, lbl_00015CA8@ha
/* 0000C9FC 4CC63182 */ crclr 6
/* 0000CA00 38030000 */ addi r0, r3, lbl_00015CA8@l
/* 0000CA04 3864008C */ addi r3, r4, 0x8c
/* 0000CA08 7C040378 */ mr r4, r0
/* 0000CA0C 7CC50734 */ extsh r5, r6
/* 0000CA10 4BFF376D */ bl sprintf
/* 0000CA14 8001000C */ lwz r0, 0xc(r1)
/* 0000CA18 38210008 */ addi r1, r1, 8
/* 0000CA1C 7C0803A6 */ mtlr r0
/* 0000CA20 4E800020 */ blr 
