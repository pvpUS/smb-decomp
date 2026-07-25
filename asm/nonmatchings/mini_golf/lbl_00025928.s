/* 00025928 7C0802A6 */ mflr r0
/* 0002592C 3CA00000 */ lis r5, lbl_10000248@ha
/* 00025930 90010004 */ stw r0, 4(r1)
/* 00025934 9421FFE0 */ stwu r1, -0x20(r1)
/* 00025938 93E1001C */ stw r31, 0x1c(r1)
/* 0002593C 3BE50000 */ addi r31, r5, lbl_10000248@l
/* 00025940 3CA00000 */ lis r5, lbl_00026AA0@ha
/* 00025944 93C10018 */ stw r30, 0x18(r1)
/* 00025948 3BC50000 */ addi r30, r5, lbl_00026AA0@l
/* 0002594C 93A10014 */ stw r29, 0x14(r1)
/* 00025950 80830000 */ lwz r4, 0(r3)
/* 00025954 80030004 */ lwz r0, 4(r3)
/* 00025958 909F0000 */ stw r4, 0(r31)
/* 0002595C 901F0004 */ stw r0, 4(r31)
/* 00025960 80830008 */ lwz r4, 8(r3)
/* 00025964 8003000C */ lwz r0, 0xc(r3)
/* 00025968 909F0008 */ stw r4, 8(r31)
/* 0002596C 901F000C */ stw r0, 0xc(r31)
/* 00025970 80830010 */ lwz r4, 0x10(r3)
/* 00025974 80030014 */ lwz r0, 0x14(r3)
/* 00025978 909F0010 */ stw r4, 0x10(r31)
/* 0002597C 901F0014 */ stw r0, 0x14(r31)
/* 00025980 80830018 */ lwz r4, 0x18(r3)
/* 00025984 8003001C */ lwz r0, 0x1c(r3)
/* 00025988 909F0018 */ stw r4, 0x18(r31)
/* 0002598C 901F001C */ stw r0, 0x1c(r31)
/* 00025990 807F0000 */ lwz r3, 0(r31)
/* 00025994 80030024 */ lwz r0, 0x24(r3)
/* 00025998 901F0020 */ stw r0, 0x20(r31)
/* 0002599C 807F0004 */ lwz r3, 4(r31)
/* 000259A0 80030024 */ lwz r0, 0x24(r3)
/* 000259A4 901F0024 */ stw r0, 0x24(r31)
/* 000259A8 4BFDA829 */ bl mathutil_mtxA_push
/* 000259AC 4BFDA825 */ bl mathutil_mtxA_from_identity
/* 000259B0 C05E0000 */ lfs f2, 0(r30)
/* 000259B4 C03F0014 */ lfs f1, 0x14(r31)
/* 000259B8 C01F0018 */ lfs f0, 0x18(r31)
/* 000259BC EC220824 */ fdivs f1, f2, f1
/* 000259C0 C07E0004 */ lfs f3, 4(r30)
/* 000259C4 EC420024 */ fdivs f2, f2, f0
/* 000259C8 4BFDA809 */ bl mathutil_mtxA_scale_xyz
/* 000259CC 38604000 */ li r3, 0x4000
/* 000259D0 4BFDA801 */ bl mathutil_mtxA_rotate_x
/* 000259D4 3BBF0008 */ addi r29, r31, 8
/* 000259D8 387D0000 */ addi r3, r29, 0
/* 000259DC 4BFDA7F5 */ bl mathutil_mtxA_translate_neg
/* 000259E0 387F0028 */ addi r3, r31, 0x28
/* 000259E4 4BFDA7ED */ bl mathutil_mtxA_to_mtx
/* 000259E8 C03E0008 */ lfs f1, 8(r30)
/* 000259EC C07E0004 */ lfs f3, 4(r30)
/* 000259F0 FC400890 */ fmr f2, f1
/* 000259F4 4BFDA7DD */ bl mathutil_mtxA_from_translate_xyz
/* 000259F8 C05E000C */ lfs f2, 0xc(r30)
/* 000259FC C01F001C */ lfs f0, 0x1c(r31)
/* 00025A00 C03E0004 */ lfs f1, 4(r30)
/* 00025A04 EC420024 */ fdivs f2, f2, f0
/* 00025A08 FC600890 */ fmr f3, f1
/* 00025A0C 4BFDA7C5 */ bl mathutil_mtxA_scale_xyz
/* 00025A10 7FA3EB78 */ mr r3, r29
/* 00025A14 4BFDA7BD */ bl mathutil_mtxA_translate_neg
/* 00025A18 387F0058 */ addi r3, r31, 0x58
/* 00025A1C 4BFDA7B5 */ bl mathutil_mtxA_to_mtx
/* 00025A20 4BFDA7B1 */ bl mathutil_mtxA_pop
/* 00025A24 80010024 */ lwz r0, 0x24(r1)
/* 00025A28 38600001 */ li r3, 1
/* 00025A2C 83E1001C */ lwz r31, 0x1c(r1)
/* 00025A30 83C10018 */ lwz r30, 0x18(r1)
/* 00025A34 7C0803A6 */ mtlr r0
/* 00025A38 83A10014 */ lwz r29, 0x14(r1)
/* 00025A3C 38210020 */ addi r1, r1, 0x20
/* 00025A40 4E800020 */ blr 
