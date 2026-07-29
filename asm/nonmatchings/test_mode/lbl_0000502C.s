/* 0000502C 7C0802A6 */ mflr r0
/* 00005030 3C600000 */ lis r3, stageHeap@ha
/* 00005034 90010004 */ stw r0, 4(r1)
/* 00005038 38630000 */ addi r3, r3, stageHeap@l
/* 0000503C 3C800000 */ lis r4, lbl_10000000@ha
/* 00005040 9421FFF0 */ stwu r1, -0x10(r1)
/* 00005044 93E1000C */ stw r31, 0xc(r1)
/* 00005048 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 0000504C 93C10008 */ stw r30, 8(r1)
/* 00005050 80630000 */ lwz r3, 0(r3)
/* 00005054 4BFFB109 */ bl OSSetCurrentHeap
/* 00005058 7C601B78 */ mr r0, r3
/* 0000505C 807F0160 */ lwz r3, 0x160(r31)
/* 00005060 7C1E0378 */ mr r30, r0
/* 00005064 4BFFB0F9 */ bl free_model
/* 00005068 807F015C */ lwz r3, 0x15c(r31)
/* 0000506C 4BFFB0F1 */ bl free_tpl
/* 00005070 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005074 809F016C */ lwz r4, 0x16c(r31)
/* 00005078 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000507C 80630000 */ lwz r3, 0(r3)
/* 00005080 4BFFB0DD */ bl OSFreeToHeap
/* 00005084 7FC3F378 */ mr r3, r30
/* 00005088 4BFFB0D5 */ bl OSSetCurrentHeap
/* 0000508C 80010014 */ lwz r0, 0x14(r1)
/* 00005090 83E1000C */ lwz r31, 0xc(r1)
/* 00005094 83C10008 */ lwz r30, 8(r1)
/* 00005098 7C0803A6 */ mtlr r0
/* 0000509C 38210010 */ addi r1, r1, 0x10
/* 000050A0 4E800020 */ blr 
