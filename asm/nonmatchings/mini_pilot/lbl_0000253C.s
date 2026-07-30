/* 0000253C 7C0802A6 */ mflr r0
/* 00002540 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002544 90010004 */ stw r0, 4(r1)
/* 00002548 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000254C 3CA00000 */ lis r5, currentBall@ha
/* 00002550 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002554 93E1000C */ stw r31, 0xc(r1)
/* 00002558 80640000 */ lwz r3, 0(r4)
/* 0000255C 83E50000 */ lwz r31, currentBall@l(r5)
/* 00002560 38030001 */ addi r0, r3, 1
/* 00002564 90040000 */ stw r0, 0(r4)
/* 00002568 3C600000 */ lis r3, playerControllerIDs@ha
/* 0000256C 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00002570 887F002E */ lbz r3, 0x2e(r31)
/* 00002574 3C800000 */ lis r4, controllerInfo@ha
/* 00002578 38840000 */ addi r4, r4, controllerInfo@l
/* 0000257C 7C630774 */ extsb r3, r3
/* 00002580 5463103A */ slwi r3, r3, 2
/* 00002584 7C601A14 */ add r3, r0, r3
/* 00002588 80030000 */ lwz r0, 0(r3)
/* 0000258C 1C00003C */ mulli r0, r0, 0x3c
/* 00002590 7C640214 */ add r3, r4, r0
/* 00002594 A0030018 */ lhz r0, 0x18(r3)
/* 00002598 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000259C 41820060 */ beq lbl_000025FC
/* 000025A0 801F0094 */ lwz r0, 0x94(r31)
/* 000025A4 540007FF */ clrlwi. r0, r0, 0x1f
/* 000025A8 41820034 */ beq lbl_000025DC
/* 000025AC 387F001C */ addi r3, r31, 0x1c
/* 000025B0 C0230000 */ lfs f1, 0(r3)
/* 000025B4 C0430004 */ lfs f2, 4(r3)
/* 000025B8 C0030008 */ lfs f0, 8(r3)
/* 000025BC EC210072 */ fmuls f1, f1, f1
/* 000025C0 EC2208BA */ fmadds f1, f2, f2, f1
/* 000025C4 EC20083A */ fmadds f1, f0, f0, f1
/* 000025C8 4BFFDB85 */ bl mathutil_sqrt
/* 000025CC 3C600000 */ lis r3, lbl_0000BFE8@ha
/* 000025D0 C8030000 */ lfd f0, lbl_0000BFE8@l(r3)
/* 000025D4 FC010040 */ fcmpo cr0, f1, f0
/* 000025D8 41800024 */ blt lbl_000025FC
lbl_000025DC:
/* 000025DC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000025E0 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000025E4 2C00003C */ cmpwi r0, 0x3c
/* 000025E8 40810014 */ ble lbl_000025FC
/* 000025EC 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000025F0 3800000D */ li r0, 0xd
/* 000025F4 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000025F8 480000B0 */ b lbl_000026A8
lbl_000025FC:
/* 000025FC 3C600000 */ lis r3, lbl_10000018@ha
/* 00002600 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00002604 2C000000 */ cmpwi r0, 0
/* 00002608 4082009C */ bne lbl_000026A4
/* 0000260C 807F00FC */ lwz r3, 0xfc(r31)
/* 00002610 80030014 */ lwz r0, 0x14(r3)
/* 00002614 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002618 4182008C */ beq lbl_000026A4
/* 0000261C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002620 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002624 3C608889 */ lis r3, 0x8889
/* 00002628 80840000 */ lwz r4, 0(r4)
/* 0000262C 38038889 */ addi r0, r3, -30583
/* 00002630 7C002096 */ mulhw r0, r0, r4
/* 00002634 7C002214 */ add r0, r0, r4
/* 00002638 7C002670 */ srawi r0, r0, 4
/* 0000263C 54030FFE */ srwi r3, r0, 0x1f
/* 00002640 7C001A14 */ add r0, r0, r3
/* 00002644 1C00001E */ mulli r0, r0, 0x1e
/* 00002648 7C002050 */ subf r0, r0, r4
/* 0000264C 2C000001 */ cmpwi r0, 1
/* 00002650 40820054 */ bne lbl_000026A4
/* 00002654 881F002E */ lbz r0, 0x2e(r31)
/* 00002658 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000265C 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 00002660 7C000774 */ extsb r0, r0
/* 00002664 90050000 */ stw r0, 0(r5)
/* 00002668 3C800000 */ lis r4, playerCharacterSelection@ha
/* 0000266C 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002670 80850000 */ lwz r4, 0(r5)
/* 00002674 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002678 5484103A */ slwi r4, r4, 2
/* 0000267C 7C802214 */ add r4, r0, r4
/* 00002680 80040000 */ lwz r0, 0(r4)
/* 00002684 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002688 4BFFDAC5 */ bl rand
/* 0000268C 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00002690 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00002694 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00002698 7C601A14 */ add r3, r0, r3
/* 0000269C A8630000 */ lha r3, 0(r3)
/* 000026A0 4BFFDAAD */ bl u_play_sound_0
lbl_000026A4:
/* 000026A4 48002371 */ bl lbl_00004A14
lbl_000026A8:
/* 000026A8 80010014 */ lwz r0, 0x14(r1)
/* 000026AC 83E1000C */ lwz r31, 0xc(r1)
/* 000026B0 38210010 */ addi r1, r1, 0x10
/* 000026B4 7C0803A6 */ mtlr r0
/* 000026B8 4E800020 */ blr 
