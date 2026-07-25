/* 00003094 7C0802A6 */ mflr r0
/* 00003098 3C600000 */ lis r3, stageHeap@ha
/* 0000309C 90010004 */ stw r0, 4(r1)
/* 000030A0 38630000 */ addi r3, r3, stageHeap@l
/* 000030A4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000030A8 93E1000C */ stw r31, 0xc(r1)
/* 000030AC 80630000 */ lwz r3, 0(r3)
/* 000030B0 4BFFD0CD */ bl OSSetCurrentHeap
/* 000030B4 3BE30000 */ addi r31, r3, 0
/* 000030B8 38600001 */ li r3, 1
/* 000030BC 4BFFD0C1 */ bl u_load_minigame_graphics
/* 000030C0 7FE3FB78 */ mr r3, r31
/* 000030C4 4BFFD0B9 */ bl OSSetCurrentHeap
/* 000030C8 80010014 */ lwz r0, 0x14(r1)
/* 000030CC 83E1000C */ lwz r31, 0xc(r1)
/* 000030D0 38210010 */ addi r1, r1, 0x10
/* 000030D4 7C0803A6 */ mtlr r0
/* 000030D8 4E800020 */ blr 
