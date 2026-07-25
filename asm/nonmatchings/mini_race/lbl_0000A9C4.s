/* 0000A9C4 7C0802A6 */ mflr r0
/* 0000A9C8 90010004 */ stw r0, 4(r1)
/* 0000A9CC 9421FFF8 */ stwu r1, -8(r1)
/* 0000A9D0 EC210072 */ fmuls f1, f1, f1
/* 0000A9D4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000A9D8 4BFF57A5 */ bl mathutil_sqrt
/* 0000A9DC 8001000C */ lwz r0, 0xc(r1)
/* 0000A9E0 38210008 */ addi r1, r1, 8
/* 0000A9E4 7C0803A6 */ mtlr r0
/* 0000A9E8 4E800020 */ blr 
