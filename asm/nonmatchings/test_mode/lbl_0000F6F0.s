/* 0000F6F0 7C0802A6 */ mflr r0
/* 0000F6F4 3C600000 */ lis r3, gameMode@ha
/* 0000F6F8 90010004 */ stw r0, 4(r1)
/* 0000F6FC 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000F700 93E1001C */ stw r31, 0x1c(r1)
/* 0000F704 3BE40000 */ addi r31, r4, 0
/* 0000F708 20DF0003 */ subfic r6, r31, 3
/* 0000F70C 93C10018 */ stw r30, 0x18(r1)
/* 0000F710 93A10014 */ stw r29, 0x14(r1)
/* 0000F714 A8030000 */ lha r0, gameMode@l(r3)
/* 0000F718 3C600000 */ lis r3, gameSubmode@ha
/* 0000F71C 20A00003 */ subfic r5, r0, 3
/* 0000F720 A8030000 */ lha r0, gameSubmode@l(r3)
/* 0000F724 3085FFFF */ addic r4, r5, -1
/* 0000F728 7C842910 */ subfe r4, r4, r5
/* 0000F72C 7CC50034 */ cntlzw r5, r6
/* 0000F730 54A6D97E */ srwi r6, r5, 5
/* 0000F734 20600078 */ subfic r3, r0, 0x78
/* 0000F738 3003FFFF */ addic r0, r3, -1
/* 0000F73C 3CA00000 */ lis r5, lbl_10003BF8@ha
/* 0000F740 7CC62378 */ or r6, r6, r4
/* 0000F744 7C001910 */ subfe r0, r0, r3
/* 0000F748 7CC60379 */ or. r6, r6, r0
/* 0000F74C 3BA50000 */ addi r29, r5, lbl_10003BF8@l
/* 0000F750 41820050 */ beq lbl_0000F7A0
/* 0000F754 807D0004 */ lwz r3, 4(r29)
/* 0000F758 4BFF0A05 */ bl ape_destroy
/* 0000F75C 3C600000 */ lis r3, __OSCurrHeap@ha
/* 0000F760 809D0084 */ lwz r4, 0x84(r29)
/* 0000F764 3BC30000 */ addi r30, r3, __OSCurrHeap@l
/* 0000F768 807E0000 */ lwz r3, 0(r30)
/* 0000F76C 4BFF09F1 */ bl OSFreeToHeap
/* 0000F770 807E0000 */ lwz r3, 0(r30)
/* 0000F774 809D0080 */ lwz r4, 0x80(r29)
/* 0000F778 4BFF09E5 */ bl OSFreeToHeap
/* 0000F77C 807E0000 */ lwz r3, 0(r30)
/* 0000F780 809D00B0 */ lwz r4, 0xb0(r29)
/* 0000F784 4BFF09D9 */ bl OSFreeToHeap
/* 0000F788 807E0000 */ lwz r3, 0(r30)
/* 0000F78C 809D00B4 */ lwz r4, 0xb4(r29)
/* 0000F790 4BFF09CD */ bl OSFreeToHeap
/* 0000F794 2C1F0003 */ cmpwi r31, 3
/* 0000F798 41820008 */ beq lbl_0000F7A0
/* 0000F79C 4BFF09C1 */ bl thread_exit
lbl_0000F7A0:
/* 0000F7A0 80010024 */ lwz r0, 0x24(r1)
/* 0000F7A4 83E1001C */ lwz r31, 0x1c(r1)
/* 0000F7A8 83C10018 */ lwz r30, 0x18(r1)
/* 0000F7AC 7C0803A6 */ mtlr r0
/* 0000F7B0 83A10014 */ lwz r29, 0x14(r1)
/* 0000F7B4 38210020 */ addi r1, r1, 0x20
/* 0000F7B8 4E800020 */ blr 
