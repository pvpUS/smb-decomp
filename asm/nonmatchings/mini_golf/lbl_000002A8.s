/* 000002A8 7C0802A6 */ mflr r0
/* 000002AC 3C600000 */ lis r3, modeCtrl@ha
/* 000002B0 90010004 */ stw r0, 4(r1)
/* 000002B4 38000008 */ li r0, 8
/* 000002B8 3C800000 */ lis r4, lbl_10000000@ha
/* 000002BC 9421FFD8 */ stwu r1, -0x28(r1)
/* 000002C0 BF610014 */ stmw r27, 0x14(r1)
/* 000002C4 3B630000 */ addi r27, r3, modeCtrl@l
/* 000002C8 3C600000 */ lis r3, lbl_000260F0@ha
/* 000002CC 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000002D0 3BE30000 */ addi r31, r3, lbl_000260F0@l
/* 000002D4 901B0028 */ stw r0, 0x28(r27)
/* 000002D8 4BFFFEF9 */ bl event_finish_all
/* 000002DC 4BFFFEF5 */ bl free_all_bitmap_groups_except_com
/* 000002E0 4BFFFEF1 */ bl func_800249D4
/* 000002E4 3860000C */ li r3, 0xc
/* 000002E8 4BFFFEE9 */ bl SoundGroupLoad
/* 000002EC 38600005 */ li r3, 5
/* 000002F0 4BFFFEE1 */ bl u_load_minigame_graphics
/* 000002F4 3860000A */ li r3, 0xa
/* 000002F8 4BFFFED9 */ bl call_bitmap_load_group
/* 000002FC 3C600000 */ lis r3, g_poolInfo@ha
/* 00000300 38630000 */ addi r3, r3, g_poolInfo@l
/* 00000304 3BA3000C */ addi r29, r3, 0xc
/* 00000308 8063000C */ lwz r3, 0xc(r3)
/* 0000030C 38000000 */ li r0, 0
/* 00000310 3B7B0024 */ addi r27, r27, 0x24
/* 00000314 98030000 */ stb r0, 0(r3)
/* 00000318 38A00000 */ li r5, 0
/* 0000031C 38800002 */ li r4, 2
/* 00000320 807D0000 */ lwz r3, 0(r29)
/* 00000324 98030001 */ stb r0, 1(r3)
/* 00000328 807D0000 */ lwz r3, 0(r29)
/* 0000032C 98030002 */ stb r0, 2(r3)
/* 00000330 807D0000 */ lwz r3, 0(r29)
/* 00000334 98030003 */ stb r0, 3(r3)
/* 00000338 48000010 */ b lbl_00000348
lbl_0000033C:
/* 0000033C 807D0000 */ lwz r3, 0(r29)
/* 00000340 7C8329AE */ stbx r4, r3, r5
/* 00000344 38A50001 */ addi r5, r5, 1
lbl_00000348:
/* 00000348 801B0000 */ lwz r0, 0(r27)
/* 0000034C 7C050000 */ cmpw r5, r0
/* 00000350 4180FFEC */ blt lbl_0000033C
/* 00000354 3C600000 */ lis r3, modeCtrl@ha
/* 00000358 38630000 */ addi r3, r3, modeCtrl@l
/* 0000035C 38000000 */ li r0, 0
/* 00000360 9003002C */ stw r0, 0x2c(r3)
/* 00000364 3CA00000 */ lis r5, ballInfo@ha
/* 00000368 38E50000 */ addi r7, r5, ballInfo@l
/* 0000036C 8003002C */ lwz r0, 0x2c(r3)
/* 00000370 3B83002C */ addi r28, r3, 0x2c
/* 00000374 3CC00000 */ lis r6, currentBall@ha
/* 00000378 1D0001A4 */ mulli r8, r0, 0x1a4
/* 0000037C 7CE74214 */ add r7, r7, r8
/* 00000380 1CA00284 */ mulli r5, r0, 0x284
/* 00000384 90E60000 */ stw r7, currentBall@l(r6)
/* 00000388 3C800000 */ lis r4, cameraInfo@ha
/* 0000038C 38040000 */ addi r0, r4, cameraInfo@l
/* 00000390 3C600000 */ lis r3, currentCamera@ha
/* 00000394 7C002A14 */ add r0, r0, r5
/* 00000398 90030000 */ stw r0, currentCamera@l(r3)
/* 0000039C 4BFFFE35 */ bl u_init_player_data_1
/* 000003A0 4BFFFE31 */ bl func_80044920
/* 000003A4 386000A7 */ li r3, 0xa7
/* 000003A8 4BFFFE29 */ bl load_stage
/* 000003AC 38600001 */ li r3, 1
/* 000003B0 4BFFFE21 */ bl event_start
/* 000003B4 38600002 */ li r3, 2
/* 000003B8 4BFFFE19 */ bl event_start
/* 000003BC 38600003 */ li r3, 3
/* 000003C0 4BFFFE11 */ bl event_start
/* 000003C4 38600004 */ li r3, 4
/* 000003C8 4BFFFE09 */ bl event_start
/* 000003CC 38600009 */ li r3, 9
/* 000003D0 4BFFFE01 */ bl event_start
/* 000003D4 38600007 */ li r3, 7
/* 000003D8 4BFFFDF9 */ bl event_start
/* 000003DC 3860000F */ li r3, 0xf
/* 000003E0 4BFFFDF1 */ bl event_start
/* 000003E4 38600010 */ li r3, 0x10
/* 000003E8 4BFFFDE9 */ bl event_start
/* 000003EC 38600012 */ li r3, 0x12
/* 000003F0 4BFFFDE1 */ bl event_start
/* 000003F4 3860000B */ li r3, 0xb
/* 000003F8 4BFFFDD9 */ bl event_start
/* 000003FC 3860000D */ li r3, 0xd
/* 00000400 4BFFFDD1 */ bl event_start
/* 00000404 38600013 */ li r3, 0x13
/* 00000408 4BFFFDC9 */ bl event_start
/* 0000040C 3C600000 */ lis r3, worldInfo@ha
/* 00000410 80DD0000 */ lwz r6, 0(r29)
/* 00000414 38030000 */ addi r0, r3, worldInfo@l
/* 00000418 3C600000 */ lis r3, g_poolInfo@ha
/* 0000041C 7C050378 */ mr r5, r0
/* 00000420 38630000 */ addi r3, r3, g_poolInfo@l
/* 00000424 38E00000 */ li r7, 0
/* 00000428 38800001 */ li r4, 1
/* 0000042C 48000020 */ b lbl_0000044C
lbl_00000430:
/* 00000430 88060000 */ lbz r0, 0(r6)
/* 00000434 2C000002 */ cmpwi r0, 2
/* 00000438 40820008 */ bne lbl_00000440
/* 0000043C 98850008 */ stb r4, 8(r5)
lbl_00000440:
/* 00000440 38E70001 */ addi r7, r7, 1
/* 00000444 38A50040 */ addi r5, r5, 0x40
/* 00000448 38C60001 */ addi r6, r6, 1
lbl_0000044C:
/* 0000044C 80030008 */ lwz r0, 8(r3)
/* 00000450 7C070000 */ cmpw r7, r0
/* 00000454 4180FFDC */ blt lbl_00000430
/* 00000458 38600040 */ li r3, 0x40
/* 0000045C 4BFFFD75 */ bl camera_set_state_all
/* 00000460 3BA00000 */ li r29, 0
lbl_00000464:
/* 00000464 C03F0000 */ lfs f1, 0(r31)
/* 00000468 7FA3EB78 */ mr r3, r29
/* 0000046C FC400890 */ fmr f2, f1
/* 00000470 FC600890 */ fmr f3, f1
/* 00000474 FC800890 */ fmr f4, f1
/* 00000478 4BFFFD59 */ bl setup_camera_viewport
/* 0000047C 3BBD0001 */ addi r29, r29, 1
/* 00000480 2C1D0004 */ cmpwi r29, 4
/* 00000484 4180FFE0 */ blt lbl_00000464
/* 00000488 807C0000 */ lwz r3, 0(r28)
/* 0000048C 3C800000 */ lis r4, cameraInfo@ha
/* 00000490 38A40000 */ addi r5, r4, cameraInfo@l
/* 00000494 38830001 */ addi r4, r3, 1
/* 00000498 7C801670 */ srawi r0, r4, 2
/* 0000049C 7C000194 */ addze r0, r0
/* 000004A0 5400103A */ slwi r0, r0, 2
/* 000004A4 7C002010 */ subfc r0, r0, r4
/* 000004A8 1C830284 */ mulli r4, r3, 0x284
/* 000004AC 38C5001F */ addi r6, r5, 0x1f
/* 000004B0 38A00000 */ li r5, 0
/* 000004B4 7CA621AE */ stbx r5, r6, r4
/* 000004B8 1C000284 */ mulli r0, r0, 0x284
/* 000004BC 38800009 */ li r4, 9
/* 000004C0 7C8601AE */ stbx r4, r6, r0
/* 000004C4 C03F0000 */ lfs f1, 0(r31)
/* 000004C8 C07F0004 */ lfs f3, 4(r31)
/* 000004CC FC400890 */ fmr f2, f1
/* 000004D0 FC801890 */ fmr f4, f3
/* 000004D4 4BFFFCFD */ bl setup_camera_viewport
/* 000004D8 807C0000 */ lwz r3, 0(r28)
/* 000004DC C03F0008 */ lfs f1, 8(r31)
/* 000004E0 38030001 */ addi r0, r3, 1
/* 000004E4 C05F0000 */ lfs f2, 0(r31)
/* 000004E8 7C031670 */ srawi r3, r0, 2
/* 000004EC C07F000C */ lfs f3, 0xc(r31)
/* 000004F0 7C630194 */ addze r3, r3
/* 000004F4 C09F0010 */ lfs f4, 0x10(r31)
/* 000004F8 5463103A */ slwi r3, r3, 2
/* 000004FC 7C630010 */ subfc r3, r3, r0
/* 00000500 4BFFFCD1 */ bl setup_camera_viewport
/* 00000504 4BFFFCCD */ bl info_init_first
/* 00000508 38600100 */ li r3, 0x100
/* 0000050C 38800000 */ li r4, 0
/* 00000510 38A0003C */ li r5, 0x3c
/* 00000514 4BFFFCBD */ bl start_screen_fade
/* 00000518 38000001 */ li r0, 1
/* 0000051C 901E0000 */ stw r0, 0(r30)
/* 00000520 38000003 */ li r0, 3
/* 00000524 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00000528 B01E0028 */ sth r0, 0x28(r30)
/* 0000052C 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00000530 80630000 */ lwz r3, 0(r3)
/* 00000534 80830088 */ lwz r4, 0x88(r3)
/* 00000538 28040000 */ cmplwi r4, 0
/* 0000053C 4182001C */ beq lbl_00000558
/* 00000540 80640000 */ lwz r3, 0(r4)
/* 00000544 80040004 */ lwz r0, 4(r4)
/* 00000548 907E005C */ stw r3, 0x5c(r30)
/* 0000054C 901E0060 */ stw r0, 0x60(r30)
/* 00000550 80040008 */ lwz r0, 8(r4)
/* 00000554 901E0064 */ stw r0, 0x64(r30)
lbl_00000558:
/* 00000558 809B0000 */ lwz r4, 0(r27)
/* 0000055C 38000000 */ li r0, 0
/* 00000560 38600038 */ li r3, 0x38
/* 00000564 7C840774 */ extsb r4, r4
/* 00000568 989E00FC */ stb r4, 0xfc(r30)
/* 0000056C 38800000 */ li r4, 0
/* 00000570 981E00F0 */ stb r0, 0xf0(r30)
/* 00000574 981E00F1 */ stb r0, 0xf1(r30)
/* 00000578 981E00F2 */ stb r0, 0xf2(r30)
/* 0000057C 981E00F3 */ stb r0, 0xf3(r30)
/* 00000580 981E00F6 */ stb r0, 0xf6(r30)
/* 00000584 981E00F7 */ stb r0, 0xf7(r30)
/* 00000588 4BFFFC49 */ bl u_play_music
/* 0000058C 386000B1 */ li r3, 0xb1
/* 00000590 4BFFFC41 */ bl set_text_font
/* 00000594 38000001 */ li r0, 1
/* 00000598 3C600000 */ lis r3, lbl_00026AEC@ha
/* 0000059C 981E00FA */ stb r0, 0xfa(r30)
/* 000005A0 38830000 */ addi r4, r3, lbl_00026AEC@l
/* 000005A4 3800FFFF */ li r0, -1
/* 000005A8 98040000 */ stb r0, 0(r4)
/* 000005AC 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000005B0 3800009F */ li r0, 0x9f
/* 000005B4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000005B8 BB610014 */ lmw r27, 0x14(r1)
/* 000005BC 8001002C */ lwz r0, 0x2c(r1)
/* 000005C0 38210028 */ addi r1, r1, 0x28
/* 000005C4 7C0803A6 */ mtlr r0
/* 000005C8 4E800020 */ blr 
