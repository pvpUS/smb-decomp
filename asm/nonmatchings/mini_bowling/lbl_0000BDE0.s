/* 0000BDE0 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000BDE4 C0E40000 */ lfs f7, 0(r4)
/* 0000BDE8 C0830000 */ lfs f4, 0(r3)
/* 0000BDEC C0C40004 */ lfs f6, 4(r4)
/* 0000BDF0 C0630004 */ lfs f3, 4(r3)
/* 0000BDF4 C0A40008 */ lfs f5, 8(r4)
/* 0000BDF8 C0030008 */ lfs f0, 8(r3)
/* 0000BDFC EC870132 */ fmuls f4, f7, f4
/* 0000BE00 EC8620FA */ fmadds f4, f6, f3, f4
/* 0000BE04 EC85203A */ fmadds f4, f5, f0, f4
/* 0000BE08 C0040000 */ lfs f0, 0(r4)
/* 0000BE0C 3CC00000 */ lis r6, lbl_00014CB8@ha
/* 0000BE10 C8660000 */ lfd f3, lbl_00014CB8@l(r6)
/* 0000BE14 EC000132 */ fmuls f0, f0, f4
/* 0000BE18 FCA30828 */ fsub f5, f3, f1
/* 0000BE1C D0010028 */ stfs f0, 0x28(r1)
/* 0000BE20 FCA02818 */ frsp f5, f5
/* 0000BE24 C0040004 */ lfs f0, 4(r4)
/* 0000BE28 EC000132 */ fmuls f0, f0, f4
/* 0000BE2C D001002C */ stfs f0, 0x2c(r1)
/* 0000BE30 C0040008 */ lfs f0, 8(r4)
/* 0000BE34 EC000132 */ fmuls f0, f0, f4
/* 0000BE38 D0010030 */ stfs f0, 0x30(r1)
/* 0000BE3C C0010028 */ lfs f0, 0x28(r1)
/* 0000BE40 C0830000 */ lfs f4, 0(r3)
/* 0000BE44 C061002C */ lfs f3, 0x2c(r1)
/* 0000BE48 EC250032 */ fmuls f1, f5, f0
/* 0000BE4C EC840028 */ fsubs f4, f4, f0
/* 0000BE50 C0010030 */ lfs f0, 0x30(r1)
/* 0000BE54 D081001C */ stfs f4, 0x1c(r1)
/* 0000BE58 C0830004 */ lfs f4, 4(r3)
/* 0000BE5C EC641828 */ fsubs f3, f4, f3
/* 0000BE60 D0610020 */ stfs f3, 0x20(r1)
/* 0000BE64 C0630008 */ lfs f3, 8(r3)
/* 0000BE68 EC030028 */ fsubs f0, f3, f0
/* 0000BE6C D0010024 */ stfs f0, 0x24(r1)
/* 0000BE70 C001001C */ lfs f0, 0x1c(r1)
/* 0000BE74 EC020032 */ fmuls f0, f2, f0
/* 0000BE78 EC010028 */ fsubs f0, f1, f0
/* 0000BE7C D0050000 */ stfs f0, 0(r5)
/* 0000BE80 C021002C */ lfs f1, 0x2c(r1)
/* 0000BE84 C0010020 */ lfs f0, 0x20(r1)
/* 0000BE88 EC250072 */ fmuls f1, f5, f1
/* 0000BE8C EC020032 */ fmuls f0, f2, f0
/* 0000BE90 EC010028 */ fsubs f0, f1, f0
/* 0000BE94 D0050004 */ stfs f0, 4(r5)
/* 0000BE98 C0210030 */ lfs f1, 0x30(r1)
/* 0000BE9C C0010024 */ lfs f0, 0x24(r1)
/* 0000BEA0 EC250072 */ fmuls f1, f5, f1
/* 0000BEA4 EC020032 */ fmuls f0, f2, f0
/* 0000BEA8 EC010028 */ fsubs f0, f1, f0
/* 0000BEAC D0050008 */ stfs f0, 8(r5)
/* 0000BEB0 38210038 */ addi r1, r1, 0x38
/* 0000BEB4 4E800020 */ blr 
