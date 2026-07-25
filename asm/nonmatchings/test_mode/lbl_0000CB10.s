/* 0000CB10 7C0802A6 */ mflr r0
/* 0000CB14 3C600000 */ lis r3, lbl_10000FAC@ha
/* 0000CB18 90010004 */ stw r0, 4(r1)
/* 0000CB1C 38030000 */ addi r0, r3, lbl_10000FAC@l
/* 0000CB20 3CA00000 */ lis r5, lbl_00010150@ha
/* 0000CB24 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000CB28 3C600000 */ lis r3, powerOnTimer@ha
/* 0000CB2C 3C800000 */ lis r4, controllerInfo@ha
/* 0000CB30 BF410020 */ stmw r26, 0x20(r1)
/* 0000CB34 7C1C0378 */ mr r28, r0
/* 0000CB38 3BC50000 */ addi r30, r5, lbl_00010150@l
/* 0000CB3C 3B430000 */ addi r26, r3, powerOnTimer@l
/* 0000CB40 3BE40000 */ addi r31, r4, controllerInfo@l
/* 0000CB44 3BA00100 */ li r29, 0x100
/* 0000CB48 3F604330 */ lis r27, 0x4330
lbl_0000CB4C:
/* 0000CB4C C03C000C */ lfs f1, 0xc(r28)
/* 0000CB50 C01E0070 */ lfs f0, 0x70(r30)
/* 0000CB54 EC010032 */ fmuls f0, f1, f0
/* 0000CB58 D01C000C */ stfs f0, 0xc(r28)
/* 0000CB5C C03C0010 */ lfs f1, 0x10(r28)
/* 0000CB60 C01E0070 */ lfs f0, 0x70(r30)
/* 0000CB64 EC010032 */ fmuls f0, f1, f0
/* 0000CB68 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CB6C C03C0010 */ lfs f1, 0x10(r28)
/* 0000CB70 C01E0074 */ lfs f0, 0x74(r30)
/* 0000CB74 EC01002A */ fadds f0, f1, f0
/* 0000CB78 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CB7C C03C0000 */ lfs f1, 0(r28)
/* 0000CB80 C01C000C */ lfs f0, 0xc(r28)
/* 0000CB84 EC01002A */ fadds f0, f1, f0
/* 0000CB88 D01C0000 */ stfs f0, 0(r28)
/* 0000CB8C C03C0004 */ lfs f1, 4(r28)
/* 0000CB90 C01C0010 */ lfs f0, 0x10(r28)
/* 0000CB94 EC01002A */ fadds f0, f1, f0
/* 0000CB98 D01C0004 */ stfs f0, 4(r28)
/* 0000CB9C A87C001C */ lha r3, 0x1c(r28)
/* 0000CBA0 38030060 */ addi r0, r3, 0x60
/* 0000CBA4 B01C001C */ sth r0, 0x1c(r28)
/* 0000CBA8 C03E0078 */ lfs f1, 0x78(r30)
/* 0000CBAC C01C0024 */ lfs f0, 0x24(r28)
/* 0000CBB0 C05C0004 */ lfs f2, 4(r28)
/* 0000CBB4 EC010028 */ fsubs f0, f1, f0
/* 0000CBB8 FC020040 */ fcmpo cr0, f2, f0
/* 0000CBBC 40800204 */ bge lbl_0000CDC0
/* 0000CBC0 A01F0000 */ lhz r0, 0(r31)
/* 0000CBC4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000CBC8 408200C4 */ bne lbl_0000CC8C
/* 0000CBCC 4BFF3591 */ bl rand
/* 0000CBD0 6C608000 */ xoris r0, r3, 0x8000
/* 0000CBD4 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CBD8 9001001C */ stw r0, 0x1c(r1)
/* 0000CBDC 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CBE0 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CBE4 93610018 */ stw r27, 0x18(r1)
/* 0000CBE8 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CBEC C8610018 */ lfd f3, 0x18(r1)
/* 0000CBF0 C01E0054 */ lfs f0, 0x54(r30)
/* 0000CBF4 EC632028 */ fsubs f3, f3, f4
/* 0000CBF8 EC431024 */ fdivs f2, f3, f2
/* 0000CBFC EC220828 */ fsubs f1, f2, f1
/* 0000CC00 EC000072 */ fmuls f0, f0, f1
/* 0000CC04 D01C0000 */ stfs f0, 0(r28)
/* 0000CC08 4BFF3555 */ bl rand
/* 0000CC0C 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC10 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CC14 90010014 */ stw r0, 0x14(r1)
/* 0000CC18 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CC1C C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CC20 93610010 */ stw r27, 0x10(r1)
/* 0000CC24 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CC28 C8610010 */ lfd f3, 0x10(r1)
/* 0000CC2C C01E005C */ lfs f0, 0x5c(r30)
/* 0000CC30 EC632028 */ fsubs f3, f3, f4
/* 0000CC34 EC431024 */ fdivs f2, f3, f2
/* 0000CC38 EC2100B2 */ fmuls f1, f1, f2
/* 0000CC3C EC000072 */ fmuls f0, f0, f1
/* 0000CC40 D01C0004 */ stfs f0, 4(r28)
/* 0000CC44 4BFF3519 */ bl rand
/* 0000CC48 6C608000 */ xoris r0, r3, 0x8000
/* 0000CC4C C05E0058 */ lfs f2, 0x58(r30)
/* 0000CC50 9001000C */ stw r0, 0xc(r1)
/* 0000CC54 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CC58 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CC5C 93610008 */ stw r27, 8(r1)
/* 0000CC60 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CC64 C8610008 */ lfd f3, 8(r1)
/* 0000CC68 C01E0018 */ lfs f0, 0x18(r30)
/* 0000CC6C EC632028 */ fsubs f3, f3, f4
/* 0000CC70 EC431024 */ fdivs f2, f3, f2
/* 0000CC74 EC220828 */ fsubs f1, f2, f1
/* 0000CC78 EC000072 */ fmuls f0, f0, f1
/* 0000CC7C D01C000C */ stfs f0, 0xc(r28)
/* 0000CC80 C01E0004 */ lfs f0, 4(r30)
/* 0000CC84 D01C0010 */ stfs f0, 0x10(r28)
/* 0000CC88 4800009C */ b lbl_0000CD24
lbl_0000CC8C:
/* 0000CC8C 801A0000 */ lwz r0, 0(r26)
/* 0000CC90 54032834 */ slwi r3, r0, 5
/* 0000CC94 4BFF34C9 */ bl mathutil_sin
/* 0000CC98 C01E007C */ lfs f0, 0x7c(r30)
/* 0000CC9C EC000072 */ fmuls f0, f0, f1
/* 0000CCA0 D01C0000 */ stfs f0, 0(r28)
/* 0000CCA4 C01E0080 */ lfs f0, 0x80(r30)
/* 0000CCA8 D01C0004 */ stfs f0, 4(r28)
/* 0000CCAC 4BFF34B1 */ bl rand
/* 0000CCB0 6C608000 */ xoris r0, r3, 0x8000
/* 0000CCB4 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CCB8 9001000C */ stw r0, 0xc(r1)
/* 0000CCBC 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CCC0 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CCC4 93610008 */ stw r27, 8(r1)
/* 0000CCC8 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CCCC C8610008 */ lfd f3, 8(r1)
/* 0000CCD0 C01E0084 */ lfs f0, 0x84(r30)
/* 0000CCD4 EC632028 */ fsubs f3, f3, f4
/* 0000CCD8 EC431024 */ fdivs f2, f3, f2
/* 0000CCDC EC220828 */ fsubs f1, f2, f1
/* 0000CCE0 EC000072 */ fmuls f0, f0, f1
/* 0000CCE4 D01C000C */ stfs f0, 0xc(r28)
/* 0000CCE8 4BFF3475 */ bl rand
/* 0000CCEC 6C608000 */ xoris r0, r3, 0x8000
/* 0000CCF0 C05E0058 */ lfs f2, 0x58(r30)
/* 0000CCF4 90010014 */ stw r0, 0x14(r1)
/* 0000CCF8 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CCFC C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD00 93610010 */ stw r27, 0x10(r1)
/* 0000CD04 C03E0088 */ lfs f1, 0x88(r30)
/* 0000CD08 C8610010 */ lfd f3, 0x10(r1)
/* 0000CD0C C01E0084 */ lfs f0, 0x84(r30)
/* 0000CD10 EC632028 */ fsubs f3, f3, f4
/* 0000CD14 EC431024 */ fdivs f2, f3, f2
/* 0000CD18 EC2100B2 */ fmuls f1, f1, f2
/* 0000CD1C EC010028 */ fsubs f0, f1, f0
/* 0000CD20 D01C0010 */ stfs f0, 0x10(r28)
lbl_0000CD24:
/* 0000CD24 4BFF3439 */ bl rand
/* 0000CD28 7C600734 */ extsh r0, r3
/* 0000CD2C B01C001C */ sth r0, 0x1c(r28)
/* 0000CD30 4BFF342D */ bl rand
/* 0000CD34 6C608000 */ xoris r0, r3, 0x8000
/* 0000CD38 C07E0058 */ lfs f3, 0x58(r30)
/* 0000CD3C 9001000C */ stw r0, 0xc(r1)
/* 0000CD40 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CD44 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD48 93610008 */ stw r27, 8(r1)
/* 0000CD4C C05E0064 */ lfs f2, 0x64(r30)
/* 0000CD50 C8010008 */ lfd f0, 8(r1)
/* 0000CD54 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CD58 EC802028 */ fsubs f4, f0, f4
/* 0000CD5C C01E0060 */ lfs f0, 0x60(r30)
/* 0000CD60 EC641824 */ fdivs f3, f4, f3
/* 0000CD64 EC4200F2 */ fmuls f2, f2, f3
/* 0000CD68 EC21102A */ fadds f1, f1, f2
/* 0000CD6C EC000072 */ fmuls f0, f0, f1
/* 0000CD70 D01C0020 */ stfs f0, 0x20(r28)
/* 0000CD74 4BFF33E9 */ bl rand
/* 0000CD78 6C608000 */ xoris r0, r3, 0x8000
/* 0000CD7C C07E0058 */ lfs f3, 0x58(r30)
/* 0000CD80 90010014 */ stw r0, 0x14(r1)
/* 0000CD84 3C600000 */ lis r3, lbl_000101B8@ha
/* 0000CD88 C8830000 */ lfd f4, lbl_000101B8@l(r3)
/* 0000CD8C 93610010 */ stw r27, 0x10(r1)
/* 0000CD90 C05E0064 */ lfs f2, 0x64(r30)
/* 0000CD94 C8010010 */ lfd f0, 0x10(r1)
/* 0000CD98 C03E002C */ lfs f1, 0x2c(r30)
/* 0000CD9C EC802028 */ fsubs f4, f0, f4
/* 0000CDA0 C01E0060 */ lfs f0, 0x60(r30)
/* 0000CDA4 EC641824 */ fdivs f3, f4, f3
/* 0000CDA8 EC4200F2 */ fmuls f2, f2, f3
/* 0000CDAC EC21102A */ fadds f1, f1, f2
/* 0000CDB0 EC000072 */ fmuls f0, f0, f1
/* 0000CDB4 D01C0024 */ stfs f0, 0x24(r28)
/* 0000CDB8 C01E000C */ lfs f0, 0xc(r30)
/* 0000CDBC D01C0028 */ stfs f0, 0x28(r28)
lbl_0000CDC0:
/* 0000CDC0 37BDFFFF */ addic. r29, r29, -1
/* 0000CDC4 3B9C002C */ addi r28, r28, 0x2c
/* 0000CDC8 4181FD84 */ bgt lbl_0000CB4C
/* 0000CDCC BB410020 */ lmw r26, 0x20(r1)
/* 0000CDD0 8001003C */ lwz r0, 0x3c(r1)
/* 0000CDD4 38210038 */ addi r1, r1, 0x38
/* 0000CDD8 7C0803A6 */ mtlr r0
/* 0000CDDC 4E800020 */ blr 
