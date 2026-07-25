/* 0000D03C 7C0802A6 */ mflr r0
/* 0000D040 3C600000 */ lis r3, ballInfo@ha
/* 0000D044 90010004 */ stw r0, 4(r1)
/* 0000D048 38030000 */ addi r0, r3, ballInfo@l
/* 0000D04C 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000D050 93E1002C */ stw r31, 0x2c(r1)
/* 0000D054 7C9F2378 */ mr r31, r4
/* 0000D058 80840048 */ lwz r4, 0x48(r4)
/* 0000D05C 1C6401A4 */ mulli r3, r4, 0x1a4
/* 0000D060 7C601A14 */ add r3, r0, r3
/* 0000D064 C0230004 */ lfs f1, 4(r3)
/* 0000D068 C0030010 */ lfs f0, 0x10(r3)
/* 0000D06C EC010028 */ fsubs f0, f1, f0
/* 0000D070 D0010010 */ stfs f0, 0x10(r1)
/* 0000D074 C0230008 */ lfs f1, 8(r3)
/* 0000D078 C0030014 */ lfs f0, 0x14(r3)
/* 0000D07C EC010028 */ fsubs f0, f1, f0
/* 0000D080 D0010014 */ stfs f0, 0x14(r1)
/* 0000D084 C023000C */ lfs f1, 0xc(r3)
/* 0000D088 C0030018 */ lfs f0, 0x18(r3)
/* 0000D08C EC010028 */ fsubs f0, f1, f0
/* 0000D090 D0010018 */ stfs f0, 0x18(r1)
/* 0000D094 C0210010 */ lfs f1, 0x10(r1)
/* 0000D098 C0410014 */ lfs f2, 0x14(r1)
/* 0000D09C C0010018 */ lfs f0, 0x18(r1)
/* 0000D0A0 EC210072 */ fmuls f1, f1, f1
/* 0000D0A4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000D0A8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000D0AC 4BFF30D1 */ bl mathutil_sqrt
/* 0000D0B0 3C600000 */ lis r3, lbl_00013D44@ha
/* 0000D0B4 C0030000 */ lfs f0, lbl_00013D44@l(r3)
/* 0000D0B8 EC000072 */ fmuls f0, f0, f1
/* 0000D0BC FC00001E */ fctiwz f0, f0
/* 0000D0C0 D8010020 */ stfd f0, 0x20(r1)
/* 0000D0C4 80A10024 */ lwz r5, 0x24(r1)
/* 0000D0C8 2C0503E8 */ cmpwi r5, 0x3e8
/* 0000D0CC 41800008 */ blt lbl_0000D0D4
/* 0000D0D0 38A003E7 */ li r5, 0x3e7
lbl_0000D0D4:
/* 0000D0D4 3C600000 */ lis r3, lbl_00015CD4@ha
/* 0000D0D8 4CC63182 */ crclr 6
/* 0000D0DC 38830000 */ addi r4, r3, lbl_00015CD4@l
/* 0000D0E0 387F008C */ addi r3, r31, 0x8c
/* 0000D0E4 4BFF3099 */ bl sprintf
/* 0000D0E8 80010034 */ lwz r0, 0x34(r1)
/* 0000D0EC 83E1002C */ lwz r31, 0x2c(r1)
/* 0000D0F0 38210030 */ addi r1, r1, 0x30
/* 0000D0F4 7C0803A6 */ mtlr r0
/* 0000D0F8 4E800020 */ blr 
