/* 00009B68 7C0802A6 */ mflr r0
/* 00009B6C 3C800000 */ lis r4, lbl_10000000@ha
/* 00009B70 90010004 */ stw r0, 4(r1)
/* 00009B74 38C40000 */ addi r6, r4, lbl_10000000@l
/* 00009B78 9421FFF8 */ stwu r1, -8(r1)
/* 00009B7C A806003A */ lha r0, 0x3a(r6)
/* 00009B80 2C000004 */ cmpwi r0, 4
/* 00009B84 40820048 */ bne lbl_00009BCC
/* 00009B88 3C800000 */ lis r4, modeCtrl@ha
/* 00009B8C C0460060 */ lfs f2, 0x60(r6)
/* 00009B90 38840000 */ addi r4, r4, modeCtrl@l
/* 00009B94 8004002C */ lwz r0, 0x2c(r4)
/* 00009B98 3CA00000 */ lis r5, ballInfo@ha
/* 00009B9C 3C800000 */ lis r4, lbl_000262F0@ha
/* 00009BA0 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00009BA4 C8040000 */ lfd f0, lbl_000262F0@l(r4)
/* 00009BA8 38A50000 */ addi r5, r5, ballInfo@l
/* 00009BAC 7CA50214 */ add r5, r5, r0
/* 00009BB0 C0250008 */ lfs f1, 8(r5)
/* 00009BB4 EC220828 */ fsubs f1, f2, f1
/* 00009BB8 FC200A10 */ fabs f1, f1
/* 00009BBC FC010040 */ fcmpo cr0, f1, f0
/* 00009BC0 4081000C */ ble lbl_00009BCC
/* 00009BC4 4BFFFE1D */ bl lbl_000099E0
/* 00009BC8 48000038 */ b lbl_00009C00
lbl_00009BCC:
/* 00009BCC C0260064 */ lfs f1, 0x64(r6)
/* 00009BD0 C0030008 */ lfs f0, 8(r3)
/* 00009BD4 C0660060 */ lfs f3, 0x60(r6)
/* 00009BD8 C0430004 */ lfs f2, 4(r3)
/* 00009BDC EC810028 */ fsubs f4, f1, f0
/* 00009BE0 C026005C */ lfs f1, 0x5c(r6)
/* 00009BE4 C0030000 */ lfs f0, 0(r3)
/* 00009BE8 EC431028 */ fsubs f2, f3, f2
/* 00009BEC EC210028 */ fsubs f1, f1, f0
/* 00009BF0 EC210072 */ fmuls f1, f1, f1
/* 00009BF4 EC2208BA */ fmadds f1, f2, f2, f1
/* 00009BF8 EC24093A */ fmadds f1, f4, f4, f1
/* 00009BFC 4BFF65D5 */ bl mathutil_sqrt
lbl_00009C00:
/* 00009C00 8001000C */ lwz r0, 0xc(r1)
/* 00009C04 38210008 */ addi r1, r1, 8
/* 00009C08 7C0803A6 */ mtlr r0
/* 00009C0C 4E800020 */ blr 
