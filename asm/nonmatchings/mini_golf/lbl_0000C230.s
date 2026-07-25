/* 0000C230 7C0802A6 */ mflr r0
/* 0000C234 3C800000 */ lis r4, stageBoundSphere@ha
/* 0000C238 90010004 */ stw r0, 4(r1)
/* 0000C23C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000C240 93E10014 */ stw r31, 0x14(r1)
/* 0000C244 3BE40000 */ addi r31, r4, stageBoundSphere@l
/* 0000C248 3C800000 */ lis r4, lbl_00026390@ha
/* 0000C24C 93C10010 */ stw r30, 0x10(r1)
/* 0000C250 3BC30000 */ addi r30, r3, 0
/* 0000C254 38640000 */ addi r3, r4, lbl_00026390@l
/* 0000C258 80BF0000 */ lwz r5, 0(r31)
/* 0000C25C 801F0004 */ lwz r0, 4(r31)
/* 0000C260 90BE000C */ stw r5, 0xc(r30)
/* 0000C264 901E0010 */ stw r0, 0x10(r30)
/* 0000C268 801F0008 */ lwz r0, 8(r31)
/* 0000C26C 901E0014 */ stw r0, 0x14(r30)
/* 0000C270 C01F000C */ lfs f0, 0xc(r31)
/* 0000C274 D01E0000 */ stfs f0, 0(r30)
/* 0000C278 C0030000 */ lfs f0, 0(r3)
/* 0000C27C D01E0004 */ stfs f0, 4(r30)
/* 0000C280 C0030000 */ lfs f0, 0(r3)
/* 0000C284 D01E0008 */ stfs f0, 8(r30)
/* 0000C288 4BFF3F49 */ bl mathutil_mtxA_from_identity
/* 0000C28C 7FE3FB78 */ mr r3, r31
/* 0000C290 4BFF3F41 */ bl mathutil_mtxA_translate
/* 0000C294 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000C298 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000C29C 7C000734 */ extsh r0, r0
/* 0000C2A0 54033032 */ slwi r3, r0, 6
/* 0000C2A4 4BFF3F2D */ bl mathutil_mtxA_rotate_y
/* 0000C2A8 38601000 */ li r3, 0x1000
/* 0000C2AC 4BFF3F25 */ bl mathutil_mtxA_rotate_z
/* 0000C2B0 387E0000 */ addi r3, r30, 0
/* 0000C2B4 389E0000 */ addi r4, r30, 0
/* 0000C2B8 4BFF3F19 */ bl mathutil_mtxA_tf_point
/* 0000C2BC C07E000C */ lfs f3, 0xc(r30)
/* 0000C2C0 C03E0000 */ lfs f1, 0(r30)
/* 0000C2C4 C05E0014 */ lfs f2, 0x14(r30)
/* 0000C2C8 C01E0008 */ lfs f0, 8(r30)
/* 0000C2CC EC230828 */ fsubs f1, f3, f1
/* 0000C2D0 EC420028 */ fsubs f2, f2, f0
/* 0000C2D4 4BFF3EFD */ bl mathutil_atan2
/* 0000C2D8 38038000 */ addi r0, r3, -32768
/* 0000C2DC B01E001A */ sth r0, 0x1a(r30)
/* 0000C2E0 C07E0014 */ lfs f3, 0x14(r30)
/* 0000C2E4 C05E0008 */ lfs f2, 8(r30)
/* 0000C2E8 C03E000C */ lfs f1, 0xc(r30)
/* 0000C2EC C01E0000 */ lfs f0, 0(r30)
/* 0000C2F0 EC431028 */ fsubs f2, f3, f2
/* 0000C2F4 EC210028 */ fsubs f1, f1, f0
/* 0000C2F8 EC210072 */ fmuls f1, f1, f1
/* 0000C2FC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C300 4BFF3ED1 */ bl mathutil_sqrt
/* 0000C304 C07E0010 */ lfs f3, 0x10(r30)
/* 0000C308 FC400890 */ fmr f2, f1
/* 0000C30C C01E0004 */ lfs f0, 4(r30)
/* 0000C310 EC230028 */ fsubs f1, f3, f0
/* 0000C314 4BFF3EBD */ bl mathutil_atan2
/* 0000C318 B07E0018 */ sth r3, 0x18(r30)
/* 0000C31C 38000000 */ li r0, 0
/* 0000C320 B01E001C */ sth r0, 0x1c(r30)
/* 0000C324 8001001C */ lwz r0, 0x1c(r1)
/* 0000C328 83E10014 */ lwz r31, 0x14(r1)
/* 0000C32C 83C10010 */ lwz r30, 0x10(r1)
/* 0000C330 38210018 */ addi r1, r1, 0x18
/* 0000C334 7C0803A6 */ mtlr r0
/* 0000C338 4E800020 */ blr 
