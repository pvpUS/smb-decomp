/* 0000B000 7C0802A6 */ mflr r0
/* 0000B004 3C800000 */ lis r4, debugFlags@ha
/* 0000B008 90010004 */ stw r0, 4(r1)
/* 0000B00C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000B010 93E10014 */ stw r31, 0x14(r1)
/* 0000B014 3BE30000 */ addi r31, r3, 0
/* 0000B018 80040000 */ lwz r0, debugFlags@l(r4)
/* 0000B01C 3C800000 */ lis r4, lbl_0000C690@ha
/* 0000B020 38640000 */ addi r3, r4, lbl_0000C690@l
/* 0000B024 7000000A */ andi. r0, r0, 0xa
/* 0000B028 408200D8 */ bne lbl_0000B100
/* 0000B02C C03F0000 */ lfs f1, 0(r31)
/* 0000B030 C01F000C */ lfs f0, 0xc(r31)
/* 0000B034 EC01002A */ fadds f0, f1, f0
/* 0000B038 D01F0000 */ stfs f0, 0(r31)
/* 0000B03C C03F0004 */ lfs f1, 4(r31)
/* 0000B040 C01F0010 */ lfs f0, 0x10(r31)
/* 0000B044 EC01002A */ fadds f0, f1, f0
/* 0000B048 D01F0004 */ stfs f0, 4(r31)
/* 0000B04C C03F0008 */ lfs f1, 8(r31)
/* 0000B050 C01F0014 */ lfs f0, 0x14(r31)
/* 0000B054 EC01002A */ fadds f0, f1, f0
/* 0000B058 D01F0008 */ stfs f0, 8(r31)
/* 0000B05C C03F000C */ lfs f1, 0xc(r31)
/* 0000B060 C0030004 */ lfs f0, 4(r3)
/* 0000B064 EC010032 */ fmuls f0, f1, f0
/* 0000B068 D01F000C */ stfs f0, 0xc(r31)
/* 0000B06C C03F0014 */ lfs f1, 0x14(r31)
/* 0000B070 C0030004 */ lfs f0, 4(r3)
/* 0000B074 EC010032 */ fmuls f0, f1, f0
/* 0000B078 D01F0014 */ stfs f0, 0x14(r31)
/* 0000B07C C03F0010 */ lfs f1, 0x10(r31)
/* 0000B080 C0030008 */ lfs f0, 8(r3)
/* 0000B084 FC010040 */ fcmpo cr0, f1, f0
/* 0000B088 40800014 */ bge lbl_0000B09C
/* 0000B08C C003000C */ lfs f0, 0xc(r3)
/* 0000B090 EC010032 */ fmuls f0, f1, f0
/* 0000B094 D01F0010 */ stfs f0, 0x10(r31)
/* 0000B098 48000010 */ b lbl_0000B0A8
lbl_0000B09C:
/* 0000B09C C0030010 */ lfs f0, 0x10(r3)
/* 0000B0A0 EC01002A */ fadds f0, f1, f0
/* 0000B0A4 D01F0010 */ stfs f0, 0x10(r31)
lbl_0000B0A8:
/* 0000B0A8 C03F0018 */ lfs f1, 0x18(r31)
/* 0000B0AC C0030014 */ lfs f0, 0x14(r3)
/* 0000B0B0 EC010032 */ fmuls f0, f1, f0
/* 0000B0B4 D01F0018 */ stfs f0, 0x18(r31)
/* 0000B0B8 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B0BC C0030018 */ lfs f0, 0x18(r3)
/* 0000B0C0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B0C4 40800014 */ bge lbl_0000B0D8
/* 0000B0C8 C03F001C */ lfs f1, 0x1c(r31)
/* 0000B0CC C003001C */ lfs f0, 0x1c(r3)
/* 0000B0D0 EC010028 */ fsubs f0, f1, f0
/* 0000B0D4 D01F001C */ stfs f0, 0x1c(r31)
lbl_0000B0D8:
/* 0000B0D8 C03F0004 */ lfs f1, 4(r31)
/* 0000B0DC C0030000 */ lfs f0, 0(r3)
/* 0000B0E0 FC010040 */ fcmpo cr0, f1, f0
/* 0000B0E4 4081000C */ ble lbl_0000B0F0
/* 0000B0E8 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B0EC 48000014 */ b lbl_0000B100
lbl_0000B0F0:
/* 0000B0F0 C03F0020 */ lfs f1, 0x20(r31)
/* 0000B0F4 C0030020 */ lfs f0, 0x20(r3)
/* 0000B0F8 EC010028 */ fsubs f0, f1, f0
/* 0000B0FC D01F0020 */ stfs f0, 0x20(r31)
lbl_0000B100:
/* 0000B100 7FE3FB78 */ mr r3, r31
/* 0000B104 4BFF5049 */ bl mathutil_mtxA_from_mtxB_translate
/* 0000B108 4BFF5045 */ bl mathutil_mtxA_sq_from_identity
/* 0000B10C 38604000 */ li r3, 0x4000
/* 0000B110 4BFF503D */ bl mathutil_mtxA_rotate_x
/* 0000B114 C03F0018 */ lfs f1, 0x18(r31)
/* 0000B118 4BFF5035 */ bl mathutil_mtxA_scale_s
/* 0000B11C 8001001C */ lwz r0, 0x1c(r1)
/* 0000B120 83E10014 */ lwz r31, 0x14(r1)
/* 0000B124 38210018 */ addi r1, r1, 0x18
/* 0000B128 7C0803A6 */ mtlr r0
/* 0000B12C 4E800020 */ blr 
