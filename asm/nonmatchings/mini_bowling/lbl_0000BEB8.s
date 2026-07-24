/* 0000BEB8 7C0802A6 */ mflr r0
/* 0000BEBC 3CC00000 */ lis r6, lbl_00014800@ha
/* 0000BEC0 90010004 */ stw r0, 4(r1)
/* 0000BEC4 1C05000C */ mulli r0, r5, 0xc
/* 0000BEC8 9421FFA0 */ stwu r1, -0x60(r1)
/* 0000BECC 93E1005C */ stw r31, 0x5c(r1)
/* 0000BED0 93C10058 */ stw r30, 0x58(r1)
/* 0000BED4 3BC60000 */ addi r30, r6, lbl_00014800@l
/* 0000BED8 38C10038 */ addi r6, r1, 0x38
/* 0000BEDC 93A10054 */ stw r29, 0x54(r1)
/* 0000BEE0 7C9D2378 */ mr r29, r4
/* 0000BEE4 38850000 */ addi r4, r5, 0
/* 0000BEE8 93810050 */ stw r28, 0x50(r1)
/* 0000BEEC 3B830000 */ addi r28, r3, 0
/* 0000BEF0 7FFC0214 */ add r31, r28, r0
/* 0000BEF4 C03F0004 */ lfs f1, 4(r31)
/* 0000BEF8 38A10044 */ addi r5, r1, 0x44
/* 0000BEFC C01F0094 */ lfs f0, 0x94(r31)
/* 0000BF00 EC010028 */ fsubs f0, f1, f0
/* 0000BF04 D0010044 */ stfs f0, 0x44(r1)
/* 0000BF08 C03F0008 */ lfs f1, 8(r31)
/* 0000BF0C C01F0098 */ lfs f0, 0x98(r31)
/* 0000BF10 EC010028 */ fsubs f0, f1, f0
/* 0000BF14 D0010048 */ stfs f0, 0x48(r1)
/* 0000BF18 C03F000C */ lfs f1, 0xc(r31)
/* 0000BF1C C01F009C */ lfs f0, 0x9c(r31)
/* 0000BF20 EC010028 */ fsubs f0, f1, f0
/* 0000BF24 D001004C */ stfs f0, 0x4c(r1)
/* 0000BF28 C03D0000 */ lfs f1, 0(r29)
/* 0000BF2C C0010044 */ lfs f0, 0x44(r1)
/* 0000BF30 EC010028 */ fsubs f0, f1, f0
/* 0000BF34 D0010044 */ stfs f0, 0x44(r1)
/* 0000BF38 C03D0004 */ lfs f1, 4(r29)
/* 0000BF3C C0010048 */ lfs f0, 0x48(r1)
/* 0000BF40 EC010028 */ fsubs f0, f1, f0
/* 0000BF44 D0010048 */ stfs f0, 0x48(r1)
/* 0000BF48 C03D0008 */ lfs f1, 8(r29)
/* 0000BF4C C001004C */ lfs f0, 0x4c(r1)
/* 0000BF50 EC010028 */ fsubs f0, f1, f0
/* 0000BF54 D001004C */ stfs f0, 0x4c(r1)
/* 0000BF58 48000179 */ bl lbl_0000C0D0
/* 0000BF5C 807C017C */ lwz r3, 0x17c(r28)
/* 0000BF60 801C0178 */ lwz r0, 0x178(r28)
/* 0000BF64 7C030040 */ cmplw r3, r0
/* 0000BF68 41820038 */ beq lbl_0000BFA0
/* 0000BF6C C0210038 */ lfs f1, 0x38(r1)
/* 0000BF70 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF74 EC010032 */ fmuls f0, f1, f0
/* 0000BF78 D0010038 */ stfs f0, 0x38(r1)
/* 0000BF7C C021003C */ lfs f1, 0x3c(r1)
/* 0000BF80 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF84 EC010032 */ fmuls f0, f1, f0
/* 0000BF88 D001003C */ stfs f0, 0x3c(r1)
/* 0000BF8C C0210040 */ lfs f1, 0x40(r1)
/* 0000BF90 C01E0398 */ lfs f0, 0x398(r30)
/* 0000BF94 EC010032 */ fmuls f0, f1, f0
/* 0000BF98 D0010040 */ stfs f0, 0x40(r1)
/* 0000BF9C 480000E4 */ b lbl_0000C080
lbl_0000BFA0:
/* 0000BFA0 C03F0094 */ lfs f1, 0x94(r31)
/* 0000BFA4 38610014 */ addi r3, r1, 0x14
/* 0000BFA8 C01F0004 */ lfs f0, 4(r31)
/* 0000BFAC EC010028 */ fsubs f0, f1, f0
/* 0000BFB0 D001002C */ stfs f0, 0x2c(r1)
/* 0000BFB4 C03F0098 */ lfs f1, 0x98(r31)
/* 0000BFB8 C01F0008 */ lfs f0, 8(r31)
/* 0000BFBC EC010028 */ fsubs f0, f1, f0
/* 0000BFC0 D0010030 */ stfs f0, 0x30(r1)
/* 0000BFC4 C03F009C */ lfs f1, 0x9c(r31)
/* 0000BFC8 C01F000C */ lfs f0, 0xc(r31)
/* 0000BFCC EC010028 */ fsubs f0, f1, f0
/* 0000BFD0 D0010034 */ stfs f0, 0x34(r1)
/* 0000BFD4 809D0000 */ lwz r4, 0(r29)
/* 0000BFD8 801D0004 */ lwz r0, 4(r29)
/* 0000BFDC 90810014 */ stw r4, 0x14(r1)
/* 0000BFE0 90010018 */ stw r0, 0x18(r1)
/* 0000BFE4 801D0008 */ lwz r0, 8(r29)
/* 0000BFE8 9001001C */ stw r0, 0x1c(r1)
/* 0000BFEC 4BFF4175 */ bl mathutil_vec_normalize_len
/* 0000BFF0 C0A1002C */ lfs f5, 0x2c(r1)
/* 0000BFF4 C0410014 */ lfs f2, 0x14(r1)
/* 0000BFF8 C0810030 */ lfs f4, 0x30(r1)
/* 0000BFFC C0210018 */ lfs f1, 0x18(r1)
/* 0000C000 C0610034 */ lfs f3, 0x34(r1)
/* 0000C004 C001001C */ lfs f0, 0x1c(r1)
/* 0000C008 ECE500B2 */ fmuls f7, f5, f2
/* 0000C00C ECE4387A */ fmadds f7, f4, f1, f7
/* 0000C010 ECE3383A */ fmadds f7, f3, f0, f7
/* 0000C014 C0410014 */ lfs f2, 0x14(r1)
/* 0000C018 C0210018 */ lfs f1, 0x18(r1)
/* 0000C01C 7F83E378 */ mr r3, r28
/* 0000C020 C001001C */ lfs f0, 0x1c(r1)
/* 0000C024 EC8201F2 */ fmuls f4, f2, f7
/* 0000C028 C0A1002C */ lfs f5, 0x2c(r1)
/* 0000C02C C8DE04C0 */ lfd f6, 0x4c0(r30)
/* 0000C030 EC4101F2 */ fmuls f2, f1, f7
/* 0000C034 C0610030 */ lfs f3, 0x30(r1)
/* 0000C038 EC852028 */ fsubs f4, f5, f4
/* 0000C03C C0210034 */ lfs f1, 0x34(r1)
/* 0000C040 EC0001F2 */ fmuls f0, f0, f7
/* 0000C044 38810020 */ addi r4, r1, 0x20
/* 0000C048 EC431028 */ fsubs f2, f3, f2
/* 0000C04C FC660132 */ fmul f3, f6, f4
/* 0000C050 EC010028 */ fsubs f0, f1, f0
/* 0000C054 FC201818 */ frsp f1, f3
/* 0000C058 D0210020 */ stfs f1, 0x20(r1)
/* 0000C05C C83E04C0 */ lfd f1, 0x4c0(r30)
/* 0000C060 FC2100B2 */ fmul f1, f1, f2
/* 0000C064 FC200818 */ frsp f1, f1
/* 0000C068 D0210024 */ stfs f1, 0x24(r1)
/* 0000C06C C83E04C0 */ lfd f1, 0x4c0(r30)
/* 0000C070 FC010032 */ fmul f0, f1, f0
/* 0000C074 FC000018 */ frsp f0, f0
/* 0000C078 D0010028 */ stfs f0, 0x28(r1)
/* 0000C07C 48001459 */ bl lbl_0000D4D4
lbl_0000C080:
/* 0000C080 C0210038 */ lfs f1, 0x38(r1)
/* 0000C084 C01C013C */ lfs f0, 0x13c(r28)
/* 0000C088 EC01002A */ fadds f0, f1, f0
/* 0000C08C D01C013C */ stfs f0, 0x13c(r28)
/* 0000C090 C021003C */ lfs f1, 0x3c(r1)
/* 0000C094 C01C0140 */ lfs f0, 0x140(r28)
/* 0000C098 EC01002A */ fadds f0, f1, f0
/* 0000C09C D01C0140 */ stfs f0, 0x140(r28)
/* 0000C0A0 C0210040 */ lfs f1, 0x40(r1)
/* 0000C0A4 C01C0144 */ lfs f0, 0x144(r28)
/* 0000C0A8 EC01002A */ fadds f0, f1, f0
/* 0000C0AC D01C0144 */ stfs f0, 0x144(r28)
/* 0000C0B0 80010064 */ lwz r0, 0x64(r1)
/* 0000C0B4 83E1005C */ lwz r31, 0x5c(r1)
/* 0000C0B8 83C10058 */ lwz r30, 0x58(r1)
/* 0000C0BC 83A10054 */ lwz r29, 0x54(r1)
/* 0000C0C0 83810050 */ lwz r28, 0x50(r1)
/* 0000C0C4 38210060 */ addi r1, r1, 0x60
/* 0000C0C8 7C0803A6 */ mtlr r0
/* 0000C0CC 4E800020 */ blr 
