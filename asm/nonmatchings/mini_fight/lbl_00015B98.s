/* 00015B98 81040048 */ lwz r8, 0x48(r4)
/* 00015B9C 3C600000 */ lis r3, lbl_10017664@ha
/* 00015BA0 38030000 */ addi r0, r3, lbl_10017664@l
/* 00015BA4 1CA80018 */ mulli r5, r8, 0x18
/* 00015BA8 7C602A14 */ add r3, r0, r5
/* 00015BAC A003001A */ lhz r0, 0x1a(r3)
/* 00015BB0 3CC00000 */ lis r6, lbl_10018920@ha
/* 00015BB4 1CA800BC */ mulli r5, r8, 0xbc
/* 00015BB8 38660000 */ addi r3, r6, lbl_10018920@l
/* 00015BBC 3CE00000 */ lis r7, lbl_0001C628@ha
/* 00015BC0 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00015BC4 38C70000 */ addi r6, r7, lbl_0001C628@l
/* 00015BC8 7C632A14 */ add r3, r3, r5
/* 00015BCC 40820038 */ bne lbl_00015C04
/* 00015BD0 C023000C */ lfs f1, 0xc(r3)
/* 00015BD4 C0030004 */ lfs f0, 4(r3)
/* 00015BD8 FC010040 */ fcmpo cr0, f1, f0
/* 00015BDC 4081005C */ ble lbl_00015C38
/* 00015BE0 C0060048 */ lfs f0, 0x48(r6)
/* 00015BE4 EC010028 */ fsubs f0, f1, f0
/* 00015BE8 D003000C */ stfs f0, 0xc(r3)
/* 00015BEC C003000C */ lfs f0, 0xc(r3)
/* 00015BF0 C0230004 */ lfs f1, 4(r3)
/* 00015BF4 FC000840 */ fcmpo cr0, f0, f1
/* 00015BF8 40800040 */ bge lbl_00015C38
/* 00015BFC D023000C */ stfs f1, 0xc(r3)
/* 00015C00 48000038 */ b lbl_00015C38
lbl_00015C04:
/* 00015C04 C046004C */ lfs f2, 0x4c(r6)
/* 00015C08 C0030004 */ lfs f0, 4(r3)
/* 00015C0C C023000C */ lfs f1, 0xc(r3)
/* 00015C10 EC42002A */ fadds f2, f2, f0
/* 00015C14 FC011040 */ fcmpo cr0, f1, f2
/* 00015C18 40800020 */ bge lbl_00015C38
/* 00015C1C C0060050 */ lfs f0, 0x50(r6)
/* 00015C20 EC01002A */ fadds f0, f1, f0
/* 00015C24 D003000C */ stfs f0, 0xc(r3)
/* 00015C28 C003000C */ lfs f0, 0xc(r3)
/* 00015C2C FC001040 */ fcmpo cr0, f0, f2
/* 00015C30 40810008 */ ble lbl_00015C38
/* 00015C34 D043000C */ stfs f2, 0xc(r3)
lbl_00015C38:
/* 00015C38 C0030008 */ lfs f0, 8(r3)
/* 00015C3C D0040004 */ stfs f0, 4(r4)
/* 00015C40 C003000C */ lfs f0, 0xc(r3)
/* 00015C44 D0040008 */ stfs f0, 8(r4)
/* 00015C48 4E800020 */ blr 
