/* 00009538 7C0802A6 */ mflr r0
/* 0000953C 3C600000 */ lis r3, modeCtrl@ha
/* 00009540 90010004 */ stw r0, 4(r1)
/* 00009544 38630000 */ addi r3, r3, modeCtrl@l
/* 00009548 3C800000 */ lis r4, cameraInfo@ha
/* 0000954C 9421FFF8 */ stwu r1, -8(r1)
/* 00009550 80C3002C */ lwz r6, 0x2c(r3)
/* 00009554 3C600000 */ lis r3, ballInfo@ha
/* 00009558 38630000 */ addi r3, r3, ballInfo@l
/* 0000955C 1C0601A4 */ mulli r0, r6, 0x1a4
/* 00009560 7CA30214 */ add r5, r3, r0
/* 00009564 3C600000 */ lis r3, lbl_00026118@ha
/* 00009568 C0450008 */ lfs f2, 8(r5)
/* 0000956C C8630000 */ lfd f3, lbl_00026118@l(r3)
/* 00009570 1C060284 */ mulli r0, r6, 0x284
/* 00009574 C0250004 */ lfs f1, 4(r5)
/* 00009578 C0A5000C */ lfs f5, 0xc(r5)
/* 0000957C 38640000 */ addi r3, r4, cameraInfo@l
/* 00009580 7C630214 */ add r3, r3, r0
/* 00009584 C0030010 */ lfs f0, 0x10(r3)
/* 00009588 C0830014 */ lfs f4, 0x14(r3)
/* 0000958C EC420028 */ fsubs f2, f2, f0
/* 00009590 C003000C */ lfs f0, 0xc(r3)
/* 00009594 EC852028 */ fsubs f4, f5, f4
/* 00009598 EC210028 */ fsubs f1, f1, f0
/* 0000959C FC03102A */ fadd f0, f3, f2
/* 000095A0 FC000018 */ frsp f0, f0
/* 000095A4 EC210072 */ fmuls f1, f1, f1
/* 000095A8 EC20083A */ fmadds f1, f0, f0, f1
/* 000095AC EC24093A */ fmadds f1, f4, f4, f1
/* 000095B0 4BFF6C21 */ bl mathutil_sqrt
/* 000095B4 8001000C */ lwz r0, 0xc(r1)
/* 000095B8 38210008 */ addi r1, r1, 8
/* 000095BC 7C0803A6 */ mtlr r0
/* 000095C0 4E800020 */ blr 
