/* 00002DA4 7C0802A6 */ mflr r0
/* 00002DA8 3C600000 */ lis r3, modeCtrl@ha
/* 00002DAC 90010004 */ stw r0, 4(r1)
/* 00002DB0 38630000 */ addi r3, r3, modeCtrl@l
/* 00002DB4 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002DB8 93E1000C */ stw r31, 0xc(r1)
/* 00002DBC 3BE30042 */ addi r31, r3, 0x42
/* 00002DC0 93C10008 */ stw r30, 8(r1)
/* 00002DC4 88030042 */ lbz r0, 0x42(r3)
/* 00002DC8 7C030E70 */ srawi r3, r0, 1
/* 00002DCC 7C630194 */ addze r3, r3
/* 00002DD0 5463083C */ slwi r3, r3, 1
/* 00002DD4 7C630011 */ subfc. r3, r3, r0
/* 00002DD8 7C1E0378 */ mr r30, r0
/* 00002DDC 41820034 */ beq lbl_00002E10
/* 00002DE0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002DE4 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002DE8 A0630004 */ lhz r3, 4(r3)
/* 00002DEC 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002DF0 40820018 */ bne lbl_00002E08
/* 00002DF4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002DF8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002DFC A0630004 */ lhz r3, 4(r3)
/* 00002E00 546307FF */ clrlwi. r3, r3, 0x1f
/* 00002E04 41820038 */ beq lbl_00002E3C
lbl_00002E08:
/* 00002E08 3BDEFFFF */ addi r30, r30, -1
/* 00002E0C 48000030 */ b lbl_00002E3C
lbl_00002E10:
/* 00002E10 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E14 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E18 A0630004 */ lhz r3, 4(r3)
/* 00002E1C 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00002E20 40820018 */ bne lbl_00002E38
/* 00002E24 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E28 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E2C A0630004 */ lhz r3, 4(r3)
/* 00002E30 546307BD */ rlwinm. r3, r3, 0, 0x1e, 0x1e
/* 00002E34 41820008 */ beq lbl_00002E3C
lbl_00002E38:
/* 00002E38 3BDE0001 */ addi r30, r30, 1
lbl_00002E3C:
/* 00002E3C 57C3063E */ clrlwi r3, r30, 0x18
/* 00002E40 28030002 */ cmplwi r3, 2
/* 00002E44 40800034 */ bge lbl_00002E78
/* 00002E48 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E4C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E50 A0630004 */ lhz r3, 4(r3)
/* 00002E54 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00002E58 40820018 */ bne lbl_00002E70
/* 00002E5C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E60 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E64 A0630004 */ lhz r3, 4(r3)
/* 00002E68 5463077B */ rlwinm. r3, r3, 0, 0x1d, 0x1d
/* 00002E6C 41820038 */ beq lbl_00002EA4
lbl_00002E70:
/* 00002E70 3BDE0002 */ addi r30, r30, 2
/* 00002E74 48000030 */ b lbl_00002EA4
lbl_00002E78:
/* 00002E78 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002E7C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002E80 A0630004 */ lhz r3, 4(r3)
/* 00002E84 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00002E88 40820018 */ bne lbl_00002EA0
/* 00002E8C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002E90 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002E94 A0630004 */ lhz r3, 4(r3)
/* 00002E98 54630739 */ rlwinm. r3, r3, 0, 0x1c, 0x1c
/* 00002E9C 41820008 */ beq lbl_00002EA4
lbl_00002EA0:
/* 00002EA0 3BDEFFFE */ addi r30, r30, -2
lbl_00002EA4:
/* 00002EA4 57C3063E */ clrlwi r3, r30, 0x18
/* 00002EA8 28030003 */ cmplwi r3, 3
/* 00002EAC 40810008 */ ble lbl_00002EB4
/* 00002EB0 3BC00000 */ li r30, 0
lbl_00002EB4:
/* 00002EB4 57C3063E */ clrlwi r3, r30, 0x18
/* 00002EB8 7C030040 */ cmplw r3, r0
/* 00002EBC 41820010 */ beq lbl_00002ECC
/* 00002EC0 3860006C */ li r3, 0x6c
/* 00002EC4 4BFFD2E9 */ bl u_play_sound_0
/* 00002EC8 9BDF0000 */ stb r30, 0(r31)
lbl_00002ECC:
/* 00002ECC 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002ED0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002ED4 A0030004 */ lhz r0, 4(r3)
/* 00002ED8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002EDC 41820020 */ beq lbl_00002EFC
/* 00002EE0 3860006B */ li r3, 0x6b
/* 00002EE4 4BFFD2C9 */ bl u_play_sound_0
/* 00002EE8 3860005D */ li r3, 0x5d
/* 00002EEC 48001375 */ bl lbl_00004260
/* 00002EF0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002EF4 380000AE */ li r0, 0xae
/* 00002EF8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00002EFC:
/* 00002EFC 80010014 */ lwz r0, 0x14(r1)
/* 00002F00 83E1000C */ lwz r31, 0xc(r1)
/* 00002F04 83C10008 */ lwz r30, 8(r1)
/* 00002F08 7C0803A6 */ mtlr r0
/* 00002F0C 38210010 */ addi r1, r1, 0x10
/* 00002F10 4E800020 */ blr 
