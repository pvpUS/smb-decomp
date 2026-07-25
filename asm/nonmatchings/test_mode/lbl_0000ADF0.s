/* 0000ADF0 3C600000 */ lis r3, controllerInfo@ha
/* 0000ADF4 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 0000ADF8 3CA00000 */ lis r5, lbl_00010080@ha
/* 0000ADFC 3C800000 */ lis r4, lbl_10000F60@ha
/* 0000AE00 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000AE04 3C600000 */ lis r3, currentCamera@ha
/* 0000AE08 38C50000 */ addi r6, r5, lbl_00010080@l
/* 0000AE0C 38A40000 */ addi r5, r4, lbl_10000F60@l
/* 0000AE10 38830000 */ addi r4, r3, currentCamera@l
/* 0000AE14 4C820020 */ bnelr 
/* 0000AE18 80640000 */ lwz r3, 0(r4)
/* 0000AE1C C0450000 */ lfs f2, 0(r5)
/* 0000AE20 C003000C */ lfs f0, 0xc(r3)
/* 0000AE24 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE28 EC001028 */ fsubs f0, f0, f2
/* 0000AE2C EC010032 */ fmuls f0, f1, f0
/* 0000AE30 EC02002A */ fadds f0, f2, f0
/* 0000AE34 D0050000 */ stfs f0, 0(r5)
/* 0000AE38 80640000 */ lwz r3, 0(r4)
/* 0000AE3C C0450004 */ lfs f2, 4(r5)
/* 0000AE40 C0030010 */ lfs f0, 0x10(r3)
/* 0000AE44 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE48 EC001028 */ fsubs f0, f0, f2
/* 0000AE4C EC010032 */ fmuls f0, f1, f0
/* 0000AE50 EC02002A */ fadds f0, f2, f0
/* 0000AE54 D0050004 */ stfs f0, 4(r5)
/* 0000AE58 80640000 */ lwz r3, 0(r4)
/* 0000AE5C C0450008 */ lfs f2, 8(r5)
/* 0000AE60 C0030014 */ lfs f0, 0x14(r3)
/* 0000AE64 C026007C */ lfs f1, 0x7c(r6)
/* 0000AE68 EC001028 */ fsubs f0, f0, f2
/* 0000AE6C EC010032 */ fmuls f0, f1, f0
/* 0000AE70 EC02002A */ fadds f0, f2, f0
/* 0000AE74 D0050008 */ stfs f0, 8(r5)
/* 0000AE78 4E800020 */ blr 
