/* 0000C5FC 7C0802A6 */ mflr r0
/* 0000C600 3C600000 */ lis r3, debugFlags@ha
/* 0000C604 90010004 */ stw r0, 4(r1)
/* 0000C608 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000C60C BEC10008 */ stmw r22, 8(r1)
/* 0000C610 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000C614 7000000A */ andi. r0, r0, 0xa
/* 0000C618 4082027C */ bne lbl_0000C894
/* 0000C61C 3C600000 */ lis r3, lbl_10017664@ha
/* 0000C620 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000C624 3B830748 */ addi r28, r3, 0x748
/* 0000C628 80630748 */ lwz r3, 0x748(r3)
/* 0000C62C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 0000C630 40820084 */ bne lbl_0000C6B4
/* 0000C634 3C600000 */ lis r3, modeCtrl@ha
/* 0000C638 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C63C 3AC30018 */ addi r22, r3, 0x18
/* 0000C640 80830018 */ lwz r4, 0x18(r3)
/* 0000C644 3C606BCA */ lis r3, 0x6bca
/* 0000C648 38031AF3 */ addi r0, r3, 0x1af3
/* 0000C64C 3864FFFF */ addi r3, r4, -1
/* 0000C650 90760000 */ stw r3, 0(r22)
/* 0000C654 80960000 */ lwz r4, 0(r22)
/* 0000C658 7C002096 */ mulhw r0, r0, r4
/* 0000C65C 7C001E70 */ srawi r0, r0, 3
/* 0000C660 54030FFE */ srwi r3, r0, 0x1f
/* 0000C664 7C001A14 */ add r0, r0, r3
/* 0000C668 1C000013 */ mulli r0, r0, 0x13
/* 0000C66C 7C002051 */ subf. r0, r0, r4
/* 0000C670 40820020 */ bne lbl_0000C690
/* 0000C674 386000FC */ li r3, 0xfc
/* 0000C678 4BFF3AED */ bl u_play_sound_0
/* 0000C67C 80160000 */ lwz r0, 0(r22)
/* 0000C680 2C000000 */ cmpwi r0, 0
/* 0000C684 4182000C */ beq lbl_0000C690
/* 0000C688 38600013 */ li r3, 0x13
/* 0000C68C 4800DCD5 */ bl lbl_0001A360
lbl_0000C690:
/* 0000C690 80160000 */ lwz r0, 0(r22)
/* 0000C694 2C000000 */ cmpwi r0, 0
/* 0000C698 40820074 */ bne lbl_0000C70C
/* 0000C69C 38000013 */ li r0, 0x13
/* 0000C6A0 90160000 */ stw r0, 0(r22)
/* 0000C6A4 801C0000 */ lwz r0, 0(r28)
/* 0000C6A8 60000008 */ ori r0, r0, 8
/* 0000C6AC 901C0000 */ stw r0, 0(r28)
/* 0000C6B0 4800005C */ b lbl_0000C70C
lbl_0000C6B4:
/* 0000C6B4 546006F7 */ rlwinm. r0, r3, 0, 0x1b, 0x1b
/* 0000C6B8 40820054 */ bne lbl_0000C70C
/* 0000C6BC 3C600000 */ lis r3, modeCtrl@ha
/* 0000C6C0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000C6C4 38830018 */ addi r4, r3, 0x18
/* 0000C6C8 80630018 */ lwz r3, 0x18(r3)
/* 0000C6CC 3803FFFF */ addi r0, r3, -1
/* 0000C6D0 90040000 */ stw r0, 0(r4)
/* 0000C6D4 80040000 */ lwz r0, 0(r4)
/* 0000C6D8 2C000000 */ cmpwi r0, 0
/* 0000C6DC 40820030 */ bne lbl_0000C70C
/* 0000C6E0 801C0000 */ lwz r0, 0(r28)
/* 0000C6E4 386001FE */ li r3, 0x1fe
/* 0000C6E8 60000010 */ ori r0, r0, 0x10
/* 0000C6EC 901C0000 */ stw r0, 0(r28)
/* 0000C6F0 4BFF3A75 */ bl u_play_sound_0
/* 0000C6F4 3C600101 */ lis r3, 0x101
/* 0000C6F8 3863D939 */ addi r3, r3, -9927
/* 0000C6FC 4BFF3A69 */ bl u_play_sound_0
/* 0000C700 3C6000FD */ lis r3, 0xfd
/* 0000C704 3863D93A */ addi r3, r3, -9926
/* 0000C708 4BFF3A5D */ bl u_play_sound_0
lbl_0000C70C:
/* 0000C70C 3C800000 */ lis r4, currentBall@ha
/* 0000C710 3C600000 */ lis r3, g_poolInfo@ha
/* 0000C714 3BA40000 */ addi r29, r4, currentBall@l
/* 0000C718 3BC30000 */ addi r30, r3, g_poolInfo@l
/* 0000C71C 835D0000 */ lwz r26, 0(r29)
/* 0000C720 3C600000 */ lis r3, ballInfo@ha
/* 0000C724 833E000C */ lwz r25, 0xc(r30)
/* 0000C728 38030000 */ addi r0, r3, ballInfo@l
/* 0000C72C 3CA00000 */ lis r5, modeCtrl@ha
/* 0000C730 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 0000C734 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000C738 7C1B0378 */ mr r27, r0
/* 0000C73C 3BE50000 */ addi r31, r5, modeCtrl@l
/* 0000C740 3AC40000 */ addi r22, r4, lbl_802F1DFC@l
/* 0000C744 3AE30000 */ addi r23, r3, u_somePlayerId@l
/* 0000C748 3B000000 */ li r24, 0
/* 0000C74C 48000088 */ b lbl_0000C7D4
lbl_0000C750:
/* 0000C750 88190000 */ lbz r0, 0(r25)
/* 0000C754 2C000002 */ cmpwi r0, 2
/* 0000C758 40820070 */ bne lbl_0000C7C8
/* 0000C75C 937D0000 */ stw r27, 0(r29)
/* 0000C760 809B0094 */ lwz r4, 0x94(r27)
/* 0000C764 548005AD */ rlwinm. r0, r4, 0, 0x16, 0x16
/* 0000C768 40820060 */ bne lbl_0000C7C8
/* 0000C76C 807B00FC */ lwz r3, 0xfc(r27)
/* 0000C770 80030014 */ lwz r0, 0x14(r3)
/* 0000C774 54000463 */ rlwinm. r0, r0, 0, 0x11, 0x11
/* 0000C778 41820050 */ beq lbl_0000C7C8
/* 0000C77C 3800FAFF */ li r0, -1281
/* 0000C780 7C800038 */ and r0, r4, r0
/* 0000C784 901B0094 */ stw r0, 0x94(r27)
/* 0000C788 38602859 */ li r3, 0x2859
/* 0000C78C 801B0094 */ lwz r0, 0x94(r27)
/* 0000C790 60000200 */ ori r0, r0, 0x200
/* 0000C794 901B0094 */ stw r0, 0x94(r27)
/* 0000C798 801F0008 */ lwz r0, 8(r31)
/* 0000C79C 60000400 */ ori r0, r0, 0x400
/* 0000C7A0 901F0008 */ stw r0, 8(r31)
/* 0000C7A4 809B00FC */ lwz r4, 0xfc(r27)
/* 0000C7A8 80040010 */ lwz r0, 0x10(r4)
/* 0000C7AC 90160000 */ stw r0, 0(r22)
/* 0000C7B0 881B002E */ lbz r0, 0x2e(r27)
/* 0000C7B4 7C000774 */ extsb r0, r0
/* 0000C7B8 90170000 */ stw r0, 0(r23)
/* 0000C7BC 4BFF39A9 */ bl u_play_sound_0
/* 0000C7C0 38600126 */ li r3, 0x126
/* 0000C7C4 4BFF39A1 */ bl u_play_sound_0
lbl_0000C7C8:
/* 0000C7C8 3B180001 */ addi r24, r24, 1
/* 0000C7CC 3B7B01A4 */ addi r27, r27, 0x1a4
/* 0000C7D0 3B390001 */ addi r25, r25, 1
lbl_0000C7D4:
/* 0000C7D4 801E0008 */ lwz r0, 8(r30)
/* 0000C7D8 7C180000 */ cmpw r24, r0
/* 0000C7DC 4180FF74 */ blt lbl_0000C750
/* 0000C7E0 3C600000 */ lis r3, currentBall@ha
/* 0000C7E4 38830000 */ addi r4, r3, currentBall@l
/* 0000C7E8 3C600000 */ lis r3, modeCtrl@ha
/* 0000C7EC 93440000 */ stw r26, 0(r4)
/* 0000C7F0 38830000 */ addi r4, r3, modeCtrl@l
/* 0000C7F4 80640000 */ lwz r3, 0(r4)
/* 0000C7F8 3803FFFF */ addi r0, r3, -1
/* 0000C7FC 90040000 */ stw r0, 0(r4)
/* 0000C800 80040000 */ lwz r0, 0(r4)
/* 0000C804 2C00003C */ cmpwi r0, 0x3c
/* 0000C808 40810034 */ ble lbl_0000C83C
/* 0000C80C 2C0000B4 */ cmpwi r0, 0xb4
/* 0000C810 4080002C */ bge lbl_0000C83C
/* 0000C814 80040008 */ lwz r0, 8(r4)
/* 0000C818 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 0000C81C 41820020 */ beq lbl_0000C83C
/* 0000C820 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000C824 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000C828 A0030004 */ lhz r0, 4(r3)
/* 0000C82C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000C830 4182000C */ beq lbl_0000C83C
/* 0000C834 3800003C */ li r0, 0x3c
/* 0000C838 90040000 */ stw r0, 0(r4)
lbl_0000C83C:
/* 0000C83C 3C600000 */ lis r3, modeCtrl@ha
/* 0000C840 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000C844 2C00003C */ cmpwi r0, 0x3c
/* 0000C848 4082002C */ bne lbl_0000C874
/* 0000C84C 38600101 */ li r3, 0x101
/* 0000C850 3880FFFF */ li r4, -1
/* 0000C854 38A0003C */ li r5, 0x3c
/* 0000C858 4BFF390D */ bl start_screen_fade
/* 0000C85C 801C0000 */ lwz r0, 0(r28)
/* 0000C860 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000C864 41820010 */ beq lbl_0000C874
/* 0000C868 3860003C */ li r3, 0x3c
/* 0000C86C 38800002 */ li r4, 2
/* 0000C870 4BFF38F5 */ bl u_play_music
lbl_0000C874:
/* 0000C874 3C600000 */ lis r3, modeCtrl@ha
/* 0000C878 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000C87C 2C000000 */ cmpwi r0, 0
/* 0000C880 40800014 */ bge lbl_0000C894
/* 0000C884 3C600000 */ lis r3, lbl_10017664@ha
/* 0000C888 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000C88C 3800000C */ li r0, 0xc
/* 0000C890 B0030002 */ sth r0, 2(r3)
lbl_0000C894:
/* 0000C894 BAC10008 */ lmw r22, 8(r1)
/* 0000C898 80010034 */ lwz r0, 0x34(r1)
/* 0000C89C 38210030 */ addi r1, r1, 0x30
/* 0000C8A0 7C0803A6 */ mtlr r0
/* 0000C8A4 4E800020 */ blr 
