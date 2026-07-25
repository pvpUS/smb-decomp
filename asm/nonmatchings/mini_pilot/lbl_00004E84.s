/* 00004E84 7C0802A6 */ mflr r0
/* 00004E88 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 00004E8C 90010004 */ stw r0, 4(r1)
/* 00004E90 9421FFF8 */ stwu r1, -8(r1)
/* 00004E94 A8030000 */ lha r0, lbl_802F1FF6@l(r3)
/* 00004E98 3C600000 */ lis r3, currentBall@ha
/* 00004E9C 80A30000 */ lwz r5, currentBall@l(r3)
/* 00004EA0 2C000010 */ cmpwi r0, 0x10
/* 00004EA4 408200B4 */ bne lbl_00004F58
/* 00004EA8 3C600000 */ lis r3, lbl_10000018@ha
/* 00004EAC A8030000 */ lha r0, lbl_10000018@l(r3)
/* 00004EB0 2C000000 */ cmpwi r0, 0
/* 00004EB4 408200A4 */ bne lbl_00004F58
/* 00004EB8 80050094 */ lwz r0, 0x94(r5)
/* 00004EBC 540007FF */ clrlwi. r0, r0, 0x1f
/* 00004EC0 40820098 */ bne lbl_00004F58
/* 00004EC4 88050003 */ lbz r0, 3(r5)
/* 00004EC8 7C000775 */ extsb. r0, r0
/* 00004ECC 4182008C */ beq lbl_00004F58
/* 00004ED0 3C600000 */ lis r3, lbl_802F1FF0@ha
/* 00004ED4 38830000 */ addi r4, r3, lbl_802F1FF0@l
/* 00004ED8 3C608889 */ lis r3, 0x8889
/* 00004EDC 80840000 */ lwz r4, 0(r4)
/* 00004EE0 38038889 */ addi r0, r3, -30583
/* 00004EE4 7C002096 */ mulhw r0, r0, r4
/* 00004EE8 7C002214 */ add r0, r0, r4
/* 00004EEC 7C002670 */ srawi r0, r0, 4
/* 00004EF0 54030FFE */ srwi r3, r0, 0x1f
/* 00004EF4 7C001A14 */ add r0, r0, r3
/* 00004EF8 1C00001E */ mulli r0, r0, 0x1e
/* 00004EFC 7C002050 */ subf r0, r0, r4
/* 00004F00 2C000001 */ cmpwi r0, 1
/* 00004F04 40820054 */ bne lbl_00004F58
/* 00004F08 8805002E */ lbz r0, 0x2e(r5)
/* 00004F0C 3C600000 */ lis r3, u_somePlayerId@ha
/* 00004F10 38A30000 */ addi r5, r3, u_somePlayerId@l
/* 00004F14 7C000774 */ extsb r0, r0
/* 00004F18 90050000 */ stw r0, 0(r5)
/* 00004F1C 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00004F20 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 00004F24 80850000 */ lwz r4, 0(r5)
/* 00004F28 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00004F2C 5484103A */ slwi r4, r4, 2
/* 00004F30 7C802214 */ add r4, r0, r4
/* 00004F34 80040000 */ lwz r0, 0(r4)
/* 00004F38 90030000 */ stw r0, lbl_802F1DFC@l(r3)
/* 00004F3C 4BFFB211 */ bl rand
/* 00004F40 3C800000 */ lis r4, lbl_0000BE80@ha
/* 00004F44 5463AF3C */ rlwinm r3, r3, 0x15, 0x1c, 0x1e
/* 00004F48 38040000 */ addi r0, r4, lbl_0000BE80@l
/* 00004F4C 7C601A14 */ add r3, r0, r3
/* 00004F50 A8630000 */ lha r3, 0(r3)
/* 00004F54 4BFFB1F9 */ bl u_play_sound_0
lbl_00004F58:
/* 00004F58 8001000C */ lwz r0, 0xc(r1)
/* 00004F5C 38210008 */ addi r1, r1, 8
/* 00004F60 7C0803A6 */ mtlr r0
/* 00004F64 4E800020 */ blr 
