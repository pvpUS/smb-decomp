/* 0000FEC8 3C800000 */ lis r4, currentBall@ha
/* 0000FECC 3C600000 */ lis r3, g_poolInfo@ha
/* 0000FED0 38A40000 */ addi r5, r4, currentBall@l
/* 0000FED4 38830000 */ addi r4, r3, g_poolInfo@l
/* 0000FED8 80E50000 */ lwz r7, 0(r5)
/* 0000FEDC 3C600000 */ lis r3, ballInfo@ha
/* 0000FEE0 8104000C */ lwz r8, 0xc(r4)
/* 0000FEE4 38030000 */ addi r0, r3, ballInfo@l
/* 0000FEE8 7C060378 */ mr r6, r0
/* 0000FEEC 39200000 */ li r9, 0
/* 0000FEF0 3860001D */ li r3, 0x1d
/* 0000FEF4 48000024 */ b lbl_0000FF18
lbl_0000FEF8:
/* 0000FEF8 88080000 */ lbz r0, 0(r8)
/* 0000FEFC 2C000002 */ cmpwi r0, 2
/* 0000FF00 4082000C */ bne lbl_0000FF0C
/* 0000FF04 90C50000 */ stw r6, 0(r5)
/* 0000FF08 98660148 */ stb r3, 0x148(r6)
lbl_0000FF0C:
/* 0000FF0C 39290001 */ addi r9, r9, 1
/* 0000FF10 38C601A4 */ addi r6, r6, 0x1a4
/* 0000FF14 39080001 */ addi r8, r8, 1
lbl_0000FF18:
/* 0000FF18 80040008 */ lwz r0, 8(r4)
/* 0000FF1C 7C090000 */ cmpw r9, r0
/* 0000FF20 4180FFD8 */ blt lbl_0000FEF8
/* 0000FF24 3C600000 */ lis r3, currentBall@ha
/* 0000FF28 90E30000 */ stw r7, currentBall@l(r3)
/* 0000FF2C 4E800020 */ blr 
