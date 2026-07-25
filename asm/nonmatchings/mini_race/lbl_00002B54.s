/* 00002B54 7C0802A6 */ mflr r0
/* 00002B58 90010004 */ stw r0, 4(r1)
/* 00002B5C 9421FFF8 */ stwu r1, -8(r1)
/* 00002B60 80A30144 */ lwz r5, 0x144(r3)
/* 00002B64 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00002B68 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00002B6C A80501CE */ lha r0, 0x1ce(r5)
/* 00002B70 80630000 */ lwz r3, 0(r3)
/* 00002B74 2C000005 */ cmpwi r0, 5
/* 00002B78 80630078 */ lwz r3, 0x78(r3)
/* 00002B7C 40810030 */ ble lbl_00002BAC
/* 00002B80 C00501D4 */ lfs f0, 0x1d4(r5)
/* 00002B84 38850004 */ addi r4, r5, 4
/* 00002B88 D00501D8 */ stfs f0, 0x1d8(r5)
/* 00002B8C C00501DC */ lfs f0, 0x1dc(r5)
/* 00002B90 D00501E0 */ stfs f0, 0x1e0(r5)
/* 00002B94 C00501E8 */ lfs f0, 0x1e8(r5)
/* 00002B98 D00501D4 */ stfs f0, 0x1d4(r5)
/* 00002B9C C00501F0 */ lfs f0, 0x1f0(r5)
/* 00002BA0 D00501DC */ stfs f0, 0x1dc(r5)
/* 00002BA4 C02501D4 */ lfs f1, 0x1d4(r5)
/* 00002BA8 48000619 */ bl lbl_000031C0
lbl_00002BAC:
/* 00002BAC 8001000C */ lwz r0, 0xc(r1)
/* 00002BB0 38210008 */ addi r1, r1, 8
/* 00002BB4 7C0803A6 */ mtlr r0
/* 00002BB8 4E800020 */ blr 
