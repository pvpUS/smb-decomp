/* 00012BC4 7C0802A6 */ mflr r0
/* 00012BC8 90010004 */ stw r0, 4(r1)
/* 00012BCC 38000000 */ li r0, 0
/* 00012BD0 9421FFD0 */ stwu r1, -0x30(r1)
/* 00012BD4 DBE10028 */ stfd f31, 0x28(r1)
/* 00012BD8 93E10024 */ stw r31, 0x24(r1)
/* 00012BDC 93C10020 */ stw r30, 0x20(r1)
/* 00012BE0 93A1001C */ stw r29, 0x1c(r1)
/* 00012BE4 93810018 */ stw r28, 0x18(r1)
/* 00012BE8 7C7C1B78 */ mr r28, r3
/* 00012BEC 83C30060 */ lwz r30, 0x60(r3)
/* 00012BF0 7C1E0040 */ cmplw r30, r0
/* 00012BF4 41820138 */ beq lbl_00012D2C
/* 00012BF8 A81E000A */ lha r0, 0xa(r30)
/* 00012BFC 2C000000 */ cmpwi r0, 0
/* 00012C00 4180012C */ blt lbl_00012D2C
/* 00012C04 1C8001A4 */ mulli r4, r0, 0x1a4
/* 00012C08 3C600000 */ lis r3, ballInfo@ha
/* 00012C0C 38030000 */ addi r0, r3, ballInfo@l
/* 00012C10 7FA02214 */ add r29, r0, r4
/* 00012C14 807D0144 */ lwz r3, 0x144(r29)
/* 00012C18 88030263 */ lbz r0, 0x263(r3)
/* 00012C1C 28000009 */ cmplwi r0, 9
/* 00012C20 40820010 */ bne lbl_00012C30
/* 00012C24 3800FFFF */ li r0, -1
/* 00012C28 B01E000A */ sth r0, 0xa(r30)
/* 00012C2C 48000100 */ b lbl_00012D2C
lbl_00012C30:
/* 00012C30 3BFC002C */ addi r31, r28, 0x2c
/* 00012C34 C03F0000 */ lfs f1, 0(r31)
/* 00012C38 C05F0004 */ lfs f2, 4(r31)
/* 00012C3C C01F0008 */ lfs f0, 8(r31)
/* 00012C40 EC210072 */ fmuls f1, f1, f1
/* 00012C44 EC2208BA */ fmadds f1, f2, f2, f1
/* 00012C48 EC20083A */ fmadds f1, f0, f0, f1
/* 00012C4C 4BFED531 */ bl mathutil_sqrt
/* 00012C50 C05D0004 */ lfs f2, 4(r29)
/* 00012C54 3C800000 */ lis r4, lbl_00014054@ha
/* 00012C58 C01C0020 */ lfs f0, 0x20(r28)
/* 00012C5C FFE00890 */ fmr f31, f1
/* 00012C60 38A40000 */ addi r5, r4, lbl_00014054@l
/* 00012C64 EC020028 */ fsubs f0, f2, f0
/* 00012C68 3861000C */ addi r3, r1, 0xc
/* 00012C6C 38830000 */ addi r4, r3, 0
/* 00012C70 D001000C */ stfs f0, 0xc(r1)
/* 00012C74 C05D0008 */ lfs f2, 8(r29)
/* 00012C78 C01C0024 */ lfs f0, 0x24(r28)
/* 00012C7C EC020028 */ fsubs f0, f2, f0
/* 00012C80 D0010010 */ stfs f0, 0x10(r1)
/* 00012C84 C03D000C */ lfs f1, 0xc(r29)
/* 00012C88 C01C0028 */ lfs f0, 0x28(r28)
/* 00012C8C EC010028 */ fsubs f0, f1, f0
/* 00012C90 D0010014 */ stfs f0, 0x14(r1)
/* 00012C94 C0250000 */ lfs f1, 0(r5)
/* 00012C98 4BFED4E5 */ bl mathutil_vec_set_len
/* 00012C9C C05C002C */ lfs f2, 0x2c(r28)
/* 00012CA0 FC20F890 */ fmr f1, f31
/* 00012CA4 C001000C */ lfs f0, 0xc(r1)
/* 00012CA8 387F0000 */ addi r3, r31, 0
/* 00012CAC 389F0000 */ addi r4, r31, 0
/* 00012CB0 EC02002A */ fadds f0, f2, f0
/* 00012CB4 D01C002C */ stfs f0, 0x2c(r28)
/* 00012CB8 C05C0030 */ lfs f2, 0x30(r28)
/* 00012CBC C0010010 */ lfs f0, 0x10(r1)
/* 00012CC0 EC02002A */ fadds f0, f2, f0
/* 00012CC4 D01C0030 */ stfs f0, 0x30(r28)
/* 00012CC8 C05C0034 */ lfs f2, 0x34(r28)
/* 00012CCC C0010014 */ lfs f0, 0x14(r1)
/* 00012CD0 EC02002A */ fadds f0, f2, f0
/* 00012CD4 D01C0034 */ stfs f0, 0x34(r28)
/* 00012CD8 4BFED4A5 */ bl mathutil_vec_set_len
/* 00012CDC 389C0020 */ addi r4, r28, 0x20
/* 00012CE0 387D0004 */ addi r3, r29, 4
/* 00012CE4 C0A30000 */ lfs f5, 0(r3)
/* 00012CE8 C0440000 */ lfs f2, 0(r4)
/* 00012CEC C0830004 */ lfs f4, 4(r3)
/* 00012CF0 C0240004 */ lfs f1, 4(r4)
/* 00012CF4 C0630008 */ lfs f3, 8(r3)
/* 00012CF8 C0040008 */ lfs f0, 8(r4)
/* 00012CFC ECA51028 */ fsubs f5, f5, f2
/* 00012D00 EC840828 */ fsubs f4, f4, f1
/* 00012D04 EC630028 */ fsubs f3, f3, f0
/* 00012D08 EC250172 */ fmuls f1, f5, f5
/* 00012D0C EC24093A */ fmadds f1, f4, f4, f1
/* 00012D10 EC2308FA */ fmadds f1, f3, f3, f1
/* 00012D14 3C600000 */ lis r3, lbl_00014058@ha
/* 00012D18 C0030000 */ lfs f0, lbl_00014058@l(r3)
/* 00012D1C FC010040 */ fcmpo cr0, f1, f0
/* 00012D20 4080000C */ bge lbl_00012D2C
/* 00012D24 3800FFFF */ li r0, -1
/* 00012D28 B01E000A */ sth r0, 0xa(r30)
lbl_00012D2C:
/* 00012D2C 80010034 */ lwz r0, 0x34(r1)
/* 00012D30 CBE10028 */ lfd f31, 0x28(r1)
/* 00012D34 83E10024 */ lwz r31, 0x24(r1)
/* 00012D38 7C0803A6 */ mtlr r0
/* 00012D3C 83C10020 */ lwz r30, 0x20(r1)
/* 00012D40 83A1001C */ lwz r29, 0x1c(r1)
/* 00012D44 83810018 */ lwz r28, 0x18(r1)
/* 00012D48 38210030 */ addi r1, r1, 0x30
/* 00012D4C 4E800020 */ blr 
