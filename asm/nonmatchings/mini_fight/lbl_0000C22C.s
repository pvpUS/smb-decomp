/* 0000C22C 7C0802A6 */ mflr r0
/* 0000C230 3C600000 */ lis r3, debugFlags@ha
/* 0000C234 90010004 */ stw r0, 4(r1)
/* 0000C238 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000C23C 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000C240 7000000A */ andi. r0, r0, 0xa
/* 0000C244 40820074 */ bne lbl_0000C2B8
/* 0000C248 3C600000 */ lis r3, modeCtrl@ha
/* 0000C24C 38C30000 */ addi r6, r3, modeCtrl@l
/* 0000C250 80A60000 */ lwz r5, 0(r6)
/* 0000C254 3C600000 */ lis r3, lbl_0001C268@ha
/* 0000C258 3C800000 */ lis r4, lbl_0001C270@ha
/* 0000C25C 3805FFFF */ addi r0, r5, -1
/* 0000C260 90060000 */ stw r0, 0(r6)
/* 0000C264 38A30000 */ addi r5, r3, lbl_0001C268@l
/* 0000C268 3C004330 */ lis r0, 0x4330
/* 0000C26C 80660000 */ lwz r3, 0(r6)
/* 0000C270 C8240000 */ lfd f1, lbl_0001C270@l(r4)
/* 0000C274 6C648000 */ xoris r4, r3, 0x8000
/* 0000C278 C8450000 */ lfd f2, 0(r5)
/* 0000C27C 9081000C */ stw r4, 0xc(r1)
/* 0000C280 90010008 */ stw r0, 8(r1)
/* 0000C284 C8010008 */ lfd f0, 8(r1)
/* 0000C288 FC000828 */ fsub f0, f0, f1
/* 0000C28C FC020000 */ fcmpu cr0, f2, f0
/* 0000C290 40820008 */ bne lbl_0000C298
/* 0000C294 4800E0CD */ bl lbl_0001A360
lbl_0000C298:
/* 0000C298 3C600000 */ lis r3, modeCtrl@ha
/* 0000C29C 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000C2A0 2C000000 */ cmpwi r0, 0
/* 0000C2A4 40820014 */ bne lbl_0000C2B8
/* 0000C2A8 3C600000 */ lis r3, lbl_10017664@ha
/* 0000C2AC 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000C2B0 38000012 */ li r0, 0x12
/* 0000C2B4 B0030002 */ sth r0, 2(r3)
lbl_0000C2B8:
/* 0000C2B8 80010014 */ lwz r0, 0x14(r1)
/* 0000C2BC 38210010 */ addi r1, r1, 0x10
/* 0000C2C0 7C0803A6 */ mtlr r0
/* 0000C2C4 4E800020 */ blr 
