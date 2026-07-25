/* 00006AA8 7C0802A6 */ mflr r0
/* 00006AAC 3C600000 */ lis r3, lbl_10006EC8@ha
/* 00006AB0 90010004 */ stw r0, 4(r1)
/* 00006AB4 38630000 */ addi r3, r3, lbl_10006EC8@l
/* 00006AB8 9421FFF8 */ stwu r1, -8(r1)
/* 00006ABC 4BFF96F1 */ bl preview_free
/* 00006AC0 8001000C */ lwz r0, 0xc(r1)
/* 00006AC4 38210008 */ addi r1, r1, 8
/* 00006AC8 7C0803A6 */ mtlr r0
/* 00006ACC 4E800020 */ blr 
