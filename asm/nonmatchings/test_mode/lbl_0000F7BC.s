/* 0000F7BC 7C0802A6 */ mflr r0
/* 0000F7C0 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000F7C4 90010004 */ stw r0, 4(r1)
/* 0000F7C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000F7CC 93E10014 */ stw r31, 0x14(r1)
/* 0000F7D0 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000F7D4 93C10010 */ stw r30, 0x10(r1)
/* 0000F7D8 80DF00A8 */ lwz r6, 0xa8(r31)
/* 0000F7DC 2C060007 */ cmpwi r6, 7
/* 0000F7E0 40820080 */ bne lbl_0000F860
/* 0000F7E4 801F006C */ lwz r0, 0x6c(r31)
/* 0000F7E8 3C600000 */ lis r3, motInfo@ha
/* 0000F7EC 54C5103A */ slwi r5, r6, 2
/* 0000F7F0 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000F7F4 3BC30000 */ addi r30, r3, motInfo@l
/* 0000F7F8 7C602A14 */ add r3, r0, r5
/* 0000F7FC 809E0000 */ lwz r4, 0(r30)
/* 0000F800 7CBF2A14 */ add r5, r31, r5
/* 0000F804 38030070 */ addi r0, r3, 0x70
/* 0000F808 80A50010 */ lwz r5, 0x10(r5)
/* 0000F80C 7C04002E */ lwzx r0, r4, r0
/* 0000F810 7C050000 */ cmpw r5, r0
/* 0000F814 4180004C */ blt lbl_0000F860
/* 0000F818 90C1000C */ stw r6, 0xc(r1)
/* 0000F81C 3861000C */ addi r3, r1, 0xc
/* 0000F820 38810008 */ addi r4, r1, 8
/* 0000F824 90A10008 */ stw r5, 8(r1)
/* 0000F828 4BFF0935 */ bl mot_ape_8008BAA8
/* 0000F82C 801F006C */ lwz r0, 0x6c(r31)
/* 0000F830 8061000C */ lwz r3, 0xc(r1)
/* 0000F834 1C8000B4 */ mulli r4, r0, 0xb4
/* 0000F838 80010008 */ lwz r0, 8(r1)
/* 0000F83C 80BE0000 */ lwz r5, 0(r30)
/* 0000F840 5463103A */ slwi r3, r3, 2
/* 0000F844 7C641A14 */ add r3, r4, r3
/* 0000F848 38630030 */ addi r3, r3, 0x30
/* 0000F84C 7C65182E */ lwzx r3, r5, r3
/* 0000F850 54002834 */ slwi r0, r0, 5
/* 0000F854 7C030214 */ add r0, r3, r0
/* 0000F858 901F00AC */ stw r0, 0xac(r31)
/* 0000F85C 4800003C */ b lbl_0000F898
lbl_0000F860:
/* 0000F860 801F006C */ lwz r0, 0x6c(r31)
/* 0000F864 3C600000 */ lis r3, motInfo@ha
/* 0000F868 809F00A8 */ lwz r4, 0xa8(r31)
/* 0000F86C 1C0000B4 */ mulli r0, r0, 0xb4
/* 0000F870 80A30000 */ lwz r5, motInfo@l(r3)
/* 0000F874 5483103A */ slwi r3, r4, 2
/* 0000F878 7C801A14 */ add r4, r0, r3
/* 0000F87C 7C7F1A14 */ add r3, r31, r3
/* 0000F880 80030010 */ lwz r0, 0x10(r3)
/* 0000F884 38840030 */ addi r4, r4, 0x30
/* 0000F888 7C65202E */ lwzx r3, r5, r4
/* 0000F88C 54002834 */ slwi r0, r0, 5
/* 0000F890 7C030214 */ add r0, r3, r0
/* 0000F894 901F00AC */ stw r0, 0xac(r31)
lbl_0000F898:
/* 0000F898 807F0004 */ lwz r3, 4(r31)
/* 0000F89C 80BF00AC */ lwz r5, 0xac(r31)
/* 0000F8A0 38C3001C */ addi r6, r3, 0x1c
/* 0000F8A4 8003001C */ lwz r0, 0x1c(r3)
/* 0000F8A8 7C050040 */ cmplw r5, r0
/* 0000F8AC 40820018 */ bne lbl_0000F8C4
/* 0000F8B0 80630000 */ lwz r3, 0(r3)
/* 0000F8B4 80850010 */ lwz r4, 0x10(r5)
/* 0000F8B8 A0030032 */ lhz r0, 0x32(r3)
/* 0000F8BC 7C040000 */ cmpw r4, r0
/* 0000F8C0 41820068 */ beq lbl_0000F928
lbl_0000F8C4:
/* 0000F8C4 90A60000 */ stw r5, 0(r6)
/* 0000F8C8 3C600000 */ lis r3, u_motAnimCount@ha
/* 0000F8CC 809F00AC */ lwz r4, 0xac(r31)
/* 0000F8D0 80030000 */ lwz r0, u_motAnimCount@l(r3)
/* 0000F8D4 84640010 */ lwzu r3, 0x10(r4)
/* 0000F8D8 7C030000 */ cmpw r3, r0
/* 0000F8DC 4081000C */ ble lbl_0000F8E8
/* 0000F8E0 38000001 */ li r0, 1
/* 0000F8E4 90040000 */ stw r0, 0(r4)
lbl_0000F8E8:
/* 0000F8E8 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000F8EC 807F0004 */ lwz r3, 4(r31)
/* 0000F8F0 90030028 */ stw r0, 0x28(r3)
/* 0000F8F4 801F00A8 */ lwz r0, 0xa8(r31)
/* 0000F8F8 807F0004 */ lwz r3, 4(r31)
/* 0000F8FC 5400103A */ slwi r0, r0, 2
/* 0000F900 7C9F0214 */ add r4, r31, r0
/* 0000F904 80040010 */ lwz r0, 0x10(r4)
/* 0000F908 900300B0 */ stw r0, 0xb0(r3)
/* 0000F90C 809F00AC */ lwz r4, 0xac(r31)
/* 0000F910 807F0004 */ lwz r3, 4(r31)
/* 0000F914 80840010 */ lwz r4, 0x10(r4)
/* 0000F918 4BFF0845 */ bl func_8008B9DC
/* 0000F91C 807F00AC */ lwz r3, 0xac(r31)
/* 0000F920 C0030018 */ lfs f0, 0x18(r3)
/* 0000F924 D01F0008 */ stfs f0, 8(r31)
lbl_0000F928:
/* 0000F928 8001001C */ lwz r0, 0x1c(r1)
/* 0000F92C 83E10014 */ lwz r31, 0x14(r1)
/* 0000F930 83C10010 */ lwz r30, 0x10(r1)
/* 0000F934 7C0803A6 */ mtlr r0
/* 0000F938 38210018 */ addi r1, r1, 0x18
/* 0000F93C 4E800020 */ blr 
