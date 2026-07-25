/* 0000A634 7C0802A6 */ mflr r0
/* 0000A638 90010004 */ stw r0, 4(r1)
/* 0000A63C 9421FFF8 */ stwu r1, -8(r1)
/* 0000A640 8063002C */ lwz r3, 0x2c(r3)
/* 0000A644 4BFF5B45 */ bl preview_free
/* 0000A648 8001000C */ lwz r0, 0xc(r1)
/* 0000A64C 38210008 */ addi r1, r1, 8
/* 0000A650 7C0803A6 */ mtlr r0
/* 0000A654 4E800020 */ blr 
