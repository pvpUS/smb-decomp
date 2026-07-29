/* 00009A08 7C0802A6 */ mflr r0
/* 00009A0C 3C800000 */ lis r4, lbl_10000054@ha
/* 00009A10 90010004 */ stw r0, 4(r1)
/* 00009A14 9421FFD0 */ stwu r1, -0x30(r1)
/* 00009A18 93E1002C */ stw r31, 0x2c(r1)
/* 00009A1C 93C10028 */ stw r30, 0x28(r1)
/* 00009A20 3BC30000 */ addi r30, r3, 0
/* 00009A24 93A10024 */ stw r29, 0x24(r1)
/* 00009A28 3BA10010 */ addi r29, r1, 0x10
/* 00009A2C 93810020 */ stw r28, 0x20(r1)
/* 00009A30 83E40000 */ lwz r31, lbl_10000054@l(r4)
/* 00009A34 3C800000 */ lis r4, ballInfo@ha
/* 00009A38 38040000 */ addi r0, r4, ballInfo@l
/* 00009A3C C01E000C */ lfs f0, 0xc(r30)
/* 00009A40 A07F0000 */ lhz r3, 0(r31)
/* 00009A44 1C6301A4 */ mulli r3, r3, 0x1a4
/* 00009A48 7F801A14 */ add r28, r0, r3
/* 00009A4C C03C0004 */ lfs f1, 4(r28)
/* 00009A50 EC010028 */ fsubs f0, f1, f0
/* 00009A54 D0010010 */ stfs f0, 0x10(r1)
/* 00009A58 C03C0008 */ lfs f1, 8(r28)
/* 00009A5C C01E0010 */ lfs f0, 0x10(r30)
/* 00009A60 EC010028 */ fsubs f0, f1, f0
/* 00009A64 D0010014 */ stfs f0, 0x14(r1)
/* 00009A68 C03C000C */ lfs f1, 0xc(r28)
/* 00009A6C C01E0014 */ lfs f0, 0x14(r30)
/* 00009A70 EC010028 */ fsubs f0, f1, f0
/* 00009A74 D0010018 */ stfs f0, 0x18(r1)
/* 00009A78 C0210010 */ lfs f1, 0x10(r1)
/* 00009A7C C0410014 */ lfs f2, 0x14(r1)
/* 00009A80 C0010018 */ lfs f0, 0x18(r1)
/* 00009A84 EC210072 */ fmuls f1, f1, f1
/* 00009A88 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009A8C EC20083A */ fmadds f1, f0, f0, f1
/* 00009A90 4BFF66ED */ bl mathutil_sqrt
/* 00009A94 3C600000 */ lis r3, lbl_00013B50@ha
/* 00009A98 C8030000 */ lfd f0, lbl_00013B50@l(r3)
/* 00009A9C FC010040 */ fcmpo cr0, f1, f0
/* 00009AA0 4081004C */ ble lbl_00009AEC
/* 00009AA4 3C600000 */ lis r3, lbl_00013B58@ha
/* 00009AA8 C0230000 */ lfs f1, lbl_00013B58@l(r3)
/* 00009AAC 387D0000 */ addi r3, r29, 0
/* 00009AB0 389D0000 */ addi r4, r29, 0
/* 00009AB4 4BFF66C9 */ bl mathutil_vec_set_len
/* 00009AB8 C03E000C */ lfs f1, 0xc(r30)
/* 00009ABC C0010010 */ lfs f0, 0x10(r1)
/* 00009AC0 EC01002A */ fadds f0, f1, f0
/* 00009AC4 D01E000C */ stfs f0, 0xc(r30)
/* 00009AC8 C03E0010 */ lfs f1, 0x10(r30)
/* 00009ACC C0010014 */ lfs f0, 0x14(r1)
/* 00009AD0 EC01002A */ fadds f0, f1, f0
/* 00009AD4 D01E0010 */ stfs f0, 0x10(r30)
/* 00009AD8 C03E0014 */ lfs f1, 0x14(r30)
/* 00009ADC C0010018 */ lfs f0, 0x18(r1)
/* 00009AE0 EC01002A */ fadds f0, f1, f0
/* 00009AE4 D01E0014 */ stfs f0, 0x14(r30)
/* 00009AE8 4800001C */ b lbl_00009B04
lbl_00009AEC:
/* 00009AEC 807C0004 */ lwz r3, 4(r28)
/* 00009AF0 801C0008 */ lwz r0, 8(r28)
/* 00009AF4 907E000C */ stw r3, 0xc(r30)
/* 00009AF8 901E0010 */ stw r0, 0x10(r30)
/* 00009AFC 801C000C */ lwz r0, 0xc(r28)
/* 00009B00 901E0014 */ stw r0, 0x14(r30)
lbl_00009B04:
/* 00009B04 3C600000 */ lis r3, lbl_00015B38@ha
/* 00009B08 38030000 */ addi r0, r3, lbl_00015B38@l
/* 00009B0C 7C040378 */ mr r4, r0
/* 00009B10 38A00000 */ li r5, 0
/* 00009B14 48000048 */ b lbl_00009B5C
lbl_00009B18:
/* 00009B18 C0040000 */ lfs f0, 0(r4)
/* 00009B1C C03F01D4 */ lfs f1, 0x1d4(r31)
/* 00009B20 FC000840 */ fcmpo cr0, f0, f1
/* 00009B24 4C401382 */ cror 2, 0, 2
/* 00009B28 4082002C */ bne lbl_00009B54
/* 00009B2C C0040004 */ lfs f0, 4(r4)
/* 00009B30 FC010040 */ fcmpo cr0, f1, f0
/* 00009B34 4C401382 */ cror 2, 0, 2
/* 00009B38 4082001C */ bne lbl_00009B54
/* 00009B3C 80640008 */ lwz r3, 8(r4)
/* 00009B40 8004000C */ lwz r0, 0xc(r4)
/* 00009B44 907E0000 */ stw r3, 0(r30)
/* 00009B48 901E0004 */ stw r0, 4(r30)
/* 00009B4C 80040010 */ lwz r0, 0x10(r4)
/* 00009B50 901E0008 */ stw r0, 8(r30)
lbl_00009B54:
/* 00009B54 38A50001 */ addi r5, r5, 1
/* 00009B58 38840014 */ addi r4, r4, 0x14
lbl_00009B5C:
/* 00009B5C 7CA00734 */ extsh r0, r5
/* 00009B60 28000007 */ cmplwi r0, 7
/* 00009B64 4180FFB4 */ blt lbl_00009B18
/* 00009B68 C03E000C */ lfs f1, 0xc(r30)
/* 00009B6C C01E0000 */ lfs f0, 0(r30)
/* 00009B70 EC010028 */ fsubs f0, f1, f0
/* 00009B74 D0010010 */ stfs f0, 0x10(r1)
/* 00009B78 C03E0010 */ lfs f1, 0x10(r30)
/* 00009B7C C01E0004 */ lfs f0, 4(r30)
/* 00009B80 EC010028 */ fsubs f0, f1, f0
/* 00009B84 D0010014 */ stfs f0, 0x14(r1)
/* 00009B88 C03E0014 */ lfs f1, 0x14(r30)
/* 00009B8C C01E0008 */ lfs f0, 8(r30)
/* 00009B90 EC010028 */ fsubs f0, f1, f0
/* 00009B94 D0010018 */ stfs f0, 0x18(r1)
/* 00009B98 C0210010 */ lfs f1, 0x10(r1)
/* 00009B9C C0410018 */ lfs f2, 0x18(r1)
/* 00009BA0 4BFF65DD */ bl mathutil_atan2
/* 00009BA4 38038000 */ addi r0, r3, -32768
/* 00009BA8 B01E001A */ sth r0, 0x1a(r30)
/* 00009BAC C0010018 */ lfs f0, 0x18(r1)
/* 00009BB0 C0210010 */ lfs f1, 0x10(r1)
/* 00009BB4 EC210072 */ fmuls f1, f1, f1
/* 00009BB8 EC20083A */ fmadds f1, f0, f0, f1
/* 00009BBC 4BFF65C1 */ bl mathutil_sqrt
/* 00009BC0 FC400890 */ fmr f2, f1
/* 00009BC4 C0210014 */ lfs f1, 0x14(r1)
/* 00009BC8 4BFF65B5 */ bl mathutil_atan2
/* 00009BCC B07E0018 */ sth r3, 0x18(r30)
/* 00009BD0 38000000 */ li r0, 0
/* 00009BD4 B01E001C */ sth r0, 0x1c(r30)
/* 00009BD8 80010034 */ lwz r0, 0x34(r1)
/* 00009BDC 83E1002C */ lwz r31, 0x2c(r1)
/* 00009BE0 83C10028 */ lwz r30, 0x28(r1)
/* 00009BE4 83A10024 */ lwz r29, 0x24(r1)
/* 00009BE8 83810020 */ lwz r28, 0x20(r1)
/* 00009BEC 38210030 */ addi r1, r1, 0x30
/* 00009BF0 7C0803A6 */ mtlr r0
/* 00009BF4 4E800020 */ blr 
