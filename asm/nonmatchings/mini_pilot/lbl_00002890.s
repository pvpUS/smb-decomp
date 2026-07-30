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
