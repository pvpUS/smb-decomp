/* 00002F14 7C0802A6 */ mflr r0
/* 00002F18 3C600000 */ lis r3, lbl_10000000@ha
/* 00002F1C 90010004 */ stw r0, 4(r1)
/* 00002F20 3800FFFF */ li r0, -1
/* 00002F24 3880000B */ li r4, 0xb
/* 00002F28 9421FFB8 */ stwu r1, -0x48(r1)
/* 00002F2C BF21002C */ stmw r25, 0x2c(r1)
/* 00002F30 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 00002F34 3BC00000 */ li r30, 0
/* 00002F38 3C600000 */ lis r3, g_recplayInfo@ha
/* 00002F3C 3BE30000 */ addi r31, r3, g_recplayInfo@l
/* 00002F40 3B9F0014 */ addi r28, r31, 0x14
/* 00002F44 3B5D005C */ addi r26, r29, 0x5c
/* 00002F48 B3DD6EB4 */ sth r30, 0x6eb4(r29)
/* 00002F4C B01D6EB6 */ sth r0, 0x6eb6(r29)
/* 00002F50 93DD6EB8 */ stw r30, 0x6eb8(r29)
/* 00002F54 901D6EBC */ stw r0, 0x6ebc(r29)
/* 00002F58 93DF0014 */ stw r30, 0x14(r31)
/* 00002F5C 801F0014 */ lwz r0, 0x14(r31)
/* 00002F60 5400103A */ slwi r0, r0, 2
/* 00002F64 7C7F0214 */ add r3, r31, r0
/* 00002F68 90830000 */ stw r4, 0(r3)
/* 00002F6C 801F0014 */ lwz r0, 0x14(r31)
/* 00002F70 5400103A */ slwi r0, r0, 2
/* 00002F74 7C7F0214 */ add r3, r31, r0
/* 00002F78 80630000 */ lwz r3, 0(r3)
/* 00002F7C 4BFFD231 */ bl recplay_get_time
/* 00002F80 D03F0010 */ stfs f1, 0x10(r31)
/* 00002F84 3C600000 */ lis r3, lbl_0000C348@ha
/* 00002F88 3B7F0010 */ addi r27, r31, 0x10
/* 00002F8C C0030000 */ lfs f0, lbl_0000C348@l(r3)
/* 00002F90 FC000800 */ fcmpu cr0, f0, f1
/* 00002F94 40820014 */ bne lbl_00002FA8
/* 00002F98 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002F9C 380000B8 */ li r0, 0xb8
/* 00002FA0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002FA4 48000288 */ b lbl_0000322C
lbl_00002FA8:
/* 00002FA8 801C0000 */ lwz r0, 0(r28)
/* 00002FAC 389D6E9C */ addi r4, r29, 0x6e9c
/* 00002FB0 5400103A */ slwi r0, r0, 2
/* 00002FB4 7C7F0214 */ add r3, r31, r0
/* 00002FB8 80630000 */ lwz r3, 0(r3)
/* 00002FBC 4BFFD1F1 */ bl recplay_get_header
/* 00002FC0 3C600000 */ lis r3, currStageId@ha
/* 00002FC4 881D6E9E */ lbz r0, 0x6e9e(r29)
/* 00002FC8 3B230000 */ addi r25, r3, currStageId@l
/* 00002FCC B0190000 */ sth r0, 0(r25)
/* 00002FD0 4BFFD1DD */ bl event_finish_all
/* 00002FD4 3C600000 */ lis r3, modeCtrl@ha
/* 00002FD8 38630000 */ addi r3, r3, modeCtrl@l
/* 00002FDC 93C30028 */ stw r30, 0x28(r3)
/* 00002FE0 38000001 */ li r0, 1
/* 00002FE4 90030024 */ stw r0, 0x24(r3)
/* 00002FE8 90030030 */ stw r0, 0x30(r3)
/* 00002FEC 80630024 */ lwz r3, 0x24(r3)
/* 00002FF0 4BFFD1BD */ bl camera_setup_splitscreen_viewports
/* 00002FF4 4BFFD1B9 */ bl func_80044920
/* 00002FF8 4BFFD1B5 */ bl u_clear_buffers_2_and_5
/* 00002FFC 38600009 */ li r3, 9
/* 00003000 4BFFD1AD */ bl event_start
/* 00003004 801C0000 */ lwz r0, 0(r28)
/* 00003008 5400103A */ slwi r0, r0, 2
/* 0000300C 7C7F0214 */ add r3, r31, r0
/* 00003010 80630000 */ lwz r3, 0(r3)
/* 00003014 4BFFD199 */ bl func_80049514
/* 00003018 3C600000 */ lis r3, infoWork@ha
/* 0000301C 3BC30000 */ addi r30, r3, infoWork@l
/* 00003020 801E0000 */ lwz r0, 0(r30)
/* 00003024 60000810 */ ori r0, r0, 0x810
/* 00003028 901E0000 */ stw r0, 0(r30)
/* 0000302C A8790000 */ lha r3, 0(r25)
/* 00003030 4BFFD17D */ bl load_stage
/* 00003034 38600001 */ li r3, 1
/* 00003038 4BFFD175 */ bl event_start
/* 0000303C 38600002 */ li r3, 2
/* 00003040 4BFFD16D */ bl event_start
/* 00003044 38600003 */ li r3, 3
/* 00003048 4BFFD165 */ bl event_start
/* 0000304C 38600004 */ li r3, 4
/* 00003050 4BFFD15D */ bl event_start
/* 00003054 38600005 */ li r3, 5
/* 00003058 4BFFD155 */ bl event_start
/* 0000305C 38600007 */ li r3, 7
/* 00003060 4BFFD14D */ bl event_start
/* 00003064 3860000E */ li r3, 0xe
/* 00003068 4BFFD145 */ bl event_start
/* 0000306C 3860000F */ li r3, 0xf
/* 00003070 4BFFD13D */ bl event_start
/* 00003074 38600010 */ li r3, 0x10
/* 00003078 4BFFD135 */ bl event_start
/* 0000307C 38600012 */ li r3, 0x12
/* 00003080 4BFFD12D */ bl event_start
/* 00003084 3860000D */ li r3, 0xd
/* 00003088 4BFFD125 */ bl event_start
/* 0000308C 38600014 */ li r3, 0x14
/* 00003090 4BFFD11D */ bl event_start
/* 00003094 38600013 */ li r3, 0x13
/* 00003098 4BFFD115 */ bl event_start
/* 0000309C 801E0000 */ lwz r0, 0(r30)
/* 000030A0 60000008 */ ori r0, r0, 8
/* 000030A4 901E0000 */ stw r0, 0(r30)
/* 000030A8 4BFFD105 */ bl rend_efc_mirror_enable
/* 000030AC 38610008 */ addi r3, r1, 8
/* 000030B0 38800000 */ li r4, 0
/* 000030B4 38A00018 */ li r5, 0x18
/* 000030B8 4BFFD0F5 */ bl memset
/* 000030BC 3C600001 */ lis r3, 1
/* 000030C0 3803FFFF */ addi r0, r3, -1
/* 000030C4 B001000E */ sth r0, 0xe(r1)
/* 000030C8 38A10008 */ addi r5, r1, 8
/* 000030CC 38600002 */ li r3, 2
/* 000030D0 38800003 */ li r4, 3
/* 000030D4 4BFFD0D9 */ bl rend_efc_enable
/* 000030D8 3C600000 */ lis r3, backgroundInfo@ha
/* 000030DC A8830000 */ lha r4, backgroundInfo@l(r3)
/* 000030E0 3C600000 */ lis r3, backgroundSongs@ha
/* 000030E4 38030000 */ addi r0, r3, backgroundSongs@l
/* 000030E8 5483083C */ slwi r3, r4, 1
/* 000030EC 7C601A14 */ add r3, r0, r3
/* 000030F0 A8630000 */ lha r3, 0(r3)
/* 000030F4 2C03FFFF */ cmpwi r3, -1
/* 000030F8 41820030 */ beq lbl_00003128
/* 000030FC 3C800000 */ lis r4, lbl_802014E0@ha
/* 00003100 38840000 */ addi r4, r4, lbl_802014E0@l
/* 00003104 80840000 */ lwz r4, 0(r4)
/* 00003108 7C032000 */ cmpw r3, r4
/* 0000310C 4182001C */ beq lbl_00003128
/* 00003110 38030001 */ addi r0, r3, 1
/* 00003114 7C002000 */ cmpw r0, r4
/* 00003118 41820010 */ beq lbl_00003128
/* 0000311C 38800000 */ li r4, 0
/* 00003120 4BFFD08D */ bl u_play_music
/* 00003124 48000038 */ b lbl_0000315C
lbl_00003128:
/* 00003128 3C800000 */ lis r4, lbl_802014E0@ha
/* 0000312C 80040000 */ lwz r0, lbl_802014E0@l(r4)
/* 00003130 2C00FFFF */ cmpwi r0, -1
/* 00003134 40820014 */ bne lbl_00003148
/* 00003138 38600001 */ li r3, 1
/* 0000313C 38800003 */ li r4, 3
/* 00003140 4BFFD06D */ bl u_play_music
/* 00003144 48000018 */ b lbl_0000315C
lbl_00003148:
/* 00003148 2C03FFFF */ cmpwi r3, -1
/* 0000314C 40820010 */ bne lbl_0000315C
/* 00003150 38600000 */ li r3, 0
/* 00003154 38800001 */ li r4, 1
/* 00003158 4BFFD055 */ bl u_play_music
lbl_0000315C:
/* 0000315C 809C0000 */ lwz r4, 0(r28)
/* 00003160 3C600000 */ lis r3, ballInfo@ha
/* 00003164 38030000 */ addi r0, r3, ballInfo@l
/* 00003168 1C6401A4 */ mulli r3, r4, 0x1a4
/* 0000316C 7C601A14 */ add r3, r0, r3
/* 00003170 38000009 */ li r0, 9
/* 00003174 98030003 */ stb r0, 3(r3)
/* 00003178 A87D6EB4 */ lha r3, 0x6eb4(r29)
/* 0000317C 48000A15 */ bl lbl_00003B90
/* 00003180 3C600000 */ lis r3, infoWork@ha
/* 00003184 38830000 */ addi r4, r3, infoWork@l
/* 00003188 80040000 */ lwz r0, 0(r4)
/* 0000318C 3C600000 */ lis r3, g_recplayInfo@ha
/* 00003190 3BC30000 */ addi r30, r3, g_recplayInfo@l
/* 00003194 60000010 */ ori r0, r0, 0x10
/* 00003198 90040000 */ stw r0, 0(r4)
/* 0000319C 801C0000 */ lwz r0, 0(r28)
/* 000031A0 5400103A */ slwi r0, r0, 2
/* 000031A4 7C7E0214 */ add r3, r30, r0
/* 000031A8 80630000 */ lwz r3, 0(r3)
/* 000031AC 4BFFD001 */ bl recplay_get_time
/* 000031B0 D03B0000 */ stfs f1, 0(r27)
/* 000031B4 801C0000 */ lwz r0, 0(r28)
/* 000031B8 C03B0000 */ lfs f1, 0(r27)
/* 000031BC 5400103A */ slwi r0, r0, 2
/* 000031C0 7C7E0214 */ add r3, r30, r0
/* 000031C4 80630000 */ lwz r3, 0(r3)
/* 000031C8 4BFFCFE5 */ bl recplay_get_stage_timer
/* 000031CC 4BFFCFE1 */ bl animate_anim_groups
/* 000031D0 38600005 */ li r3, 5
/* 000031D4 4BFFCFD9 */ bl call_bitmap_load_group
/* 000031D8 38600100 */ li r3, 0x100
/* 000031DC 38800000 */ li r4, 0
/* 000031E0 38A0001E */ li r5, 0x1e
/* 000031E4 4BFFCFC9 */ bl start_screen_fade
/* 000031E8 38000000 */ li r0, 0
/* 000031EC 901A001C */ stw r0, 0x1c(r26)
/* 000031F0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000031F4 380000C1 */ li r0, 0xc1
/* 000031F8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000031FC A01D6E9C */ lhz r0, 0x6e9c(r29)
/* 00003200 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003204 41820018 */ beq lbl_0000321C
/* 00003208 3C600000 */ lis r3, modeCtrl@ha
/* 0000320C 38630000 */ addi r3, r3, modeCtrl@l
/* 00003210 3800003C */ li r0, 0x3c
/* 00003214 90030018 */ stw r0, 0x18(r3)
/* 00003218 48000014 */ b lbl_0000322C
lbl_0000321C:
/* 0000321C 3C600000 */ lis r3, modeCtrl@ha
/* 00003220 38630000 */ addi r3, r3, modeCtrl@l
/* 00003224 380000B4 */ li r0, 0xb4
/* 00003228 90030018 */ stw r0, 0x18(r3)
lbl_0000322C:
/* 0000322C BB21002C */ lmw r25, 0x2c(r1)
/* 00003230 8001004C */ lwz r0, 0x4c(r1)
/* 00003234 38210048 */ addi r1, r1, 0x48
/* 00003238 7C0803A6 */ mtlr r0
/* 0000323C 4E800020 */ blr 
