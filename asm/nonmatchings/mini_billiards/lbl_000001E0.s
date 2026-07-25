/* 000001E0 7C0802A6 */ mflr r0
/* 000001E4 3C600000 */ lis r3, lbl_0001C2B8@ha
/* 000001E8 90010004 */ stw r0, 4(r1)
/* 000001EC 3C800000 */ lis r4, lbl_10000000@ha
/* 000001F0 9421FFD0 */ stwu r1, -0x30(r1)
/* 000001F4 BF61001C */ stmw r27, 0x1c(r1)
/* 000001F8 3BA30000 */ addi r29, r3, lbl_0001C2B8@l
/* 000001FC 3C600000 */ lis r3, lbl_00020DA0@ha
/* 00000200 3BE30000 */ addi r31, r3, lbl_00020DA0@l
/* 00000204 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00000208 386000B4 */ li r3, 0xb4
/* 0000020C 4BFFFF29 */ bl load_stage
/* 00000210 38000000 */ li r0, 0
/* 00000214 2C000010 */ cmpwi r0, 0x10
/* 00000218 40800048 */ bge lbl_00000260
/* 0000021C 3800FFFF */ li r0, -1
/* 00000220 901E0064 */ stw r0, 0x64(r30)
/* 00000224 901E0068 */ stw r0, 0x68(r30)
/* 00000228 901E006C */ stw r0, 0x6c(r30)
/* 0000022C 901E0070 */ stw r0, 0x70(r30)
/* 00000230 901E0074 */ stw r0, 0x74(r30)
/* 00000234 901E0078 */ stw r0, 0x78(r30)
/* 00000238 901E007C */ stw r0, 0x7c(r30)
/* 0000023C 901E0080 */ stw r0, 0x80(r30)
/* 00000240 901E0084 */ stw r0, 0x84(r30)
/* 00000244 901E0088 */ stw r0, 0x88(r30)
/* 00000248 901E008C */ stw r0, 0x8c(r30)
/* 0000024C 901E0090 */ stw r0, 0x90(r30)
/* 00000250 901E0094 */ stw r0, 0x94(r30)
/* 00000254 901E0098 */ stw r0, 0x98(r30)
/* 00000258 901E009C */ stw r0, 0x9c(r30)
/* 0000025C 901E00A0 */ stw r0, 0xa0(r30)
lbl_00000260:
/* 00000260 4BFFFED5 */ bl event_finish_all
/* 00000264 4BFFFED1 */ bl free_all_bitmap_groups_except_com
/* 00000268 4BFFFECD */ bl func_800249D4
/* 0000026C 3C600000 */ lis r3, stageHeap@ha
/* 00000270 3B830000 */ addi r28, r3, stageHeap@l
/* 00000274 807C0000 */ lwz r3, 0(r28)
/* 00000278 4BFFFEBD */ bl OSSetCurrentHeap
/* 0000027C 3B630000 */ addi r27, r3, 0
/* 00000280 38600009 */ li r3, 9
/* 00000284 4BFFFEB1 */ bl SoundGroupLoad
/* 00000288 7F63DB78 */ mr r3, r27
/* 0000028C 4BFFFEA9 */ bl OSSetCurrentHeap
/* 00000290 38600008 */ li r3, 8
/* 00000294 4BFFFEA1 */ bl call_bitmap_load_group
/* 00000298 807C0000 */ lwz r3, 0(r28)
/* 0000029C 4BFFFE99 */ bl OSSetCurrentHeap
/* 000002A0 3B830000 */ addi r28, r3, 0
/* 000002A4 38600006 */ li r3, 6
/* 000002A8 4BFFFE8D */ bl u_load_minigame_graphics
/* 000002AC 7F83E378 */ mr r3, r28
/* 000002B0 4BFFFE85 */ bl OSSetCurrentHeap
/* 000002B4 38600010 */ li r3, 0x10
/* 000002B8 4BFFFE7D */ bl event_start
/* 000002BC 38600012 */ li r3, 0x12
/* 000002C0 4BFFFE75 */ bl event_start
/* 000002C4 38600013 */ li r3, 0x13
/* 000002C8 4BFFFE6D */ bl event_start
/* 000002CC 3860000B */ li r3, 0xb
/* 000002D0 4BFFFE65 */ bl event_start
/* 000002D4 3C600000 */ lis r3, currStageId@ha
/* 000002D8 38630000 */ addi r3, r3, currStageId@l
/* 000002DC A8630000 */ lha r3, 0(r3)
/* 000002E0 4BFFFE55 */ bl light_init
/* 000002E4 3C600000 */ lis r3, g_poolInfo@ha
/* 000002E8 38830000 */ addi r4, r3, g_poolInfo@l
/* 000002EC 3C600000 */ lis r3, worldInfo@ha
/* 000002F0 80C4000C */ lwz r6, 0xc(r4)
/* 000002F4 38030000 */ addi r0, r3, worldInfo@l
/* 000002F8 7C050378 */ mr r5, r0
/* 000002FC 38E00000 */ li r7, 0
/* 00000300 38600001 */ li r3, 1
/* 00000304 48000020 */ b lbl_00000324
lbl_00000308:
/* 00000308 88060000 */ lbz r0, 0(r6)
/* 0000030C 2C000002 */ cmpwi r0, 2
/* 00000310 40820008 */ bne lbl_00000318
/* 00000314 98650008 */ stb r3, 8(r5)
lbl_00000318:
/* 00000318 38E70001 */ addi r7, r7, 1
/* 0000031C 38A50040 */ addi r5, r5, 0x40
/* 00000320 38C60001 */ addi r6, r6, 1
lbl_00000324:
/* 00000324 80040008 */ lwz r0, 8(r4)
/* 00000328 7C070000 */ cmpw r7, r0
/* 0000032C 4180FFDC */ blt lbl_00000308
/* 00000330 38600000 */ li r3, 0
/* 00000334 4BFFFE01 */ bl camera_set_state_all
/* 00000338 4BFFFDFD */ bl recplay_init_first
/* 0000033C 3C600000 */ lis r3, currStageId@ha
/* 00000340 38630000 */ addi r3, r3, currStageId@l
/* 00000344 A8630000 */ lha r3, 0(r3)
/* 00000348 4BFFFDED */ bl light_init
/* 0000034C 3B800000 */ li r28, 0
lbl_00000350:
/* 00000350 C03D08B4 */ lfs f1, 0x8b4(r29)
/* 00000354 7F83E378 */ mr r3, r28
/* 00000358 C07D08B8 */ lfs f3, 0x8b8(r29)
/* 0000035C FC400890 */ fmr f2, f1
/* 00000360 FC801890 */ fmr f4, f3
/* 00000364 4BFFFDD1 */ bl setup_camera_viewport
/* 00000368 3B9C0001 */ addi r28, r28, 1
/* 0000036C 2C1C0004 */ cmpwi r28, 4
/* 00000370 4180FFE0 */ blt lbl_00000350
/* 00000374 38600100 */ li r3, 0x100
/* 00000378 38800000 */ li r4, 0
/* 0000037C 38A0003C */ li r5, 0x3c
/* 00000380 4BFFFDB5 */ bl start_screen_fade
/* 00000384 3C600000 */ lis r3, submodeFinishFunc@ha
/* 00000388 38830000 */ addi r4, r3, submodeFinishFunc@l
/* 0000038C 3B800000 */ li r28, 0
/* 00000390 93840000 */ stw r28, 0(r4)
/* 00000394 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00000398 3800009D */ li r0, 0x9d
/* 0000039C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000003A0 38600034 */ li r3, 0x34
/* 000003A4 38800000 */ li r4, 0
/* 000003A8 4BFFFD8D */ bl u_play_music
/* 000003AC 3860000F */ li r3, 0xf
/* 000003B0 4BFFFD85 */ bl event_start
/* 000003B4 38600041 */ li r3, 0x41
/* 000003B8 4BFFFD7D */ bl camera_set_state_all
/* 000003BC 3C600000 */ lis r3, currentCamera@ha
/* 000003C0 38A30000 */ addi r5, r3, currentCamera@l
/* 000003C4 80650000 */ lwz r3, 0(r5)
/* 000003C8 38800042 */ li r4, 0x42
/* 000003CC 3800001A */ li r0, 0x1a
/* 000003D0 988302A2 */ stb r4, 0x2a2(r3)
/* 000003D4 3860C000 */ li r3, -16384
/* 000003D8 3880000A */ li r4, 0xa
/* 000003DC 7C0903A6 */ mtctr r0
/* 000003E0 B07E004A */ sth r3, 0x4a(r30)
/* 000003E4 7FA6EB78 */ mr r6, r29
/* 000003E8 B39E004C */ sth r28, 0x4c(r30)
/* 000003EC 38FE00A4 */ addi r7, r30, 0xa4
/* 000003F0 B39E004E */ sth r28, 0x4e(r30)
/* 000003F4 C01D08BC */ lfs f0, 0x8bc(r29)
/* 000003F8 D01E0050 */ stfs f0, 0x50(r30)
/* 000003FC C01D08B4 */ lfs f0, 0x8b4(r29)
/* 00000400 D01F0000 */ stfs f0, 0(r31)
/* 00000404 C01D08B4 */ lfs f0, 0x8b4(r29)
/* 00000408 D01F0004 */ stfs f0, 4(r31)
/* 0000040C C01D08B4 */ lfs f0, 0x8b4(r29)
/* 00000410 D01F0008 */ stfs f0, 8(r31)
/* 00000414 9B9E0049 */ stb r28, 0x49(r30)
/* 00000418 80650000 */ lwz r3, 0(r5)
/* 0000041C 98830026 */ stb r4, 0x26(r3)
/* 00000420 80650000 */ lwz r3, 0(r5)
/* 00000424 A8030024 */ lha r0, 0x24(r3)
/* 00000428 60000010 */ ori r0, r0, 0x10
/* 0000042C B0030024 */ sth r0, 0x24(r3)
/* 00000430 80650000 */ lwz r3, 0(r5)
/* 00000434 988302AA */ stb r4, 0x2aa(r3)
/* 00000438 80650000 */ lwz r3, 0(r5)
/* 0000043C A80302A8 */ lha r0, 0x2a8(r3)
/* 00000440 60000010 */ ori r0, r0, 0x10
/* 00000444 B00302A8 */ sth r0, 0x2a8(r3)
lbl_00000448:
/* 00000448 C0060000 */ lfs f0, 0(r6)
/* 0000044C D0070000 */ stfs f0, 0(r7)
/* 00000450 C0060004 */ lfs f0, 4(r6)
/* 00000454 D0070004 */ stfs f0, 4(r7)
/* 00000458 C0060008 */ lfs f0, 8(r6)
/* 0000045C D0070008 */ stfs f0, 8(r7)
/* 00000460 C006000C */ lfs f0, 0xc(r6)
/* 00000464 D007000C */ stfs f0, 0xc(r7)
/* 00000468 C01D08B4 */ lfs f0, 0x8b4(r29)
/* 0000046C D0070010 */ stfs f0, 0x10(r7)
/* 00000470 C01D08B8 */ lfs f0, 0x8b8(r29)
/* 00000474 D0070014 */ stfs f0, 0x14(r7)
/* 00000478 C01D08B4 */ lfs f0, 0x8b4(r29)
/* 0000047C D0070018 */ stfs f0, 0x18(r7)
/* 00000480 C01D08C0 */ lfs f0, 0x8c0(r29)
/* 00000484 D007001C */ stfs f0, 0x1c(r7)
/* 00000488 C0060010 */ lfs f0, 0x10(r6)
/* 0000048C D0070020 */ stfs f0, 0x20(r7)
/* 00000490 C0060014 */ lfs f0, 0x14(r6)
/* 00000494 D0070024 */ stfs f0, 0x24(r7)
/* 00000498 C0060018 */ lfs f0, 0x18(r6)
/* 0000049C D0070028 */ stfs f0, 0x28(r7)
/* 000004A0 C006001C */ lfs f0, 0x1c(r6)
/* 000004A4 D007002C */ stfs f0, 0x2c(r7)
/* 000004A8 C0060028 */ lfs f0, 0x28(r6)
/* 000004AC D0070030 */ stfs f0, 0x30(r7)
/* 000004B0 C006002C */ lfs f0, 0x2c(r6)
/* 000004B4 D0070034 */ stfs f0, 0x34(r7)
/* 000004B8 C0060030 */ lfs f0, 0x30(r6)
/* 000004BC D0070038 */ stfs f0, 0x38(r7)
/* 000004C0 C0060034 */ lfs f0, 0x34(r6)
/* 000004C4 38C60028 */ addi r6, r6, 0x28
/* 000004C8 D007003C */ stfs f0, 0x3c(r7)
/* 000004CC C01D08B4 */ lfs f0, 0x8b4(r29)
/* 000004D0 D0070040 */ stfs f0, 0x40(r7)
/* 000004D4 C01D08B8 */ lfs f0, 0x8b8(r29)
/* 000004D8 D0070044 */ stfs f0, 0x44(r7)
/* 000004DC 38E70030 */ addi r7, r7, 0x30
/* 000004E0 C01D08B4 */ lfs f0, 0x8b4(r29)
/* 000004E4 D0070018 */ stfs f0, 0x18(r7)
/* 000004E8 C01D08C0 */ lfs f0, 0x8c0(r29)
/* 000004EC D007001C */ stfs f0, 0x1c(r7)
/* 000004F0 C0060010 */ lfs f0, 0x10(r6)
/* 000004F4 D0070020 */ stfs f0, 0x20(r7)
/* 000004F8 C0060014 */ lfs f0, 0x14(r6)
/* 000004FC D0070024 */ stfs f0, 0x24(r7)
/* 00000500 C0060018 */ lfs f0, 0x18(r6)
/* 00000504 D0070028 */ stfs f0, 0x28(r7)
/* 00000508 C006001C */ lfs f0, 0x1c(r6)
/* 0000050C 38C60028 */ addi r6, r6, 0x28
/* 00000510 D007002C */ stfs f0, 0x2c(r7)
/* 00000514 38E70030 */ addi r7, r7, 0x30
/* 00000518 4200FF30 */ bdnz lbl_00000448
/* 0000051C 3BE00000 */ li r31, 0
/* 00000520 1C9F01A4 */ mulli r4, r31, 0x1a4
/* 00000524 3C600000 */ lis r3, ballInfo@ha
/* 00000528 38030000 */ addi r0, r3, ballInfo@l
/* 0000052C 7F802214 */ add r28, r0, r4
/* 00000530 3BBF0000 */ addi r29, r31, 0
lbl_00000534:
/* 00000534 7F83E378 */ mr r3, r28
/* 00000538 4BFFFBFD */ bl u_ball_init_2
/* 0000053C 3BFF0001 */ addi r31, r31, 1
/* 00000540 93BC0094 */ stw r29, 0x94(r28)
/* 00000544 2C1F0004 */ cmpwi r31, 4
/* 00000548 3B9C01A4 */ addi r28, r28, 0x1a4
/* 0000054C 4180FFE8 */ blt lbl_00000534
/* 00000550 480002B1 */ bl lbl_00000800
/* 00000554 3BA00000 */ li r29, 0
/* 00000558 9BBE0060 */ stb r29, 0x60(r30)
/* 0000055C 480000B9 */ bl lbl_00000614
/* 00000560 480001F5 */ bl lbl_00000754
/* 00000564 9BBE0010 */ stb r29, 0x10(r30)
/* 00000568 3C600000 */ lis r3, dipSwitches@ha
/* 0000056C 93BE0020 */ stw r29, 0x20(r30)
/* 00000570 881E000A */ lbz r0, 0xa(r30)
/* 00000574 981E000B */ stb r0, 0xb(r30)
/* 00000578 80030000 */ lwz r0, dipSwitches@l(r3)
/* 0000057C 540007FF */ clrlwi. r0, r0, 0x1f
/* 00000580 41820020 */ beq lbl_000005A0
/* 00000584 3C600000 */ lis r3, controllerInfo@ha
/* 00000588 A0030000 */ lhz r0, controllerInfo@l(r3)
/* 0000058C 540006F7 */ rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 00000590 41820010 */ beq lbl_000005A0
/* 00000594 38000001 */ li r0, 1
/* 00000598 981E000A */ stb r0, 0xa(r30)
/* 0000059C 4800000C */ b lbl_000005A8
lbl_000005A0:
/* 000005A0 38000000 */ li r0, 0
/* 000005A4 981E000A */ stb r0, 0xa(r30)
lbl_000005A8:
/* 000005A8 38800001 */ li r4, 1
/* 000005AC 989E000C */ stb r4, 0xc(r30)
/* 000005B0 38000000 */ li r0, 0
/* 000005B4 3C600000 */ lis r3, lbl_802F1C32@ha
/* 000005B8 989E000D */ stb r4, 0xd(r30)
/* 000005BC 981E0A64 */ stb r0, 0xa64(r30)
/* 000005C0 981E0A66 */ stb r0, 0xa66(r30)
/* 000005C4 B01E0A68 */ sth r0, 0xa68(r30)
/* 000005C8 989E0A67 */ stb r4, 0xa67(r30)
/* 000005CC 989E0A6A */ stb r4, 0xa6a(r30)
/* 000005D0 981E0A6C */ stb r0, 0xa6c(r30)
/* 000005D4 B01E0A6E */ sth r0, 0xa6e(r30)
/* 000005D8 989E0A6D */ stb r4, 0xa6d(r30)
/* 000005DC 98030000 */ stb r0, lbl_802F1C32@l(r3)
/* 000005E0 981E0011 */ stb r0, 0x11(r30)
/* 000005E4 981E0004 */ stb r0, 4(r30)
/* 000005E8 981E0012 */ stb r0, 0x12(r30)
/* 000005EC 981E0013 */ stb r0, 0x13(r30)
/* 000005F0 981E0014 */ stb r0, 0x14(r30)
/* 000005F4 981E0015 */ stb r0, 0x15(r30)
/* 000005F8 901E0024 */ stw r0, 0x24(r30)
/* 000005FC 48007679 */ bl lbl_00007C74
/* 00000600 BB61001C */ lmw r27, 0x1c(r1)
/* 00000604 80010034 */ lwz r0, 0x34(r1)
/* 00000608 38210030 */ addi r1, r1, 0x30
/* 0000060C 7C0803A6 */ mtlr r0
/* 00000610 4E800020 */ blr 
