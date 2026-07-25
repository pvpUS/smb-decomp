/* 000099E0 7C0802A6 */ mflr r0
/* 000099E4 3C800000 */ lis r4, lbl_000260F0@ha
/* 000099E8 90010004 */ stw r0, 4(r1)
/* 000099EC 9421FFC8 */ stwu r1, -0x38(r1)
/* 000099F0 DBE10030 */ stfd f31, 0x30(r1)
/* 000099F4 BF210014 */ stmw r25, 0x14(r1)
/* 000099F8 3B840000 */ addi r28, r4, lbl_000260F0@l
/* 000099FC 3C800000 */ lis r4, lbl_00026AB0@ha
/* 00009A00 3B230000 */ addi r25, r3, 0
/* 00009A04 3BA40000 */ addi r29, r4, lbl_00026AB0@l
/* 00009A08 3B400000 */ li r26, 0
/* 00009A0C 3B600000 */ li r27, 0
/* 00009A10 3BE00000 */ li r31, 0
/* 00009A14 C3FC01FC */ lfs f31, 0x1fc(r28)
lbl_00009A18:
/* 00009A18 7C7DFA14 */ add r3, r29, r31
/* 00009A1C C0390008 */ lfs f1, 8(r25)
/* 00009A20 C00300A0 */ lfs f0, 0xa0(r3)
/* 00009A24 C0790004 */ lfs f3, 4(r25)
/* 00009A28 C043009C */ lfs f2, 0x9c(r3)
/* 00009A2C EC810028 */ fsubs f4, f1, f0
/* 00009A30 C0390000 */ lfs f1, 0(r25)
/* 00009A34 C0030098 */ lfs f0, 0x98(r3)
/* 00009A38 EC431028 */ fsubs f2, f3, f2
/* 00009A3C EC210028 */ fsubs f1, f1, f0
/* 00009A40 EC210072 */ fmuls f1, f1, f1
/* 00009A44 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009A48 EC24093A */ fmadds f1, f4, f4, f1
/* 00009A4C 4BFF6785 */ bl mathutil_sqrt
/* 00009A50 FC01F840 */ fcmpo cr0, f1, f31
/* 00009A54 4080000C */ bge lbl_00009A60
/* 00009A58 FFE00890 */ fmr f31, f1
/* 00009A5C 7F7ADB78 */ mr r26, r27
lbl_00009A60:
/* 00009A60 3B7B0001 */ addi r27, r27, 1
/* 00009A64 281B000B */ cmplwi r27, 0xb
/* 00009A68 3BFF000C */ addi r31, r31, 0xc
/* 00009A6C 4180FFAC */ blt lbl_00009A18
/* 00009A70 C3FC0000 */ lfs f31, 0(r28)
/* 00009A74 3BDAFFFF */ addi r30, r26, -1
/* 00009A78 3B600000 */ li r27, 0
/* 00009A7C 3BE00000 */ li r31, 0
/* 00009A80 48000048 */ b lbl_00009AC8
lbl_00009A84:
/* 00009A84 7C7DFA14 */ add r3, r29, r31
/* 00009A88 C02300A0 */ lfs f1, 0xa0(r3)
/* 00009A8C C00300AC */ lfs f0, 0xac(r3)
/* 00009A90 C063009C */ lfs f3, 0x9c(r3)
/* 00009A94 C04300A8 */ lfs f2, 0xa8(r3)
/* 00009A98 EC810028 */ fsubs f4, f1, f0
/* 00009A9C C0230098 */ lfs f1, 0x98(r3)
/* 00009AA0 C00300A4 */ lfs f0, 0xa4(r3)
/* 00009AA4 EC431028 */ fsubs f2, f3, f2
/* 00009AA8 EC210028 */ fsubs f1, f1, f0
/* 00009AAC EC210072 */ fmuls f1, f1, f1
/* 00009AB0 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009AB4 EC24093A */ fmadds f1, f4, f4, f1
/* 00009AB8 4BFF6719 */ bl mathutil_sqrt
/* 00009ABC EFFF082A */ fadds f31, f31, f1
/* 00009AC0 3B7B0001 */ addi r27, r27, 1
/* 00009AC4 3BFF000C */ addi r31, r31, 0xc
lbl_00009AC8:
/* 00009AC8 7C1BF000 */ cmpw r27, r30
/* 00009ACC 4180FFB8 */ blt lbl_00009A84
/* 00009AD0 2C1A0000 */ cmpwi r26, 0
/* 00009AD4 41820048 */ beq lbl_00009B1C
/* 00009AD8 1C1A000C */ mulli r0, r26, 0xc
/* 00009ADC C0990008 */ lfs f4, 8(r25)
/* 00009AE0 C0590004 */ lfs f2, 4(r25)
/* 00009AE4 C0190000 */ lfs f0, 0(r25)
/* 00009AE8 7C7D0214 */ add r3, r29, r0
/* 00009AEC C0A30094 */ lfs f5, 0x94(r3)
/* 00009AF0 C0630090 */ lfs f3, 0x90(r3)
/* 00009AF4 C023008C */ lfs f1, 0x8c(r3)
/* 00009AF8 EC852028 */ fsubs f4, f5, f4
/* 00009AFC EC431028 */ fsubs f2, f3, f2
/* 00009B00 EC210028 */ fsubs f1, f1, f0
/* 00009B04 EC210072 */ fmuls f1, f1, f1
/* 00009B08 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009B0C EC24093A */ fmadds f1, f4, f4, f1
/* 00009B10 4BFF66C1 */ bl mathutil_sqrt
/* 00009B14 EFFF082A */ fadds f31, f31, f1
/* 00009B18 48000034 */ b lbl_00009B4C
lbl_00009B1C:
/* 00009B1C C07D00A0 */ lfs f3, 0xa0(r29)
/* 00009B20 C0590008 */ lfs f2, 8(r25)
/* 00009B24 C03D0098 */ lfs f1, 0x98(r29)
/* 00009B28 C0190000 */ lfs f0, 0(r25)
/* 00009B2C EC631028 */ fsubs f3, f3, f2
/* 00009B30 C05C0000 */ lfs f2, 0(r28)
/* 00009B34 EC210028 */ fsubs f1, f1, f0
/* 00009B38 EC210072 */ fmuls f1, f1, f1
/* 00009B3C EC2208BA */ fmadds f1, f2, f2, f1
/* 00009B40 EC2308FA */ fmadds f1, f3, f3, f1
/* 00009B44 4BFF668D */ bl mathutil_sqrt
/* 00009B48 FFE00890 */ fmr f31, f1
lbl_00009B4C:
/* 00009B4C BB210014 */ lmw r25, 0x14(r1)
/* 00009B50 FC20F890 */ fmr f1, f31
/* 00009B54 8001003C */ lwz r0, 0x3c(r1)
/* 00009B58 CBE10030 */ lfd f31, 0x30(r1)
/* 00009B5C 38210038 */ addi r1, r1, 0x38
/* 00009B60 7C0803A6 */ mtlr r0
/* 00009B64 4E800020 */ blr 
