/* 00019B40 7C0802A6 */ mflr r0
/* 00019B44 3C600000 */ lis r3, lbl_10018FD4@ha
/* 00019B48 90010004 */ stw r0, 4(r1)
/* 00019B4C 3C800000 */ lis r4, lbl_0001C7D8@ha
/* 00019B50 38630000 */ addi r3, r3, lbl_10018FD4@l
/* 00019B54 9421FFD8 */ stwu r1, -0x28(r1)
/* 00019B58 93E10024 */ stw r31, 0x24(r1)
/* 00019B5C 3BE40000 */ addi r31, r4, lbl_0001C7D8@l
/* 00019B60 C01F0000 */ lfs f0, 0(r31)
/* 00019B64 C023000C */ lfs f1, 0xc(r3)
/* 00019B68 FC010040 */ fcmpo cr0, f1, f0
/* 00019B6C 4C401382 */ cror 2, 0, 2
/* 00019B70 41820110 */ beq lbl_00019C80
/* 00019B74 C01F0018 */ lfs f0, 0x18(r31)
/* 00019B78 FC010040 */ fcmpo cr0, f1, f0
/* 00019B7C 4C411382 */ cror 2, 1, 2
/* 00019B80 40820058 */ bne lbl_00019BD8
/* 00019B84 C01F007C */ lfs f0, 0x7c(r31)
/* 00019B88 3C600000 */ lis r3, currentCamera@ha
/* 00019B8C D0010018 */ stfs f0, 0x18(r1)
/* 00019B90 80830000 */ lwz r4, currentCamera@l(r3)
/* 00019B94 38610008 */ addi r3, r1, 8
/* 00019B98 C0210018 */ lfs f1, 0x18(r1)
/* 00019B9C C0040038 */ lfs f0, 0x38(r4)
/* 00019BA0 EC010032 */ fmuls f0, f1, f0
/* 00019BA4 D001000C */ stfs f0, 0xc(r1)
/* 00019BA8 C001000C */ lfs f0, 0xc(r1)
/* 00019BAC FC000050 */ fneg f0, f0
/* 00019BB0 D0010014 */ stfs f0, 0x14(r1)
/* 00019BB4 C021000C */ lfs f1, 0xc(r1)
/* 00019BB8 C0040034 */ lfs f0, 0x34(r4)
/* 00019BBC EC010032 */ fmuls f0, f1, f0
/* 00019BC0 D0010008 */ stfs f0, 8(r1)
/* 00019BC4 C0010008 */ lfs f0, 8(r1)
/* 00019BC8 FC000050 */ fneg f0, f0
/* 00019BCC D0010010 */ stfs f0, 0x10(r1)
/* 00019BD0 4800025D */ bl lbl_00019E2C
/* 00019BD4 48000058 */ b lbl_00019C2C
lbl_00019BD8:
/* 00019BD8 C01F0080 */ lfs f0, 0x80(r31)
/* 00019BDC 3C600000 */ lis r3, currentCamera@ha
/* 00019BE0 D0010018 */ stfs f0, 0x18(r1)
/* 00019BE4 80830000 */ lwz r4, currentCamera@l(r3)
/* 00019BE8 38610008 */ addi r3, r1, 8
/* 00019BEC C0210018 */ lfs f1, 0x18(r1)
/* 00019BF0 C0040038 */ lfs f0, 0x38(r4)
/* 00019BF4 EC010032 */ fmuls f0, f1, f0
/* 00019BF8 D001000C */ stfs f0, 0xc(r1)
/* 00019BFC C001000C */ lfs f0, 0xc(r1)
/* 00019C00 FC000050 */ fneg f0, f0
/* 00019C04 D0010014 */ stfs f0, 0x14(r1)
/* 00019C08 C021000C */ lfs f1, 0xc(r1)
/* 00019C0C C0040034 */ lfs f0, 0x34(r4)
/* 00019C10 EC010032 */ fmuls f0, f1, f0
/* 00019C14 D0010008 */ stfs f0, 8(r1)
/* 00019C18 C0010008 */ lfs f0, 8(r1)
/* 00019C1C FC000050 */ fneg f0, f0
/* 00019C20 D0010010 */ stfs f0, 0x10(r1)
/* 00019C24 48000209 */ bl lbl_00019E2C
/* 00019C28 48000481 */ bl lbl_0001A0A8
lbl_00019C2C:
/* 00019C2C 48000069 */ bl lbl_00019C94
/* 00019C30 C01F007C */ lfs f0, 0x7c(r31)
/* 00019C34 3C600000 */ lis r3, currentCamera@ha
/* 00019C38 D0010018 */ stfs f0, 0x18(r1)
/* 00019C3C 80830000 */ lwz r4, currentCamera@l(r3)
/* 00019C40 38610008 */ addi r3, r1, 8
/* 00019C44 C0210018 */ lfs f1, 0x18(r1)
/* 00019C48 C0040038 */ lfs f0, 0x38(r4)
/* 00019C4C EC010032 */ fmuls f0, f1, f0
/* 00019C50 D001000C */ stfs f0, 0xc(r1)
/* 00019C54 C001000C */ lfs f0, 0xc(r1)
/* 00019C58 FC000050 */ fneg f0, f0
/* 00019C5C D0010014 */ stfs f0, 0x14(r1)
/* 00019C60 C021000C */ lfs f1, 0xc(r1)
/* 00019C64 C0040034 */ lfs f0, 0x34(r4)
/* 00019C68 EC010032 */ fmuls f0, f1, f0
/* 00019C6C D0010008 */ stfs f0, 8(r1)
/* 00019C70 C0010008 */ lfs f0, 8(r1)
/* 00019C74 FC000050 */ fneg f0, f0
/* 00019C78 D0010010 */ stfs f0, 0x10(r1)
/* 00019C7C 480001B1 */ bl lbl_00019E2C
lbl_00019C80:
/* 00019C80 8001002C */ lwz r0, 0x2c(r1)
/* 00019C84 83E10024 */ lwz r31, 0x24(r1)
/* 00019C88 38210028 */ addi r1, r1, 0x28
/* 00019C8C 7C0803A6 */ mtlr r0
/* 00019C90 4E800020 */ blr 
