/* 000005E8 7C0802A6 */ mflr r0
/* 000005EC 3C600000 */ lis r3, lbl_10000000@ha
/* 000005F0 90010004 */ stw r0, 4(r1)
/* 000005F4 9421FFF0 */ stwu r1, -0x10(r1)
/* 000005F8 93E1000C */ stw r31, 0xc(r1)
/* 000005FC 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 00000600 93C10008 */ stw r30, 8(r1)
/* 00000604 3BDF00BC */ addi r30, r31, 0xbc
/* 00000608 807F00D8 */ lwz r3, 0xd8(r31)
/* 0000060C 3403FFFF */ addic. r0, r3, -1
/* 00000610 901F00D8 */ stw r0, 0xd8(r31)
/* 00000614 4082001C */ bne lbl_00000630
/* 00000618 3C600000 */ lis r3, lbl_0000C6A5@ha
/* 0000061C 38630000 */ addi r3, r3, lbl_0000C6A5@l
/* 00000620 88630000 */ lbz r3, 0(r3)
/* 00000624 4BFFFB89 */ bl u_play_sound_0
/* 00000628 3800003C */ li r0, 0x3c
/* 0000062C 901E001C */ stw r0, 0x1c(r30)
lbl_00000630:
/* 00000630 A87F01B4 */ lha r3, 0x1b4(r31)
/* 00000634 2C030000 */ cmpwi r3, 0
/* 00000638 40810044 */ ble lbl_0000067C
/* 0000063C 3863FFFF */ addi r3, r3, -1
/* 00000640 7C600735 */ extsh. r0, r3
/* 00000644 B07F01B4 */ sth r3, 0x1b4(r31)
/* 00000648 418100B4 */ bgt lbl_000006FC
/* 0000064C 4BFFFB61 */ bl OSGetSoundMode
/* 00000650 28030001 */ cmplwi r3, 1
/* 00000654 4082000C */ bne lbl_00000660
/* 00000658 38600000 */ li r3, 0
/* 0000065C 48000008 */ b lbl_00000664
lbl_00000660:
/* 00000660 38600001 */ li r3, 1
lbl_00000664:
/* 00000664 4BFFFB49 */ bl u_change_sound_mode
/* 00000668 3C600000 */ lis r3, lbl_0000C6A4@ha
/* 0000066C 38630000 */ addi r3, r3, lbl_0000C6A4@l
/* 00000670 88630000 */ lbz r3, 0(r3)
/* 00000674 38800000 */ li r4, 0
/* 00000678 4BFFFB35 */ bl u_play_music
lbl_0000067C:
/* 0000067C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000680 38830000 */ addi r4, r3, g_currPlayerButtons@l
/* 00000684 A0A40008 */ lhz r5, 8(r4)
/* 00000688 54A007FF */ clrlwi. r0, r5, 0x1f
/* 0000068C 40820028 */ bne lbl_000006B4
/* 00000690 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00000694 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00000698 A0630008 */ lhz r3, 8(r3)
/* 0000069C 546007FF */ clrlwi. r0, r3, 0x1f
/* 000006A0 40820014 */ bne lbl_000006B4
/* 000006A4 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 000006A8 4082000C */ bne lbl_000006B4
/* 000006AC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000006B0 41820024 */ beq lbl_000006D4
lbl_000006B4:
/* 000006B4 3860006C */ li r3, 0x6c
/* 000006B8 4BFFFAF5 */ bl u_play_sound_0
/* 000006BC 3860FFFF */ li r3, -1
/* 000006C0 38800001 */ li r4, 1
/* 000006C4 4BFFFAE9 */ bl u_play_music
/* 000006C8 38000005 */ li r0, 5
/* 000006CC B01F01B4 */ sth r0, 0x1b4(r31)
/* 000006D0 4800002C */ b lbl_000006FC
lbl_000006D4:
/* 000006D4 A0040004 */ lhz r0, 4(r4)
/* 000006D8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000006DC 41820020 */ beq lbl_000006FC
/* 000006E0 3860006B */ li r3, 0x6b
/* 000006E4 4BFFFAC9 */ bl u_play_sound_0
/* 000006E8 3860005C */ li r3, 0x5c
/* 000006EC 48003B75 */ bl lbl_00004260
/* 000006F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000006F4 380000AE */ li r0, 0xae
/* 000006F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_000006FC:
/* 000006FC 80010014 */ lwz r0, 0x14(r1)
/* 00000700 83E1000C */ lwz r31, 0xc(r1)
/* 00000704 83C10008 */ lwz r30, 8(r1)
/* 00000708 7C0803A6 */ mtlr r0
/* 0000070C 38210010 */ addi r1, r1, 0x10
/* 00000710 4E800020 */ blr 
