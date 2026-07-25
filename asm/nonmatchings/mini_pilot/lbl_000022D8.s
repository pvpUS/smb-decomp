/* 000022D8 7C0802A6 */ mflr r0
/* 000022DC 3C600000 */ lis r3, lbl_10000090@ha
/* 000022E0 90010004 */ stw r0, 4(r1)
/* 000022E4 3C800000 */ lis r4, modeCtrl@ha
/* 000022E8 9421FFF0 */ stwu r1, -0x10(r1)
/* 000022EC 93E1000C */ stw r31, 0xc(r1)
/* 000022F0 88030000 */ lbz r0, lbl_10000090@l(r3)
/* 000022F4 38640000 */ addi r3, r4, modeCtrl@l
/* 000022F8 3BE3002C */ addi r31, r3, 0x2c
/* 000022FC 3C600000 */ lis r3, lbl_10000078@ha
/* 00002300 80BF0000 */ lwz r5, 0(r31)
/* 00002304 7C040774 */ extsb r4, r0
/* 00002308 38030000 */ addi r0, r3, lbl_10000078@l
/* 0000230C 7C602214 */ add r3, r0, r4
/* 00002310 88030000 */ lbz r0, 0(r3)
/* 00002314 3C600000 */ lis r3, lbl_80285A68@ha
/* 00002318 1C850006 */ mulli r4, r5, 6
/* 0000231C 38630000 */ addi r3, r3, lbl_80285A68@l
/* 00002320 7C000774 */ extsb r0, r0
/* 00002324 7CA32214 */ add r5, r3, r4
/* 00002328 5400083C */ slwi r0, r0, 1
/* 0000232C 7C850214 */ add r4, r5, r0
/* 00002330 A8640000 */ lha r3, 0(r4)
/* 00002334 38030001 */ addi r0, r3, 1
/* 00002338 B0040000 */ sth r0, 0(r4)
/* 0000233C A8050004 */ lha r0, 4(r5)
/* 00002340 2C000000 */ cmpwi r0, 0
/* 00002344 41820010 */ beq lbl_00002354
/* 00002348 386001B1 */ li r3, 0x1b1
/* 0000234C 4BFFDE01 */ bl u_play_sound_0
/* 00002350 4BFFE6E1 */ bl lbl_00000A30
lbl_00002354:
/* 00002354 801F0000 */ lwz r0, 0(r31)
/* 00002358 3C600000 */ lis r3, lbl_80285A68@ha
/* 0000235C 38630000 */ addi r3, r3, lbl_80285A68@l
/* 00002360 1C000006 */ mulli r0, r0, 6
/* 00002364 7C630214 */ add r3, r3, r0
/* 00002368 A8030002 */ lha r0, 2(r3)
/* 0000236C 2C000000 */ cmpwi r0, 0
/* 00002370 41820010 */ beq lbl_00002380
/* 00002374 386001AA */ li r3, 0x1aa
/* 00002378 4BFFDDD5 */ bl u_play_sound_0
/* 0000237C 4BFFE531 */ bl lbl_000008AC
lbl_00002380:
/* 00002380 809F0000 */ lwz r4, 0(r31)
/* 00002384 3C600000 */ lis r3, lbl_80285A68@ha
/* 00002388 38030000 */ addi r0, r3, lbl_80285A68@l
/* 0000238C 1C640006 */ mulli r3, r4, 6
/* 00002390 7C601A14 */ add r3, r0, r3
/* 00002394 A8030000 */ lha r0, 0(r3)
/* 00002398 2C000000 */ cmpwi r0, 0
/* 0000239C 4182000C */ beq lbl_000023A8
/* 000023A0 386001B3 */ li r3, 0x1b3
/* 000023A4 4BFFDDA9 */ bl u_play_sound_0
lbl_000023A8:
/* 000023A8 80010014 */ lwz r0, 0x14(r1)
/* 000023AC 83E1000C */ lwz r31, 0xc(r1)
/* 000023B0 38210010 */ addi r1, r1, 0x10
/* 000023B4 7C0803A6 */ mtlr r0
/* 000023B8 4E800020 */ blr 
lbl_000023BC:
/* 000023BC 7C0802A6 */ mflr r0
/* 000023C0 38600064 */ li r3, 0x64
/* 000023C4 90010004 */ stw r0, 4(r1)
/* 000023C8 38800008 */ li r4, 8
/* 000023CC 9421FFF8 */ stwu r1, -8(r1)
/* 000023D0 4BFFDD7D */ bl u_play_music
/* 000023D4 38600078 */ li r3, 0x78
/* 000023D8 4BFFDD75 */ bl hud_show_ready_banner
/* 000023DC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000023E0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000023E4 38000000 */ li r0, 0
/* 000023E8 90040000 */ stw r0, 0(r4)
/* 000023EC 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000023F0 38000008 */ li r0, 8
/* 000023F4 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 000023F8 8001000C */ lwz r0, 0xc(r1)
/* 000023FC 38210008 */ addi r1, r1, 8
/* 00002400 7C0803A6 */ mtlr r0
/* 00002404 4E800020 */ blr 
lbl_00002408:
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
lbl_000024D0:
/* 000024D0 7C0802A6 */ mflr r0
/* 000024D4 38600002 */ li r3, 2
/* 000024D8 90010004 */ stw r0, 4(r1)
/* 000024DC 9421FFF8 */ stwu r1, -8(r1)
/* 000024E0 4BFFDC6D */ bl event_resume
/* 000024E4 3860003C */ li r3, 0x3c
/* 000024E8 4BFFDC65 */ bl hud_show_go_banner
/* 000024EC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000024F0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000024F4 38000000 */ li r0, 0
/* 000024F8 90040000 */ stw r0, 0(r4)
/* 000024FC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002500 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002504 3800000C */ li r0, 0xc
/* 00002508 B0050000 */ sth r0, 0(r5)
/* 0000250C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002510 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002514 3800FFFF */ li r0, -1
/* 00002518 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 0000251C 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002520 81830030 */ lwz r12, 0x30(r3)
/* 00002524 7D8803A6 */ mtlr r12
/* 00002528 4E800021 */ blrl 
/* 0000252C 8001000C */ lwz r0, 0xc(r1)
/* 00002530 38210008 */ addi r1, r1, 8
/* 00002534 7C0803A6 */ mtlr r0
/* 00002538 4E800020 */ blr 
lbl_0000253C:
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
lbl_000026BC:
/* 000026BC 7C0802A6 */ mflr r0
/* 000026C0 3C800000 */ lis r4, lbl_0000BE80@ha
/* 000026C4 90010004 */ stw r0, 4(r1)
/* 000026C8 3C600000 */ lis r3, currentBall@ha
/* 000026CC 9421FFD8 */ stwu r1, -0x28(r1)
/* 000026D0 93E10024 */ stw r31, 0x24(r1)
/* 000026D4 93C10020 */ stw r30, 0x20(r1)
/* 000026D8 93A1001C */ stw r29, 0x1c(r1)
/* 000026DC 3BA40000 */ addi r29, r4, lbl_0000BE80@l
/* 000026E0 3C800000 */ lis r4, lbl_10000000@ha
/* 000026E4 C01D0180 */ lfs f0, 0x180(r29)
/* 000026E8 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000026EC 83C30000 */ lwz r30, currentBall@l(r3)
/* 000026F0 D01F0004 */ stfs f0, 4(r31)
/* 000026F4 807D0170 */ lwz r3, 0x170(r29)
/* 000026F8 801D0174 */ lwz r0, 0x174(r29)
/* 000026FC 90610008 */ stw r3, 8(r1)
/* 00002700 9001000C */ stw r0, 0xc(r1)
/* 00002704 807D0178 */ lwz r3, 0x178(r29)
/* 00002708 801D017C */ lwz r0, 0x17c(r29)
/* 0000270C 90610010 */ stw r3, 0x10(r1)
/* 00002710 90010014 */ stw r0, 0x14(r1)
/* 00002714 80610008 */ lwz r3, 8(r1)
/* 00002718 8001000C */ lwz r0, 0xc(r1)
/* 0000271C 907E0098 */ stw r3, 0x98(r30)
/* 00002720 901E009C */ stw r0, 0x9c(r30)
/* 00002724 80610010 */ lwz r3, 0x10(r1)
/* 00002728 80010014 */ lwz r0, 0x14(r1)
/* 0000272C 907E00A0 */ stw r3, 0xa0(r30)
/* 00002730 901E00A4 */ stw r0, 0xa4(r30)
/* 00002734 4BFFDA19 */ bl mathutil_mtxA_sq_from_identity
/* 00002738 C01E0024 */ lfs f0, 0x24(r30)
/* 0000273C C03E001C */ lfs f1, 0x1c(r30)
/* 00002740 EC210072 */ fmuls f1, f1, f1
/* 00002744 EC20083A */ fmadds f1, f0, f0, f1
/* 00002748 C81D0188 */ lfd f0, 0x188(r29)
/* 0000274C FC010040 */ fcmpo cr0, f1, f0
/* 00002750 41810010 */ bgt lbl_00002760
/* 00002754 801E0094 */ lwz r0, 0x94(r30)
/* 00002758 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000275C 41820020 */ beq lbl_0000277C
lbl_00002760:
/* 00002760 C03E001C */ lfs f1, 0x1c(r30)
/* 00002764 C01E0024 */ lfs f0, 0x24(r30)
/* 00002768 FC200850 */ fneg f1, f1
/* 0000276C FC400050 */ fneg f2, f0
/* 00002770 4BFFD9DD */ bl mathutil_atan2
/* 00002774 7C630734 */ extsh r3, r3
/* 00002778 4BFFD9D5 */ bl mathutil_mtxA_rotate_y
lbl_0000277C:
/* 0000277C 387E0030 */ addi r3, r30, 0x30
/* 00002780 4BFFD9CD */ bl mathutil_mtxA_sq_to_mtx
/* 00002784 38000001 */ li r0, 1
/* 00002788 981E0148 */ stb r0, 0x148(r30)
/* 0000278C 3C800000 */ lis r4, cameraInfo@ha
/* 00002790 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002794 881E002E */ lbz r0, 0x2e(r30)
/* 00002798 38840000 */ addi r4, r4, cameraInfo@l
/* 0000279C 38A00002 */ li r5, 2
/* 000027A0 7C000774 */ extsb r0, r0
/* 000027A4 1C000284 */ mulli r0, r0, 0x284
/* 000027A8 7C840214 */ add r4, r4, r0
/* 000027AC 98A4001F */ stb r5, 0x1f(r4)
/* 000027B0 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 000027B4 386000F0 */ li r3, 0xf0
/* 000027B8 801E0094 */ lwz r0, 0x94(r30)
/* 000027BC 60000010 */ ori r0, r0, 0x10
/* 000027C0 901E0094 */ stw r0, 0x94(r30)
/* 000027C4 80040000 */ lwz r0, 0(r4)
/* 000027C8 60000100 */ ori r0, r0, 0x100
/* 000027CC 90040000 */ stw r0, 0(r4)
/* 000027D0 4BFFD97D */ bl u_play_sound_0
/* 000027D4 A81F0018 */ lha r0, 0x18(r31)
/* 000027D8 2C000000 */ cmpwi r0, 0
/* 000027DC 40820010 */ bne lbl_000027EC
/* 000027E0 386000EF */ li r3, 0xef
/* 000027E4 4BFFD969 */ bl u_play_sound_2
/* 000027E8 907F002C */ stw r3, 0x2c(r31)
lbl_000027EC:
/* 000027EC 889E002E */ lbz r4, 0x2e(r30)
/* 000027F0 3C600000 */ lis r3, playerControllerIDs@ha
/* 000027F4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000027F8 7C830774 */ extsb r3, r4
/* 000027FC 5463103A */ slwi r3, r3, 2
/* 00002800 7C601A14 */ add r3, r0, r3
/* 00002804 80630000 */ lwz r3, 0(r3)
/* 00002808 38800001 */ li r4, 1
/* 0000280C 38A0000A */ li r5, 0xa
/* 00002810 4BFFD93D */ bl vibration_control
/* 00002814 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002818 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000281C 38000000 */ li r0, 0
/* 00002820 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002824 90040000 */ stw r0, 0(r4)
/* 00002828 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 0000282C 3800000E */ li r0, 0xe
/* 00002830 B0040000 */ sth r0, 0(r4)
/* 00002834 A8040000 */ lha r0, 0(r4)
/* 00002838 2C00FFFF */ cmpwi r0, -1
/* 0000283C 41820014 */ beq lbl_00002850
/* 00002840 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002844 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00002848 3800FFFF */ li r0, -1
/* 0000284C B0040000 */ sth r0, 0(r4)
lbl_00002850:
/* 00002850 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002854 A8830000 */ lha r4, lbl_802F1FF6@l(r3)
/* 00002858 3C600000 */ lis r3, lbl_0000C748@ha
/* 0000285C 38030000 */ addi r0, r3, lbl_0000C748@l
/* 00002860 5483103A */ slwi r3, r4, 2
/* 00002864 7C601A14 */ add r3, r0, r3
/* 00002868 81830000 */ lwz r12, 0(r3)
/* 0000286C 7D8803A6 */ mtlr r12
/* 00002870 4E800021 */ blrl 
/* 00002874 8001002C */ lwz r0, 0x2c(r1)
/* 00002878 83E10024 */ lwz r31, 0x24(r1)
/* 0000287C 83C10020 */ lwz r30, 0x20(r1)
/* 00002880 7C0803A6 */ mtlr r0
/* 00002884 83A1001C */ lwz r29, 0x1c(r1)
/* 00002888 38210028 */ addi r1, r1, 0x28
/* 0000288C 4E800020 */ blr 
lbl_00002890:
/* 00002890 7C0802A6 */ mflr r0
/* 00002894 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002898 90010004 */ stw r0, 4(r1)
/* 0000289C 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 000028A0 3CA00000 */ lis r5, currentBall@ha
/* 000028A4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000028A8 93E1000C */ stw r31, 0xc(r1)
/* 000028AC 80640000 */ lwz r3, 0(r4)
/* 000028B0 83E50000 */ lwz r31, currentBall@l(r5)
/* 000028B4 38030001 */ addi r0, r3, 1
/* 000028B8 90040000 */ stw r0, 0(r4)
/* 000028BC 80040000 */ lwz r0, 0(r4)
/* 000028C0 2C000011 */ cmpwi r0, 0x11
/* 000028C4 40820044 */ bne lbl_00002908
/* 000028C8 881F002E */ lbz r0, 0x2e(r31)
/* 000028CC 3C600000 */ lis r3, u_somePlayerId@ha
/* 000028D0 3C800000 */ lis r4, playerCharacterSelection@ha
/* 000028D4 7C000774 */ extsb r0, r0
/* 000028D8 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 000028DC 90050000 */ stw r0, 0(r5)
/* 000028E0 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 000028E4 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000028E8 80A50000 */ lwz r5, 0(r5)
/* 000028EC 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 000028F0 3860001F */ li r3, 0x1f
/* 000028F4 54A5103A */ slwi r5, r5, 2
/* 000028F8 7CA02A14 */ add r5, r0, r5
/* 000028FC 80050000 */ lwz r0, 0(r5)
/* 00002900 90040000 */ stw r0, 0(r4)
/* 00002904 4BFFD849 */ bl u_play_sound_0
lbl_00002908:
/* 00002908 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000290C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00002910 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002914 4182009C */ beq lbl_000029B0
/* 00002918 807F00FC */ lwz r3, 0xfc(r31)
/* 0000291C 80030014 */ lwz r0, 0x14(r3)
/* 00002920 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002924 4182008C */ beq lbl_000029B0
/* 00002928 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 0000292C 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002930 3C608889 */ lis r3, 0x8889
/* 00002934 80840000 */ lwz r4, 0(r4)
/* 00002938 38038889 */ addi r0, r3, -30583
/* 0000293C 7C002096 */ mulhw r0, r0, r4
/* 00002940 7C002214 */ add r0, r0, r4
/* 00002944 7C002670 */ srawi r0, r0, 4
/* 00002948 54030FFE */ srwi r3, r0, 0x1f
/* 0000294C 7C001A14 */ add r0, r0, r3
/* 00002950 1C00001E */ mulli r0, r0, 0x1e
/* 00002954 7C002050 */ subf r0, r0, r4
/* 00002958 2C000001 */ cmpwi r0, 1
/* 0000295C 40820054 */ bne lbl_000029B0
/* 00002960 881F002E */ lbz r0, 0x2e(r31)
/* 00002964 3C600000 */ lis r3, u_somePlayerId@ha
/* 00002968 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 0000296C 7C000774 */ extsb r0, r0
/* 00002970 90050000 */ stw r0, 0(r5)
/* 00002974 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002978 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 0000297C 80850000 */ lwz r4, 0(r5)
/* 00002980 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002984 5484103A */ slwi r4, r4, 2
/* 00002988 7C802214 */ add r4, r0, r4
/* 0000298C 80040000 */ lwz r0, 0(r4)
/* 00002990 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002994 4BFFD7B9 */ bl rand
/* 00002998 3C800000 */ lis r4, lbl_0000BE80@ha
/* 0000299C 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 000029A0 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 000029A4 7C601A14 */ add r3, r0, r3
/* 000029A8 A8630000 */ lha r3, 0(r3)
/* 000029AC 4BFFD7A1 */ bl u_play_sound_0
lbl_000029B0:
/* 000029B0 881F002E */ lbz r0, 0x2e(r31)
/* 000029B4 3C600000 */ lis r3, playerControllerIDs@ha
/* 000029B8 3CA00000 */ lis r5, controllerInfo@ha
/* 000029BC 7C000774 */ extsb r0, r0
/* 000029C0 5404103A */ slwi r4, r0, 2
/* 000029C4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000029C8 7C602214 */ add r3, r0, r4
/* 000029CC 80030000 */ lwz r0, 0(r3)
/* 000029D0 38650000 */ addi r3, r5, controllerInfo@l
/* 000029D4 1C00003C */ mulli r0, r0, 0x3c
/* 000029D8 7C630214 */ add r3, r3, r0
/* 000029DC A0030018 */ lhz r0, 0x18(r3)
/* 000029E0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000029E4 41820030 */ beq lbl_00002A14
/* 000029E8 3C800000 */ lis r4, lbl_802F1FDC@ha
/* 000029EC 3C600000 */ lis r3, lbl_0000C010@ha
/* 000029F0 C0240000 */ lfs f1, lbl_802F1FDC@l(r4)
/* 000029F4 C8030000 */ lfd f0, lbl_0000C010@l(r3)
/* 000029F8 FC010040 */ fcmpo cr0, f1, f0
/* 000029FC 4C411382 */ cror 2, 1, 2
/* 00002A00 40820014 */ bne lbl_00002A14
/* 00002A04 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002A08 38000011 */ li r0, 0x11
/* 00002A0C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00002A10 48000008 */ b lbl_00002A18
lbl_00002A14:
/* 00002A14 48002001 */ bl lbl_00004A14
lbl_00002A18:
/* 00002A18 80010014 */ lwz r0, 0x14(r1)
/* 00002A1C 83E1000C */ lwz r31, 0xc(r1)
/* 00002A20 38210010 */ addi r1, r1, 0x10
/* 00002A24 7C0803A6 */ mtlr r0
/* 00002A28 4E800020 */ blr 
lbl_00002A2C:
/* 00002A2C 7C0802A6 */ mflr r0
/* 00002A30 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002A34 90010004 */ stw r0, 4(r1)
/* 00002A38 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00002A3C 3C600000 */ lis r3, currentBall@ha
/* 00002A40 9421FFF8 */ stwu r1, -8(r1)
/* 00002A44 3CA00000 */ lis r5, lbl_0000BE80@ha
/* 00002A48 80040000 */ lwz r0, 0(r4)
/* 00002A4C 80C30000 */ lwz r6, currentBall@l(r3)
/* 00002A50 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00002A54 60000020 */ ori r0, r0, 0x20
/* 00002A58 90040000 */ stw r0, 0(r4)
/* 00002A5C 38850000 */ addi r4, r5, lbl_0000BE80@l
/* 00002A60 C8040198 */ lfd f0, 0x198(r4)
/* 00002A64 C4230000 */ lfsu f1, lbl_802F1FDC@l(r3)
/* 00002A68 FC010040 */ fcmpo cr0, f1, f0
/* 00002A6C 4C411382 */ cror 2, 1, 2
/* 00002A70 4082000C */ bne lbl_00002A7C
/* 00002A74 C00401A0 */ lfs f0, 0x1a0(r4)
/* 00002A78 D0030000 */ stfs f0, 0(r3)
lbl_00002A7C:
/* 00002A7C C00401A4 */ lfs f0, 0x1a4(r4)
/* 00002A80 386000EF */ li r3, 0xef
/* 00002A84 D0060070 */ stfs f0, 0x70(r6)
/* 00002A88 4BFFD6C5 */ bl SoundOffID
/* 00002A8C 3C600000 */ lis r3, lbl_1000001E@ha
/* 00002A90 38830000 */ addi r4, r3, lbl_1000001E@l
/* 00002A94 38000000 */ li r0, 0
/* 00002A98 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002A9C B0040000 */ sth r0, 0(r4)
/* 00002AA0 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002AA4 90040000 */ stw r0, 0(r4)
/* 00002AA8 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002AAC 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002AB0 38000010 */ li r0, 0x10
/* 00002AB4 B0050000 */ sth r0, 0(r5)
/* 00002AB8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002ABC 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002AC0 3800FFFF */ li r0, -1
/* 00002AC4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002AC8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002ACC 81830040 */ lwz r12, 0x40(r3)
/* 00002AD0 7D8803A6 */ mtlr r12
/* 00002AD4 4E800021 */ blrl 
/* 00002AD8 8001000C */ lwz r0, 0xc(r1)
/* 00002ADC 38210008 */ addi r1, r1, 8
/* 00002AE0 7C0803A6 */ mtlr r0
/* 00002AE4 4E800020 */ blr 
lbl_00002AE8:
/* 00002AE8 7C0802A6 */ mflr r0
/* 00002AEC 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002AF0 90010004 */ stw r0, 4(r1)
/* 00002AF4 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002AF8 3CA00000 */ lis r5, currentBall@ha
/* 00002AFC 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002B00 93E1000C */ stw r31, 0xc(r1)
/* 00002B04 93C10008 */ stw r30, 8(r1)
/* 00002B08 80640000 */ lwz r3, 0(r4)
/* 00002B0C 83C50000 */ lwz r30, currentBall@l(r5)
/* 00002B10 38030001 */ addi r0, r3, 1
/* 00002B14 90040000 */ stw r0, 0(r4)
/* 00002B18 3C600000 */ lis r3, lbl_10000000@ha
/* 00002B1C 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00002B20 881E0003 */ lbz r0, 3(r30)
/* 00002B24 7C000775 */ extsb. r0, r0
/* 00002B28 4082002C */ bne lbl_00002B54
/* 00002B2C 38600002 */ li r3, 2
/* 00002B30 4BFFD61D */ bl event_suspend
/* 00002B34 3C600000 */ lis r3, stageInfo@ha
/* 00002B38 38630000 */ addi r3, r3, stageInfo@l
/* 00002B3C 8003001C */ lwz r0, 0x1c(r3)
/* 00002B40 60000001 */ ori r0, r0, 1
/* 00002B44 9003001C */ stw r0, 0x1c(r3)
/* 00002B48 A07F001E */ lhz r3, 0x1e(r31)
/* 00002B4C 38030001 */ addi r0, r3, 1
/* 00002B50 B01F001E */ sth r0, 0x1e(r31)
lbl_00002B54:
/* 00002B54 A0DF001E */ lhz r6, 0x1e(r31)
/* 00002B58 2806001E */ cmplwi r6, 0x1e
/* 00002B5C 40820024 */ bne lbl_00002B80
/* 00002B60 48006E45 */ bl lbl_000099A4
/* 00002B64 3860016A */ li r3, 0x16a
/* 00002B68 3880016B */ li r4, 0x16b
/* 00002B6C 4BFFD5E1 */ bl func_8002BFCC
/* 00002B70 38600000 */ li r3, 0
/* 00002B74 38800008 */ li r4, 8
/* 00002B78 4BFFD5D5 */ bl u_play_music
/* 00002B7C 48000080 */ b lbl_00002BFC
lbl_00002B80:
/* 00002B80 28060078 */ cmplwi r6, 0x78
/* 00002B84 40820010 */ bne lbl_00002B94
/* 00002B88 386001AF */ li r3, 0x1af
/* 00002B8C 4BFFD5C1 */ bl u_play_sound_0
/* 00002B90 4800006C */ b lbl_00002BFC
lbl_00002B94:
/* 00002B94 280600F0 */ cmplwi r6, 0xf0
/* 00002B98 40820014 */ bne lbl_00002BAC
/* 00002B9C 38600064 */ li r3, 0x64
/* 00002BA0 38800008 */ li r4, 8
/* 00002BA4 4BFFD5A9 */ bl u_play_music
/* 00002BA8 48000054 */ b lbl_00002BFC
lbl_00002BAC:
/* 00002BAC 40810050 */ ble lbl_00002BFC
/* 00002BB0 881E002E */ lbz r0, 0x2e(r30)
/* 00002BB4 3C600000 */ lis r3, playerControllerIDs@ha
/* 00002BB8 3CA00000 */ lis r5, controllerInfo@ha
/* 00002BBC 7C000774 */ extsb r0, r0
/* 00002BC0 5404103A */ slwi r4, r0, 2
/* 00002BC4 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00002BC8 7C602214 */ add r3, r0, r4
/* 00002BCC 80030000 */ lwz r0, 0(r3)
/* 00002BD0 38650000 */ addi r3, r5, controllerInfo@l
/* 00002BD4 1C00003C */ mulli r0, r0, 0x3c
/* 00002BD8 7C630214 */ add r3, r3, r0
/* 00002BDC A0030018 */ lhz r0, 0x18(r3)
/* 00002BE0 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002BE4 4082000C */ bne lbl_00002BF0
/* 00002BE8 280601A4 */ cmplwi r6, 0x1a4
/* 00002BEC 40810010 */ ble lbl_00002BFC
lbl_00002BF0:
/* 00002BF0 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00002BF4 38000000 */ li r0, 0
/* 00002BF8 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_00002BFC:
/* 00002BFC 48001E19 */ bl lbl_00004A14
/* 00002C00 80010014 */ lwz r0, 0x14(r1)
/* 00002C04 83E1000C */ lwz r31, 0xc(r1)
/* 00002C08 83C10008 */ lwz r30, 8(r1)
/* 00002C0C 7C0803A6 */ mtlr r0
/* 00002C10 38210010 */ addi r1, r1, 0x10
/* 00002C14 4E800020 */ blr 
lbl_00002C18:
/* 00002C18 7C0802A6 */ mflr r0
/* 00002C1C 3C600000 */ lis r3, currentBall@ha
/* 00002C20 90010004 */ stw r0, 4(r1)
/* 00002C24 3C800000 */ lis r4, lbl_10000000@ha
/* 00002C28 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002C2C 93E10014 */ stw r31, 0x14(r1)
/* 00002C30 93C10010 */ stw r30, 0x10(r1)
/* 00002C34 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00002C38 93A1000C */ stw r29, 0xc(r1)
/* 00002C3C 83A30000 */ lwz r29, currentBall@l(r3)
/* 00002C40 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00002C44 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 00002C48 38600002 */ li r3, 2
/* 00002C4C 4BFFD501 */ bl event_suspend
/* 00002C50 38000003 */ li r0, 3
/* 00002C54 3C600000 */ lis r3, modeCtrl@ha
/* 00002C58 981D0148 */ stb r0, 0x148(r29)
/* 00002C5C 38630000 */ addi r3, r3, modeCtrl@l
/* 00002C60 8003002C */ lwz r0, 0x2c(r3)
/* 00002C64 3C600000 */ lis r3, lbl_80285A80@ha
/* 00002C68 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00002C6C 1C00000C */ mulli r0, r0, 0xc
/* 00002C70 7C630214 */ add r3, r3, r0
/* 00002C74 A8030008 */ lha r0, 8(r3)
/* 00002C78 2C000000 */ cmpwi r0, 0
/* 00002C7C 41820010 */ beq lbl_00002C8C
/* 00002C80 C01F01A8 */ lfs f0, 0x1a8(r31)
/* 00002C84 D01D0070 */ stfs f0, 0x70(r29)
/* 00002C88 48000024 */ b lbl_00002CAC
lbl_00002C8C:
/* 00002C8C A8030004 */ lha r0, 4(r3)
/* 00002C90 2C000000 */ cmpwi r0, 0
/* 00002C94 41820010 */ beq lbl_00002CA4
/* 00002C98 C01F01AC */ lfs f0, 0x1ac(r31)
/* 00002C9C D01D0070 */ stfs f0, 0x70(r29)
/* 00002CA0 4800000C */ b lbl_00002CAC
lbl_00002CA4:
/* 00002CA4 C01F01A4 */ lfs f0, 0x1a4(r31)
/* 00002CA8 D01D0070 */ stfs f0, 0x70(r29)
lbl_00002CAC:
/* 00002CAC 801E002C */ lwz r0, 0x2c(r30)
/* 00002CB0 2C00FFFF */ cmpwi r0, -1
/* 00002CB4 41820014 */ beq lbl_00002CC8
/* 00002CB8 5403043E */ clrlwi r3, r0, 0x10
/* 00002CBC 4BFFD491 */ bl SoundOff
/* 00002CC0 3800FFFF */ li r0, -1
/* 00002CC4 901E002C */ stw r0, 0x2c(r30)
lbl_00002CC8:
/* 00002CC8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002CCC 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002CD0 38000000 */ li r0, 0
/* 00002CD4 90040000 */ stw r0, 0(r4)
/* 00002CD8 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002CDC 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002CE0 38000012 */ li r0, 0x12
/* 00002CE4 B0050000 */ sth r0, 0(r5)
/* 00002CE8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002CEC 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002CF0 3800FFFF */ li r0, -1
/* 00002CF4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002CF8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002CFC 81830048 */ lwz r12, 0x48(r3)
/* 00002D00 7D8803A6 */ mtlr r12
/* 00002D04 4E800021 */ blrl 
/* 00002D08 8001001C */ lwz r0, 0x1c(r1)
/* 00002D0C 83E10014 */ lwz r31, 0x14(r1)
/* 00002D10 83C10010 */ lwz r30, 0x10(r1)
/* 00002D14 7C0803A6 */ mtlr r0
/* 00002D18 83A1000C */ lwz r29, 0xc(r1)
/* 00002D1C 38210018 */ addi r1, r1, 0x18
/* 00002D20 4E800020 */ blr 
lbl_00002D24:
/* 00002D24 7C0802A6 */ mflr r0
/* 00002D28 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002D2C 90010004 */ stw r0, 4(r1)
/* 00002D30 38A30000 */ addi r5, r3, lbl_802F1FF0@l
/* 00002D34 3C600000 */ lis r3, lbl_10000018@ha
/* 00002D38 9421FFF8 */ stwu r1, -8(r1)
/* 00002D3C 80850000 */ lwz r4, 0(r5)
/* 00002D40 38040001 */ addi r0, r4, 1
/* 00002D44 90050000 */ stw r0, 0(r5)
/* 00002D48 A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00002D4C 2C000000 */ cmpwi r0, 0
/* 00002D50 408200A0 */ bne lbl_00002DF0
/* 00002D54 3C800000 */ lis r4, lbl_0000C030@ha
/* 00002D58 3C600000 */ lis r3, lbl_802F1FDC@ha
/* 00002D5C C8240000 */ lfd f1, lbl_0000C030@l(r4)
/* 00002D60 C0030000 */ lfs f0, lbl_802F1FDC@l(r3)
/* 00002D64 FC010000 */ fcmpu cr0, f1, f0
/* 00002D68 40820088 */ bne lbl_00002DF0
/* 00002D6C 3C608889 */ lis r3, 0x8889
/* 00002D70 80850000 */ lwz r4, 0(r5)
/* 00002D74 38038889 */ addi r0, r3, -30583
/* 00002D78 7C002096 */ mulhw r0, r0, r4
/* 00002D7C 7C002214 */ add r0, r0, r4
/* 00002D80 7C002670 */ srawi r0, r0, 4
/* 00002D84 54030FFE */ srwi r3, r0, 0x1f
/* 00002D88 7C001A14 */ add r0, r0, r3
/* 00002D8C 1C00001E */ mulli r0, r0, 0x1e
/* 00002D90 7C002050 */ subf r0, r0, r4
/* 00002D94 2C000001 */ cmpwi r0, 1
/* 00002D98 40820058 */ bne lbl_00002DF0
/* 00002D9C 3C600000 */ lis r3, modeCtrl@ha
/* 00002DA0 38830000 */ addi r4, r3, modeCtrl@l
/* 00002DA4 3C600000 */ lis r3, u_somePlayerId@ha
/* 00002DA8 8004002C */ lwz r0, 0x2c(r4)
/* 00002DAC 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 00002DB0 90050000 */ stw r0, 0(r5)
/* 00002DB4 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00002DB8 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00002DBC 80A50000 */ lwz r5, 0(r5)
/* 00002DC0 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00002DC4 54A4103A */ slwi r4, r5, 2
/* 00002DC8 7C802214 */ add r4, r0, r4
/* 00002DCC 80040000 */ lwz r0, 0(r4)
/* 00002DD0 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00002DD4 4BFFD379 */ bl rand
/* 00002DD8 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00002DDC 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00002DE0 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00002DE4 7C601A14 */ add r3, r0, r3
/* 00002DE8 A8630000 */ lha r3, 0(r3)
/* 00002DEC 4BFFD361 */ bl u_play_sound_0
lbl_00002DF0:
/* 00002DF0 48001C25 */ bl lbl_00004A14
/* 00002DF4 8001000C */ lwz r0, 0xc(r1)
/* 00002DF8 38210008 */ addi r1, r1, 8
/* 00002DFC 7C0803A6 */ mtlr r0
/* 00002E00 4E800020 */ blr 
lbl_00002E04:
/* 00002E04 7C0802A6 */ mflr r0
/* 00002E08 3C600000 */ lis r3, modeCtrl@ha
/* 00002E0C 90010004 */ stw r0, 4(r1)
/* 00002E10 38630000 */ addi r3, r3, modeCtrl@l
/* 00002E14 9421FFF8 */ stwu r1, -8(r1)
/* 00002E18 8003002C */ lwz r0, 0x2c(r3)
/* 00002E1C 3C600000 */ lis r3, lbl_80285A80@ha
/* 00002E20 38630000 */ addi r3, r3, lbl_80285A80@l
/* 00002E24 1C00000C */ mulli r0, r0, 0xc
/* 00002E28 7C630214 */ add r3, r3, r0
/* 00002E2C A8030004 */ lha r0, 4(r3)
/* 00002E30 2C000000 */ cmpwi r0, 0
/* 00002E34 41820010 */ beq lbl_00002E44
/* 00002E38 38600135 */ li r3, 0x135
/* 00002E3C 4BFFD311 */ bl u_play_sound_0
/* 00002E40 48000018 */ b lbl_00002E58
lbl_00002E44:
/* 00002E44 A8030008 */ lha r0, 8(r3)
/* 00002E48 2C000000 */ cmpwi r0, 0
/* 00002E4C 4182000C */ beq lbl_00002E58
/* 00002E50 38600138 */ li r3, 0x138
/* 00002E54 4BFFD2F9 */ bl u_play_sound_0
lbl_00002E58:
/* 00002E58 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002E5C 38000014 */ li r0, 0x14
/* 00002E60 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 00002E64 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002E68 3800FFFF */ li r0, -1
/* 00002E6C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002E70 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002E74 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002E78 81830050 */ lwz r12, 0x50(r3)
/* 00002E7C 7D8803A6 */ mtlr r12
/* 00002E80 4E800021 */ blrl 
/* 00002E84 8001000C */ lwz r0, 0xc(r1)
/* 00002E88 38210008 */ addi r1, r1, 8
/* 00002E8C 7C0803A6 */ mtlr r0
/* 00002E90 4E800020 */ blr 
lbl_00002E94:
/* 00002E94 7C0802A6 */ mflr r0
/* 00002E98 90010004 */ stw r0, 4(r1)
/* 00002E9C 9421FFF8 */ stwu r1, -8(r1)
/* 00002EA0 48001B75 */ bl lbl_00004A14
/* 00002EA4 8001000C */ lwz r0, 0xc(r1)
/* 00002EA8 38210008 */ addi r1, r1, 8
/* 00002EAC 7C0803A6 */ mtlr r0
/* 00002EB0 4E800020 */ blr 
lbl_00002EB4:
/* 00002EB4 7C0802A6 */ mflr r0
/* 00002EB8 3C600000 */ lis r3, stageInfo@ha
/* 00002EBC 90010004 */ stw r0, 4(r1)
/* 00002EC0 38630000 */ addi r3, r3, stageInfo@l
/* 00002EC4 3C800000 */ lis r4, currentBall@ha
/* 00002EC8 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002ECC 93E1000C */ stw r31, 0xc(r1)
/* 00002ED0 8003001C */ lwz r0, 0x1c(r3)
/* 00002ED4 83E40000 */ lwz r31, currentBall@l(r4)
/* 00002ED8 60000001 */ ori r0, r0, 1
/* 00002EDC 9003001C */ stw r0, 0x1c(r3)
/* 00002EE0 7FE3FB78 */ mr r3, r31
/* 00002EE4 48003D11 */ bl lbl_00006BF4
/* 00002EE8 48005681 */ bl lbl_00008568
/* 00002EEC 3C600000 */ lis r3, lbl_10000074@ha
/* 00002EF0 80A30000 */ lwz r5, lbl_10000074@l(r3)
/* 00002EF4 2C050005 */ cmpwi r5, 5
/* 00002EF8 41800020 */ blt lbl_00002F18
/* 00002EFC 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00002F00 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 00002F04 80640000 */ lwz r3, 0(r4)
/* 00002F08 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00002F0C 4082000C */ bne lbl_00002F18
/* 00002F10 60600001 */ ori r0, r3, 1
/* 00002F14 90040000 */ stw r0, 0(r4)
lbl_00002F18:
/* 00002F18 2C05012C */ cmpwi r5, 0x12c
/* 00002F1C 41800010 */ blt lbl_00002F2C
/* 00002F20 386001AE */ li r3, 0x1ae
/* 00002F24 4BFFD229 */ bl u_play_sound_0
/* 00002F28 48000034 */ b lbl_00002F5C
lbl_00002F2C:
/* 00002F2C 2C050064 */ cmpwi r5, 0x64
/* 00002F30 41800010 */ blt lbl_00002F40
/* 00002F34 386001AD */ li r3, 0x1ad
/* 00002F38 4BFFD215 */ bl u_play_sound_0
/* 00002F3C 48000020 */ b lbl_00002F5C
lbl_00002F40:
/* 00002F40 2C05000A */ cmpwi r5, 0xa
/* 00002F44 41800010 */ blt lbl_00002F54
/* 00002F48 386001A0 */ li r3, 0x1a0
/* 00002F4C 4BFFD201 */ bl u_play_sound_0
/* 00002F50 4800000C */ b lbl_00002F5C
lbl_00002F54:
/* 00002F54 386001A4 */ li r3, 0x1a4
/* 00002F58 4BFFD1F5 */ bl u_play_sound_0
lbl_00002F5C:
/* 00002F5C 38600000 */ li r3, 0
/* 00002F60 38800008 */ li r4, 8
/* 00002F64 4BFFD1E9 */ bl u_play_music
/* 00002F68 386000F9 */ li r3, 0xf9
/* 00002F6C 4BFFD1E1 */ bl SoundOffID
/* 00002F70 881F002E */ lbz r0, 0x2e(r31)
/* 00002F74 3C800000 */ lis r4, cameraInfo@ha
/* 00002F78 38840000 */ addi r4, r4, cameraInfo@l
/* 00002F7C 7C000774 */ extsb r0, r0
/* 00002F80 1C000284 */ mulli r0, r0, 0x284
/* 00002F84 7C840214 */ add r4, r4, r0
/* 00002F88 38000003 */ li r0, 3
/* 00002F8C 9804001F */ stb r0, 0x1f(r4)
/* 00002F90 38000000 */ li r0, 0
/* 00002F94 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002F98 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00002F9C 981F0003 */ stb r0, 3(r31)
/* 00002FA0 3C600000 */ lis r3, lbl_1000008C@ha
/* 00002FA4 90040000 */ stw r0, 0(r4)
/* 00002FA8 38C30000 */ addi r6, r3, lbl_1000008C@l
/* 00002FAC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00002FB0 90060000 */ stw r0, 0(r6)
/* 00002FB4 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00002FB8 38000016 */ li r0, 0x16
/* 00002FBC B0050000 */ sth r0, 0(r5)
/* 00002FC0 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00002FC4 3800FFFF */ li r0, -1
/* 00002FC8 3C600000 */ lis r3, lbl_0000C748@ha
/* 00002FCC B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00002FD0 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00002FD4 81830058 */ lwz r12, 0x58(r3)
/* 00002FD8 7D8803A6 */ mtlr r12
/* 00002FDC 4E800021 */ blrl 
/* 00002FE0 80010014 */ lwz r0, 0x14(r1)
/* 00002FE4 83E1000C */ lwz r31, 0xc(r1)
/* 00002FE8 38210010 */ addi r1, r1, 0x10
/* 00002FEC 7C0803A6 */ mtlr r0
/* 00002FF0 4E800020 */ blr 
lbl_00002FF4:
/* 00002FF4 7C0802A6 */ mflr r0
/* 00002FF8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00002FFC 90010004 */ stw r0, 4(r1)
/* 00003000 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00003004 3CA00000 */ lis r5, currentBall@ha
/* 00003008 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000300C 93E1000C */ stw r31, 0xc(r1)
/* 00003010 93C10008 */ stw r30, 8(r1)
/* 00003014 80640000 */ lwz r3, 0(r4)
/* 00003018 83C50000 */ lwz r30, currentBall@l(r5)
/* 0000301C 38030001 */ addi r0, r3, 1
/* 00003020 90040000 */ stw r0, 0(r4)
/* 00003024 3C600000 */ lis r3, lbl_10000000@ha
/* 00003028 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000302C 80040000 */ lwz r0, 0(r4)
/* 00003030 2C00000F */ cmpwi r0, 0xf
/* 00003034 408200A8 */ bne lbl_000030DC
/* 00003038 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 0000303C 80030000 */ lwz r0, lbl_802F1FD0@l(r3)
/* 00003040 54000673 */ rlwinm. r0, r0, 0, 0x19, 0x19
/* 00003044 40820118 */ bne lbl_0000315C
/* 00003048 881E002E */ lbz r0, 0x2e(r30)
/* 0000304C 3C600000 */ lis r3, u_somePlayerId@ha
/* 00003050 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 00003054 7C000774 */ extsb r0, r0
/* 00003058 90050000 */ stw r0, 0(r5)
/* 0000305C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003060 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00003064 80850000 */ lwz r4, 0(r5)
/* 00003068 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 0000306C 5484103A */ slwi r4, r4, 2
/* 00003070 7C802214 */ add r4, r0, r4
/* 00003074 80040000 */ lwz r0, 0(r4)
/* 00003078 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 0000307C 801F0074 */ lwz r0, 0x74(r31)
/* 00003080 2C0001F4 */ cmpwi r0, 0x1f4
/* 00003084 41800010 */ blt lbl_00003094
/* 00003088 3860012D */ li r3, 0x12d
/* 0000308C 4BFFD0C1 */ bl u_play_sound_0
/* 00003090 480000CC */ b lbl_0000315C
lbl_00003094:
/* 00003094 2C00012C */ cmpwi r0, 0x12c
/* 00003098 41800010 */ blt lbl_000030A8
/* 0000309C 38600130 */ li r3, 0x130
/* 000030A0 4BFFD0AD */ bl u_play_sound_0
/* 000030A4 480000B8 */ b lbl_0000315C
lbl_000030A8:
/* 000030A8 2C000064 */ cmpwi r0, 0x64
/* 000030AC 41800010 */ blt lbl_000030BC
/* 000030B0 3860012F */ li r3, 0x12f
/* 000030B4 4BFFD099 */ bl u_play_sound_0
/* 000030B8 480000A4 */ b lbl_0000315C
lbl_000030BC:
/* 000030BC 2C00000A */ cmpwi r0, 0xa
/* 000030C0 41800010 */ blt lbl_000030D0
/* 000030C4 3860012E */ li r3, 0x12e
/* 000030C8 4BFFD085 */ bl u_play_sound_0
/* 000030CC 48000090 */ b lbl_0000315C
lbl_000030D0:
/* 000030D0 3860012C */ li r3, 0x12c
/* 000030D4 4BFFD079 */ bl u_play_sound_0
/* 000030D8 48000084 */ b lbl_0000315C
lbl_000030DC:
/* 000030DC 2C00001E */ cmpwi r0, 0x1e
/* 000030E0 4082007C */ bne lbl_0000315C
/* 000030E4 801F0074 */ lwz r0, 0x74(r31)
/* 000030E8 2C00012C */ cmpwi r0, 0x12c
/* 000030EC 4180001C */ blt lbl_00003108
/* 000030F0 3860015F */ li r3, 0x15f
/* 000030F4 38800160 */ li r4, 0x160
/* 000030F8 4BFFD055 */ bl func_8002BFCC
/* 000030FC 380001FE */ li r0, 0x1fe
/* 00003100 901F0094 */ stw r0, 0x94(r31)
/* 00003104 48000058 */ b lbl_0000315C
lbl_00003108:
/* 00003108 2C000064 */ cmpwi r0, 0x64
/* 0000310C 4180001C */ blt lbl_00003128
/* 00003110 38600163 */ li r3, 0x163
/* 00003114 3880015C */ li r4, 0x15c
/* 00003118 4BFFD035 */ bl func_8002BFCC
/* 0000311C 3800010E */ li r0, 0x10e
/* 00003120 901F0094 */ stw r0, 0x94(r31)
/* 00003124 48000038 */ b lbl_0000315C
lbl_00003128:
/* 00003128 2C00000A */ cmpwi r0, 0xa
/* 0000312C 4180001C */ blt lbl_00003148
/* 00003130 3860015D */ li r3, 0x15d
/* 00003134 3880015E */ li r4, 0x15e
/* 00003138 4BFFD015 */ bl func_8002BFCC
/* 0000313C 380000F0 */ li r0, 0xf0
/* 00003140 901F0094 */ stw r0, 0x94(r31)
/* 00003144 48000018 */ b lbl_0000315C
lbl_00003148:
/* 00003148 3860016A */ li r3, 0x16a
/* 0000314C 3880016B */ li r4, 0x16b
/* 00003150 4BFFCFFD */ bl func_8002BFCC
/* 00003154 380000D2 */ li r0, 0xd2
/* 00003158 901F0094 */ stw r0, 0x94(r31)
lbl_0000315C:
/* 0000315C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003160 801F0094 */ lwz r0, 0x94(r31)
/* 00003164 38630000 */ addi r3, r3, lbl_802F1FF0@l
/* 00003168 80630000 */ lwz r3, 0(r3)
/* 0000316C 7C030000 */ cmpw r3, r0
/* 00003170 40820010 */ bne lbl_00003180
/* 00003174 38600064 */ li r3, 0x64
/* 00003178 38800008 */ li r4, 8
/* 0000317C 4BFFCFD1 */ bl u_play_music
lbl_00003180:
/* 00003180 3C600000 */ lis r3, modeCtrl@ha
/* 00003184 38630000 */ addi r3, r3, modeCtrl@l
/* 00003188 8083002C */ lwz r4, 0x2c(r3)
/* 0000318C 3C600000 */ lis r3, lbl_80285A58@ha
/* 00003190 38030000 */ addi r0, r3, lbl_80285A58@l
/* 00003194 5488103A */ slwi r8, r4, 2
/* 00003198 7CE04214 */ add r7, r0, r8
/* 0000319C 80C70000 */ lwz r6, 0(r7)
/* 000031A0 2C060000 */ cmpwi r6, 0
/* 000031A4 40820014 */ bne lbl_000031B8
/* 000031A8 807F008C */ lwz r3, 0x8c(r31)
/* 000031AC 38030001 */ addi r0, r3, 1
/* 000031B0 901F008C */ stw r0, 0x8c(r31)
/* 000031B4 4800005C */ b lbl_00003210
lbl_000031B8:
/* 000031B8 881E002E */ lbz r0, 0x2e(r30)
/* 000031BC 3C600000 */ lis r3, playerControllerIDs@ha
/* 000031C0 3CA00000 */ lis r5, controllerInfo@ha
/* 000031C4 7C000774 */ extsb r0, r0
/* 000031C8 5404103A */ slwi r4, r0, 2
/* 000031CC 38030000 */ addi r0, r3, playerControllerIDs@l
/* 000031D0 7C602214 */ add r3, r0, r4
/* 000031D4 80030000 */ lwz r0, 0(r3)
/* 000031D8 38650000 */ addi r3, r5, controllerInfo@l
/* 000031DC 1C00003C */ mulli r0, r0, 0x3c
/* 000031E0 7C630214 */ add r3, r3, r0
/* 000031E4 A0030018 */ lhz r0, 0x18(r3)
/* 000031E8 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000031EC 41820024 */ beq lbl_00003210
/* 000031F0 7CBF4214 */ add r5, r31, r8
/* 000031F4 80850044 */ lwz r4, 0x44(r5)
/* 000031F8 38000000 */ li r0, 0
/* 000031FC 3C600000 */ lis r3, lbl_802F1FEC@ha
/* 00003200 7C843214 */ add r4, r4, r6
/* 00003204 90850044 */ stw r4, 0x44(r5)
/* 00003208 90070000 */ stw r0, 0(r7)
/* 0000320C B0030000 */ sth r0, lbl_802F1FEC@l(r3)
lbl_00003210:
/* 00003210 801F008C */ lwz r0, 0x8c(r31)
/* 00003214 2C000014 */ cmpwi r0, 0x14
/* 00003218 40810064 */ ble lbl_0000327C
/* 0000321C 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003220 80C30000 */ lwz r6, lbl_802F1FF0@l(r3)
/* 00003224 2C060078 */ cmpwi r6, 0x78
/* 00003228 40810054 */ ble lbl_0000327C
/* 0000322C 881E002E */ lbz r0, 0x2e(r30)
/* 00003230 3C600000 */ lis r3, playerControllerIDs@ha
/* 00003234 3CA00000 */ lis r5, controllerInfo@ha
/* 00003238 7C000774 */ extsb r0, r0
/* 0000323C 5404103A */ slwi r4, r0, 2
/* 00003240 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00003244 7C602214 */ add r3, r0, r4
/* 00003248 80030000 */ lwz r0, 0(r3)
/* 0000324C 38650000 */ addi r3, r5, controllerInfo@l
/* 00003250 1C00003C */ mulli r0, r0, 0x3c
/* 00003254 7C630214 */ add r3, r3, r0
/* 00003258 A0030018 */ lhz r0, 0x18(r3)
/* 0000325C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00003260 4082000C */ bne lbl_0000326C
/* 00003264 2C0601E0 */ cmpwi r6, 0x1e0
/* 00003268 40810014 */ ble lbl_0000327C
lbl_0000326C:
/* 0000326C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003270 38000000 */ li r0, 0
/* 00003274 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 00003278 48000008 */ b lbl_00003280
lbl_0000327C:
/* 0000327C 48001799 */ bl lbl_00004A14
lbl_00003280:
/* 00003280 80010014 */ lwz r0, 0x14(r1)
/* 00003284 83E1000C */ lwz r31, 0xc(r1)
/* 00003288 83C10008 */ lwz r30, 8(r1)
/* 0000328C 7C0803A6 */ mtlr r0
/* 00003290 38210010 */ addi r1, r1, 0x10
/* 00003294 4E800020 */ blr 
lbl_00003298:
/* 00003298 7C0802A6 */ mflr r0
/* 0000329C 3C600000 */ lis r3, lbl_10000000@ha
/* 000032A0 90010004 */ stw r0, 4(r1)
/* 000032A4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000032A8 93E1001C */ stw r31, 0x1c(r1)
/* 000032AC 93C10018 */ stw r30, 0x18(r1)
/* 000032B0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000032B4 4BFFCE99 */ bl event_finish_all
/* 000032B8 38600001 */ li r3, 1
/* 000032BC 4BFFCE91 */ bl event_start
/* 000032C0 38600004 */ li r3, 4
/* 000032C4 4BFFCE89 */ bl event_start
/* 000032C8 3860000F */ li r3, 0xf
/* 000032CC 4BFFCE81 */ bl event_start
/* 000032D0 38600010 */ li r3, 0x10
/* 000032D4 4BFFCE79 */ bl event_start
/* 000032D8 38600012 */ li r3, 0x12
/* 000032DC 4BFFCE71 */ bl event_start
/* 000032E0 38600014 */ li r3, 0x14
/* 000032E4 4BFFCE69 */ bl event_start
/* 000032E8 38600013 */ li r3, 0x13
/* 000032EC 4BFFCE61 */ bl event_start
/* 000032F0 38600043 */ li r3, 0x43
/* 000032F4 4BFFCE59 */ bl camera_set_state_all
/* 000032F8 3C600000 */ lis r3, cameraInfo@ha
/* 000032FC 38630000 */ addi r3, r3, cameraInfo@l
/* 00003300 38000004 */ li r0, 4
/* 00003304 9803001F */ stb r0, 0x1f(r3)
/* 00003308 3BE00000 */ li r31, 0
/* 0000330C B3FE0018 */ sth r31, 0x18(r30)
/* 00003310 93FE0098 */ stw r31, 0x98(r30)
/* 00003314 93FE009C */ stw r31, 0x9c(r30)
/* 00003318 93FE00A0 */ stw r31, 0xa0(r30)
/* 0000331C 93FE00A4 */ stw r31, 0xa4(r30)
/* 00003320 4800737D */ bl lbl_0000A69C
/* 00003324 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003328 93E30000 */ stw r31, lbl_802F1FF0@l(r3)
/* 0000332C 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003330 3CA00000 */ lis r5, lbl_802F1FF6@ha
/* 00003334 93FE008C */ stw r31, 0x8c(r30)
/* 00003338 38000018 */ li r0, 0x18
/* 0000333C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00003340 B0050000 */ sth r0, lbl_802F1FF6@l(r5)
/* 00003344 3800FFFF */ li r0, -1
/* 00003348 38630000 */ addi r3, r3, lbl_0000C748@l
/* 0000334C B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003350 81830060 */ lwz r12, 0x60(r3)
/* 00003354 7D8803A6 */ mtlr r12
/* 00003358 4E800021 */ blrl 
/* 0000335C 80010024 */ lwz r0, 0x24(r1)
/* 00003360 83E1001C */ lwz r31, 0x1c(r1)
/* 00003364 83C10018 */ lwz r30, 0x18(r1)
/* 00003368 7C0803A6 */ mtlr r0
/* 0000336C 38210020 */ addi r1, r1, 0x20
/* 00003370 4E800020 */ blr 
lbl_00003374:
/* 00003374 7C0802A6 */ mflr r0
/* 00003378 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 0000337C 90010004 */ stw r0, 4(r1)
/* 00003380 3C800000 */ lis r4, lbl_10000000@ha
/* 00003384 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003388 93E1001C */ stw r31, 0x1c(r1)
/* 0000338C 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00003390 93C10018 */ stw r30, 0x18(r1)
/* 00003394 3BC30000 */ addi r30, r3, lbl_802F1FF0@l
/* 00003398 807E0000 */ lwz r3, 0(r30)
/* 0000339C 38030001 */ addi r0, r3, 1
/* 000033A0 901E0000 */ stw r0, 0(r30)
/* 000033A4 48003971 */ bl lbl_00006D14
/* 000033A8 2C030000 */ cmpwi r3, 0
/* 000033AC 41820030 */ beq lbl_000033DC
/* 000033B0 801E0000 */ lwz r0, 0(r30)
/* 000033B4 2C000032 */ cmpwi r0, 0x32
/* 000033B8 40810024 */ ble lbl_000033DC
/* 000033BC 801F0044 */ lwz r0, 0x44(r31)
/* 000033C0 901F0098 */ stw r0, 0x98(r31)
/* 000033C4 801F0048 */ lwz r0, 0x48(r31)
/* 000033C8 901F009C */ stw r0, 0x9c(r31)
/* 000033CC 801F004C */ lwz r0, 0x4c(r31)
/* 000033D0 901F00A0 */ stw r0, 0xa0(r31)
/* 000033D4 801F0050 */ lwz r0, 0x50(r31)
/* 000033D8 901F00A4 */ stw r0, 0xa4(r31)
lbl_000033DC:
/* 000033DC 3C600000 */ lis r3, g_poolInfo@ha
/* 000033E0 38630000 */ addi r3, r3, g_poolInfo@l
/* 000033E4 8083000C */ lwz r4, 0xc(r3)
/* 000033E8 38BF0044 */ addi r5, r31, 0x44
/* 000033EC 38DF0098 */ addi r6, r31, 0x98
/* 000033F0 88040000 */ lbz r0, 0(r4)
/* 000033F4 38E00000 */ li r7, 0
/* 000033F8 7C000775 */ extsb. r0, r0
/* 000033FC 41820014 */ beq lbl_00003410
/* 00003400 80660000 */ lwz r3, 0(r6)
/* 00003404 80050000 */ lwz r0, 0(r5)
/* 00003408 7C030000 */ cmpw r3, r0
/* 0000340C 40820080 */ bne lbl_0000348C
lbl_00003410:
/* 00003410 8C040001 */ lbzu r0, 1(r4)
/* 00003414 38E00001 */ li r7, 1
/* 00003418 38A50004 */ addi r5, r5, 4
/* 0000341C 7C000775 */ extsb. r0, r0
/* 00003420 38C60004 */ addi r6, r6, 4
/* 00003424 41820014 */ beq lbl_00003438
/* 00003428 80660000 */ lwz r3, 0(r6)
/* 0000342C 80050000 */ lwz r0, 0(r5)
/* 00003430 7C030000 */ cmpw r3, r0
/* 00003434 40820058 */ bne lbl_0000348C
lbl_00003438:
/* 00003438 8C040001 */ lbzu r0, 1(r4)
/* 0000343C 38E00002 */ li r7, 2
/* 00003440 38A50004 */ addi r5, r5, 4
/* 00003444 7C000775 */ extsb. r0, r0
/* 00003448 38C60004 */ addi r6, r6, 4
/* 0000344C 41820014 */ beq lbl_00003460
/* 00003450 80660000 */ lwz r3, 0(r6)
/* 00003454 80050000 */ lwz r0, 0(r5)
/* 00003458 7C030000 */ cmpw r3, r0
/* 0000345C 40820030 */ bne lbl_0000348C
lbl_00003460:
/* 00003460 88040001 */ lbz r0, 1(r4)
/* 00003464 38E00003 */ li r7, 3
/* 00003468 38A50004 */ addi r5, r5, 4
/* 0000346C 7C000775 */ extsb. r0, r0
/* 00003470 38C60004 */ addi r6, r6, 4
/* 00003474 41820014 */ beq lbl_00003488
/* 00003478 80660000 */ lwz r3, 0(r6)
/* 0000347C 80050000 */ lwz r0, 0(r5)
/* 00003480 7C030000 */ cmpw r3, r0
/* 00003484 40820008 */ bne lbl_0000348C
lbl_00003488:
/* 00003488 38E00004 */ li r7, 4
lbl_0000348C:
/* 0000348C 2C070004 */ cmpwi r7, 4
/* 00003490 40820010 */ bne lbl_000034A0
/* 00003494 807F008C */ lwz r3, 0x8c(r31)
/* 00003498 38030001 */ addi r0, r3, 1
/* 0000349C 901F008C */ stw r0, 0x8c(r31)
lbl_000034A0:
/* 000034A0 48003875 */ bl lbl_00006D14
/* 000034A4 2C030000 */ cmpwi r3, 0
/* 000034A8 41820010 */ beq lbl_000034B8
/* 000034AC 801F008C */ lwz r0, 0x8c(r31)
/* 000034B0 2C000014 */ cmpwi r0, 0x14
/* 000034B4 41810014 */ bgt lbl_000034C8
lbl_000034B8:
/* 000034B8 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 000034BC 80030000 */ lwz r0, lbl_802F1FF0@l(r3)
/* 000034C0 2C0002D0 */ cmpwi r0, 0x2d0
/* 000034C4 408100DC */ ble lbl_000035A0
lbl_000034C8:
/* 000034C8 3800FFFF */ li r0, -1
/* 000034CC 3C600000 */ lis r3, modeCtrl@ha
/* 000034D0 981F0034 */ stb r0, 0x34(r31)
/* 000034D4 38630000 */ addi r3, r3, modeCtrl@l
/* 000034D8 80030024 */ lwz r0, 0x24(r3)
/* 000034DC 2C000001 */ cmpwi r0, 1
/* 000034E0 408200A0 */ bne lbl_00003580
/* 000034E4 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000034E8 38630000 */ addi r3, r3, lbl_802F1FD0@l
/* 000034EC 80630000 */ lwz r3, 0(r3)
/* 000034F0 38A00000 */ li r5, 0
/* 000034F4 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 000034F8 41820008 */ beq lbl_00003500
/* 000034FC 60A50001 */ ori r5, r5, 1
lbl_00003500:
/* 00003500 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 00003504 41820008 */ beq lbl_0000350C
/* 00003508 60A50002 */ ori r5, r5, 2
lbl_0000350C:
/* 0000350C A81F0064 */ lha r0, 0x64(r31)
/* 00003510 2C00000A */ cmpwi r0, 0xa
/* 00003514 4182001C */ beq lbl_00003530
/* 00003518 40800020 */ bge lbl_00003538
/* 0000351C 2C000005 */ cmpwi r0, 5
/* 00003520 41820008 */ beq lbl_00003528
/* 00003524 48000014 */ b lbl_00003538
lbl_00003528:
/* 00003528 38600006 */ li r3, 6
/* 0000352C 48000010 */ b lbl_0000353C
lbl_00003530:
/* 00003530 38600007 */ li r3, 7
/* 00003534 48000008 */ b lbl_0000353C
lbl_00003538:
/* 00003538 38600008 */ li r3, 8
lbl_0000353C:
/* 0000353C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003540 80040000 */ lwz r0, playerCharacterSelection@l(r4)
/* 00003544 38810010 */ addi r4, r1, 0x10
/* 00003548 98010013 */ stb r0, 0x13(r1)
/* 0000354C 801F0044 */ lwz r0, 0x44(r31)
/* 00003550 B0010014 */ sth r0, 0x14(r1)
/* 00003554 98A10016 */ stb r5, 0x16(r1)
/* 00003558 4BFFCBF5 */ bl func_800AC5E0
/* 0000355C 7C600774 */ extsb r0, r3
/* 00003560 981F0034 */ stb r0, 0x34(r31)
/* 00003564 881F0034 */ lbz r0, 0x34(r31)
/* 00003568 7C000775 */ extsb. r0, r0
/* 0000356C 40800014 */ bge lbl_00003580
/* 00003570 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003574 3800001B */ li r0, 0x1b
/* 00003578 B0030000 */ sth r0, lbl_802F1FF4@l(r3)
/* 0000357C 48000024 */ b lbl_000035A0
lbl_00003580:
/* 00003580 3C600000 */ lis r3, pauseMenuState@ha
/* 00003584 38830000 */ addi r4, r3, pauseMenuState@l
/* 00003588 80040004 */ lwz r0, 4(r4)
/* 0000358C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 00003590 60000002 */ ori r0, r0, 2
/* 00003594 90040004 */ stw r0, 4(r4)
/* 00003598 38000019 */ li r0, 0x19
/* 0000359C B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000035A0:
/* 000035A0 80010024 */ lwz r0, 0x24(r1)
/* 000035A4 83E1001C */ lwz r31, 0x1c(r1)
/* 000035A8 83C10018 */ lwz r30, 0x18(r1)
/* 000035AC 7C0803A6 */ mtlr r0
/* 000035B0 38210020 */ addi r1, r1, 0x20
/* 000035B4 4E800020 */ blr 
lbl_000035B8:
/* 000035B8 7C0802A6 */ mflr r0
/* 000035BC 3C600000 */ lis r3, lbl_0000BE80@ha
/* 000035C0 90010004 */ stw r0, 4(r1)
/* 000035C4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000035C8 93E1001C */ stw r31, 0x1c(r1)
/* 000035CC 3BE30000 */ addi r31, r3, lbl_0000BE80@l
/* 000035D0 93C10018 */ stw r30, 0x18(r1)
/* 000035D4 93A10014 */ stw r29, 0x14(r1)
/* 000035D8 4BFFCB75 */ bl u_free_minigame_graphics
/* 000035DC 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 000035E0 38000000 */ li r0, 0
/* 000035E4 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 000035E8 4BFFCB65 */ bl event_finish_all
/* 000035EC 38600001 */ li r3, 1
/* 000035F0 4BFFCB5D */ bl event_start
/* 000035F4 38600004 */ li r3, 4
/* 000035F8 4BFFCB55 */ bl event_start
/* 000035FC 38600014 */ li r3, 0x14
/* 00003600 4BFFCB4D */ bl event_start
/* 00003604 38600013 */ li r3, 0x13
/* 00003608 4BFFCB45 */ bl event_start
/* 0000360C 38600012 */ li r3, 0x12
/* 00003610 4BFFCB3D */ bl event_start
/* 00003614 3860000F */ li r3, 0xf
/* 00003618 4BFFCB35 */ bl event_start
/* 0000361C 3860000D */ li r3, 0xd
/* 00003620 4BFFCB2D */ bl event_start
/* 00003624 38600010 */ li r3, 0x10
/* 00003628 4BFFCB25 */ bl event_start
/* 0000362C 3C600000 */ lis r3, modeCtrl@ha
/* 00003630 38630000 */ addi r3, r3, modeCtrl@l
/* 00003634 80030024 */ lwz r0, 0x24(r3)
/* 00003638 2C000001 */ cmpwi r0, 1
/* 0000363C 40820034 */ bne lbl_00003670
/* 00003640 3C600000 */ lis r3, playerCharacterSelection@ha
/* 00003644 80830000 */ lwz r4, playerCharacterSelection@l(r3)
/* 00003648 3800FFFF */ li r0, -1
/* 0000364C 3C600000 */ lis r3, lbl_10000034@ha
/* 00003650 7C840774 */ extsb r4, r4
/* 00003654 9881000C */ stb r4, 0xc(r1)
/* 00003658 9801000D */ stb r0, 0xd(r1)
/* 0000365C 9801000E */ stb r0, 0xe(r1)
/* 00003660 9801000F */ stb r0, 0xf(r1)
/* 00003664 88030000 */ lbz r0, lbl_10000034@l(r3)
/* 00003668 98010008 */ stb r0, 8(r1)
/* 0000366C 48000144 */ b lbl_000037B0
lbl_00003670:
/* 00003670 3C600000 */ lis r3, g_poolInfo@ha
/* 00003674 38830000 */ addi r4, r3, g_poolInfo@l
/* 00003678 3C600000 */ lis r3, lbl_10000044@ha
/* 0000367C 8164000C */ lwz r11, 0xc(r4)
/* 00003680 39830000 */ addi r12, r3, lbl_10000044@l
/* 00003684 38000004 */ li r0, 4
/* 00003688 3C600000 */ lis r3, playerCharacterSelection@ha
/* 0000368C 7C0903A6 */ mtctr r0
/* 00003690 39230000 */ addi r9, r3, playerCharacterSelection@l
/* 00003694 38CB0000 */ addi r6, r11, 0
/* 00003698 390C0000 */ addi r8, r12, 0
/* 0000369C 38E1000C */ addi r7, r1, 0xc
/* 000036A0 39410008 */ addi r10, r1, 8
/* 000036A4 3BC00000 */ li r30, 0
lbl_000036A8:
/* 000036A8 88060000 */ lbz r0, 0(r6)
/* 000036AC 7C000775 */ extsb. r0, r0
/* 000036B0 40820010 */ bne lbl_000036C0
/* 000036B4 3800FFFF */ li r0, -1
/* 000036B8 98070000 */ stb r0, 0(r7)
/* 000036BC 480000D8 */ b lbl_00003794
lbl_000036C0:
/* 000036C0 38000000 */ li r0, 0
/* 000036C4 80A80000 */ lwz r5, 0(r8)
/* 000036C8 7C1E0000 */ cmpw r30, r0
/* 000036CC 3BA00000 */ li r29, 0
/* 000036D0 41820020 */ beq lbl_000036F0
/* 000036D4 880B0000 */ lbz r0, 0(r11)
/* 000036D8 7C000775 */ extsb. r0, r0
/* 000036DC 41820014 */ beq lbl_000036F0
/* 000036E0 800C0000 */ lwz r0, 0(r12)
/* 000036E4 7C002800 */ cmpw r0, r5
/* 000036E8 40810008 */ ble lbl_000036F0
/* 000036EC 3BA00001 */ li r29, 1
lbl_000036F0:
/* 000036F0 38000001 */ li r0, 1
/* 000036F4 7C1E0000 */ cmpw r30, r0
/* 000036F8 386B0001 */ addi r3, r11, 1
/* 000036FC 388C0004 */ addi r4, r12, 4
/* 00003700 41820020 */ beq lbl_00003720
/* 00003704 88030000 */ lbz r0, 0(r3)
/* 00003708 7C000775 */ extsb. r0, r0
/* 0000370C 41820014 */ beq lbl_00003720
/* 00003710 80040000 */ lwz r0, 0(r4)
/* 00003714 7C002800 */ cmpw r0, r5
/* 00003718 40810008 */ ble lbl_00003720
/* 0000371C 3BBD0001 */ addi r29, r29, 1
lbl_00003720:
/* 00003720 38000002 */ li r0, 2
/* 00003724 7C1E0000 */ cmpw r30, r0
/* 00003728 38630001 */ addi r3, r3, 1
/* 0000372C 38840004 */ addi r4, r4, 4
/* 00003730 41820020 */ beq lbl_00003750
/* 00003734 88030000 */ lbz r0, 0(r3)
/* 00003738 7C000775 */ extsb. r0, r0
/* 0000373C 41820014 */ beq lbl_00003750
/* 00003740 80040000 */ lwz r0, 0(r4)
/* 00003744 7C002800 */ cmpw r0, r5
/* 00003748 40810008 */ ble lbl_00003750
/* 0000374C 3BBD0001 */ addi r29, r29, 1
lbl_00003750:
/* 00003750 38000003 */ li r0, 3
/* 00003754 7C1E0000 */ cmpw r30, r0
/* 00003758 38630001 */ addi r3, r3, 1
/* 0000375C 38840004 */ addi r4, r4, 4
/* 00003760 41820020 */ beq lbl_00003780
/* 00003764 88030000 */ lbz r0, 0(r3)
/* 00003768 7C000775 */ extsb. r0, r0
/* 0000376C 41820014 */ beq lbl_00003780
/* 00003770 80040000 */ lwz r0, 0(r4)
/* 00003774 7C002800 */ cmpw r0, r5
/* 00003778 40810008 */ ble lbl_00003780
/* 0000377C 3BBD0001 */ addi r29, r29, 1
lbl_00003780:
/* 00003780 80690000 */ lwz r3, 0(r9)
/* 00003784 7FA00774 */ extsb r0, r29
/* 00003788 7C630774 */ extsb r3, r3
/* 0000378C 98670000 */ stb r3, 0(r7)
/* 00003790 980A0000 */ stb r0, 0(r10)
lbl_00003794:
/* 00003794 38C60001 */ addi r6, r6, 1
/* 00003798 38E70001 */ addi r7, r7, 1
/* 0000379C 39080004 */ addi r8, r8, 4
/* 000037A0 39290004 */ addi r9, r9, 4
/* 000037A4 394A0001 */ addi r10, r10, 1
/* 000037A8 3BDE0001 */ addi r30, r30, 1
/* 000037AC 4200FEFC */ bdnz lbl_000036A8
lbl_000037B0:
/* 000037B0 3861000C */ addi r3, r1, 0xc
/* 000037B4 38810008 */ addi r4, r1, 8
/* 000037B8 4BFFC995 */ bl func_8009C5E4
/* 000037BC 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000037C0 38830000 */ addi r4, r3, lbl_802F1FD0@l
/* 000037C4 80040000 */ lwz r0, 0(r4)
/* 000037C8 38600046 */ li r3, 0x46
/* 000037CC 60000004 */ ori r0, r0, 4
/* 000037D0 90040000 */ stw r0, 0(r4)
/* 000037D4 4BFFC979 */ bl camera_set_state_all
/* 000037D8 C03F0030 */ lfs f1, 0x30(r31)
/* 000037DC C05F01B8 */ lfs f2, 0x1b8(r31)
/* 000037E0 C07F01BC */ lfs f3, 0x1bc(r31)
/* 000037E4 4BFFC969 */ bl mathutil_mtxA_from_translate_xyz
/* 000037E8 3C600001 */ lis r3, 1
/* 000037EC 38638000 */ addi r3, r3, -32768
/* 000037F0 4BFFC95D */ bl mathutil_mtxA_rotate_y
/* 000037F4 3C600000 */ lis r3, mathutilData@ha
/* 000037F8 38630000 */ addi r3, r3, mathutilData@l
/* 000037FC 80630000 */ lwz r3, 0(r3)
/* 00003800 4BFFC94D */ bl func_8009DB40
/* 00003804 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003808 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 0000380C 38000000 */ li r0, 0
/* 00003810 90040000 */ stw r0, 0(r4)
/* 00003814 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00003818 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 0000381C 3800001A */ li r0, 0x1a
/* 00003820 B0050000 */ sth r0, 0(r5)
/* 00003824 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003828 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 0000382C 3800FFFF */ li r0, -1
/* 00003830 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003834 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00003838 81830068 */ lwz r12, 0x68(r3)
/* 0000383C 7D8803A6 */ mtlr r12
/* 00003840 4E800021 */ blrl 
/* 00003844 80010024 */ lwz r0, 0x24(r1)
/* 00003848 83E1001C */ lwz r31, 0x1c(r1)
/* 0000384C 83C10018 */ lwz r30, 0x18(r1)
/* 00003850 7C0803A6 */ mtlr r0
/* 00003854 83A10014 */ lwz r29, 0x14(r1)
/* 00003858 38210020 */ addi r1, r1, 0x20
/* 0000385C 4E800020 */ blr 
lbl_00003860:
/* 00003860 7C0802A6 */ mflr r0
/* 00003864 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00003868 90010004 */ stw r0, 4(r1)
/* 0000386C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003870 93E1000C */ stw r31, 0xc(r1)
/* 00003874 3BE30000 */ addi r31, r3, lbl_802F1FF0@l
/* 00003878 807F0000 */ lwz r3, 0(r31)
/* 0000387C 38030001 */ addi r0, r3, 1
/* 00003880 901F0000 */ stw r0, 0(r31)
/* 00003884 801F0000 */ lwz r0, 0(r31)
/* 00003888 2C00003C */ cmpwi r0, 0x3c
/* 0000388C 41800034 */ blt lbl_000038C0
/* 00003890 4BFFC8BD */ bl func_8009D794
/* 00003894 2C030000 */ cmpwi r3, 0
/* 00003898 41820028 */ beq lbl_000038C0
/* 0000389C 48003479 */ bl lbl_00006D14
/* 000038A0 2C030000 */ cmpwi r3, 0
/* 000038A4 40820010 */ bne lbl_000038B4
/* 000038A8 801F0000 */ lwz r0, 0(r31)
/* 000038AC 2C000708 */ cmpwi r0, 0x708
/* 000038B0 40810010 */ ble lbl_000038C0
lbl_000038B4:
/* 000038B4 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000038B8 3800001B */ li r0, 0x1b
/* 000038BC B0030000 */ sth r0, lbl_802F1FF4@l(r3)
lbl_000038C0:
/* 000038C0 80010014 */ lwz r0, 0x14(r1)
/* 000038C4 83E1000C */ lwz r31, 0xc(r1)
/* 000038C8 38210010 */ addi r1, r1, 0x10
/* 000038CC 7C0803A6 */ mtlr r0
/* 000038D0 4E800020 */ blr 
lbl_000038D4:
/* 000038D4 7C0802A6 */ mflr r0
/* 000038D8 90010004 */ stw r0, 4(r1)
/* 000038DC 9421FFC8 */ stwu r1, -0x38(r1)
/* 000038E0 93E10034 */ stw r31, 0x34(r1)
/* 000038E4 3BE00000 */ li r31, 0
/* 000038E8 93C10030 */ stw r30, 0x30(r1)
/* 000038EC 4BFFC861 */ bl u_free_minigame_graphics
/* 000038F0 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 000038F4 38000000 */ li r0, 0
/* 000038F8 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 000038FC 4BFFC851 */ bl mini_commend_free_data
/* 00003900 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00003904 3BC30000 */ addi r30, r3, lbl_802F1FD0@l
/* 00003908 801E0000 */ lwz r0, 0(r30)
/* 0000390C 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00003910 901E0000 */ stw r0, 0(r30)
/* 00003914 4BFFC839 */ bl event_finish_all
/* 00003918 38600010 */ li r3, 0x10
/* 0000391C 4BFFC831 */ bl event_start
/* 00003920 38600012 */ li r3, 0x12
/* 00003924 4BFFC829 */ bl event_start
/* 00003928 807E0000 */ lwz r3, 0(r30)
/* 0000392C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003930 41820008 */ beq lbl_00003938
/* 00003934 63FF0001 */ ori r31, r31, 1
lbl_00003938:
/* 00003938 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000393C 41820008 */ beq lbl_00003944
/* 00003940 63FF0002 */ ori r31, r31, 2
lbl_00003944:
/* 00003944 3C600000 */ lis r3, lbl_10000064@ha
/* 00003948 A8030000 */ lha r0, lbl_10000064@l(r3)
/* 0000394C 2C00000A */ cmpwi r0, 0xa
/* 00003950 4182001C */ beq lbl_0000396C
/* 00003954 40800020 */ bge lbl_00003974
/* 00003958 2C000005 */ cmpwi r0, 5
/* 0000395C 41820008 */ beq lbl_00003964
/* 00003960 48000014 */ b lbl_00003974
lbl_00003964:
/* 00003964 3BC00006 */ li r30, 6
/* 00003968 48000010 */ b lbl_00003978
lbl_0000396C:
/* 0000396C 3BC00007 */ li r30, 7
/* 00003970 48000008 */ b lbl_00003978
lbl_00003974:
/* 00003974 3BC00008 */ li r30, 8
lbl_00003978:
/* 00003978 3C600000 */ lis r3, g_poolInfo@ha
/* 0000397C 38630000 */ addi r3, r3, g_poolInfo@l
/* 00003980 80A3000C */ lwz r5, 0xc(r3)
/* 00003984 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00003988 3C600000 */ lis r3, lbl_10000044@ha
/* 0000398C 88050000 */ lbz r0, 0(r5)
/* 00003990 38840000 */ addi r4, r4, playerCharacterSelection@l
/* 00003994 38C10008 */ addi r6, r1, 8
/* 00003998 7C000775 */ extsb. r0, r0
/* 0000399C 38630000 */ addi r3, r3, lbl_10000044@l
/* 000039A0 4182009C */ beq lbl_00003A3C
/* 000039A4 80040000 */ lwz r0, 0(r4)
/* 000039A8 38840004 */ addi r4, r4, 4
/* 000039AC 38E30004 */ addi r7, r3, 4
/* 000039B0 9801000B */ stb r0, 0xb(r1)
/* 000039B4 38C60008 */ addi r6, r6, 8
/* 000039B8 80030000 */ lwz r0, 0(r3)
/* 000039BC B001000C */ sth r0, 0xc(r1)
/* 000039C0 9BE1000E */ stb r31, 0xe(r1)
/* 000039C4 8C050001 */ lbzu r0, 1(r5)
/* 000039C8 7C000775 */ extsb. r0, r0
/* 000039CC 41820070 */ beq lbl_00003A3C
/* 000039D0 80040000 */ lwz r0, 0(r4)
/* 000039D4 38840004 */ addi r4, r4, 4
/* 000039D8 98060003 */ stb r0, 3(r6)
/* 000039DC 80070000 */ lwz r0, 0(r7)
/* 000039E0 38E70004 */ addi r7, r7, 4
/* 000039E4 B0060004 */ sth r0, 4(r6)
/* 000039E8 9BE60006 */ stb r31, 6(r6)
/* 000039EC 38C60008 */ addi r6, r6, 8
/* 000039F0 8C050001 */ lbzu r0, 1(r5)
/* 000039F4 7C000775 */ extsb. r0, r0
/* 000039F8 41820044 */ beq lbl_00003A3C
/* 000039FC 80040000 */ lwz r0, 0(r4)
/* 00003A00 38840004 */ addi r4, r4, 4
/* 00003A04 98060003 */ stb r0, 3(r6)
/* 00003A08 80070000 */ lwz r0, 0(r7)
/* 00003A0C 38E70004 */ addi r7, r7, 4
/* 00003A10 B0060004 */ sth r0, 4(r6)
/* 00003A14 9BE60006 */ stb r31, 6(r6)
/* 00003A18 38C60008 */ addi r6, r6, 8
/* 00003A1C 88050001 */ lbz r0, 1(r5)
/* 00003A20 7C000775 */ extsb. r0, r0
/* 00003A24 41820018 */ beq lbl_00003A3C
/* 00003A28 80040000 */ lwz r0, 0(r4)
/* 00003A2C 98060003 */ stb r0, 3(r6)
/* 00003A30 80070000 */ lwz r0, 0(r7)
/* 00003A34 B0060004 */ sth r0, 4(r6)
/* 00003A38 9BE60006 */ stb r31, 6(r6)
lbl_00003A3C:
/* 00003A3C 3C600000 */ lis r3, modeCtrl@ha
/* 00003A40 38630000 */ addi r3, r3, modeCtrl@l
/* 00003A44 80A30024 */ lwz r5, 0x24(r3)
/* 00003A48 387E0000 */ addi r3, r30, 0
/* 00003A4C 38810008 */ addi r4, r1, 8
/* 00003A50 4BFFC6FD */ bl func_800AC43C
/* 00003A54 2C030000 */ cmpwi r3, 0
/* 00003A58 41820014 */ beq lbl_00003A6C
/* 00003A5C 387E0000 */ addi r3, r30, 0
/* 00003A60 38800001 */ li r4, 1
/* 00003A64 4BFFC6E9 */ bl func_800AB2A0
/* 00003A68 48000010 */ b lbl_00003A78
lbl_00003A6C:
/* 00003A6C 387E0000 */ addi r3, r30, 0
/* 00003A70 38800000 */ li r4, 0
/* 00003A74 4BFFC6D9 */ bl func_800AB2A0
lbl_00003A78:
/* 00003A78 3C600000 */ lis r3, modeCtrl@ha
/* 00003A7C 38830000 */ addi r4, r3, modeCtrl@l
/* 00003A80 38000000 */ li r0, 0
/* 00003A84 90040000 */ stw r0, 0(r4)
/* 00003A88 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00003A8C 38A30000 */ addi r5, r3, lbl_802F1FF6@l
/* 00003A90 3800001C */ li r0, 0x1c
/* 00003A94 B0050000 */ sth r0, 0(r5)
/* 00003A98 3C600000 */ lis r3, lbl_0000C748@ha
/* 00003A9C 3C800000 */ lis r4, lbl_802F1FF4@ha
/* 00003AA0 3800FFFF */ li r0, -1
/* 00003AA4 B0040000 */ sth r0, lbl_802F1FF4@l(r4)
/* 00003AA8 38630000 */ addi r3, r3, lbl_0000C748@l
/* 00003AAC 81830070 */ lwz r12, 0x70(r3)
/* 00003AB0 7D8803A6 */ mtlr r12
/* 00003AB4 4E800021 */ blrl 
/* 00003AB8 8001003C */ lwz r0, 0x3c(r1)
/* 00003ABC 83E10034 */ lwz r31, 0x34(r1)
/* 00003AC0 83C10030 */ lwz r30, 0x30(r1)
/* 00003AC4 7C0803A6 */ mtlr r0
/* 00003AC8 38210038 */ addi r1, r1, 0x38
/* 00003ACC 4E800020 */ blr 
lbl_00003AD0:
/* 00003AD0 7C0802A6 */ mflr r0
/* 00003AD4 3C600000 */ lis r3, modeCtrl@ha
/* 00003AD8 90010004 */ stw r0, 4(r1)
/* 00003ADC 9421FFF0 */ stwu r1, -0x10(r1)
/* 00003AE0 93E1000C */ stw r31, 0xc(r1)
/* 00003AE4 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00003AE8 807F0000 */ lwz r3, 0(r31)
/* 00003AEC 2C030000 */ cmpwi r3, 0
/* 00003AF0 40820050 */ bne lbl_00003B40
/* 00003AF4 48003221 */ bl lbl_00006D14
/* 00003AF8 2C030000 */ cmpwi r3, 0
/* 00003AFC 4182005C */ beq lbl_00003B58
/* 00003B00 4BFFC64D */ bl func_800AB6F8
/* 00003B04 2C030000 */ cmpwi r3, 0
/* 00003B08 40820050 */ bne lbl_00003B58
/* 00003B0C 386000D1 */ li r3, 0xd1
/* 00003B10 4BFFC63D */ bl u_play_sound_0
/* 00003B14 3800003C */ li r0, 0x3c
/* 00003B18 3C600100 */ lis r3, 0x100
/* 00003B1C 901F0000 */ stw r0, 0(r31)
/* 00003B20 3883FFFF */ addi r4, r3, -1
/* 00003B24 38600101 */ li r3, 0x101
/* 00003B28 38A0003C */ li r5, 0x3c
/* 00003B2C 4BFFC621 */ bl start_screen_fade
/* 00003B30 3860003C */ li r3, 0x3c
/* 00003B34 38800002 */ li r4, 2
/* 00003B38 4BFFC615 */ bl u_play_music
/* 00003B3C 4800001C */ b lbl_00003B58
lbl_00003B40:
/* 00003B40 3403FFFF */ addic. r0, r3, -1
/* 00003B44 901F0000 */ stw r0, 0(r31)
/* 00003B48 40820010 */ bne lbl_00003B58
/* 00003B4C 4BFFC601 */ bl func_800AB444
/* 00003B50 807F0028 */ lwz r3, 0x28(r31)
/* 00003B54 4BFFC5F9 */ bl func_80012434
lbl_00003B58:
/* 00003B58 80010014 */ lwz r0, 0x14(r1)
/* 00003B5C 83E1000C */ lwz r31, 0xc(r1)
/* 00003B60 38210010 */ addi r1, r1, 0x10
/* 00003B64 7C0803A6 */ mtlr r0
/* 00003B68 4E800020 */ blr 
