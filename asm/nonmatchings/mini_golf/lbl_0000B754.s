/* 0000B754 7C0802A6 */ mflr r0
/* 0000B758 3CC00000 */ lis r6, lbl_00026378@ha
/* 0000B75C 90010004 */ stw r0, 4(r1)
/* 0000B760 3CA00000 */ lis r5, lbl_10000130@ha
/* 0000B764 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000B768 BF610024 */ stmw r27, 0x24(r1)
/* 0000B76C 3B630000 */ addi r27, r3, 0
/* 0000B770 3B840000 */ addi r28, r4, 0
/* 0000B774 3BA60000 */ addi r29, r6, lbl_00026378@l
/* 0000B778 3BC50000 */ addi r30, r5, lbl_10000130@l
/* 0000B77C 4BFF4A55 */ bl camera_clear
/* 0000B780 3BE00000 */ li r31, 0
/* 0000B784 9BFE0002 */ stb r31, 2(r30)
/* 0000B788 387B000C */ addi r3, r27, 0xc
/* 0000B78C C01C0004 */ lfs f0, 4(r28)
/* 0000B790 D01B000C */ stfs f0, 0xc(r27)
/* 0000B794 C83D0010 */ lfd f1, 0x10(r29)
/* 0000B798 C01C0008 */ lfs f0, 8(r28)
/* 0000B79C FC01002A */ fadd f0, f1, f0
/* 0000B7A0 FC000018 */ frsp f0, f0
/* 0000B7A4 D01B0010 */ stfs f0, 0x10(r27)
/* 0000B7A8 C01C000C */ lfs f0, 0xc(r28)
/* 0000B7AC D01B0014 */ stfs f0, 0x14(r27)
/* 0000B7B0 4BFF4A21 */ bl mathutil_mtxA_from_translate
/* 0000B7B4 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 0000B7B8 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 0000B7BC 80630000 */ lwz r3, 0(r3)
/* 0000B7C0 80630010 */ lwz r3, 0x10(r3)
/* 0000B7C4 A863000E */ lha r3, 0xe(r3)
/* 0000B7C8 4BFF4A09 */ bl mathutil_mtxA_rotate_y
/* 0000B7CC C01D0018 */ lfs f0, 0x18(r29)
/* 0000B7D0 389B0000 */ addi r4, r27, 0
/* 0000B7D4 38610010 */ addi r3, r1, 0x10
/* 0000B7D8 D0010010 */ stfs f0, 0x10(r1)
/* 0000B7DC C01D001C */ lfs f0, 0x1c(r29)
/* 0000B7E0 D0010014 */ stfs f0, 0x14(r1)
/* 0000B7E4 C01D0020 */ lfs f0, 0x20(r29)
/* 0000B7E8 D0010018 */ stfs f0, 0x18(r1)
/* 0000B7EC 4BFF49E5 */ bl mathutil_mtxA_tf_point
/* 0000B7F0 C01D0018 */ lfs f0, 0x18(r29)
/* 0000B7F4 38610010 */ addi r3, r1, 0x10
/* 0000B7F8 389B00AC */ addi r4, r27, 0xac
/* 0000B7FC D0010010 */ stfs f0, 0x10(r1)
/* 0000B800 C01D0018 */ lfs f0, 0x18(r29)
/* 0000B804 D0010014 */ stfs f0, 0x14(r1)
/* 0000B808 C01D0020 */ lfs f0, 0x20(r29)
/* 0000B80C D0010018 */ stfs f0, 0x18(r1)
/* 0000B810 4BFF49C1 */ bl mathutil_mtxA_tf_point
/* 0000B814 C03B000C */ lfs f1, 0xc(r27)
/* 0000B818 C01B0000 */ lfs f0, 0(r27)
/* 0000B81C EC010028 */ fsubs f0, f1, f0
/* 0000B820 D0010010 */ stfs f0, 0x10(r1)
/* 0000B824 C03B0010 */ lfs f1, 0x10(r27)
/* 0000B828 C01B0004 */ lfs f0, 4(r27)
/* 0000B82C EC010028 */ fsubs f0, f1, f0
/* 0000B830 D0010014 */ stfs f0, 0x14(r1)
/* 0000B834 C03B0014 */ lfs f1, 0x14(r27)
/* 0000B838 C01B0008 */ lfs f0, 8(r27)
/* 0000B83C EC010028 */ fsubs f0, f1, f0
/* 0000B840 D0010018 */ stfs f0, 0x18(r1)
/* 0000B844 C0210010 */ lfs f1, 0x10(r1)
/* 0000B848 C0410018 */ lfs f2, 0x18(r1)
/* 0000B84C 4BFF4985 */ bl mathutil_atan2
/* 0000B850 38038000 */ addi r0, r3, -32768
/* 0000B854 B01B001A */ sth r0, 0x1a(r27)
/* 0000B858 C0010018 */ lfs f0, 0x18(r1)
/* 0000B85C C0210010 */ lfs f1, 0x10(r1)
/* 0000B860 EC210072 */ fmuls f1, f1, f1
/* 0000B864 EC20083A */ fmadds f1, f0, f0, f1
/* 0000B868 4BFF4969 */ bl mathutil_sqrt
/* 0000B86C FC400890 */ fmr f2, f1
/* 0000B870 C0210014 */ lfs f1, 0x14(r1)
/* 0000B874 4BFF495D */ bl mathutil_atan2
/* 0000B878 B07B0018 */ sth r3, 0x18(r27)
/* 0000B87C 38600002 */ li r3, 2
/* 0000B880 38000001 */ li r0, 1
/* 0000B884 B3FB001C */ sth r31, 0x1c(r27)
/* 0000B888 987E0000 */ stb r3, 0(r30)
/* 0000B88C 9BFE0001 */ stb r31, 1(r30)
/* 0000B890 981B001F */ stb r0, 0x1f(r27)
/* 0000B894 8001003C */ lwz r0, 0x3c(r1)
/* 0000B898 BB610024 */ lmw r27, 0x24(r1)
/* 0000B89C 38210038 */ addi r1, r1, 0x38
/* 0000B8A0 7C0803A6 */ mtlr r0
/* 0000B8A4 4E800020 */ blr 
