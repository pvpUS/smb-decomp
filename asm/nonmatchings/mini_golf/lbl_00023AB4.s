/* 00023AB4 7C0802A6 */ mflr r0
/* 00023AB8 3C800000 */ lis r4, lbl_00026550@ha
/* 00023ABC 90010004 */ stw r0, 4(r1)
/* 00023AC0 3CA00000 */ lis r5, stageBoundSphere@ha
/* 00023AC4 39050000 */ addi r8, r5, stageBoundSphere@l
/* 00023AC8 9421FF80 */ stwu r1, -0x80(r1)
/* 00023ACC 38840000 */ addi r4, r4, lbl_00026550@l
/* 00023AD0 546A063E */ clrlwi r10, r3, 0x18
/* 00023AD4 C84402D8 */ lfd f2, 0x2d8(r4)
/* 00023AD8 3CC00000 */ lis r6, ballInfo@ha
/* 00023ADC C004045C */ lfs f0, 0x45c(r4)
/* 00023AE0 1D2A01A4 */ mulli r9, r10, 0x1a4
/* 00023AE4 C028000C */ lfs f1, 0xc(r8)
/* 00023AE8 80080000 */ lwz r0, 0(r8)
/* 00023AEC 80E80004 */ lwz r7, 4(r8)
/* 00023AF0 EC010032 */ fmuls f0, f1, f0
/* 00023AF4 38C60000 */ addi r6, r6, ballInfo@l
/* 00023AF8 90010064 */ stw r0, 0x64(r1)
/* 00023AFC 3800000A */ li r0, 0xa
/* 00023B00 FD02002A */ fadd f8, f2, f0
/* 00023B04 90E10068 */ stw r7, 0x68(r1)
/* 00023B08 7C0903A6 */ mtctr r0
/* 00023B0C 3CA00000 */ lis r5, lbl_00026FB8@ha
/* 00023B10 80080008 */ lwz r0, 8(r8)
/* 00023B14 FD004018 */ frsp f8, f8
/* 00023B18 7D064A14 */ add r8, r6, r9
/* 00023B1C 9001006C */ stw r0, 0x6c(r1)
/* 00023B20 1CCA0050 */ mulli r6, r10, 0x50
/* 00023B24 C0240284 */ lfs f1, 0x284(r4)
/* 00023B28 C00403EC */ lfs f0, 0x3ec(r4)
/* 00023B2C 38050000 */ addi r0, r5, lbl_00026FB8@l
/* 00023B30 EC210232 */ fmuls f1, f1, f8
/* 00023B34 C0E1006C */ lfs f7, 0x6c(r1)
/* 00023B38 7CA03214 */ add r5, r0, r6
/* 00023B3C C0610064 */ lfs f3, 0x64(r1)
/* 00023B40 ED474028 */ fsubs f10, f7, f8
/* 00023B44 ECC10024 */ fdivs f6, f1, f0
/* 00023B48 C0280004 */ lfs f1, 4(r8)
/* 00023B4C C0840248 */ lfs f4, 0x248(r4)
/* 00023B50 38E10004 */ addi r7, r1, 4
/* 00023B54 C008000C */ lfs f0, 0xc(r8)
/* 00023B58 ED233028 */ fsubs f9, f3, f6
/* 00023B5C C0440474 */ lfs f2, 0x474(r4)
/* 00023B60 EC63302A */ fadds f3, f3, f6
/* 00023B64 C0A404A0 */ lfs f5, 0x4a0(r4)
/* 00023B68 38C5FFF8 */ addi r6, r5, -8
/* 00023B6C ECC14828 */ fsubs f6, f1, f9
/* 00023B70 EC205028 */ fsubs f1, f0, f10
/* 00023B74 EC07402A */ fadds f0, f7, f8
/* 00023B78 EC8401B2 */ fmuls f4, f4, f6
/* 00023B7C EC634828 */ fsubs f3, f3, f9
/* 00023B80 EC220072 */ fmuls f1, f2, f1
/* 00023B84 EC005028 */ fsubs f0, f0, f10
/* 00023B88 EC441824 */ fdivs f2, f4, f3
/* 00023B8C EC610024 */ fdivs f3, f1, f0
/* 00023B90 EC25102A */ fadds f1, f5, f2
lbl_00023B94:
/* 00023B94 84A60008 */ lwzu r5, 8(r6)
/* 00023B98 80060004 */ lwz r0, 4(r6)
/* 00023B9C 94A70008 */ stwu r5, 8(r7)
/* 00023BA0 90070004 */ stw r0, 4(r7)
/* 00023BA4 4200FFF0 */ bdnz lbl_00023B94
/* 00023BA8 C00404A4 */ lfs f0, 0x4a4(r4)
/* 00023BAC FC010040 */ fcmpo cr0, f1, f0
/* 00023BB0 4080000C */ bge lbl_00023BBC
/* 00023BB4 D0010010 */ stfs f0, 0x10(r1)
/* 00023BB8 48000008 */ b lbl_00023BC0
lbl_00023BBC:
/* 00023BBC D0210010 */ stfs f1, 0x10(r1)
lbl_00023BC0:
/* 00023BC0 C0040474 */ lfs f0, 0x474(r4)
/* 00023BC4 FC030040 */ fcmpo cr0, f3, f0
/* 00023BC8 4081000C */ ble lbl_00023BD4
/* 00023BCC D0010014 */ stfs f0, 0x14(r1)
/* 00023BD0 48000008 */ b lbl_00023BD8
lbl_00023BD4:
/* 00023BD4 D0610014 */ stfs f3, 0x14(r1)
lbl_00023BD8:
/* 00023BD8 3CA00000 */ lis r5, globalAnimTimer@ha
/* 00023BDC C8040158 */ lfd f0, 0x158(r4)
/* 00023BE0 38C50000 */ addi r6, r5, globalAnimTimer@l
/* 00023BE4 3CA08889 */ lis r5, 0x8889
/* 00023BE8 80C60000 */ lwz r6, 0(r6)
/* 00023BEC 38058889 */ addi r0, r5, -30583
/* 00023BF0 7C003016 */ mulhwu r0, r0, r6
/* 00023BF4 5400D1BE */ srwi r0, r0, 6
/* 00023BF8 1C000078 */ mulli r0, r0, 0x78
/* 00023BFC 7CA03050 */ subf r5, r0, r6
/* 00023C00 6CA08000 */ xoris r0, r5, 0x8000
/* 00023C04 9001007C */ stw r0, 0x7c(r1)
/* 00023C08 3C004330 */ lis r0, 0x4330
/* 00023C0C 3CA00000 */ lis r5, lbl_000266F8@ha
/* 00023C10 90010078 */ stw r0, 0x78(r1)
/* 00023C14 5460063E */ clrlwi r0, r3, 0x18
/* 00023C18 C8450000 */ lfd f2, lbl_000266F8@l(r5)
/* 00023C1C C8210078 */ lfd f1, 0x78(r1)
/* 00023C20 FC211028 */ fsub f1, f1, f2
/* 00023C24 FC010024 */ fdiv f0, f1, f0
/* 00023C28 FC00001E */ fctiwz f0, f0
/* 00023C2C D8010070 */ stfd f0, 0x70(r1)
/* 00023C30 80A10074 */ lwz r5, 0x74(r1)
/* 00023C34 7C050000 */ cmpw r5, r0
/* 00023C38 40820018 */ bne lbl_00023C50
/* 00023C3C C0210018 */ lfs f1, 0x18(r1)
/* 00023C40 C8040290 */ lfd f0, 0x290(r4)
/* 00023C44 FC010028 */ fsub f0, f1, f0
/* 00023C48 FC000018 */ frsp f0, f0
/* 00023C4C D0010018 */ stfs f0, 0x18(r1)
lbl_00023C50:
/* 00023C50 3861000C */ addi r3, r1, 0xc
/* 00023C54 4BFDC57D */ bl nlSprPut
/* 00023C58 80010084 */ lwz r0, 0x84(r1)
/* 00023C5C 38210080 */ addi r1, r1, 0x80
/* 00023C60 7C0803A6 */ mtlr r0
/* 00023C64 4E800020 */ blr 
