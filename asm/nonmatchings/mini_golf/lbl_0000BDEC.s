/* 0000BDEC 7C0802A6 */ mflr r0
/* 0000BDF0 3CA00000 */ lis r5, lbl_00026378@ha
/* 0000BDF4 90010004 */ stw r0, 4(r1)
/* 0000BDF8 38000000 */ li r0, 0
/* 0000BDFC 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000BE00 DBE10038 */ stfd f31, 0x38(r1)
/* 0000BE04 DBC10030 */ stfd f30, 0x30(r1)
/* 0000BE08 93E1002C */ stw r31, 0x2c(r1)
/* 0000BE0C 3BE30000 */ addi r31, r3, 0
/* 0000BE10 93C10028 */ stw r30, 0x28(r1)
/* 0000BE14 93A10024 */ stw r29, 0x24(r1)
/* 0000BE18 3BA50000 */ addi r29, r5, lbl_00026378@l
/* 0000BE1C 93810020 */ stw r28, 0x20(r1)
/* 0000BE20 3B840000 */ addi r28, r4, 0
/* 0000BE24 98030026 */ stb r0, 0x26(r3)
/* 0000BE28 3C600000 */ lis r3, lbl_10000130@ha
/* 0000BE2C 3BC30000 */ addi r30, r3, lbl_10000130@l
/* 0000BE30 4BFFD495 */ bl lbl_000092C4
/* 0000BE34 C05C0004 */ lfs f2, 4(r28)
/* 0000BE38 C81D0010 */ lfd f0, 0x10(r29)
/* 0000BE3C EC22082A */ fadds f1, f2, f1
/* 0000BE40 FC010032 */ fmul f0, f1, f0
/* 0000BE44 FC000018 */ frsp f0, f0
/* 0000BE48 D01F000C */ stfs f0, 0xc(r31)
/* 0000BE4C 4BFFD485 */ bl lbl_000092D0
/* 0000BE50 C81D0040 */ lfd f0, 0x40(r29)
/* 0000BE54 C05C0008 */ lfs f2, 8(r28)
/* 0000BE58 FC20082A */ fadd f1, f0, f1
/* 0000BE5C C81D0010 */ lfd f0, 0x10(r29)
/* 0000BE60 FC22082A */ fadd f1, f2, f1
/* 0000BE64 FC010032 */ fmul f0, f1, f0
/* 0000BE68 FC000018 */ frsp f0, f0
/* 0000BE6C D01F0010 */ stfs f0, 0x10(r31)
/* 0000BE70 4BFFD471 */ bl lbl_000092E0
/* 0000BE74 C05C000C */ lfs f2, 0xc(r28)
/* 0000BE78 C81D0010 */ lfd f0, 0x10(r29)
/* 0000BE7C EC22082A */ fadds f1, f2, f1
/* 0000BE80 FC010032 */ fmul f0, f1, f0
/* 0000BE84 FC000018 */ frsp f0, f0
/* 0000BE88 D01F0014 */ stfs f0, 0x14(r31)
/* 0000BE8C C03F0014 */ lfs f1, 0x14(r31)
/* 0000BE90 C01C000C */ lfs f0, 0xc(r28)
/* 0000BE94 C07F0010 */ lfs f3, 0x10(r31)
/* 0000BE98 C05C0008 */ lfs f2, 8(r28)
/* 0000BE9C EC810028 */ fsubs f4, f1, f0
/* 0000BEA0 C03F000C */ lfs f1, 0xc(r31)
/* 0000BEA4 C01C0004 */ lfs f0, 4(r28)
/* 0000BEA8 EC431028 */ fsubs f2, f3, f2
/* 0000BEAC EC210028 */ fsubs f1, f1, f0
/* 0000BEB0 EC210072 */ fmuls f1, f1, f1
/* 0000BEB4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BEB8 EC24093A */ fmadds f1, f4, f4, f1
/* 0000BEBC 4BFF4315 */ bl mathutil_sqrt
/* 0000BEC0 FFC00890 */ fmr f30, f1
/* 0000BEC4 38601555 */ li r3, 0x1555
/* 0000BEC8 4BFF4309 */ bl mathutil_tan
/* 0000BECC EFFE0824 */ fdivs f31, f30, f1
/* 0000BED0 C81D0048 */ lfd f0, 0x48(r29)
/* 0000BED4 FC1F0040 */ fcmpo cr0, f31, f0
/* 0000BED8 40800008 */ bge lbl_0000BEE0
/* 0000BEDC C3FD0050 */ lfs f31, 0x50(r29)
lbl_0000BEE0:
/* 0000BEE0 881F001F */ lbz r0, 0x1f(r31)
/* 0000BEE4 2C000010 */ cmpwi r0, 0x10
/* 0000BEE8 40820120 */ bne lbl_0000C008
/* 0000BEEC 4BFFD3D9 */ bl lbl_000092C4
/* 0000BEF0 C01C0004 */ lfs f0, 4(r28)
/* 0000BEF4 EC010028 */ fsubs f0, f1, f0
/* 0000BEF8 D0010010 */ stfs f0, 0x10(r1)
/* 0000BEFC C01D0018 */ lfs f0, 0x18(r29)
/* 0000BF00 D0010014 */ stfs f0, 0x14(r1)
/* 0000BF04 4BFFD3DD */ bl lbl_000092E0
/* 0000BF08 C01C000C */ lfs f0, 0xc(r28)
/* 0000BF0C 38610010 */ addi r3, r1, 0x10
/* 0000BF10 EC010028 */ fsubs f0, f1, f0
/* 0000BF14 D0010018 */ stfs f0, 0x18(r1)
/* 0000BF18 4BFF42B9 */ bl mathutil_vec_normalize_len
/* 0000BF1C 4BFF42B5 */ bl mathutil_mtxA_from_identity
/* 0000BF20 4BFFD4E5 */ bl lbl_00009404
/* 0000BF24 5460063E */ clrlwi r0, r3, 0x18
/* 0000BF28 2800000F */ cmplwi r0, 0xf
/* 0000BF2C 40820010 */ bne lbl_0000BF3C
/* 0000BF30 38606000 */ li r3, 0x6000
/* 0000BF34 4BFF429D */ bl mathutil_mtxA_rotate_y
/* 0000BF38 4800000C */ b lbl_0000BF44
lbl_0000BF3C:
/* 0000BF3C 38602000 */ li r3, 0x2000
/* 0000BF40 4BFF4291 */ bl mathutil_mtxA_rotate_y
lbl_0000BF44:
/* 0000BF44 38610010 */ addi r3, r1, 0x10
/* 0000BF48 38830000 */ addi r4, r3, 0
/* 0000BF4C 4BFF4285 */ bl mathutil_mtxA_tf_vec
/* 0000BF50 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 0000BF54 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 0000BF58 80630000 */ lwz r3, 0(r3)
/* 0000BF5C 80030088 */ lwz r0, 0x88(r3)
/* 0000BF60 28000000 */ cmplwi r0, 0
/* 0000BF64 41820088 */ beq lbl_0000BFEC
/* 0000BF68 C0210010 */ lfs f1, 0x10(r1)
/* 0000BF6C C0410014 */ lfs f2, 0x14(r1)
/* 0000BF70 C0010018 */ lfs f0, 0x18(r1)
/* 0000BF74 EC210072 */ fmuls f1, f1, f1
/* 0000BF78 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BF7C EC20083A */ fmadds f1, f0, f0, f1
/* 0000BF80 4BFF4251 */ bl mathutil_sqrt
/* 0000BF84 FFC00890 */ fmr f30, f1
/* 0000BF88 4BFFD33D */ bl lbl_000092C4
/* 0000BF8C C0010010 */ lfs f0, 0x10(r1)
/* 0000BF90 EC00F024 */ fdivs f0, f0, f30
/* 0000BF94 EC1F0032 */ fmuls f0, f31, f0
/* 0000BF98 EC01002A */ fadds f0, f1, f0
/* 0000BF9C D01F0000 */ stfs f0, 0(r31)
/* 0000BFA0 4BFFD331 */ bl lbl_000092D0
/* 0000BFA4 C81D0058 */ lfd f0, 0x58(r29)
/* 0000BFA8 FC00082A */ fadd f0, f0, f1
/* 0000BFAC FC000018 */ frsp f0, f0
/* 0000BFB0 D01F0004 */ stfs f0, 4(r31)
/* 0000BFB4 C0210010 */ lfs f1, 0x10(r1)
/* 0000BFB8 C0410014 */ lfs f2, 0x14(r1)
/* 0000BFBC C0010018 */ lfs f0, 0x18(r1)
/* 0000BFC0 EC210072 */ fmuls f1, f1, f1
/* 0000BFC4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000BFC8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000BFCC 4BFF4205 */ bl mathutil_sqrt
/* 0000BFD0 FFC00890 */ fmr f30, f1
/* 0000BFD4 4BFFD30D */ bl lbl_000092E0
/* 0000BFD8 C0010018 */ lfs f0, 0x18(r1)
/* 0000BFDC EC00F024 */ fdivs f0, f0, f30
/* 0000BFE0 EC1F0032 */ fmuls f0, f31, f0
/* 0000BFE4 EC01002A */ fadds f0, f1, f0
/* 0000BFE8 D01F0008 */ stfs f0, 8(r31)
lbl_0000BFEC:
/* 0000BFEC 80610010 */ lwz r3, 0x10(r1)
/* 0000BFF0 80010014 */ lwz r0, 0x14(r1)
/* 0000BFF4 907E0010 */ stw r3, 0x10(r30)
/* 0000BFF8 901E0014 */ stw r0, 0x14(r30)
/* 0000BFFC 80010018 */ lwz r0, 0x18(r1)
/* 0000C000 901E0018 */ stw r0, 0x18(r30)
/* 0000C004 4800008C */ b lbl_0000C090
lbl_0000C008:
/* 0000C008 3B9E0010 */ addi r28, r30, 0x10
/* 0000C00C C03C0000 */ lfs f1, 0(r28)
/* 0000C010 C05C0004 */ lfs f2, 4(r28)
/* 0000C014 C01C0008 */ lfs f0, 8(r28)
/* 0000C018 EC210072 */ fmuls f1, f1, f1
/* 0000C01C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C020 EC20083A */ fmadds f1, f0, f0, f1
/* 0000C024 4BFF41AD */ bl mathutil_sqrt
/* 0000C028 FFC00890 */ fmr f30, f1
/* 0000C02C 4BFFD299 */ bl lbl_000092C4
/* 0000C030 C01E0010 */ lfs f0, 0x10(r30)
/* 0000C034 EC00F024 */ fdivs f0, f0, f30
/* 0000C038 EC1F0032 */ fmuls f0, f31, f0
/* 0000C03C EC01002A */ fadds f0, f1, f0
/* 0000C040 D01F0000 */ stfs f0, 0(r31)
/* 0000C044 4BFFD28D */ bl lbl_000092D0
/* 0000C048 C81D0058 */ lfd f0, 0x58(r29)
/* 0000C04C FC00082A */ fadd f0, f0, f1
/* 0000C050 FC000018 */ frsp f0, f0
/* 0000C054 D01F0004 */ stfs f0, 4(r31)
/* 0000C058 C03C0000 */ lfs f1, 0(r28)
/* 0000C05C C05C0004 */ lfs f2, 4(r28)
/* 0000C060 C01C0008 */ lfs f0, 8(r28)
/* 0000C064 EC210072 */ fmuls f1, f1, f1
/* 0000C068 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C06C EC20083A */ fmadds f1, f0, f0, f1
/* 0000C070 4BFF4161 */ bl mathutil_sqrt
/* 0000C074 FFC00890 */ fmr f30, f1
/* 0000C078 4BFFD269 */ bl lbl_000092E0
/* 0000C07C C01E0018 */ lfs f0, 0x18(r30)
/* 0000C080 EC00F024 */ fdivs f0, f0, f30
/* 0000C084 EC1F0032 */ fmuls f0, f31, f0
/* 0000C088 EC01002A */ fadds f0, f1, f0
/* 0000C08C D01F0008 */ stfs f0, 8(r31)
lbl_0000C090:
/* 0000C090 C07F0014 */ lfs f3, 0x14(r31)
/* 0000C094 C05F0008 */ lfs f2, 8(r31)
/* 0000C098 C03F000C */ lfs f1, 0xc(r31)
/* 0000C09C C01F0000 */ lfs f0, 0(r31)
/* 0000C0A0 EC431028 */ fsubs f2, f3, f2
/* 0000C0A4 EC210028 */ fsubs f1, f1, f0
/* 0000C0A8 EC210072 */ fmuls f1, f1, f1
/* 0000C0AC EC2208BA */ fmadds f1, f2, f2, f1
/* 0000C0B0 4BFF4121 */ bl mathutil_sqrt
/* 0000C0B4 C07F0010 */ lfs f3, 0x10(r31)
/* 0000C0B8 FC400890 */ fmr f2, f1
/* 0000C0BC C01F0004 */ lfs f0, 4(r31)
/* 0000C0C0 EC230028 */ fsubs f1, f3, f0
/* 0000C0C4 4BFF410D */ bl mathutil_atan2
/* 0000C0C8 B07F0018 */ sth r3, 0x18(r31)
/* 0000C0CC C07F000C */ lfs f3, 0xc(r31)
/* 0000C0D0 C03F0000 */ lfs f1, 0(r31)
/* 0000C0D4 C05F0014 */ lfs f2, 0x14(r31)
/* 0000C0D8 C01F0008 */ lfs f0, 8(r31)
/* 0000C0DC EC230828 */ fsubs f1, f3, f1
/* 0000C0E0 EC420028 */ fsubs f2, f2, f0
/* 0000C0E4 4BFF40ED */ bl mathutil_atan2
/* 0000C0E8 38038000 */ addi r0, r3, -32768
/* 0000C0EC B01F001A */ sth r0, 0x1a(r31)
/* 0000C0F0 38600000 */ li r3, 0
/* 0000C0F4 38000011 */ li r0, 0x11
/* 0000C0F8 B07F010C */ sth r3, 0x10c(r31)
/* 0000C0FC 981F001F */ stb r0, 0x1f(r31)
/* 0000C100 80010044 */ lwz r0, 0x44(r1)
/* 0000C104 CBE10038 */ lfd f31, 0x38(r1)
/* 0000C108 CBC10030 */ lfd f30, 0x30(r1)
/* 0000C10C 83E1002C */ lwz r31, 0x2c(r1)
/* 0000C110 83C10028 */ lwz r30, 0x28(r1)
/* 0000C114 83A10024 */ lwz r29, 0x24(r1)
/* 0000C118 83810020 */ lwz r28, 0x20(r1)
/* 0000C11C 38210040 */ addi r1, r1, 0x40
/* 0000C120 7C0803A6 */ mtlr r0
/* 0000C124 4E800020 */ blr 
