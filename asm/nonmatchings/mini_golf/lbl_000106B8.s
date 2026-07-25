/* 000106B8 7C0802A6 */ mflr r0
/* 000106BC 3C600000 */ lis r3, lbl_10000190@ha
/* 000106C0 90010004 */ stw r0, 4(r1)
/* 000106C4 9421FFC0 */ stwu r1, -0x40(r1)
/* 000106C8 93E1003C */ stw r31, 0x3c(r1)
/* 000106CC 3BE30000 */ addi r31, r3, lbl_10000190@l
/* 000106D0 93C10038 */ stw r30, 0x38(r1)
/* 000106D4 4BFEFAFD */ bl rand
/* 000106D8 5463047E */ clrlwi r3, r3, 0x11
/* 000106DC 7C603670 */ srawi r0, r3, 6
/* 000106E0 7C000194 */ addze r0, r0
/* 000106E4 54003032 */ slwi r0, r0, 6
/* 000106E8 7C001810 */ subfc r0, r0, r3
/* 000106EC 7C000734 */ extsh r0, r0
/* 000106F0 B01F0000 */ sth r0, 0(r31)
/* 000106F4 4BFEFADD */ bl rand
/* 000106F8 5463047E */ clrlwi r3, r3, 0x11
/* 000106FC 7C603670 */ srawi r0, r3, 6
/* 00010700 7C000194 */ addze r0, r0
/* 00010704 54003032 */ slwi r0, r0, 6
/* 00010708 7C001810 */ subfc r0, r0, r3
/* 0001070C 7C000734 */ extsh r0, r0
/* 00010710 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010714 B01F0002 */ sth r0, 2(r31)
/* 00010718 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 0001071C 80630000 */ lwz r3, 0(r3)
/* 00010720 3883000C */ addi r4, r3, 0xc
/* 00010724 8063000C */ lwz r3, 0xc(r3)
/* 00010728 C02300F0 */ lfs f1, 0xf0(r3)
/* 0001072C C00301B4 */ lfs f0, 0x1b4(r3)
/* 00010730 FC010040 */ fcmpo cr0, f1, f0
/* 00010734 40810018 */ ble lbl_0001074C
/* 00010738 38000001 */ li r0, 1
/* 0001073C 981F0004 */ stb r0, 4(r31)
/* 00010740 38000002 */ li r0, 2
/* 00010744 981F0005 */ stb r0, 5(r31)
/* 00010748 48000014 */ b lbl_0001075C
lbl_0001074C:
/* 0001074C 38000002 */ li r0, 2
/* 00010750 981F0004 */ stb r0, 4(r31)
/* 00010754 38000001 */ li r0, 1
/* 00010758 981F0005 */ stb r0, 5(r31)
lbl_0001075C:
/* 0001075C 881F0005 */ lbz r0, 5(r31)
/* 00010760 80640000 */ lwz r3, 0(r4)
/* 00010764 1C0000C4 */ mulli r0, r0, 0xc4
/* 00010768 7FC30214 */ add r30, r3, r0
/* 0001076C 387E0000 */ addi r3, r30, 0
/* 00010770 4BFEFA61 */ bl mathutil_mtxA_from_translate
/* 00010774 A87E0010 */ lha r3, 0x10(r30)
/* 00010778 4BFEFA59 */ bl mathutil_mtxA_rotate_z
/* 0001077C A87E000E */ lha r3, 0xe(r30)
/* 00010780 4BFEFA51 */ bl mathutil_mtxA_rotate_y
/* 00010784 A87E000C */ lha r3, 0xc(r30)
/* 00010788 4BFEFA49 */ bl mathutil_mtxA_rotate_x
/* 0001078C 38610008 */ addi r3, r1, 8
/* 00010790 4BFEFA41 */ bl mathutil_mtxA_to_mtx
/* 00010794 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010798 881F0004 */ lbz r0, 4(r31)
/* 0001079C 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 000107A0 80630000 */ lwz r3, 0(r3)
/* 000107A4 1C0000C4 */ mulli r0, r0, 0xc4
/* 000107A8 8063000C */ lwz r3, 0xc(r3)
/* 000107AC 7FC30214 */ add r30, r3, r0
/* 000107B0 4BFEFA21 */ bl mathutil_mtxA_from_identity
/* 000107B4 A81E000C */ lha r0, 0xc(r30)
/* 000107B8 7C6000D0 */ neg r3, r0
/* 000107BC 4BFEFA15 */ bl mathutil_mtxA_rotate_x
/* 000107C0 A81E000E */ lha r0, 0xe(r30)
/* 000107C4 7C6000D0 */ neg r3, r0
/* 000107C8 4BFEFA09 */ bl mathutil_mtxA_rotate_y
/* 000107CC A81E0010 */ lha r0, 0x10(r30)
/* 000107D0 7C6000D0 */ neg r3, r0
/* 000107D4 4BFEF9FD */ bl mathutil_mtxA_rotate_z
/* 000107D8 7FC3F378 */ mr r3, r30
/* 000107DC 4BFEF9F5 */ bl mathutil_mtxA_translate_neg
/* 000107E0 38610008 */ addi r3, r1, 8
/* 000107E4 4BFEF9ED */ bl mathutil_mtxA_mult_right
/* 000107E8 387F0008 */ addi r3, r31, 8
/* 000107EC 4BFEF9E5 */ bl mathutil_mtxA_to_mtx
/* 000107F0 80010044 */ lwz r0, 0x44(r1)
/* 000107F4 83E1003C */ lwz r31, 0x3c(r1)
/* 000107F8 83C10038 */ lwz r30, 0x38(r1)
/* 000107FC 7C0803A6 */ mtlr r0
/* 00010800 38210040 */ addi r1, r1, 0x40
/* 00010804 4E800020 */ blr 
