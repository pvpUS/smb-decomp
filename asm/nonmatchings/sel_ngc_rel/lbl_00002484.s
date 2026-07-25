/* 00002484 7C0802A6 */ mflr r0
/* 00002488 3CC00000 */ lis r6, lbl_801EEDA8@ha
/* 0000248C 90010004 */ stw r0, 4(r1)
/* 00002490 39060000 */ addi r8, r6, lbl_801EEDA8@l
/* 00002494 39200001 */ li r9, 1
/* 00002498 9421FFE0 */ stwu r1, -0x20(r1)
/* 0000249C 3CC00000 */ lis r6, lbl_802F1DFC@ha
/* 000024A0 93E1001C */ stw r31, 0x1c(r1)
/* 000024A4 3BE40000 */ addi r31, r4, 0
/* 000024A8 57EA103A */ slwi r10, r31, 2
/* 000024AC 93C10018 */ stw r30, 0x18(r1)
/* 000024B0 3C800000 */ lis r4, playerControllerIDs@ha
/* 000024B4 7D085214 */ add r8, r8, r10
/* 000024B8 38E40000 */ addi r7, r4, playerControllerIDs@l
/* 000024BC 91280048 */ stw r9, 0x48(r8)
/* 000024C0 3C800000 */ lis r4, playerCharacterSelection@ha
/* 000024C4 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000024C8 7CE75214 */ add r7, r7, r10
/* 000024CC 90670000 */ stw r3, 0(r7)
/* 000024D0 7FC05214 */ add r30, r0, r10
/* 000024D4 3C800000 */ lis r4, u_somePlayerId@ha
/* 000024D8 801E0000 */ lwz r0, 0(r30)
/* 000024DC 90060000 */ stw r0, lbl_802F1DFC@l(r6)
/* 000024E0 2C000002 */ cmpwi r0, 2
/* 000024E4 90A40000 */ stw r5, u_somePlayerId@l(r4)
/* 000024E8 41820044 */ beq lbl_0000252C
/* 000024EC 40800014 */ bge lbl_00002500
/* 000024F0 2C000000 */ cmpwi r0, 0
/* 000024F4 41820018 */ beq lbl_0000250C
/* 000024F8 40800024 */ bge lbl_0000251C
/* 000024FC 4800004C */ b lbl_00002548
lbl_00002500:
/* 00002500 2C000004 */ cmpwi r0, 4
/* 00002504 40800044 */ bge lbl_00002548
/* 00002508 48000034 */ b lbl_0000253C
lbl_0000250C:
/* 0000250C 3C600100 */ lis r3, 0x100
/* 00002510 3863004F */ addi r3, r3, 0x4f
/* 00002514 4BFFDC75 */ bl u_play_sound_0
/* 00002518 48000030 */ b lbl_00002548
lbl_0000251C:
/* 0000251C 3C6001D8 */ lis r3, 0x1d8
/* 00002520 3863004F */ addi r3, r3, 0x4f
/* 00002524 4BFFDC65 */ bl u_play_sound_0
/* 00002528 48000020 */ b lbl_00002548
lbl_0000252C:
/* 0000252C 3C600028 */ lis r3, 0x28
/* 00002530 3863004F */ addi r3, r3, 0x4f
/* 00002534 4BFFDC55 */ bl u_play_sound_0
/* 00002538 48000010 */ b lbl_00002548
lbl_0000253C:
/* 0000253C 3C6000FC */ lis r3, 0xfc
/* 00002540 3863004F */ addi r3, r3, 0x4f
/* 00002544 4BFFDC45 */ bl u_play_sound_0
lbl_00002548:
/* 00002548 38600065 */ li r3, 0x65
/* 0000254C 4BFFDC3D */ bl u_play_sound_0
/* 00002550 80DE0000 */ lwz r6, 0(r30)
/* 00002554 3C800000 */ lis r4, lbl_801EEDA8@ha
/* 00002558 3C600000 */ lis r3, lbl_802F1C10@ha
/* 0000255C 38A40000 */ addi r5, r4, lbl_801EEDA8@l
/* 00002560 54C4103A */ slwi r4, r6, 2
/* 00002564 38030000 */ addi r0, r3, lbl_802F1C10@l
/* 00002568 7C652214 */ add r3, r5, r4
/* 0000256C 3880001E */ li r4, 0x1e
/* 00002570 90830058 */ stw r4, 0x58(r3)
/* 00002574 7CC40774 */ extsb r4, r6
/* 00002578 7C60FA14 */ add r3, r0, r31
/* 0000257C 98830004 */ stb r4, 4(r3)
/* 00002580 38600001 */ li r3, 1
/* 00002584 80010024 */ lwz r0, 0x24(r1)
/* 00002588 83E1001C */ lwz r31, 0x1c(r1)
/* 0000258C 83C10018 */ lwz r30, 0x18(r1)
/* 00002590 38210020 */ addi r1, r1, 0x20
/* 00002594 7C0803A6 */ mtlr r0
/* 00002598 4E800020 */ blr 
