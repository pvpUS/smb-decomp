/* 0000C5EC 7C0802A6 */ mflr r0
/* 0000C5F0 3C600000 */ lis r3, lbl_1000106C@ha
/* 0000C5F4 90010004 */ stw r0, 4(r1)
/* 0000C5F8 38A30000 */ addi r5, r3, lbl_1000106C@l
/* 0000C5FC 3C608889 */ lis r3, 0x8889
/* 0000C600 4CC63182 */ crclr 6
/* 0000C604 9421FFF8 */ stwu r1, -8(r1)
/* 0000C608 80C50000 */ lwz r6, 0(r5)
/* 0000C60C 38A38889 */ addi r5, r3, -30583
/* 0000C610 7C053096 */ mulhw r0, r5, r6
/* 0000C614 7C003214 */ add r0, r0, r6
/* 0000C618 7C002E70 */ srawi r0, r0, 5
/* 0000C61C 54030FFE */ srwi r3, r0, 0x1f
/* 0000C620 7C001A14 */ add r0, r0, r3
/* 0000C624 1C00003C */ mulli r0, r0, 0x3c
/* 0000C628 7C003050 */ subf r0, r0, r6
/* 0000C62C 1C000064 */ mulli r0, r0, 0x64
/* 0000C630 7C650096 */ mulhw r3, r5, r0
/* 0000C634 7C030214 */ add r0, r3, r0
/* 0000C638 7C002E70 */ srawi r0, r0, 5
/* 0000C63C 3C600000 */ lis r3, lbl_00015C60@ha
/* 0000C640 54050FFE */ srwi r5, r0, 0x1f
/* 0000C644 38C30000 */ addi r6, r3, lbl_00015C60@l
/* 0000C648 3864008C */ addi r3, r4, 0x8c
/* 0000C64C 38860000 */ addi r4, r6, 0
/* 0000C650 7CA02A14 */ add r5, r0, r5
/* 0000C654 4BFF3B29 */ bl sprintf
/* 0000C658 8001000C */ lwz r0, 0xc(r1)
/* 0000C65C 38210008 */ addi r1, r1, 8
/* 0000C660 7C0803A6 */ mtlr r0
/* 0000C664 4E800020 */ blr 
