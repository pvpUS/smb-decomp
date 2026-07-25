/* 00003C34 7C0802A6 */ mflr r0
/* 00003C38 3CA00000 */ lis r5, lbl_10000000@ha
/* 00003C3C 90010004 */ stw r0, 4(r1)
/* 00003C40 38A50000 */ addi r5, r5, lbl_10000000@l
/* 00003C44 3CC00000 */ lis r6, gameMode@ha
/* 00003C48 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003C4C 93E1001C */ stw r31, 0x1c(r1)
/* 00003C50 3BE40000 */ addi r31, r4, 0
/* 00003C54 3C800000 */ lis r4, gameSubmode@ha
/* 00003C58 80E50150 */ lwz r7, 0x150(r5)
/* 00003C5C 211F0003 */ subfic r8, r31, 3
/* 00003C60 A8060000 */ lha r0, gameMode@l(r6)
/* 00003C64 20C70001 */ subfic r6, r7, 1
/* 00003C68 A9240000 */ lha r9, gameSubmode@l(r4)
/* 00003C6C 7D070034 */ cntlzw r7, r8
/* 00003C70 7CC60034 */ cntlzw r6, r6
/* 00003C74 20800003 */ subfic r4, r0, 3
/* 00003C78 3004FFFF */ addic r0, r4, -1
/* 00003C7C 2C090077 */ cmpwi r9, 0x77
/* 00003C80 54E7D97E */ srwi r7, r7, 5
/* 00003C84 54C6D97E */ srwi r6, r6, 5
/* 00003C88 7CE73378 */ or r7, r7, r6
/* 00003C8C 7C002110 */ subfe r0, r0, r4
/* 00003C90 7CE70378 */ or r7, r7, r0
/* 00003C94 38000000 */ li r0, 0
/* 00003C98 41820010 */ beq lbl_00003CA8
/* 00003C9C 2C090078 */ cmpwi r9, 0x78
/* 00003CA0 41820008 */ beq lbl_00003CA8
/* 00003CA4 38000001 */ li r0, 1
lbl_00003CA8:
/* 00003CA8 7CE70379 */ or. r7, r7, r0
/* 00003CAC 41820018 */ beq lbl_00003CC4
/* 00003CB0 4BFFC4AD */ bl ape_destroy
/* 00003CB4 2C1F0003 */ cmpwi r31, 3
/* 00003CB8 418200C8 */ beq lbl_00003D80
/* 00003CBC 4BFFC4A1 */ bl thread_exit
/* 00003CC0 480000C0 */ b lbl_00003D80
lbl_00003CC4:
/* 00003CC4 3C800000 */ lis r4, debugFlags@ha
/* 00003CC8 80040000 */ lwz r0, debugFlags@l(r4)
/* 00003CCC 7000000A */ andi. r0, r0, 0xa
/* 00003CD0 408200B0 */ bne lbl_00003D80
/* 00003CD4 80030074 */ lwz r0, 0x74(r3)
/* 00003CD8 28000000 */ cmplwi r0, 0
/* 00003CDC 41820094 */ beq lbl_00003D70
/* 00003CE0 5404103A */ slwi r4, r0, 2
/* 00003CE4 3CC00000 */ lis r6, lbl_0000FF78@ha
/* 00003CE8 7C852214 */ add r4, r5, r4
/* 00003CEC C0660000 */ lfs f3, lbl_0000FF78@l(r6)
/* 00003CF0 540007FF */ clrlwi. r0, r0, 0x1f
/* 00003CF4 810400B8 */ lwz r8, 0xb8(r4)
/* 00003CF8 41820010 */ beq lbl_00003D08
/* 00003CFC 3C800000 */ lis r4, lbl_0000FF00@ha
/* 00003D00 C0040000 */ lfs f0, lbl_0000FF00@l(r4)
/* 00003D04 EC630032 */ fmuls f3, f3, f0
lbl_00003D08:
/* 00003D08 80E80030 */ lwz r7, 0x30(r8)
/* 00003D0C 3C004330 */ lis r0, 0x4330
/* 00003D10 80C80034 */ lwz r6, 0x34(r8)
/* 00003D14 3C800000 */ lis r4, lbl_0000FEC8@ha
/* 00003D18 90E30030 */ stw r7, 0x30(r3)
/* 00003D1C 90C30034 */ stw r6, 0x34(r3)
/* 00003D20 80C80038 */ lwz r6, 0x38(r8)
/* 00003D24 90C30038 */ stw r6, 0x38(r3)
/* 00003D28 80C30074 */ lwz r6, 0x74(r3)
/* 00003D2C C8240000 */ lfd f1, lbl_0000FEC8@l(r4)
/* 00003D30 90C10014 */ stw r6, 0x14(r1)
/* 00003D34 C0430030 */ lfs f2, 0x30(r3)
/* 00003D38 90010010 */ stw r0, 0x10(r1)
/* 00003D3C C8010010 */ lfd f0, 0x10(r1)
/* 00003D40 EC000828 */ fsubs f0, f0, f1
/* 00003D44 EC030032 */ fmuls f0, f3, f0
/* 00003D48 EC02002A */ fadds f0, f2, f0
/* 00003D4C D0030030 */ stfs f0, 0x30(r3)
/* 00003D50 80880060 */ lwz r4, 0x60(r8)
/* 00003D54 80080064 */ lwz r0, 0x64(r8)
/* 00003D58 90830060 */ stw r4, 0x60(r3)
/* 00003D5C 90030064 */ stw r0, 0x64(r3)
/* 00003D60 80880068 */ lwz r4, 0x68(r8)
/* 00003D64 8008006C */ lwz r0, 0x6c(r8)
/* 00003D68 90830068 */ stw r4, 0x68(r3)
/* 00003D6C 9003006C */ stw r0, 0x6c(r3)
lbl_00003D70:
/* 00003D70 C0050140 */ lfs f0, 0x140(r5)
/* 00003D74 80830000 */ lwz r4, 0(r3)
/* 00003D78 D004003C */ stfs f0, 0x3c(r4)
/* 00003D7C 4BFFC3E1 */ bl ape_skel_anim_main
lbl_00003D80:
/* 00003D80 80010024 */ lwz r0, 0x24(r1)
/* 00003D84 83E1001C */ lwz r31, 0x1c(r1)
/* 00003D88 38210020 */ addi r1, r1, 0x20
/* 00003D8C 7C0803A6 */ mtlr r0
/* 00003D90 4E800020 */ blr 
