/* 00003DD8 7C0802A6 */ mflr r0
/* 00003DDC 90010004 */ stw r0, 4(r1)
/* 00003DE0 9421FFE0 */ stwu r1, -0x20(r1)
/* 00003DE4 BF61000C */ stmw r27, 0xc(r1)
/* 00003DE8 4BFFC3C5 */ bl vibration_get_cont_enable_mask
/* 00003DEC 3C800000 */ lis r4, g_currPlayerButtons@ha
/* 00003DF0 38840000 */ addi r4, r4, g_currPlayerButtons@l
/* 00003DF4 A0A40004 */ lhz r5, 4(r4)
/* 00003DF8 3BE40004 */ addi r31, r4, 4
/* 00003DFC 3C800000 */ lis r4, lbl_10000000@ha
/* 00003E00 38840000 */ addi r4, r4, lbl_10000000@l
/* 00003E04 3B640154 */ addi r27, r4, 0x154
/* 00003E08 80840154 */ lwz r4, 0x154(r4)
/* 00003E0C 3B830000 */ addi r28, r3, 0
/* 00003E10 54A00739 */ rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 00003E14 3BBC0000 */ addi r29, r28, 0
/* 00003E18 3BC40000 */ addi r30, r4, 0
/* 00003E1C 40820018 */ bne lbl_00003E34
/* 00003E20 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003E24 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003E28 A0630004 */ lhz r3, 4(r3)
/* 00003E2C 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00003E30 41820014 */ beq lbl_00003E44
lbl_00003E34:
/* 00003E34 37DEFFFF */ addic. r30, r30, -1
/* 00003E38 4080002C */ bge lbl_00003E64
/* 00003E3C 3BC00003 */ li r30, 3
/* 00003E40 48000024 */ b lbl_00003E64
lbl_00003E44:
/* 00003E44 54A0077B */ rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 00003E48 4082000C */ bne lbl_00003E54
/* 00003E4C 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003E50 41820014 */ beq lbl_00003E64
lbl_00003E54:
/* 00003E54 3BDE0001 */ addi r30, r30, 1
/* 00003E58 2C1E0004 */ cmpwi r30, 4
/* 00003E5C 41800008 */ blt lbl_00003E64
/* 00003E60 3BC00000 */ li r30, 0
lbl_00003E64:
/* 00003E64 7C1E2000 */ cmpw r30, r4
/* 00003E68 41820010 */ beq lbl_00003E78
/* 00003E6C 3860006C */ li r3, 0x6c
/* 00003E70 4BFFC33D */ bl u_play_sound_0
/* 00003E74 93DB0000 */ stw r30, 0(r27)
lbl_00003E78:
/* 00003E78 A09F0000 */ lhz r4, 0(r31)
/* 00003E7C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00003E80 40820028 */ bne lbl_00003EA8
/* 00003E84 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00003E88 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00003E8C A0630004 */ lhz r3, 4(r3)
/* 00003E90 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00003E94 40820014 */ bne lbl_00003EA8
/* 00003E98 548007FF */ clrlwi. r0, r4, 0x1f
/* 00003E9C 4082000C */ bne lbl_00003EA8
/* 00003EA0 546007FF */ clrlwi. r0, r3, 0x1f
/* 00003EA4 41820018 */ beq lbl_00003EBC
lbl_00003EA8:
/* 00003EA8 38600065 */ li r3, 0x65
/* 00003EAC 4BFFC301 */ bl u_play_sound_0
/* 00003EB0 38000001 */ li r0, 1
/* 00003EB4 7C00F030 */ slw r0, r0, r30
/* 00003EB8 7FBD0278 */ xor r29, r29, r0
lbl_00003EBC:
/* 00003EBC 57A3063E */ clrlwi r3, r29, 0x18
/* 00003EC0 5780063E */ clrlwi r0, r28, 0x18
/* 00003EC4 7C030040 */ cmplw r3, r0
/* 00003EC8 4182000C */ beq lbl_00003ED4
/* 00003ECC 7FA3EB78 */ mr r3, r29
/* 00003ED0 4BFFC2DD */ bl vibration_set_cont_enable_mask
lbl_00003ED4:
/* 00003ED4 A01F0000 */ lhz r0, 0(r31)
/* 00003ED8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003EDC 41820020 */ beq lbl_00003EFC
/* 00003EE0 3860006B */ li r3, 0x6b
/* 00003EE4 4BFFC2C9 */ bl u_play_sound_0
/* 00003EE8 38600060 */ li r3, 0x60
/* 00003EEC 48000375 */ bl lbl_00004260
/* 00003EF0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003EF4 380000C2 */ li r0, 0xc2
/* 00003EF8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
lbl_00003EFC:
/* 00003EFC BB61000C */ lmw r27, 0xc(r1)
/* 00003F00 80010024 */ lwz r0, 0x24(r1)
/* 00003F04 38210020 */ addi r1, r1, 0x20
/* 00003F08 7C0803A6 */ mtlr r0
/* 00003F0C 4E800020 */ blr 
