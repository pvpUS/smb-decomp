/* 0000A658 7C0802A6 */ mflr r0
/* 0000A65C 90010004 */ stw r0, 4(r1)
/* 0000A660 9421FFF8 */ stwu r1, -8(r1)
/* 0000A664 8063002C */ lwz r3, 0x2c(r3)
/* 0000A668 4BFF5B21 */ bl preview_free
/* 0000A66C 8001000C */ lwz r0, 0xc(r1)
/* 0000A670 38210008 */ addi r1, r1, 8
/* 0000A674 7C0803A6 */ mtlr r0
/* 0000A678 4E800020 */ blr 
