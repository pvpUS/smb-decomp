/* 00025A44 7C0802A6 */ mflr r0
/* 00025A48 3CA00000 */ lis r5, lbl_10000248@ha
/* 00025A4C 90010004 */ stw r0, 4(r1)
/* 00025A50 9421FFE8 */ stwu r1, -0x18(r1)
/* 00025A54 93E10014 */ stw r31, 0x14(r1)
/* 00025A58 3BE50000 */ addi r31, r5, lbl_10000248@l
/* 00025A5C 3CA00000 */ lis r5, lbl_00026AA0@ha
/* 00025A60 93C10010 */ stw r30, 0x10(r1)
/* 00025A64 3BC50000 */ addi r30, r5, lbl_00026AA0@l
/* 00025A68 80830000 */ lwz r4, 0(r3)
/* 00025A6C 80030004 */ lwz r0, 4(r3)
/* 00025A70 909F0000 */ stw r4, 0(r31)
/* 00025A74 901F0004 */ stw r0, 4(r31)
/* 00025A78 80830008 */ lwz r4, 8(r3)
/* 00025A7C 8003000C */ lwz r0, 0xc(r3)
/* 00025A80 909F0008 */ stw r4, 8(r31)
/* 00025A84 901F000C */ stw r0, 0xc(r31)
/* 00025A88 80830010 */ lwz r4, 0x10(r3)
/* 00025A8C 80030014 */ lwz r0, 0x14(r3)
/* 00025A90 909F0010 */ stw r4, 0x10(r31)
/* 00025A94 901F0014 */ stw r0, 0x14(r31)
/* 00025A98 80830018 */ lwz r4, 0x18(r3)
/* 00025A9C 8003001C */ lwz r0, 0x1c(r3)
/* 00025AA0 909F0018 */ stw r4, 0x18(r31)
/* 00025AA4 901F001C */ stw r0, 0x1c(r31)
/* 00025AA8 807F0000 */ lwz r3, 0(r31)
/* 00025AAC 80030024 */ lwz r0, 0x24(r3)
/* 00025AB0 901F0020 */ stw r0, 0x20(r31)
/* 00025AB4 4BFDA71D */ bl mathutil_mtxA_push
/* 00025AB8 C03E0008 */ lfs f1, 8(r30)
/* 00025ABC C07E0004 */ lfs f3, 4(r30)
/* 00025AC0 FC400890 */ fmr f2, f1
/* 00025AC4 4BFDA70D */ bl mathutil_mtxA_from_translate_xyz
/* 00025AC8 C03E0000 */ lfs f1, 0(r30)
/* 00025ACC C07E0004 */ lfs f3, 4(r30)
/* 00025AD0 FC400890 */ fmr f2, f1
/* 00025AD4 4BFDA6FD */ bl mathutil_mtxA_scale_xyz
/* 00025AD8 38604000 */ li r3, 0x4000
/* 00025ADC 4BFDA6F5 */ bl mathutil_mtxA_rotate_x
/* 00025AE0 387F0008 */ addi r3, r31, 8
/* 00025AE4 4BFDA6ED */ bl mathutil_mtxA_translate_neg
/* 00025AE8 387F0028 */ addi r3, r31, 0x28
/* 00025AEC 4BFDA6E5 */ bl mathutil_mtxA_to_mtx
/* 00025AF0 4BFDA6E1 */ bl mathutil_mtxA_pop
/* 00025AF4 8001001C */ lwz r0, 0x1c(r1)
/* 00025AF8 38600001 */ li r3, 1
/* 00025AFC 83E10014 */ lwz r31, 0x14(r1)
/* 00025B00 83C10010 */ lwz r30, 0x10(r1)
/* 00025B04 7C0803A6 */ mtlr r0
/* 00025B08 38210018 */ addi r1, r1, 0x18
/* 00025B0C 4E800020 */ blr 
