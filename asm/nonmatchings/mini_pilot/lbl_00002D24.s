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
