/* 000001F8 7C0802A6 */ mflr r0
/* 000001FC 3C800000 */ lis r4, lbl_10000000@ha
/* 00000200 90010004 */ stw r0, 4(r1)
/* 00000204 3C600000 */ lis r3, lbl_0000BE80@ha
/* 00000208 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000020C 93E10014 */ stw r31, 0x14(r1)
/* 00000210 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00000214 93C10010 */ stw r30, 0x10(r1)
/* 00000218 93A1000C */ stw r29, 0xc(r1)
/* 0000021C 3BA30000 */ addi r29, r3, lbl_0000BE80@l
/* 00000220 4BFFFF2D */ bl event_finish_all
/* 00000224 4BFFFF29 */ bl free_all_bitmap_groups_except_com
/* 00000228 4BFFFF25 */ bl func_800249D4
/* 0000022C 4BFFFF21 */ bl unload_stage
/* 00000230 3860000E */ li r3, 0xe
/* 00000234 4BFFFF19 */ bl SoundGroupLoad
/* 00000238 3C600000 */ lis r3, stageHeap@ha
/* 0000023C 38630000 */ addi r3, r3, stageHeap@l
/* 00000240 80630000 */ lwz r3, 0(r3)
/* 00000244 4BFFFF09 */ bl OSSetCurrentHeap
/* 00000248 3BC30000 */ addi r30, r3, 0
/* 0000024C 3860000B */ li r3, 0xb
/* 00000250 4BFFFEFD */ bl bitmap_load_group
/* 00000254 7FC3F378 */ mr r3, r30
/* 00000258 4BFFFEF5 */ bl OSSetCurrentHeap
/* 0000025C 4BFFFEF1 */ bl u_init_player_data_1
/* 00000260 480003E9 */ bl lbl_00000648
/* 00000264 3C800000 */ lis r4, lbl_00004024@ha
/* 00000268 3C600000 */ lis r3, lbl_802F1FD4@ha
/* 0000026C 38040000 */ addi r0, r4, lbl_00004024@l
/* 00000270 90030000 */ stw r0, lbl_802F1FD4@l(r3)
/* 00000274 3BC00000 */ li r30, 0
lbl_00000278:
/* 00000278 C03D0030 */ lfs f1, 0x30(r29)
/* 0000027C 7FC3F378 */ mr r3, r30
/* 00000280 C07D0034 */ lfs f3, 0x34(r29)
/* 00000284 FC400890 */ fmr f2, f1
/* 00000288 FC801890 */ fmr f4, f3
/* 0000028C 4BFFFEC1 */ bl setup_camera_viewport
/* 00000290 3BDE0001 */ addi r30, r30, 1
/* 00000294 2C1E0004 */ cmpwi r30, 4
/* 00000298 4180FFE0 */ blt lbl_00000278
/* 0000029C 3C600000 */ lis r3, lbl_802F1FF4@ha
/* 000002A0 38830000 */ addi r4, r3, lbl_802F1FF4@l
/* 000002A4 3800FFFF */ li r0, -1
/* 000002A8 B0040000 */ sth r0, 0(r4)
/* 000002AC 3C600000 */ lis r3, lbl_802F1FF6@ha
/* 000002B0 38000000 */ li r0, 0
/* 000002B4 B0030000 */ sth r0, lbl_802F1FF6@l(r3)
/* 000002B8 48000229 */ bl lbl_000004E0
/* 000002BC 38600043 */ li r3, 0x43
/* 000002C0 4BFFFE8D */ bl camera_set_state_all
/* 000002C4 3C800000 */ lis r4, currentBall@ha
/* 000002C8 3C600000 */ lis r3, g_poolInfo@ha
/* 000002CC 38A40000 */ addi r5, r4, currentBall@l
/* 000002D0 38830000 */ addi r4, r3, g_poolInfo@l
/* 000002D4 80E50000 */ lwz r7, 0(r5)
/* 000002D8 3C600000 */ lis r3, ballInfo@ha
/* 000002DC 8104000C */ lwz r8, 0xc(r4)
/* 000002E0 38030000 */ addi r0, r3, ballInfo@l
/* 000002E4 7C060378 */ mr r6, r0
/* 000002E8 39200000 */ li r9, 0
/* 000002EC 38600001 */ li r3, 1
/* 000002F0 48000024 */ b lbl_00000314
lbl_000002F4:
/* 000002F4 88080000 */ lbz r0, 0(r8)
/* 000002F8 2C000002 */ cmpwi r0, 2
/* 000002FC 4082000C */ bne lbl_00000308
/* 00000300 90C50000 */ stw r6, 0(r5)
/* 00000304 98660003 */ stb r3, 3(r6)
lbl_00000308:
/* 00000308 39290001 */ addi r9, r9, 1
/* 0000030C 38C601A4 */ addi r6, r6, 0x1a4
/* 00000310 39080001 */ addi r8, r8, 1
lbl_00000314:
/* 00000314 80040008 */ lwz r0, 8(r4)
/* 00000318 7C090000 */ cmpw r9, r0
/* 0000031C 4180FFD8 */ blt lbl_000002F4
/* 00000320 3C600000 */ lis r3, currentBall@ha
/* 00000324 90E30000 */ stw r7, currentBall@l(r3)
/* 00000328 38600100 */ li r3, 0x100
/* 0000032C 38800000 */ li r4, 0
/* 00000330 38A0001E */ li r5, 0x1e
/* 00000334 4BFFFE19 */ bl start_screen_fade
/* 00000338 38600032 */ li r3, 0x32
/* 0000033C 38800000 */ li r4, 0
/* 00000340 4BFFFE0D */ bl u_play_music
/* 00000344 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000348 38830000 */ addi r4, r3, gameSubmodeRequest@l
/* 0000034C 3800009B */ li r0, 0x9b
/* 00000350 3C600000 */ lis r3, stageHeap@ha
/* 00000354 B0040000 */ sth r0, 0(r4)
/* 00000358 3BA30000 */ addi r29, r3, stageHeap@l
/* 0000035C 3FC00001 */ lis r30, 1
/* 00000360 807D0000 */ lwz r3, 0(r29)
/* 00000364 389EA00C */ addi r4, r30, -24564
/* 00000368 4BFFFDE5 */ bl OSAllocFromHeap
/* 0000036C 907F0038 */ stw r3, 0x38(r31)
/* 00000370 389E400C */ addi r4, r30, 0x400c
/* 00000374 807D0000 */ lwz r3, 0(r29)
/* 00000378 4BFFFDD5 */ bl OSAllocFromHeap
/* 0000037C 907F003C */ stw r3, 0x3c(r31)
/* 00000380 38800400 */ li r4, 0x400
/* 00000384 807F0038 */ lwz r3, 0x38(r31)
/* 00000388 4800ABE1 */ bl lbl_0000AF68
/* 0000038C 807F003C */ lwz r3, 0x3c(r31)
/* 00000390 38800800 */ li r4, 0x800
/* 00000394 4800ABD5 */ bl lbl_0000AF68
/* 00000398 8001001C */ lwz r0, 0x1c(r1)
/* 0000039C 83E10014 */ lwz r31, 0x14(r1)
/* 000003A0 83C10010 */ lwz r30, 0x10(r1)
/* 000003A4 7C0803A6 */ mtlr r0
/* 000003A8 83A1000C */ lwz r29, 0xc(r1)
/* 000003AC 38210018 */ addi r1, r1, 0x18
/* 000003B0 4E800020 */ blr 
