/* 00005A84 7C0802A6 */ mflr r0
/* 00005A88 3C800000 */ lis r4, lbl_00013740@ha
/* 00005A8C 90010004 */ stw r0, 4(r1)
/* 00005A90 9421FFE0 */ stwu r1, -0x20(r1)
/* 00005A94 93E1001C */ stw r31, 0x1c(r1)
/* 00005A98 93C10018 */ stw r30, 0x18(r1)
/* 00005A9C 3BC40000 */ addi r30, r4, lbl_00013740@l
/* 00005AA0 93A10014 */ stw r29, 0x14(r1)
/* 00005AA4 7C7D1B78 */ mr r29, r3
/* 00005AA8 389D001C */ addi r4, r29, 0x1c
/* 00005AAC 83E30144 */ lwz r31, 0x144(r3)
/* 00005AB0 80630004 */ lwz r3, 4(r3)
/* 00005AB4 801D0008 */ lwz r0, 8(r29)
/* 00005AB8 907D0010 */ stw r3, 0x10(r29)
/* 00005ABC 901D0014 */ stw r0, 0x14(r29)
/* 00005AC0 801D000C */ lwz r0, 0xc(r29)
/* 00005AC4 901D0018 */ stw r0, 0x18(r29)
/* 00005AC8 C0240000 */ lfs f1, 0(r4)
/* 00005ACC C0440004 */ lfs f2, 4(r4)
/* 00005AD0 C0040008 */ lfs f0, 8(r4)
/* 00005AD4 EC210072 */ fmuls f1, f1, f1
/* 00005AD8 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005ADC EC20083A */ fmadds f1, f0, f0, f1
/* 00005AE0 4BFFA69D */ bl mathutil_sqrt
/* 00005AE4 D03D00F8 */ stfs f1, 0xf8(r29)
/* 00005AE8 801D0094 */ lwz r0, 0x94(r29)
/* 00005AEC 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00005AF0 901D0094 */ stw r0, 0x94(r29)
/* 00005AF4 C03D0020 */ lfs f1, 0x20(r29)
/* 00005AF8 C01D006C */ lfs f0, 0x6c(r29)
/* 00005AFC EC010028 */ fsubs f0, f1, f0
/* 00005B00 D01D0020 */ stfs f0, 0x20(r29)
/* 00005B04 A81F01CE */ lha r0, 0x1ce(r31)
/* 00005B08 2C000005 */ cmpwi r0, 5
/* 00005B0C 4081004C */ ble lbl_00005B58
/* 00005B10 C03E014C */ lfs f1, 0x14c(r30)
/* 00005B14 C01F01F8 */ lfs f0, 0x1f8(r31)
/* 00005B18 C05D001C */ lfs f2, 0x1c(r29)
/* 00005B1C EC010032 */ fmuls f0, f1, f0
/* 00005B20 EC020032 */ fmuls f0, f2, f0
/* 00005B24 D01D001C */ stfs f0, 0x1c(r29)
/* 00005B28 C03E014C */ lfs f1, 0x14c(r30)
/* 00005B2C C01F01F8 */ lfs f0, 0x1f8(r31)
/* 00005B30 C05D0020 */ lfs f2, 0x20(r29)
/* 00005B34 EC010032 */ fmuls f0, f1, f0
/* 00005B38 EC020032 */ fmuls f0, f2, f0
/* 00005B3C D01D0020 */ stfs f0, 0x20(r29)
/* 00005B40 C03E014C */ lfs f1, 0x14c(r30)
/* 00005B44 C01F01F8 */ lfs f0, 0x1f8(r31)
/* 00005B48 C05D0024 */ lfs f2, 0x24(r29)
/* 00005B4C EC010032 */ fmuls f0, f1, f0
/* 00005B50 EC020032 */ fmuls f0, f2, f0
/* 00005B54 D01D0024 */ stfs f0, 0x24(r29)
lbl_00005B58:
/* 00005B58 C03D0004 */ lfs f1, 4(r29)
/* 00005B5C 7FA3EB78 */ mr r3, r29
/* 00005B60 C01D001C */ lfs f0, 0x1c(r29)
/* 00005B64 EC01002A */ fadds f0, f1, f0
/* 00005B68 D01D0004 */ stfs f0, 4(r29)
/* 00005B6C C03D0008 */ lfs f1, 8(r29)
/* 00005B70 C01D0020 */ lfs f0, 0x20(r29)
/* 00005B74 EC01002A */ fadds f0, f1, f0
/* 00005B78 D01D0008 */ stfs f0, 8(r29)
/* 00005B7C C03D000C */ lfs f1, 0xc(r29)
/* 00005B80 C01D0024 */ lfs f0, 0x24(r29)
/* 00005B84 EC01002A */ fadds f0, f1, f0
/* 00005B88 D01D000C */ stfs f0, 0xc(r29)
/* 00005B8C 48001AFD */ bl lbl_00007688
/* 00005B90 2C030000 */ cmpwi r3, 0
/* 00005B94 41820070 */ beq lbl_00005C04
/* 00005B98 3860001D */ li r3, 0x1d
/* 00005B9C 4BFFA5E1 */ bl u_play_sound_0
/* 00005BA0 38600015 */ li r3, 0x15
/* 00005BA4 4BFFA5D9 */ bl u_play_sound_0
/* 00005BA8 C01F01D4 */ lfs f0, 0x1d4(r31)
/* 00005BAC 38000013 */ li r0, 0x13
/* 00005BB0 D01F01E8 */ stfs f0, 0x1e8(r31)
/* 00005BB4 C01F01D8 */ lfs f0, 0x1d8(r31)
/* 00005BB8 D01F01EC */ stfs f0, 0x1ec(r31)
/* 00005BBC C01F01DC */ lfs f0, 0x1dc(r31)
/* 00005BC0 D01F01F0 */ stfs f0, 0x1f0(r31)
/* 00005BC4 C01F01E0 */ lfs f0, 0x1e0(r31)
/* 00005BC8 D01F01F4 */ stfs f0, 0x1f4(r31)
/* 00005BCC 981D0148 */ stb r0, 0x148(r29)
/* 00005BD0 801F0014 */ lwz r0, 0x14(r31)
/* 00005BD4 540006B5 */ rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 00005BD8 40820024 */ bne lbl_00005BFC
/* 00005BDC 881D002E */ lbz r0, 0x2e(r29)
/* 00005BE0 3C600000 */ lis r3, cameraInfo@ha
/* 00005BE4 38630000 */ addi r3, r3, cameraInfo@l
/* 00005BE8 7C000774 */ extsb r0, r0
/* 00005BEC 1C000284 */ mulli r0, r0, 0x284
/* 00005BF0 7C630214 */ add r3, r3, r0
/* 00005BF4 38000007 */ li r0, 7
/* 00005BF8 9803001F */ stb r0, 0x1f(r3)
lbl_00005BFC:
/* 00005BFC 3800003C */ li r0, 0x3c
/* 00005C00 B01F001C */ sth r0, 0x1c(r31)
lbl_00005C04:
/* 00005C04 80010024 */ lwz r0, 0x24(r1)
/* 00005C08 83E1001C */ lwz r31, 0x1c(r1)
/* 00005C0C 83C10018 */ lwz r30, 0x18(r1)
/* 00005C10 7C0803A6 */ mtlr r0
/* 00005C14 83A10014 */ lwz r29, 0x14(r1)
/* 00005C18 38210020 */ addi r1, r1, 0x20
/* 00005C1C 4E800020 */ blr 
lbl_00005C20:
/* 00005C20 7C0802A6 */ mflr r0
/* 00005C24 90010004 */ stw r0, 4(r1)
/* 00005C28 9421FFE0 */ stwu r1, -0x20(r1)
/* 00005C2C 93E1001C */ stw r31, 0x1c(r1)
/* 00005C30 7C7F1B78 */ mr r31, r3
/* 00005C34 80630004 */ lwz r3, 4(r3)
/* 00005C38 801F0008 */ lwz r0, 8(r31)
/* 00005C3C 907F0010 */ stw r3, 0x10(r31)
/* 00005C40 387F001C */ addi r3, r31, 0x1c
/* 00005C44 901F0014 */ stw r0, 0x14(r31)
/* 00005C48 801F000C */ lwz r0, 0xc(r31)
/* 00005C4C 901F0018 */ stw r0, 0x18(r31)
/* 00005C50 C0230000 */ lfs f1, 0(r3)
/* 00005C54 C0430004 */ lfs f2, 4(r3)
/* 00005C58 C0030008 */ lfs f0, 8(r3)
/* 00005C5C EC210072 */ fmuls f1, f1, f1
/* 00005C60 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005C64 EC20083A */ fmadds f1, f0, f0, f1
/* 00005C68 4BFFA515 */ bl mathutil_sqrt
/* 00005C6C D03F00F8 */ stfs f1, 0xf8(r31)
/* 00005C70 3C600000 */ lis r3, lbl_000138E8@ha
/* 00005C74 38C30000 */ addi r6, r3, lbl_000138E8@l
/* 00005C78 801F0094 */ lwz r0, 0x94(r31)
/* 00005C7C 3881000C */ addi r4, r1, 0xc
/* 00005C80 7FE3FB78 */ mr r3, r31
/* 00005C84 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00005C88 901F0094 */ stw r0, 0x94(r31)
/* 00005C8C 80A60000 */ lwz r5, 0(r6)
/* 00005C90 80060004 */ lwz r0, 4(r6)
/* 00005C94 90A1000C */ stw r5, 0xc(r1)
/* 00005C98 90010010 */ stw r0, 0x10(r1)
/* 00005C9C 80060008 */ lwz r0, 8(r6)
/* 00005CA0 90010014 */ stw r0, 0x14(r1)
/* 00005CA4 48000D2D */ bl lbl_000069D0
/* 00005CA8 C03F0004 */ lfs f1, 4(r31)
/* 00005CAC C01F001C */ lfs f0, 0x1c(r31)
/* 00005CB0 EC01002A */ fadds f0, f1, f0
/* 00005CB4 D01F0004 */ stfs f0, 4(r31)
/* 00005CB8 C03F0008 */ lfs f1, 8(r31)
/* 00005CBC C01F0020 */ lfs f0, 0x20(r31)
/* 00005CC0 EC01002A */ fadds f0, f1, f0
/* 00005CC4 D01F0008 */ stfs f0, 8(r31)
/* 00005CC8 C03F000C */ lfs f1, 0xc(r31)
/* 00005CCC C01F0024 */ lfs f0, 0x24(r31)
/* 00005CD0 EC01002A */ fadds f0, f1, f0
/* 00005CD4 D01F000C */ stfs f0, 0xc(r31)
/* 00005CD8 80010024 */ lwz r0, 0x24(r1)
/* 00005CDC 83E1001C */ lwz r31, 0x1c(r1)
/* 00005CE0 38210020 */ addi r1, r1, 0x20
/* 00005CE4 7C0803A6 */ mtlr r0
/* 00005CE8 4E800020 */ blr 
