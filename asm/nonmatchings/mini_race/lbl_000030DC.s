/* 000030DC 7C0802A6 */ mflr r0
/* 000030E0 3C600000 */ lis r3, stageHeap@ha
/* 000030E4 90010004 */ stw r0, 4(r1)
/* 000030E8 38630000 */ addi r3, r3, stageHeap@l
/* 000030EC 9421FFF0 */ stwu r1, -0x10(r1)
/* 000030F0 93E1000C */ stw r31, 0xc(r1)
/* 000030F4 80630000 */ lwz r3, 0(r3)
/* 000030F8 4BFFD085 */ bl OSSetCurrentHeap
/* 000030FC 7C7F1B78 */ mr r31, r3
/* 00003100 4BFFD07D */ bl u_free_minigame_graphics
/* 00003104 7FE3FB78 */ mr r3, r31
/* 00003108 4BFFD075 */ bl OSSetCurrentHeap
/* 0000310C 80010014 */ lwz r0, 0x14(r1)
/* 00003110 83E1000C */ lwz r31, 0xc(r1)
/* 00003114 38210010 */ addi r1, r1, 0x10
/* 00003118 7C0803A6 */ mtlr r0
/* 0000311C 4E800020 */ blr 
