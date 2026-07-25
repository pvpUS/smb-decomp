/* 0000A364 7C0802A6 */ mflr r0
/* 0000A368 3CA00000 */ lis r5, debugFlags@ha
/* 0000A36C 90010004 */ stw r0, 4(r1)
/* 0000A370 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000A374 93E1002C */ stw r31, 0x2c(r1)
/* 0000A378 3BE30000 */ addi r31, r3, 0
/* 0000A37C 80050000 */ lwz r0, debugFlags@l(r5)
/* 0000A380 7000000A */ andi. r0, r0, 0xa
/* 0000A384 40820144 */ bne lbl_0000A4C8
/* 0000A388 80A40004 */ lwz r5, 4(r4)
/* 0000A38C 3C600000 */ lis r3, lbl_10001B1C@ha
/* 0000A390 80040008 */ lwz r0, 8(r4)
/* 0000A394 38C30000 */ addi r6, r3, lbl_10001B1C@l
/* 0000A398 90BF000C */ stw r5, 0xc(r31)
/* 0000A39C 901F0010 */ stw r0, 0x10(r31)
/* 0000A3A0 8004000C */ lwz r0, 0xc(r4)
/* 0000A3A4 901F0014 */ stw r0, 0x14(r31)
/* 0000A3A8 8804002E */ lbz r0, 0x2e(r4)
/* 0000A3AC 7C000774 */ extsb r0, r0
/* 0000A3B0 5400083C */ slwi r0, r0, 1
/* 0000A3B4 7CA60214 */ add r5, r6, r0
/* 0000A3B8 A0650000 */ lhz r3, 0(r5)
/* 0000A3BC 38030050 */ addi r0, r3, 0x50
/* 0000A3C0 B0050000 */ sth r0, 0(r5)
/* 0000A3C4 8804002E */ lbz r0, 0x2e(r4)
/* 0000A3C8 7C000774 */ extsb r0, r0
/* 0000A3CC 5400083C */ slwi r0, r0, 1
/* 0000A3D0 7C660214 */ add r3, r6, r0
/* 0000A3D4 A8630000 */ lha r3, 0(r3)
/* 0000A3D8 4BFF5DA5 */ bl mathutil_mtxA_from_rotate_y
/* 0000A3DC 3860F000 */ li r3, -4096
/* 0000A3E0 4BFF5D9D */ bl mathutil_mtxA_rotate_x
/* 0000A3E4 3C600000 */ lis r3, lbl_00013BAC@ha
/* 0000A3E8 38C30000 */ addi r6, r3, lbl_00013BAC@l
/* 0000A3EC 80A60000 */ lwz r5, 0(r6)
/* 0000A3F0 7FE3FB78 */ mr r3, r31
/* 0000A3F4 80060004 */ lwz r0, 4(r6)
/* 0000A3F8 7FE4FB78 */ mr r4, r31
/* 0000A3FC 90A10010 */ stw r5, 0x10(r1)
/* 0000A400 90010014 */ stw r0, 0x14(r1)
/* 0000A404 80060008 */ lwz r0, 8(r6)
/* 0000A408 90010018 */ stw r0, 0x18(r1)
/* 0000A40C 80A10010 */ lwz r5, 0x10(r1)
/* 0000A410 80010014 */ lwz r0, 0x14(r1)
/* 0000A414 90BF0000 */ stw r5, 0(r31)
/* 0000A418 901F0004 */ stw r0, 4(r31)
/* 0000A41C 80010018 */ lwz r0, 0x18(r1)
/* 0000A420 901F0008 */ stw r0, 8(r31)
/* 0000A424 4BFF5D59 */ bl mathutil_mtxA_tf_vec
/* 0000A428 C03F0000 */ lfs f1, 0(r31)
/* 0000A42C C01F000C */ lfs f0, 0xc(r31)
/* 0000A430 EC01002A */ fadds f0, f1, f0
/* 0000A434 D01F0000 */ stfs f0, 0(r31)
/* 0000A438 C03F0004 */ lfs f1, 4(r31)
/* 0000A43C C01F0010 */ lfs f0, 0x10(r31)
/* 0000A440 EC01002A */ fadds f0, f1, f0
/* 0000A444 D01F0004 */ stfs f0, 4(r31)
/* 0000A448 C03F0008 */ lfs f1, 8(r31)
/* 0000A44C C01F0014 */ lfs f0, 0x14(r31)
/* 0000A450 EC01002A */ fadds f0, f1, f0
/* 0000A454 D01F0008 */ stfs f0, 8(r31)
/* 0000A458 C03F000C */ lfs f1, 0xc(r31)
/* 0000A45C C01F0000 */ lfs f0, 0(r31)
/* 0000A460 EC010028 */ fsubs f0, f1, f0
/* 0000A464 D001001C */ stfs f0, 0x1c(r1)
/* 0000A468 C03F0010 */ lfs f1, 0x10(r31)
/* 0000A46C C01F0004 */ lfs f0, 4(r31)
/* 0000A470 EC010028 */ fsubs f0, f1, f0
/* 0000A474 D0010020 */ stfs f0, 0x20(r1)
/* 0000A478 C03F0014 */ lfs f1, 0x14(r31)
/* 0000A47C C01F0008 */ lfs f0, 8(r31)
/* 0000A480 EC010028 */ fsubs f0, f1, f0
/* 0000A484 D0010024 */ stfs f0, 0x24(r1)
/* 0000A488 C021001C */ lfs f1, 0x1c(r1)
/* 0000A48C C0410024 */ lfs f2, 0x24(r1)
/* 0000A490 4BFF5CED */ bl mathutil_atan2
/* 0000A494 38038000 */ addi r0, r3, -32768
/* 0000A498 B01F001A */ sth r0, 0x1a(r31)
/* 0000A49C C0010024 */ lfs f0, 0x24(r1)
/* 0000A4A0 C021001C */ lfs f1, 0x1c(r1)
/* 0000A4A4 EC210072 */ fmuls f1, f1, f1
/* 0000A4A8 EC20083A */ fmadds f1, f0, f0, f1
/* 0000A4AC 4BFF5CD1 */ bl mathutil_sqrt
/* 0000A4B0 FC400890 */ fmr f2, f1
/* 0000A4B4 C0210020 */ lfs f1, 0x20(r1)
/* 0000A4B8 4BFF5CC5 */ bl mathutil_atan2
/* 0000A4BC B07F0018 */ sth r3, 0x18(r31)
/* 0000A4C0 38000000 */ li r0, 0
/* 0000A4C4 B01F001C */ sth r0, 0x1c(r31)
lbl_0000A4C8:
/* 0000A4C8 80010034 */ lwz r0, 0x34(r1)
/* 0000A4CC 83E1002C */ lwz r31, 0x2c(r1)
/* 0000A4D0 38210030 */ addi r1, r1, 0x30
/* 0000A4D4 7C0803A6 */ mtlr r0
/* 0000A4D8 4E800020 */ blr 
