/* 000099B4 7C0802A6 */ mflr r0
/* 000099B8 90010004 */ stw r0, 4(r1)
/* 000099BC 9421FFF8 */ stwu r1, -8(r1)
/* 000099C0 4BFF6811 */ bl mathutil_mtxA_from_mtx
/* 000099C4 3C600000 */ lis r3, lbl_10000100@ha
/* 000099C8 38630000 */ addi r3, r3, lbl_10000100@l
/* 000099CC 4BFF6805 */ bl mathutil_mtxA_to_mtx
/* 000099D0 8001000C */ lwz r0, 0xc(r1)
/* 000099D4 38210008 */ addi r1, r1, 8
/* 000099D8 7C0803A6 */ mtlr r0
/* 000099DC 4E800020 */ blr 
