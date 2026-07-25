/* 00008B60 7C0802A6 */ mflr r0
/* 00008B64 3CC00000 */ lis r6, controllerInfo@ha
/* 00008B68 90010004 */ stw r0, 4(r1)
/* 00008B6C 9421FFE0 */ stwu r1, -0x20(r1)
/* 00008B70 8803002E */ lbz r0, 0x2e(r3)
/* 00008B74 3C600000 */ lis r3, playerControllerIDs@ha
/* 00008B78 7C000774 */ extsb r0, r0
/* 00008B7C 5405103A */ slwi r5, r0, 2
/* 00008B80 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00008B84 7C602A14 */ add r3, r0, r5
/* 00008B88 80030000 */ lwz r0, 0(r3)
/* 00008B8C 3C600000 */ lis r3, lbl_000137B8@ha
/* 00008B90 C8430000 */ lfd f2, lbl_000137B8@l(r3)
/* 00008B94 38660000 */ addi r3, r6, controllerInfo@l
/* 00008B98 1C00003C */ mulli r0, r0, 0x3c
/* 00008B9C 7C630214 */ add r3, r3, r0
/* 00008BA0 88030002 */ lbz r0, 2(r3)
/* 00008BA4 3CA00000 */ lis r5, lbl_00013740@ha
/* 00008BA8 38C50000 */ addi r6, r5, lbl_00013740@l
/* 00008BAC 88630003 */ lbz r3, 3(r3)
/* 00008BB0 7C000774 */ extsb r0, r0
/* 00008BB4 6C008000 */ xoris r0, r0, 0x8000
/* 00008BB8 C0060298 */ lfs f0, 0x298(r6)
/* 00008BBC 9001001C */ stw r0, 0x1c(r1)
/* 00008BC0 3CA04330 */ lis r5, 0x4330
/* 00008BC4 7C630774 */ extsb r3, r3
/* 00008BC8 90A10018 */ stw r5, 0x18(r1)
/* 00008BCC 7C0300D0 */ neg r0, r3
/* 00008BD0 6C008000 */ xoris r0, r0, 0x8000
/* 00008BD4 C8210018 */ lfd f1, 0x18(r1)
/* 00008BD8 3C600000 */ lis r3, lbl_000137B8@ha
/* 00008BDC 90010014 */ stw r0, 0x14(r1)
/* 00008BE0 EC211028 */ fsubs f1, f1, f2
/* 00008BE4 90A10010 */ stw r5, 0x10(r1)
/* 00008BE8 EC010024 */ fdivs f0, f1, f0
/* 00008BEC C8210010 */ lfd f1, 0x10(r1)
/* 00008BF0 D0040000 */ stfs f0, 0(r4)
/* 00008BF4 C0060008 */ lfs f0, 8(r6)
/* 00008BF8 D0040004 */ stfs f0, 4(r4)
/* 00008BFC C8430000 */ lfd f2, lbl_000137B8@l(r3)
/* 00008C00 C0060298 */ lfs f0, 0x298(r6)
/* 00008C04 EC211028 */ fsubs f1, f1, f2
/* 00008C08 EC010024 */ fdivs f0, f1, f0
/* 00008C0C D0040008 */ stfs f0, 8(r4)
/* 00008C10 C0440000 */ lfs f2, 0(r4)
/* 00008C14 C0240004 */ lfs f1, 4(r4)
/* 00008C18 C0040008 */ lfs f0, 8(r4)
/* 00008C1C EC4200B2 */ fmuls f2, f2, f2
/* 00008C20 EC41107A */ fmadds f2, f1, f1, f2
/* 00008C24 EC40103A */ fmadds f2, f0, f0, f2
/* 00008C28 C0060020 */ lfs f0, 0x20(r6)
/* 00008C2C FC020040 */ fcmpo cr0, f2, f0
/* 00008C30 4081000C */ ble lbl_00008C3C
/* 00008C34 7C832378 */ mr r3, r4
/* 00008C38 4BFF7545 */ bl mathutil_vec_normalize_len
lbl_00008C3C:
/* 00008C3C 80010024 */ lwz r0, 0x24(r1)
/* 00008C40 38210020 */ addi r1, r1, 0x20
/* 00008C44 7C0803A6 */ mtlr r0
/* 00008C48 4E800020 */ blr 
