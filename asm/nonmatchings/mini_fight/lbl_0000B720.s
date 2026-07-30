/* 0000B720 7C0802A6 */ mflr r0
/* 0000B724 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B728 90010004 */ stw r0, 4(r1)
/* 0000B72C 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000B730 38000009 */ li r0, 9
/* 0000B734 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000B738 3CA00000 */ lis r5, modeCtrl@ha
/* 0000B73C 3C800000 */ lis r4, worldInfo@ha
/* 0000B740 BF010008 */ stmw r24, 8(r1)
/* 0000B744 38C00000 */ li r6, 0
/* 0000B748 B0030002 */ sth r0, 2(r3)
/* 0000B74C 38040000 */ addi r0, r4, worldInfo@l
/* 0000B750 38850000 */ addi r4, r5, modeCtrl@l
/* 0000B754 38A0003C */ li r5, 0x3c
/* 0000B758 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B75C 90A40000 */ stw r5, 0(r4)
/* 0000B760 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000B764 80A3000C */ lwz r5, 0xc(r3)
/* 0000B768 3BC3000C */ addi r30, r3, 0xc
/* 0000B76C 3BA30008 */ addi r29, r3, 8
/* 0000B770 7C040378 */ mr r4, r0
/* 0000B774 38600001 */ li r3, 1
/* 0000B778 48000020 */ b lbl_0000B798
lbl_0000B77C:
/* 0000B77C 88050000 */ lbz r0, 0(r5)
/* 0000B780 2C000002 */ cmpwi r0, 2
/* 0000B784 40820008 */ bne lbl_0000B78C
/* 0000B788 98640008 */ stb r3, 8(r4)
lbl_0000B78C:
/* 0000B78C 38C60001 */ addi r6, r6, 1
/* 0000B790 38840040 */ addi r4, r4, 0x40
/* 0000B794 38A50001 */ addi r5, r5, 1
lbl_0000B798:
/* 0000B798 801D0000 */ lwz r0, 0(r29)
/* 0000B79C 7C060000 */ cmpw r6, r0
/* 0000B7A0 4180FFDC */ blt lbl_0000B77C
/* 0000B7A4 3C600000 */ lis r3, currentBall@ha
/* 0000B7A8 80DE0000 */ lwz r6, 0(r30)
/* 0000B7AC 38830000 */ addi r4, r3, currentBall@l
/* 0000B7B0 3C600000 */ lis r3, ballInfo@ha
/* 0000B7B4 80A40000 */ lwz r5, 0(r4)
/* 0000B7B8 38030000 */ addi r0, r3, ballInfo@l
/* 0000B7BC 7C030378 */ mr r3, r0
/* 0000B7C0 38E00000 */ li r7, 0
/* 0000B7C4 4800002C */ b lbl_0000B7F0
lbl_0000B7C8:
/* 0000B7C8 88060000 */ lbz r0, 0(r6)
/* 0000B7CC 2C000002 */ cmpwi r0, 2
/* 0000B7D0 40820014 */ bne lbl_0000B7E4
/* 0000B7D4 90640000 */ stw r3, 0(r4)
/* 0000B7D8 80030094 */ lwz r0, 0x94(r3)
/* 0000B7DC 64000001 */ oris r0, r0, 1
/* 0000B7E0 90030094 */ stw r0, 0x94(r3)
lbl_0000B7E4:
/* 0000B7E4 38E70001 */ addi r7, r7, 1
/* 0000B7E8 386301A4 */ addi r3, r3, 0x1a4
/* 0000B7EC 38C60001 */ addi r6, r6, 1
lbl_0000B7F0:
/* 0000B7F0 801D0000 */ lwz r0, 0(r29)
/* 0000B7F4 7C070000 */ cmpw r7, r0
/* 0000B7F8 4180FFD0 */ blt lbl_0000B7C8
/* 0000B7FC 3C600000 */ lis r3, currentBall@ha
/* 0000B800 3BE30000 */ addi r31, r3, currentBall@l
/* 0000B804 3C600000 */ lis r3, infoWork@ha
/* 0000B808 90BF0000 */ stw r5, 0(r31)
/* 0000B80C 38830000 */ addi r4, r3, infoWork@l
/* 0000B810 80040000 */ lwz r0, 0(r4)
/* 0000B814 3C600001 */ lis r3, 1
/* 0000B818 3863D8FC */ addi r3, r3, -9988
/* 0000B81C 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 0000B820 90040000 */ stw r0, 0(r4)
/* 0000B824 4BFF4941 */ bl u_play_sound_0
/* 0000B828 38600183 */ li r3, 0x183
/* 0000B82C 4BFF4939 */ bl u_play_sound_0
/* 0000B830 3C600000 */ lis r3, ballInfo@ha
/* 0000B834 839F0000 */ lwz r28, 0(r31)
/* 0000B838 38030000 */ addi r0, r3, ballInfo@l
/* 0000B83C 833E0000 */ lwz r25, 0(r30)
/* 0000B840 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 0000B844 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000B848 7C1A0378 */ mr r26, r0
/* 0000B84C 3B640000 */ addi r27, r4, lbl_802F1DFC@l
/* 0000B850 3BC30000 */ addi r30, r3, u_somePlayerId@l
/* 0000B854 3B000000 */ li r24, 0
/* 0000B858 48000040 */ b lbl_0000B898
lbl_0000B85C:
/* 0000B85C 88190000 */ lbz r0, 0(r25)
/* 0000B860 2C000002 */ cmpwi r0, 2
/* 0000B864 40820028 */ bne lbl_0000B88C
/* 0000B868 935F0000 */ stw r26, 0(r31)
/* 0000B86C 3860001E */ li r3, 0x1e
/* 0000B870 809A00FC */ lwz r4, 0xfc(r26)
/* 0000B874 80040010 */ lwz r0, 0x10(r4)
/* 0000B878 901B0000 */ stw r0, 0(r27)
/* 0000B87C 881A002E */ lbz r0, 0x2e(r26)
/* 0000B880 7C000774 */ extsb r0, r0
/* 0000B884 901E0000 */ stw r0, 0(r30)
/* 0000B888 4BFF48DD */ bl u_play_sound_0
lbl_0000B88C:
/* 0000B88C 3B180001 */ addi r24, r24, 1
/* 0000B890 3B5A01A4 */ addi r26, r26, 0x1a4
/* 0000B894 3B390001 */ addi r25, r25, 1
lbl_0000B898:
/* 0000B898 801D0000 */ lwz r0, 0(r29)
/* 0000B89C 7C180000 */ cmpw r24, r0
/* 0000B8A0 4180FFBC */ blt lbl_0000B85C
/* 0000B8A4 3C600000 */ lis r3, currentBall@ha
/* 0000B8A8 93830000 */ stw r28, currentBall@l(r3)
/* 0000B8AC BB010008 */ lmw r24, 8(r1)
/* 0000B8B0 8001002C */ lwz r0, 0x2c(r1)
/* 0000B8B4 38210028 */ addi r1, r1, 0x28
/* 0000B8B8 7C0803A6 */ mtlr r0
/* 0000B8BC 4E800020 */ blr 
