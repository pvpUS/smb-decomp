/* 0000C76C 7C0802A6 */ mflr r0
/* 0000C770 3C600000 */ lis r3, ballInfo@ha
/* 0000C774 90010004 */ stw r0, 4(r1)
/* 0000C778 3CA00000 */ lis r5, lbl_10000028@ha
/* 0000C77C 38630000 */ addi r3, r3, ballInfo@l
/* 0000C780 9421FFF8 */ stwu r1, -8(r1)
/* 0000C784 38A50000 */ addi r5, r5, lbl_10000028@l
/* 0000C788 80040048 */ lwz r0, 0x48(r4)
/* 0000C78C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000C790 7C630214 */ add r3, r3, r0
/* 0000C794 A0050004 */ lhz r0, 4(r5)
/* 0000C798 80630144 */ lwz r3, 0x144(r3)
/* 0000C79C A8630022 */ lha r3, 0x22(r3)
/* 0000C7A0 38630001 */ addi r3, r3, 1
/* 0000C7A4 7C670734 */ extsh r7, r3
/* 0000C7A8 7C070000 */ cmpw r7, r0
/* 0000C7AC 41800008 */ blt lbl_0000C7B4
/* 0000C7B0 A8E50004 */ lha r7, 4(r5)
lbl_0000C7B4:
/* 0000C7B4 3C600000 */ lis r3, lbl_00015C6C@ha
/* 0000C7B8 A0C50004 */ lhz r6, 4(r5)
/* 0000C7BC 38030000 */ addi r0, r3, lbl_00015C6C@l
/* 0000C7C0 4CC63182 */ crclr 6
/* 0000C7C4 3864008C */ addi r3, r4, 0x8c
/* 0000C7C8 7C040378 */ mr r4, r0
/* 0000C7CC 7CE50734 */ extsh r5, r7
/* 0000C7D0 4BFF39AD */ bl sprintf
/* 0000C7D4 8001000C */ lwz r0, 0xc(r1)
/* 0000C7D8 38210008 */ addi r1, r1, 8
/* 0000C7DC 7C0803A6 */ mtlr r0
/* 0000C7E0 4E800020 */ blr 
