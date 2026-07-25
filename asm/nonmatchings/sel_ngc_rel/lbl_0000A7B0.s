/* 0000A7B0 7C0802A6 */ mflr r0
/* 0000A7B4 90010004 */ stw r0, 4(r1)
/* 0000A7B8 9421FFF8 */ stwu r1, -8(r1)
/* 0000A7BC 8064002C */ lwz r3, 0x2c(r4)
/* 0000A7C0 4BFF59C9 */ bl preview_main
/* 0000A7C4 8001000C */ lwz r0, 0xc(r1)
/* 0000A7C8 38210008 */ addi r1, r1, 8
/* 0000A7CC 7C0803A6 */ mtlr r0
/* 0000A7D0 4E800020 */ blr 
