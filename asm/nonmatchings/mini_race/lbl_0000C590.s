/* 0000C590 7C0802A6 */ mflr r0
/* 0000C594 3C600000 */ lis r3, lbl_1000106C@ha
/* 0000C598 90010004 */ stw r0, 4(r1)
/* 0000C59C 38A30000 */ addi r5, r3, lbl_1000106C@l
/* 0000C5A0 3C608889 */ lis r3, 0x8889
/* 0000C5A4 4CC63182 */ crclr 6
/* 0000C5A8 9421FFF8 */ stwu r1, -8(r1)
/* 0000C5AC 38638889 */ addi r3, r3, -30583
/* 0000C5B0 80050000 */ lwz r0, 0(r5)
/* 0000C5B4 7C630096 */ mulhw r3, r3, r0
/* 0000C5B8 7C030214 */ add r0, r3, r0
/* 0000C5BC 7C002E70 */ srawi r0, r0, 5
/* 0000C5C0 3C600000 */ lis r3, lbl_00015C58@ha
/* 0000C5C4 54050FFE */ srwi r5, r0, 0x1f
/* 0000C5C8 38C30000 */ addi r6, r3, lbl_00015C58@l
/* 0000C5CC 3864008C */ addi r3, r4, 0x8c
/* 0000C5D0 38860000 */ addi r4, r6, 0
/* 0000C5D4 7CA02A14 */ add r5, r0, r5
/* 0000C5D8 4BFF3BA5 */ bl sprintf
/* 0000C5DC 8001000C */ lwz r0, 0xc(r1)
/* 0000C5E0 38210008 */ addi r1, r1, 8
/* 0000C5E4 7C0803A6 */ mtlr r0
/* 0000C5E8 4E800020 */ blr 
