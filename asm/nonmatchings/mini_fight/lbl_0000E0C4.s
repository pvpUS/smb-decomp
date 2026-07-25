/* 0000E0C4 7C0802A6 */ mflr r0
/* 0000E0C8 38800000 */ li r4, 0
/* 0000E0CC 90010004 */ stw r0, 4(r1)
/* 0000E0D0 38A000CC */ li r5, 0xcc
/* 0000E0D4 9421FF08 */ stwu r1, -0xf8(r1)
/* 0000E0D8 BF2100DC */ stmw r25, 0xdc(r1)
/* 0000E0DC 38610008 */ addi r3, r1, 8
/* 0000E0E0 4BFF2085 */ bl memset
/* 0000E0E4 3C600000 */ lis r3, lbl_10017664@ha
/* 0000E0E8 3BE30000 */ addi r31, r3, lbl_10017664@l
/* 0000E0EC 387F0068 */ addi r3, r31, 0x68
/* 0000E0F0 38800000 */ li r4, 0
/* 0000E0F4 38A006D0 */ li r5, 0x6d0
/* 0000E0F8 4BFF206D */ bl memset
/* 0000E0FC 38000007 */ li r0, 7
/* 0000E100 B001000C */ sth r0, 0xc(r1)
/* 0000E104 38000000 */ li r0, 0
/* 0000E108 3C800000 */ lis r4, currentBall@ha
/* 0000E10C 3C600000 */ lis r3, g_poolInfo@ha
/* 0000E110 980100A8 */ stb r0, 0xa8(r1)
/* 0000E114 3B640000 */ addi r27, r4, currentBall@l
/* 0000E118 3B830000 */ addi r28, r3, g_poolInfo@l
/* 0000E11C 83DB0000 */ lwz r30, 0(r27)
/* 0000E120 3C600000 */ lis r3, ballInfo@ha
/* 0000E124 83BC000C */ lwz r29, 0xc(r28)
/* 0000E128 38030000 */ addi r0, r3, ballInfo@l
/* 0000E12C 7C1A0378 */ mr r26, r0
/* 0000E130 3B200000 */ li r25, 0
/* 0000E134 48000058 */ b lbl_0000E18C
lbl_0000E138:
/* 0000E138 881D0000 */ lbz r0, 0(r29)
/* 0000E13C 2C000002 */ cmpwi r0, 2
/* 0000E140 40820040 */ bne lbl_0000E180
/* 0000E144 935B0000 */ stw r26, 0(r27)
/* 0000E148 3800FFFF */ li r0, -1
/* 0000E14C 38610008 */ addi r3, r1, 8
/* 0000E150 88BA002E */ lbz r5, 0x2e(r26)
/* 0000E154 7CA50774 */ extsb r5, r5
/* 0000E158 1C8501B4 */ mulli r4, r5, 0x1b4
/* 0000E15C 7C9F2214 */ add r4, r31, r4
/* 0000E160 94A40068 */ stwu r5, 0x68(r4)
/* 0000E164 90040028 */ stw r0, 0x28(r4)
/* 0000E168 9004002C */ stw r0, 0x2c(r4)
/* 0000E16C 881A002E */ lbz r0, 0x2e(r26)
/* 0000E170 7C000774 */ extsb r0, r0
/* 0000E174 B001000E */ sth r0, 0xe(r1)
/* 0000E178 908100AC */ stw r4, 0xac(r1)
/* 0000E17C 4BFF1FE9 */ bl spawn_stobj
lbl_0000E180:
/* 0000E180 3B390001 */ addi r25, r25, 1
/* 0000E184 3B5A01A4 */ addi r26, r26, 0x1a4
/* 0000E188 3BBD0001 */ addi r29, r29, 1
lbl_0000E18C:
/* 0000E18C 801C0008 */ lwz r0, 8(r28)
/* 0000E190 7C190000 */ cmpw r25, r0
/* 0000E194 4180FFA4 */ blt lbl_0000E138
/* 0000E198 3C600000 */ lis r3, currentBall@ha
/* 0000E19C 93C30000 */ stw r30, currentBall@l(r3)
/* 0000E1A0 BB2100DC */ lmw r25, 0xdc(r1)
/* 0000E1A4 800100FC */ lwz r0, 0xfc(r1)
/* 0000E1A8 382100F8 */ addi r1, r1, 0xf8
/* 0000E1AC 7C0803A6 */ mtlr r0
/* 0000E1B0 4E800020 */ blr 
