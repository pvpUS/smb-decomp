/* 0000B03C 7C0802A6 */ mflr r0
/* 0000B040 3C600000 */ lis r3, lbl_10017520@ha
/* 0000B044 90010004 */ stw r0, 4(r1)
/* 0000B048 38000005 */ li r0, 5
/* 0000B04C 9421FF18 */ stwu r1, -0xe8(r1)
/* 0000B050 BEE100C4 */ stmw r23, 0xc4(r1)
/* 0000B054 3BE30000 */ addi r31, r3, lbl_10017520@l
/* 0000B058 3C600000 */ lis r3, modeCtrl@ha
/* 0000B05C B01F0146 */ sth r0, 0x146(r31)
/* 0000B060 38000258 */ li r0, 0x258
/* 0000B064 94030000 */ stwu r0, modeCtrl@l(r3)
/* 0000B068 3800001E */ li r0, 0x1e
/* 0000B06C 90030018 */ stw r0, 0x18(r3)
/* 0000B070 4BFF50F5 */ bl event_finish_all
/* 0000B074 4BFF50F1 */ bl func_80044920
/* 0000B078 3C60AAAB */ lis r3, 0xaaab
/* 0000B07C A89F0148 */ lha r4, 0x148(r31)
/* 0000B080 3803AAAB */ addi r0, r3, -21845
/* 0000B084 7C002016 */ mulhwu r0, r0, r4
/* 0000B088 5400F87E */ srwi r0, r0, 1
/* 0000B08C 1C000003 */ mulli r0, r0, 3
/* 0000B090 7C002050 */ subf r0, r0, r4
/* 0000B094 7C7F0214 */ add r3, r31, r0
/* 0000B098 88830054 */ lbz r4, 0x54(r3)
/* 0000B09C 3C600000 */ lis r3, lbl_0001CC38@ha
/* 0000B0A0 38030000 */ addi r0, r3, lbl_0001CC38@l
/* 0000B0A4 7C830774 */ extsb r3, r4
/* 0000B0A8 5463103A */ slwi r3, r3, 2
/* 0000B0AC 7FC01A14 */ add r30, r0, r3
/* 0000B0B0 A87E0002 */ lha r3, 2(r30)
/* 0000B0B4 3B7F0148 */ addi r27, r31, 0x148
/* 0000B0B8 4BFF50AD */ bl load_stage
/* 0000B0BC 38600001 */ li r3, 1
/* 0000B0C0 4BFF50A5 */ bl event_start
/* 0000B0C4 38600002 */ li r3, 2
/* 0000B0C8 4BFF509D */ bl event_start
/* 0000B0CC 38600003 */ li r3, 3
/* 0000B0D0 4BFF5095 */ bl event_start
/* 0000B0D4 38600004 */ li r3, 4
/* 0000B0D8 4BFF508D */ bl event_start
/* 0000B0DC 38600005 */ li r3, 5
/* 0000B0E0 4BFF5085 */ bl event_start
/* 0000B0E4 38600007 */ li r3, 7
/* 0000B0E8 4BFF507D */ bl event_start
/* 0000B0EC 3860000F */ li r3, 0xf
/* 0000B0F0 4BFF5075 */ bl event_start
/* 0000B0F4 38600010 */ li r3, 0x10
/* 0000B0F8 4BFF506D */ bl event_start
/* 0000B0FC 38600012 */ li r3, 0x12
/* 0000B100 4BFF5065 */ bl event_start
/* 0000B104 3860000D */ li r3, 0xd
/* 0000B108 4BFF505D */ bl event_start
/* 0000B10C 38600014 */ li r3, 0x14
/* 0000B110 4BFF5055 */ bl event_start
/* 0000B114 38600013 */ li r3, 0x13
/* 0000B118 4BFF504D */ bl event_start
/* 0000B11C 38600009 */ li r3, 9
/* 0000B120 4BFF5045 */ bl event_start
/* 0000B124 3860000B */ li r3, 0xb
/* 0000B128 4BFF503D */ bl event_start
/* 0000B12C 3C600000 */ lis r3, currStageId@ha
/* 0000B130 38630000 */ addi r3, r3, currStageId@l
/* 0000B134 A8630000 */ lha r3, 0(r3)
/* 0000B138 4BFF502D */ bl light_init
/* 0000B13C 38600100 */ li r3, 0x100
/* 0000B140 38800000 */ li r4, 0
/* 0000B144 38A0001E */ li r5, 0x1e
/* 0000B148 4BFF501D */ bl start_screen_fade
/* 0000B14C 3C600000 */ lis r3, infoWork@ha
/* 0000B150 84030000 */ lwzu r0, infoWork@l(r3)
/* 0000B154 60000008 */ ori r0, r0, 8
/* 0000B158 90030000 */ stw r0, 0(r3)
/* 0000B15C 4BFF5009 */ bl rend_efc_mirror_enable
/* 0000B160 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B164 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000B168 3C800000 */ lis r4, currentBall@ha
/* 0000B16C 38A40000 */ addi r5, r4, currentBall@l
/* 0000B170 3BA3000C */ addi r29, r3, 0xc
/* 0000B174 80050000 */ lwz r0, 0(r5)
/* 0000B178 3C800000 */ lis r4, ballInfo@ha
/* 0000B17C 80E3000C */ lwz r7, 0xc(r3)
/* 0000B180 38840000 */ addi r4, r4, ballInfo@l
/* 0000B184 38C40000 */ addi r6, r4, 0
/* 0000B188 3B830008 */ addi r28, r3, 8
/* 0000B18C 39000000 */ li r8, 0
/* 0000B190 38800018 */ li r4, 0x18
/* 0000B194 48000024 */ b lbl_0000B1B8
lbl_0000B198:
/* 0000B198 88670000 */ lbz r3, 0(r7)
/* 0000B19C 2C030002 */ cmpwi r3, 2
/* 0000B1A0 4082000C */ bne lbl_0000B1AC
/* 0000B1A4 90C50000 */ stw r6, 0(r5)
/* 0000B1A8 98860003 */ stb r4, 3(r6)
lbl_0000B1AC:
/* 0000B1AC 39080001 */ addi r8, r8, 1
/* 0000B1B0 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B1B4 38E70001 */ addi r7, r7, 1
lbl_0000B1B8:
/* 0000B1B8 807C0000 */ lwz r3, 0(r28)
/* 0000B1BC 7C081800 */ cmpw r8, r3
/* 0000B1C0 4180FFD8 */ blt lbl_0000B198
/* 0000B1C4 3C600000 */ lis r3, currentBall@ha
/* 0000B1C8 38A30000 */ addi r5, r3, currentBall@l
/* 0000B1CC 90050000 */ stw r0, 0(r5)
/* 0000B1D0 3C600000 */ lis r3, ballInfo@ha
/* 0000B1D4 38630000 */ addi r3, r3, ballInfo@l
/* 0000B1D8 80FD0000 */ lwz r7, 0(r29)
/* 0000B1DC 38C30000 */ addi r6, r3, 0
/* 0000B1E0 39000000 */ li r8, 0
/* 0000B1E4 3880001D */ li r4, 0x1d
/* 0000B1E8 48000024 */ b lbl_0000B20C
lbl_0000B1EC:
/* 0000B1EC 88670000 */ lbz r3, 0(r7)
/* 0000B1F0 2C030002 */ cmpwi r3, 2
/* 0000B1F4 4082000C */ bne lbl_0000B200
/* 0000B1F8 90C50000 */ stw r6, 0(r5)
/* 0000B1FC 98860148 */ stb r4, 0x148(r6)
lbl_0000B200:
/* 0000B200 39080001 */ addi r8, r8, 1
/* 0000B204 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B208 38E70001 */ addi r7, r7, 1
lbl_0000B20C:
/* 0000B20C 807C0000 */ lwz r3, 0(r28)
/* 0000B210 7C081800 */ cmpw r8, r3
/* 0000B214 4180FFD8 */ blt lbl_0000B1EC
/* 0000B218 3C600000 */ lis r3, currentBall@ha
/* 0000B21C 38A30000 */ addi r5, r3, currentBall@l
/* 0000B220 90050000 */ stw r0, 0(r5)
/* 0000B224 3C600000 */ lis r3, ballInfo@ha
/* 0000B228 38630000 */ addi r3, r3, ballInfo@l
/* 0000B22C 80FD0000 */ lwz r7, 0(r29)
/* 0000B230 38C30000 */ addi r6, r3, 0
/* 0000B234 39000000 */ li r8, 0
/* 0000B238 48000030 */ b lbl_0000B268
lbl_0000B23C:
/* 0000B23C 88670000 */ lbz r3, 0(r7)
/* 0000B240 2C030002 */ cmpwi r3, 2
/* 0000B244 40820018 */ bne lbl_0000B25C
/* 0000B248 90C50000 */ stw r6, 0(r5)
/* 0000B24C 808600FC */ lwz r4, 0xfc(r6)
/* 0000B250 80640014 */ lwz r3, 0x14(r4)
/* 0000B254 60630020 */ ori r3, r3, 0x20
/* 0000B258 90640014 */ stw r3, 0x14(r4)
lbl_0000B25C:
/* 0000B25C 39080001 */ addi r8, r8, 1
/* 0000B260 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B264 38E70001 */ addi r7, r7, 1
lbl_0000B268:
/* 0000B268 807C0000 */ lwz r3, 0(r28)
/* 0000B26C 7C081800 */ cmpw r8, r3
/* 0000B270 4180FFCC */ blt lbl_0000B23C
/* 0000B274 3C600000 */ lis r3, currentBall@ha
/* 0000B278 3B430000 */ addi r26, r3, currentBall@l
/* 0000B27C 901A0000 */ stw r0, 0(r26)
/* 0000B280 38610008 */ addi r3, r1, 8
/* 0000B284 38800000 */ li r4, 0
/* 0000B288 38A000AC */ li r5, 0xac
/* 0000B28C 4BFF4ED9 */ bl memset
/* 0000B290 3800001E */ li r0, 0x1e
/* 0000B294 B0010010 */ sth r0, 0x10(r1)
/* 0000B298 3C600000 */ lis r3, ballInfo@ha
/* 0000B29C 38030000 */ addi r0, r3, ballInfo@l
/* 0000B2A0 831A0000 */ lwz r24, 0(r26)
/* 0000B2A4 7C190378 */ mr r25, r0
/* 0000B2A8 83BD0000 */ lwz r29, 0(r29)
/* 0000B2AC 3AE00000 */ li r23, 0
/* 0000B2B0 48000034 */ b lbl_0000B2E4
lbl_0000B2B4:
/* 0000B2B4 881D0000 */ lbz r0, 0(r29)
/* 0000B2B8 2C000002 */ cmpwi r0, 2
/* 0000B2BC 4082001C */ bne lbl_0000B2D8
/* 0000B2C0 933A0000 */ stw r25, 0(r26)
/* 0000B2C4 38610008 */ addi r3, r1, 8
/* 0000B2C8 8819002E */ lbz r0, 0x2e(r25)
/* 0000B2CC 7C000774 */ extsb r0, r0
/* 0000B2D0 B001001C */ sth r0, 0x1c(r1)
/* 0000B2D4 4BFF4E91 */ bl spawn_effect
lbl_0000B2D8:
/* 0000B2D8 3AF70001 */ addi r23, r23, 1
/* 0000B2DC 3B3901A4 */ addi r25, r25, 0x1a4
/* 0000B2E0 3BBD0001 */ addi r29, r29, 1
lbl_0000B2E4:
/* 0000B2E4 801C0000 */ lwz r0, 0(r28)
/* 0000B2E8 7C170000 */ cmpw r23, r0
/* 0000B2EC 4180FFC8 */ blt lbl_0000B2B4
/* 0000B2F0 3C600000 */ lis r3, currentBall@ha
/* 0000B2F4 93030000 */ stw r24, currentBall@l(r3)
/* 0000B2F8 48002DCD */ bl lbl_0000E0C4
/* 0000B2FC 4BFF4E69 */ bl reset_camera_viewport
/* 0000B300 3C600000 */ lis r3, currentCamera@ha
/* 0000B304 38830000 */ addi r4, r3, currentCamera@l
/* 0000B308 3C600000 */ lis r3, cameraInfo@ha
/* 0000B30C 80C40000 */ lwz r6, 0(r4)
/* 0000B310 38630000 */ addi r3, r3, cameraInfo@l
/* 0000B314 90640000 */ stw r3, 0(r4)
/* 0000B318 38000006 */ li r0, 6
/* 0000B31C 38A30284 */ addi r5, r3, 0x284
/* 0000B320 9803001F */ stb r0, 0x1f(r3)
/* 0000B324 90A40000 */ stw r5, 0(r4)
/* 0000B328 38A50284 */ addi r5, r5, 0x284
/* 0000B32C 980302A3 */ stb r0, 0x2a3(r3)
/* 0000B330 90A40000 */ stw r5, 0(r4)
/* 0000B334 9805001F */ stb r0, 0x1f(r5)
/* 0000B338 38A50284 */ addi r5, r5, 0x284
/* 0000B33C 90A40000 */ stw r5, 0(r4)
/* 0000B340 9805001F */ stb r0, 0x1f(r5)
/* 0000B344 90C40000 */ stw r6, 0(r4)
/* 0000B348 A87E0000 */ lha r3, 0(r30)
/* 0000B34C 48003B99 */ bl lbl_0000EEE4
/* 0000B350 48003A59 */ bl lbl_0000EDA8
/* 0000B354 48002601 */ bl lbl_0000D954
/* 0000B358 48009FA9 */ bl lbl_00015300
/* 0000B35C 4800C46D */ bl lbl_000177C8
/* 0000B360 38600030 */ li r3, 0x30
/* 0000B364 38800000 */ li r4, 0
/* 0000B368 4BFF4DFD */ bl u_play_music
/* 0000B36C A8BB0000 */ lha r5, 0(r27)
/* 0000B370 3C60AAAB */ lis r3, 0xaaab
/* 0000B374 3803AAAB */ addi r0, r3, -21845
/* 0000B378 38A50001 */ addi r5, r5, 1
/* 0000B37C 7C002816 */ mulhwu r0, r0, r5
/* 0000B380 5400F87E */ srwi r0, r0, 1
/* 0000B384 1C000003 */ mulli r0, r0, 3
/* 0000B388 7C002850 */ subf r0, r0, r5
/* 0000B38C 7C7F0214 */ add r3, r31, r0
/* 0000B390 88030054 */ lbz r0, 0x54(r3)
/* 0000B394 3C800000 */ lis r4, lbl_0001CC38@ha
/* 0000B398 3C600000 */ lis r3, currStageId@ha
/* 0000B39C 7C050774 */ extsb r5, r0
/* 0000B3A0 A8030000 */ lha r0, currStageId@l(r3)
/* 0000B3A4 54A5103A */ slwi r5, r5, 2
/* 0000B3A8 38640000 */ addi r3, r4, lbl_0001CC38@l
/* 0000B3AC 7C632A14 */ add r3, r3, r5
/* 0000B3B0 A8630002 */ lha r3, 2(r3)
/* 0000B3B4 7C030000 */ cmpw r3, r0
/* 0000B3B8 41820008 */ beq lbl_0000B3C0
/* 0000B3BC 4BFF4DA9 */ bl preload_stage_files
lbl_0000B3C0:
/* 0000B3C0 BAE100C4 */ lmw r23, 0xc4(r1)
/* 0000B3C4 800100EC */ lwz r0, 0xec(r1)
/* 0000B3C8 382100E8 */ addi r1, r1, 0xe8
/* 0000B3CC 7C0803A6 */ mtlr r0
/* 0000B3D0 4E800020 */ blr 
