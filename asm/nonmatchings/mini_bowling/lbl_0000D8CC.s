/* 0000D8CC C0230004 */ lfs f1, 4(r3)
/* 0000D8D0 C0A40008 */ lfs f5, 8(r4)
/* 0000D8D4 C0430008 */ lfs f2, 8(r3)
/* 0000D8D8 C0640000 */ lfs f3, 0(r4)
/* 0000D8DC C0030000 */ lfs f0, 0(r3)
/* 0000D8E0 C0840004 */ lfs f4, 4(r4)
/* 0000D8E4 ECC10172 */ fmuls f6, f1, f5
/* 0000D8E8 ECE200F2 */ fmuls f7, f2, f3
/* 0000D8EC ED000132 */ fmuls f8, f0, f4
/* 0000D8F0 ECC2313C */ fnmsubs f6, f2, f4, f6
/* 0000D8F4 D0C50000 */ stfs f6, 0(r5)
/* 0000D8F8 ECE0397C */ fnmsubs f7, f0, f5, f7
/* 0000D8FC D0E50004 */ stfs f7, 4(r5)
/* 0000D900 ED0140FC */ fnmsubs f8, f1, f3, f8
/* 0000D904 D1050008 */ stfs f8, 8(r5)
/* 0000D908 4E800020 */ blr 
