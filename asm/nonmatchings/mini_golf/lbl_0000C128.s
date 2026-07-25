/* 0000C128 7C0802A6 */ mflr r0
/* 0000C12C 3C800000 */ lis r4, stageBoundSphere@ha
/* 0000C130 90010004 */ stw r0, 4(r1)
/* 0000C134 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000C138 93E10014 */ stw r31, 0x14(r1)
/* 0000C13C 3BE40000 */ addi r31, r4, stageBoundSphere@l
/* 0000C140 3C800000 */ lis r4, lbl_00026390@ha
/* 0000C144 93C10010 */ stw r30, 0x10(r1)
/* 0000C148 3BC30000 */ addi r30, r3, 0
/* 0000C14C 38640000 */ addi r3, r4, lbl_00026390@l
/* 0000C150 80BF0000 */ lwz r5, 0(r31)
/* 0000C154 801F0004 */ lwz r0, 4(r31)
/* 0000C158 90BE000C */ stw r5, 0xc(r30)
/* 0000C15C 901E0010 */ stw r0, 0x10(r30)
/* 0000C160 801F0008 */ lwz r0, 8(r31)
/* 0000C164 901E0014 */ stw r0, 0x14(r30)
/* 0000C168 C01F000C */ lfs f0, 0xc(r31)
/* 0000C16C D01E0000 */ stfs f0, 0(r30)
/* 0000C170 C0030000 */ lfs f0, 0(r3)
/* 0000C174 D01E0004 */ stfs f0, 4(r30)
/* 0000C178 C0030000 */ lfs f0, 0(r3)
/* 0000C17C D01E0008 */ stfs f0, 8(r30)
/* 0000C180 4BFF4051 */ bl mathutil_mtxA_from_identity
/* 0000C184 7FE3FB78 */ mr r3, r31
/* 0000C188 4BFF4049 */ bl mathutil_mtxA_translate
/* 0000C18C 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000C190 80030000 */ lwz r0, globalAnimTimer@l(r3)
/* 0000C194 54033032 */ slwi r3, r0, 6
/* 0000C198 4BFF4039 */ bl mathutil_mtxA_rotate_y
/* 0000C19C 38601000 */ li r3, 0x1000
/* 0000C1A0 4BFF4031 */ bl mathutil_mtxA_rotate_z
/* 0000C1A4 387E0000 */ addi r3, r30, 0
/* 0000C1A8 389E0000 */ addi r4, r30, 0
/* 0000C1AC 4BFF4025 */ bl mathutil_mtxA_tf_point
/* 0000C1B0 C07E000C */ lfs f3, 0xc(r30)
/* 0000C1B4 C03E0000 */ lfs f1, 0(r30)
/* 0000C1B8 C05E0014 */ lfs f2, 0x14(r30)
/* 0000C1BC C01E0008 */ lfs f0, 8(r30)
/* 0000C1C0 EC230828 */ fsubs f1, f3, f1
/* 0000C1C4 EC420028 */ fsubs f2, f2, f0
/* 0000C1C8 4BFF4009 */ bl mathutil_atan2
/* 0000C1CC 38038000 */ addi r0, r3, -32768
/* 0000C1D0 B01E001A */ sth r0, 0x1a(r30)
/* 0000C1D4 C07E0014 */ lfs f3, 0x14(r30)
/* 0000C1D8 C05E0008 */ lfs f2, 8(r30)
/* 0000C1DC C03E000C */ lfs f1, 0xc(r30)
/* 0000C1E0 C01E0000 */ lfs f0, 0(r30)
/* 0000C1E4 EC431028 */ fsubs f2, f3, f2
/* 0000C1E8 EC210028 */ fsubs f1, f1, f0
/* 0000C1EC EC210072 */ fmuls f1, f1, f1
/* 0000C1F0 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C1F4 4BFF3FDD */ bl mathutil_sqrt
/* 0000C1F8 C07E0010 */ lfs f3, 0x10(r30)
/* 0000C1FC FC400890 */ fmr f2, f1
/* 0000C200 C01E0004 */ lfs f0, 4(r30)
/* 0000C204 EC230028 */ fsubs f1, f3, f0
/* 0000C208 4BFF3FC9 */ bl mathutil_atan2
/* 0000C20C B07E0018 */ sth r3, 0x18(r30)
/* 0000C210 38000000 */ li r0, 0
/* 0000C214 B01E001C */ sth r0, 0x1c(r30)
/* 0000C218 8001001C */ lwz r0, 0x1c(r1)
/* 0000C21C 83E10014 */ lwz r31, 0x14(r1)
/* 0000C220 83C10010 */ lwz r30, 0x10(r1)
/* 0000C224 38210018 */ addi r1, r1, 0x18
/* 0000C228 7C0803A6 */ mtlr r0
/* 0000C22C 4E800020 */ blr 
