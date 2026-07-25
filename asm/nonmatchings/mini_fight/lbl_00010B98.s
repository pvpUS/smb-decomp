/* 00010B98 7C0802A6 */ mflr r0
/* 00010B9C 90010004 */ stw r0, 4(r1)
/* 00010BA0 9421FFE8 */ stwu r1, -0x18(r1)
/* 00010BA4 93E10014 */ stw r31, 0x14(r1)
/* 00010BA8 7C7F1B78 */ mr r31, r3
/* 00010BAC 4BFEF5B9 */ bl ball_func_4
/* 00010BB0 801F0094 */ lwz r0, 0x94(r31)
/* 00010BB4 60000020 */ ori r0, r0, 0x20
/* 00010BB8 901F0094 */ stw r0, 0x94(r31)
/* 00010BBC 801F0094 */ lwz r0, 0x94(r31)
/* 00010BC0 54000253 */ rlwinm. r0, r0, 0, 9, 9
/* 00010BC4 41820030 */ beq lbl_00010BF4
/* 00010BC8 A87F014C */ lha r3, 0x14c(r31)
/* 00010BCC 3803FFFF */ addi r0, r3, -1
/* 00010BD0 B01F014C */ sth r0, 0x14c(r31)
/* 00010BD4 A81F014C */ lha r0, 0x14c(r31)
/* 00010BD8 2C000000 */ cmpwi r0, 0
/* 00010BDC 40800018 */ bge lbl_00010BF4
/* 00010BE0 807F0094 */ lwz r3, 0x94(r31)
/* 00010BE4 38000000 */ li r0, 0
/* 00010BE8 54630290 */ rlwinm r3, r3, 0, 0xa, 8
/* 00010BEC 907F0094 */ stw r3, 0x94(r31)
/* 00010BF0 B01F014C */ sth r0, 0x14c(r31)
lbl_00010BF4:
/* 00010BF4 8001001C */ lwz r0, 0x1c(r1)
/* 00010BF8 83E10014 */ lwz r31, 0x14(r1)
/* 00010BFC 38210018 */ addi r1, r1, 0x18
/* 00010C00 7C0803A6 */ mtlr r0
/* 00010C04 4E800020 */ blr 
lbl_00010C08:
/* 00010C08 7C0802A6 */ mflr r0
/* 00010C0C 90010004 */ stw r0, 4(r1)
/* 00010C10 9421FFE8 */ stwu r1, -0x18(r1)
/* 00010C14 93E10014 */ stw r31, 0x14(r1)
/* 00010C18 7C7F1B78 */ mr r31, r3
/* 00010C1C 4BFEF549 */ bl ball_func_4
/* 00010C20 889F002E */ lbz r4, 0x2e(r31)
/* 00010C24 3C600000 */ lis r3, lbl_10017664@ha
/* 00010C28 38030000 */ addi r0, r3, lbl_10017664@l
/* 00010C2C 7C830774 */ extsb r3, r4
/* 00010C30 1C630018 */ mulli r3, r3, 0x18
/* 00010C34 7C601A14 */ add r3, r0, r3
/* 00010C38 38830008 */ addi r4, r3, 8
/* 00010C3C A863000E */ lha r3, 0xe(r3)
/* 00010C40 2C030000 */ cmpwi r3, 0
/* 00010C44 4081000C */ ble lbl_00010C50
/* 00010C48 3803FFFF */ addi r0, r3, -1
/* 00010C4C B0040006 */ sth r0, 6(r4)
lbl_00010C50:
/* 00010C50 A8640016 */ lha r3, 0x16(r4)
/* 00010C54 2C030000 */ cmpwi r3, 0
/* 00010C58 40810034 */ ble lbl_00010C8C
/* 00010C5C 3803FFFF */ addi r0, r3, -1
/* 00010C60 B0040016 */ sth r0, 0x16(r4)
/* 00010C64 A8040016 */ lha r0, 0x16(r4)
/* 00010C68 2C000000 */ cmpwi r0, 0
/* 00010C6C 40820020 */ bne lbl_00010C8C
/* 00010C70 80BF00FC */ lwz r5, 0xfc(r31)
/* 00010C74 3C600000 */ lis r3, lbl_802F1DFC@ha
/* 00010C78 38830000 */ addi r4, r3, lbl_802F1DFC@l
/* 00010C7C 80050010 */ lwz r0, 0x10(r5)
/* 00010C80 3860001E */ li r3, 0x1e
/* 00010C84 90040000 */ stw r0, 0(r4)
/* 00010C88 4BFEF4DD */ bl u_play_sound_0
lbl_00010C8C:
/* 00010C8C 8001001C */ lwz r0, 0x1c(r1)
/* 00010C90 83E10014 */ lwz r31, 0x14(r1)
/* 00010C94 38210018 */ addi r1, r1, 0x18
/* 00010C98 7C0803A6 */ mtlr r0
/* 00010C9C 4E800020 */ blr 
lbl_00010CA0:
/* 00010CA0 7C0802A6 */ mflr r0
/* 00010CA4 3CA00000 */ lis r5, lbl_0001C348@ha
/* 00010CA8 90010004 */ stw r0, 4(r1)
/* 00010CAC 9421FEA0 */ stwu r1, -0x160(r1)
/* 00010CB0 93E1015C */ stw r31, 0x15c(r1)
/* 00010CB4 93C10158 */ stw r30, 0x158(r1)
/* 00010CB8 3BC50000 */ addi r30, r5, lbl_0001C348@l
/* 00010CBC 93A10154 */ stw r29, 0x154(r1)
/* 00010CC0 7C7D1B78 */ mr r29, r3
/* 00010CC4 80830004 */ lwz r4, 4(r3)
/* 00010CC8 80030008 */ lwz r0, 8(r3)
/* 00010CCC 90810130 */ stw r4, 0x130(r1)
/* 00010CD0 90010134 */ stw r0, 0x134(r1)
/* 00010CD4 801D000C */ lwz r0, 0xc(r29)
/* 00010CD8 90010138 */ stw r0, 0x138(r1)
/* 00010CDC 4BFEF489 */ bl u_ball_init_2
/* 00010CE0 881D002E */ lbz r0, 0x2e(r29)
/* 00010CE4 3C600000 */ lis r3, lbl_10017664@ha
/* 00010CE8 3C800000 */ lis r4, lbl_0001D724@ha
/* 00010CEC 7C050774 */ extsb r5, r0
/* 00010CF0 38040000 */ addi r0, r4, lbl_0001D724@l
/* 00010CF4 7C802A14 */ add r4, r0, r5
/* 00010CF8 88040000 */ lbz r0, 0(r4)
/* 00010CFC 38630000 */ addi r3, r3, lbl_10017664@l
/* 00010D00 981D014A */ stb r0, 0x14a(r29)
/* 00010D04 881D002E */ lbz r0, 0x2e(r29)
/* 00010D08 7C000774 */ extsb r0, r0
/* 00010D0C 1C000018 */ mulli r0, r0, 0x18
/* 00010D10 7C630214 */ add r3, r3, r0
/* 00010D14 A003001A */ lhz r0, 0x1a(r3)
/* 00010D18 540007FF */ clrlwi. r0, r0, 0x1f
/* 00010D1C 41820010 */ beq lbl_00010D2C
/* 00010D20 801D0094 */ lwz r0, 0x94(r29)
/* 00010D24 64000200 */ oris r0, r0, 0x200
/* 00010D28 901D0094 */ stw r0, 0x94(r29)
lbl_00010D2C:
/* 00010D2C 887D002E */ lbz r3, 0x2e(r29)
/* 00010D30 3881013C */ addi r4, r1, 0x13c
/* 00010D34 7C630774 */ extsb r3, r3
/* 00010D38 480013F5 */ bl lbl_0001212C
/* 00010D3C C0010130 */ lfs f0, 0x130(r1)
/* 00010D40 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00010D44 38A02000 */ li r5, 0x2000
/* 00010D48 D01D0004 */ stfs f0, 4(r29)
/* 00010D4C 38830000 */ addi r4, r3, decodedStageLzPtr@l
/* 00010D50 38000000 */ li r0, 0
/* 00010D54 C03E00A8 */ lfs f1, 0xa8(r30)
/* 00010D58 387D0004 */ addi r3, r29, 4
/* 00010D5C C0010134 */ lfs f0, 0x134(r1)
/* 00010D60 EC01002A */ fadds f0, f1, f0
/* 00010D64 D01D0008 */ stfs f0, 8(r29)
/* 00010D68 C0010138 */ lfs f0, 0x138(r1)
/* 00010D6C D01D000C */ stfs f0, 0xc(r29)
/* 00010D70 C01D0004 */ lfs f0, 4(r29)
/* 00010D74 D01D0010 */ stfs f0, 0x10(r29)
/* 00010D78 C01D0008 */ lfs f0, 8(r29)
/* 00010D7C D01D0014 */ stfs f0, 0x14(r29)
/* 00010D80 C01D000C */ lfs f0, 0xc(r29)
/* 00010D84 D01D0018 */ stfs f0, 0x18(r29)
/* 00010D88 C01E001C */ lfs f0, 0x1c(r30)
/* 00010D8C D01D001C */ stfs f0, 0x1c(r29)
/* 00010D90 C01E001C */ lfs f0, 0x1c(r30)
/* 00010D94 D01D0020 */ stfs f0, 0x20(r29)
/* 00010D98 C01E001C */ lfs f0, 0x1c(r30)
/* 00010D9C D01D0024 */ stfs f0, 0x24(r29)
/* 00010DA0 B0BD0028 */ sth r5, 0x28(r29)
/* 00010DA4 80840000 */ lwz r4, 0(r4)
/* 00010DA8 80840010 */ lwz r4, 0x10(r4)
/* 00010DAC A884000E */ lha r4, 0xe(r4)
/* 00010DB0 3884C000 */ addi r4, r4, -16384
/* 00010DB4 B09D002A */ sth r4, 0x2a(r29)
/* 00010DB8 B01D002C */ sth r0, 0x2c(r29)
/* 00010DBC 4BFEF3A9 */ bl mathutil_mtxA_from_translate
/* 00010DC0 A87D002A */ lha r3, 0x2a(r29)
/* 00010DC4 4BFEF3A1 */ bl mathutil_mtxA_rotate_y
/* 00010DC8 A87D0028 */ lha r3, 0x28(r29)
/* 00010DCC 4BFEF399 */ bl mathutil_mtxA_rotate_x
/* 00010DD0 A87D002C */ lha r3, 0x2c(r29)
/* 00010DD4 4BFEF391 */ bl mathutil_mtxA_rotate_z
/* 00010DD8 387D0030 */ addi r3, r29, 0x30
/* 00010DDC 4BFEF389 */ bl mathutil_mtxA_to_mtx
/* 00010DE0 387D00C8 */ addi r3, r29, 0xc8
/* 00010DE4 4BFEF381 */ bl mathutil_mtxA_to_mtx
/* 00010DE8 801D0094 */ lwz r0, 0x94(r29)
/* 00010DEC 60000500 */ ori r0, r0, 0x500
/* 00010DF0 901D0094 */ stw r0, 0x94(r29)
/* 00010DF4 801D0094 */ lwz r0, 0x94(r29)
/* 00010DF8 64000018 */ oris r0, r0, 0x18
/* 00010DFC 901D0094 */ stw r0, 0x94(r29)
/* 00010E00 801D0094 */ lwz r0, 0x94(r29)
/* 00010E04 60000010 */ ori r0, r0, 0x10
/* 00010E08 901D0094 */ stw r0, 0x94(r29)
/* 00010E0C 807D00FC */ lwz r3, 0xfc(r29)
/* 00010E10 28030000 */ cmplwi r3, 0
/* 00010E14 41820010 */ beq lbl_00010E24
/* 00010E18 80030014 */ lwz r0, 0x14(r3)
/* 00010E1C 60000020 */ ori r0, r0, 0x20
/* 00010E20 90030014 */ stw r0, 0x14(r3)
lbl_00010E24:
/* 00010E24 387D0004 */ addi r3, r29, 4
/* 00010E28 C0A10130 */ lfs f5, 0x130(r1)
/* 00010E2C C0430000 */ lfs f2, 0(r3)
/* 00010E30 C0810134 */ lfs f4, 0x134(r1)
/* 00010E34 C0230004 */ lfs f1, 4(r3)
/* 00010E38 C0610138 */ lfs f3, 0x138(r1)
/* 00010E3C C0030008 */ lfs f0, 8(r3)
/* 00010E40 ECA51028 */ fsubs f5, f5, f2
/* 00010E44 EC840828 */ fsubs f4, f4, f1
/* 00010E48 EC630028 */ fsubs f3, f3, f0
/* 00010E4C EC250172 */ fmuls f1, f5, f5
/* 00010E50 EC24093A */ fmadds f1, f4, f4, f1
/* 00010E54 EC2308FA */ fmadds f1, f3, f3, f1
/* 00010E58 4BFEF30D */ bl mathutil_sqrt
/* 00010E5C C01E00AC */ lfs f0, 0xac(r30)
/* 00010E60 38610084 */ addi r3, r1, 0x84
/* 00010E64 38800000 */ li r4, 0
/* 00010E68 EC000072 */ fmuls f0, f0, f1
/* 00010E6C 38A000AC */ li r5, 0xac
/* 00010E70 FC00001E */ fctiwz f0, f0
/* 00010E74 D8010148 */ stfd f0, 0x148(r1)
/* 00010E78 8001014C */ lwz r0, 0x14c(r1)
/* 00010E7C 901D0080 */ stw r0, 0x80(r29)
/* 00010E80 4BFEF2E5 */ bl memset
/* 00010E84 3BE00018 */ li r31, 0x18
/* 00010E88 80A10130 */ lwz r5, 0x130(r1)
/* 00010E8C B3E1008C */ sth r31, 0x8c(r1)
/* 00010E90 38610084 */ addi r3, r1, 0x84
/* 00010E94 80810134 */ lwz r4, 0x134(r1)
/* 00010E98 88DD002E */ lbz r6, 0x2e(r29)
/* 00010E9C 80010138 */ lwz r0, 0x138(r1)
/* 00010EA0 7CC60774 */ extsb r6, r6
/* 00010EA4 B0C10098 */ sth r6, 0x98(r1)
/* 00010EA8 80DD0080 */ lwz r6, 0x80(r29)
/* 00010EAC 90C10094 */ stw r6, 0x94(r1)
/* 00010EB0 90A100B8 */ stw r5, 0xb8(r1)
/* 00010EB4 908100BC */ stw r4, 0xbc(r1)
/* 00010EB8 900100C0 */ stw r0, 0xc0(r1)
/* 00010EBC 4BFEF2A9 */ bl spawn_effect
/* 00010EC0 7FA3EB78 */ mr r3, r29
/* 00010EC4 4BFFD2F1 */ bl lbl_0000E1B4
/* 00010EC8 9BFD0003 */ stb r31, 3(r29)
/* 00010ECC 38000029 */ li r0, 0x29
/* 00010ED0 387D00A8 */ addi r3, r29, 0xa8
/* 00010ED4 981D0148 */ stb r0, 0x148(r29)
/* 00010ED8 C01E001C */ lfs f0, 0x1c(r30)
/* 00010EDC D01D00C4 */ stfs f0, 0xc4(r29)
/* 00010EE0 D01D00F8 */ stfs f0, 0xf8(r29)
/* 00010EE4 809E008C */ lwz r4, 0x8c(r30)
/* 00010EE8 801E0090 */ lwz r0, 0x90(r30)
/* 00010EEC 90810078 */ stw r4, 0x78(r1)
/* 00010EF0 9001007C */ stw r0, 0x7c(r1)
/* 00010EF4 801E0094 */ lwz r0, 0x94(r30)
/* 00010EF8 90010080 */ stw r0, 0x80(r1)
/* 00010EFC 80810078 */ lwz r4, 0x78(r1)
/* 00010F00 8001007C */ lwz r0, 0x7c(r1)
/* 00010F04 909D00B8 */ stw r4, 0xb8(r29)
/* 00010F08 901D00BC */ stw r0, 0xbc(r29)
/* 00010F0C 80010080 */ lwz r0, 0x80(r1)
/* 00010F10 901D00C0 */ stw r0, 0xc0(r29)
/* 00010F14 809D00FC */ lwz r4, 0xfc(r29)
/* 00010F18 80040014 */ lwz r0, 0x14(r4)
/* 00010F1C 540004A0 */ rlwinm r0, r0, 0, 0x12, 0x10
/* 00010F20 90040014 */ stw r0, 0x14(r4)
/* 00010F24 809E0098 */ lwz r4, 0x98(r30)
/* 00010F28 801E009C */ lwz r0, 0x9c(r30)
/* 00010F2C 90810068 */ stw r4, 0x68(r1)
/* 00010F30 9001006C */ stw r0, 0x6c(r1)
/* 00010F34 809E00A0 */ lwz r4, 0xa0(r30)
/* 00010F38 801E00A4 */ lwz r0, 0xa4(r30)
/* 00010F3C 90810070 */ stw r4, 0x70(r1)
/* 00010F40 90010074 */ stw r0, 0x74(r1)
/* 00010F44 80810068 */ lwz r4, 0x68(r1)
/* 00010F48 8001006C */ lwz r0, 0x6c(r1)
/* 00010F4C 909D0098 */ stw r4, 0x98(r29)
/* 00010F50 901D009C */ stw r0, 0x9c(r29)
/* 00010F54 80810070 */ lwz r4, 0x70(r1)
/* 00010F58 80010074 */ lwz r0, 0x74(r1)
/* 00010F5C 909D00A0 */ stw r4, 0xa0(r29)
/* 00010F60 901D00A4 */ stw r0, 0xa4(r29)
/* 00010F64 4BFEF201 */ bl mathutil_mtxA_to_quat
/* 00010F68 387D0000 */ addi r3, r29, 0
/* 00010F6C 3881000C */ addi r4, r1, 0xc
/* 00010F70 38A00001 */ li r5, 1
/* 00010F74 4BFEF1F1 */ bl handle_ball_linear_kinematics
/* 00010F78 387D0000 */ addi r3, r29, 0
/* 00010F7C 3881000C */ addi r4, r1, 0xc
/* 00010F80 38A00001 */ li r5, 1
/* 00010F84 4BFEF1E1 */ bl handle_ball_rotational_kinematics
/* 00010F88 387D0000 */ addi r3, r29, 0
/* 00010F8C 3881000C */ addi r4, r1, 0xc
/* 00010F90 38A00001 */ li r5, 1
/* 00010F94 4BFEF1D1 */ bl update_ball_ape_transform
/* 00010F98 807D0080 */ lwz r3, 0x80(r29)
/* 00010F9C 3803FFFF */ addi r0, r3, -1
/* 00010FA0 901D0080 */ stw r0, 0x80(r29)
/* 00010FA4 801D0080 */ lwz r0, 0x80(r29)
/* 00010FA8 2C000000 */ cmpwi r0, 0
/* 00010FAC 41810050 */ bgt lbl_00010FFC
/* 00010FB0 9BFD0003 */ stb r31, 3(r29)
/* 00010FB4 38600021 */ li r3, 0x21
/* 00010FB8 38000000 */ li r0, 0
/* 00010FBC 987D0148 */ stb r3, 0x148(r29)
/* 00010FC0 901D0080 */ stw r0, 0x80(r29)
/* 00010FC4 801D0094 */ lwz r0, 0x94(r29)
/* 00010FC8 54000734 */ rlwinm r0, r0, 0, 0x1c, 0x1a
/* 00010FCC 901D0094 */ stw r0, 0x94(r29)
/* 00010FD0 801D0094 */ lwz r0, 0x94(r29)
/* 00010FD4 60004000 */ ori r0, r0, 0x4000
/* 00010FD8 901D0094 */ stw r0, 0x94(r29)
/* 00010FDC 807D00FC */ lwz r3, 0xfc(r29)
/* 00010FE0 28030000 */ cmplwi r3, 0
/* 00010FE4 41820010 */ beq lbl_00010FF4
/* 00010FE8 80030014 */ lwz r0, 0x14(r3)
/* 00010FEC 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 00010FF0 90030014 */ stw r0, 0x14(r3)
lbl_00010FF4:
/* 00010FF4 38600131 */ li r3, 0x131
/* 00010FF8 4BFEF16D */ bl u_play_sound_0
lbl_00010FFC:
/* 00010FFC 80010164 */ lwz r0, 0x164(r1)
/* 00011000 83E1015C */ lwz r31, 0x15c(r1)
/* 00011004 83C10158 */ lwz r30, 0x158(r1)
/* 00011008 7C0803A6 */ mtlr r0
/* 0001100C 83A10154 */ lwz r29, 0x154(r1)
/* 00011010 38210160 */ addi r1, r1, 0x160
/* 00011014 4E800020 */ blr 
lbl_00011018:
/* 00011018 7C0802A6 */ mflr r0
/* 0001101C 38A00001 */ li r5, 1
/* 00011020 90010004 */ stw r0, 4(r1)
/* 00011024 9421FF90 */ stwu r1, -0x70(r1)
/* 00011028 93E1006C */ stw r31, 0x6c(r1)
/* 0001102C 3BE30000 */ addi r31, r3, 0
/* 00011030 3881000C */ addi r4, r1, 0xc
/* 00011034 4BFEF131 */ bl handle_ball_linear_kinematics
/* 00011038 387F0000 */ addi r3, r31, 0
/* 0001103C 3881000C */ addi r4, r1, 0xc
/* 00011040 38A00001 */ li r5, 1
/* 00011044 4BFEF121 */ bl handle_ball_rotational_kinematics
/* 00011048 387F0000 */ addi r3, r31, 0
/* 0001104C 3881000C */ addi r4, r1, 0xc
/* 00011050 38A00001 */ li r5, 1
/* 00011054 4BFEF111 */ bl update_ball_ape_transform
/* 00011058 80010074 */ lwz r0, 0x74(r1)
/* 0001105C 83E1006C */ lwz r31, 0x6c(r1)
/* 00011060 38210070 */ addi r1, r1, 0x70
/* 00011064 7C0803A6 */ mtlr r0
/* 00011068 4E800020 */ blr 
