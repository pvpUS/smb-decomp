/* 0000D7F8 7C0802A6 */ mflr r0
/* 0000D7FC 90010004 */ stw r0, 4(r1)
/* 0000D800 9421FFC0 */ stwu r1, -0x40(r1)
/* 0000D804 BF61002C */ stmw r27, 0x2c(r1)
/* 0000D808 3B630000 */ addi r27, r3, 0
/* 0000D80C 3B840000 */ addi r28, r4, 0
/* 0000D810 3BE50000 */ addi r31, r5, 0
/* 0000D814 3BA60000 */ addi r29, r6, 0
/* 0000D818 3BC70000 */ addi r30, r7, 0
/* 0000D81C 4BFF2945 */ bl mathutil_mtxA_push
/* 0000D820 7FE3FB78 */ mr r3, r31
/* 0000D824 4BFF293D */ bl mathutil_mtxA_from_rotate_y
/* 0000D828 C05C0000 */ lfs f2, 0(r28)
/* 0000D82C C03C0004 */ lfs f1, 4(r28)
/* 0000D830 C01C0008 */ lfs f0, 8(r28)
/* 0000D834 3C60E000 */ lis r3, 0xe000
/* 0000D838 D043000C */ stfs f2, 0xc(r3)
/* 0000D83C D023001C */ stfs f1, 0x1c(r3)
/* 0000D840 D003002C */ stfs f0, 0x2c(r3)
/* 0000D844 387B0000 */ addi r3, r27, 0
/* 0000D848 3881001C */ addi r4, r1, 0x1c
/* 0000D84C 4BFF2915 */ bl mathutil_mtxA_tf_point
/* 0000D850 C021001C */ lfs f1, 0x1c(r1)
/* 0000D854 C0410024 */ lfs f2, 0x24(r1)
/* 0000D858 4BFF2909 */ bl mathutil_atan2
/* 0000D85C 7C7F1B78 */ mr r31, r3
/* 0000D860 4BFF2901 */ bl mathutil_mtxA_pop
/* 0000D864 7FE50734 */ extsh r5, r31
/* 0000D868 38054000 */ addi r0, r5, 0x4000
/* 0000D86C 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000D870 7C600278 */ xor r0, r3, r0
/* 0000D874 7C030050 */ subf r0, r3, r0
/* 0000D878 7C044670 */ srawi r4, r0, 8
/* 0000D87C 38058000 */ addi r0, r5, -32768
/* 0000D880 7C03FE70 */ srawi r3, r0, 0x1f
/* 0000D884 5484063E */ clrlwi r4, r4, 0x18
/* 0000D888 7C600278 */ xor r0, r3, r0
/* 0000D88C 7C030050 */ subf r0, r3, r0
/* 0000D890 7C004670 */ srawi r0, r0, 8
/* 0000D894 28040080 */ cmplwi r4, 0x80
/* 0000D898 5400063E */ clrlwi r0, r0, 0x18
/* 0000D89C 41800008 */ blt lbl_0000D8A4
/* 0000D8A0 208400FF */ subfic r4, r4, 0xff
lbl_0000D8A4:
/* 0000D8A4 28000080 */ cmplwi r0, 0x80
/* 0000D8A8 41800008 */ blt lbl_0000D8B0
/* 0000D8AC 200000FF */ subfic r0, r0, 0xff
lbl_0000D8B0:
/* 0000D8B0 989D0000 */ stb r4, 0(r29)
/* 0000D8B4 981E0000 */ stb r0, 0(r30)
/* 0000D8B8 BB61002C */ lmw r27, 0x2c(r1)
/* 0000D8BC 80010044 */ lwz r0, 0x44(r1)
/* 0000D8C0 38210040 */ addi r1, r1, 0x40
/* 0000D8C4 7C0803A6 */ mtlr r0
/* 0000D8C8 4E800020 */ blr 
