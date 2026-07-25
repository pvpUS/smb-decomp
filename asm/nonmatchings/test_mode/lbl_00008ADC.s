/* 00008ADC 7C0802A6 */ mflr r0
/* 00008AE0 90010004 */ stw r0, 4(r1)
/* 00008AE4 9421FFF8 */ stwu r1, -8(r1)
/* 00008AE8 8064002C */ lwz r3, 0x2c(r4)
/* 00008AEC 4BFF7671 */ bl preview_main
/* 00008AF0 8001000C */ lwz r0, 0xc(r1)
/* 00008AF4 38210008 */ addi r1, r1, 8
/* 00008AF8 7C0803A6 */ mtlr r0
/* 00008AFC 4E800020 */ blr 
