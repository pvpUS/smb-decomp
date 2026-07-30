/* 00002408 7C0802A6 */ mflr r0
/* 0000240C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002410 90010004 */ stw r0, 4(r1)
/* 00002414 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002418 3CA00000 */ lis r5, currentBall@ha
/* 0000241C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002420 80640000 */ lwz r3, 0(r4)
/* 00002424 80C50000 */ lwz r6, currentBall@l(r5)
/* 00002428 3CA00000 */ lis r5, lbl_0000BFE0@ha
/* 0000242C 38030001 */ addi r0, r3, 1
/* 00002430 90040000 */ stw r0, 0(r4)
/* 00002434 3C600000 */ lis r3, lbl_0000BEE0@ha
/* 00002438 3C004330 */ lis r0, 0x4330
/* 0000243C 80840000 */ lwz r4, 0(r4)
/* 00002440 C8230000 */ lfd f1, lbl_0000BEE0@l(r3)
/* 00002444 6C838000 */ xoris r3, r4, 0x8000
/* 00002448 C8450000 */ lfd f2, lbl_0000BFE0@l(r5)
/* 0000244C 9061000C */ stw r3, 0xc(r1)
/* 00002450 90010008 */ stw r0, 8(r1)
/* 00002454 C8010008 */ lfd f0, 8(r1)
/* 00002458 FC000828 */ fsub f0, f0, f1
/* 0000245C FC020000 */ fcmpu cr0, f2, f0
/* 00002460 40820044 */ bne lbl_000024A4
/* 00002464 8806002E */ lbz r0, 0x2e(r6)
/* 00002468 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000246C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002470 7C000774 */ extsb r0, r0
/* 00002474 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 00002478 90050000 */ stw r0, 0(r5)
/* 0000247C 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002480 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002484 80A50000 */ lwz r5, 0(r5)
/* 00002488 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 0000248C 3860001E */ li r3, 0x1e
/* 00002490 54A5103A */ slwi r5, r5, 2
/* 00002494 7CA02A14 */ add r5, r0, r5
/* 00002498 80050000 */ lwz r0, 0(r5)
/* 0000249C 90040000 */ stw r0, 0(r4)
/* 000024A0 4BFFDCAD */ bl u_play_sound_0
lbl_000024A4:
/* 000024A4 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000024A8 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000024AC 2C000078 */ cmpwi r0, 0x78
/* 000024B0 40810010 */ ble lbl_000024C0
/* 000024B4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000024B8 3800000B */ li r0, 0xb
/* 000024BC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000024C0:
/* 000024C0 80010014 */ lwz r0, 0x14(r1)
/* 000024C4 38210010 */ addi r1, r1, 0x10
/* 000024C8 7C0803A6 */ mtlr r0
/* 000024CC 4E800020 */ blr 
