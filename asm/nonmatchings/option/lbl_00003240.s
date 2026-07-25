/* 00003240 7C0802A6 */ mflr r0
/* 00003244 3C600000 */ lis r3, g_recplayInfo@ha
/* 00003248 90010004 */ stw r0, 4(r1)
/* 0000324C 3CA00000 */ lis r5, ballInfo@ha
/* 00003250 38630000 */ addi r3, r3, g_recplayInfo@l
/* 00003254 9421FFA8 */ stwu r1, -0x58(r1)
/* 00003258 3C800000 */ lis r4, cameraInfo@ha
/* 0000325C 38E50000 */ addi r7, r5, ballInfo@l
/* 00003260 BF010038 */ stmw r24, 0x38(r1)
/* 00003264 3D200000 */ lis r9, lbl_0000C230@ha
/* 00003268 3B830014 */ addi r28, r3, 0x14
/* 0000326C 38A40000 */ addi r5, r4, cameraInfo@l
/* 00003270 3BE90000 */ addi r31, r9, lbl_0000C230@l
/* 00003274 81430014 */ lwz r10, 0x14(r3)
/* 00003278 3C600000 */ lis r3, lbl_10000000@ha
/* 0000327C 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 00003280 801E6EC0 */ lwz r0, 0x6ec0(r30)
/* 00003284 1D0A01A4 */ mulli r8, r10, 0x1a4
/* 00003288 1CCA0284 */ mulli r6, r10, 0x284
/* 0000328C 3C600000 */ lis r3, worldInfo@ha
/* 00003290 2C000000 */ cmpwi r0, 0
/* 00003294 55443032 */ slwi r4, r10, 6
/* 00003298 38030000 */ addi r0, r3, worldInfo@l
/* 0000329C 3BBE005C */ addi r29, r30, 0x5c
/* 000032A0 7F474214 */ add r26, r7, r8
/* 000032A4 7F653214 */ add r27, r5, r6
/* 000032A8 7F202214 */ add r25, r0, r4
/* 000032AC 41820068 */ beq lbl_00003314
/* 000032B0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000032B4 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000032B8 A0030004 */ lhz r0, 4(r3)
/* 000032BC 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 000032C0 41820020 */ beq lbl_000032E0
/* 000032C4 38000000 */ li r0, 0
/* 000032C8 901E6EC0 */ stw r0, 0x6ec0(r30)
/* 000032CC 3C600000 */ lis r3, debugFlags@ha
/* 000032D0 84030000 */ lwzu r0, debugFlags@l(r3)
/* 000032D4 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 000032D8 90030000 */ stw r0, 0(r3)
/* 000032DC 48000054 */ b lbl_00003330
lbl_000032E0:
/* 000032E0 A0030008 */ lhz r0, 8(r3)
/* 000032E4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000032E8 41820018 */ beq lbl_00003300
/* 000032EC 3C600000 */ lis r3, debugFlags@ha
/* 000032F0 84030000 */ lwzu r0, debugFlags@l(r3)
/* 000032F4 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 000032F8 90030000 */ stw r0, 0(r3)
/* 000032FC 48000034 */ b lbl_00003330
lbl_00003300:
/* 00003300 3C600000 */ lis r3, debugFlags@ha
/* 00003304 84030000 */ lwzu r0, debugFlags@l(r3)
/* 00003308 60000008 */ ori r0, r0, 8
/* 0000330C 90030000 */ stw r0, 0(r3)
/* 00003310 48000020 */ b lbl_00003330
lbl_00003314:
/* 00003314 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003318 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000331C A0030004 */ lhz r0, 4(r3)
/* 00003320 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00003324 4182000C */ beq lbl_00003330
/* 00003328 38000001 */ li r0, 1
/* 0000332C 901E6EC0 */ stw r0, 0x6ec0(r30)
lbl_00003330:
/* 00003330 807D001C */ lwz r3, 0x1c(r29)
/* 00003334 2C030000 */ cmpwi r3, 0
/* 00003338 4081000C */ ble lbl_00003344
/* 0000333C 3803FFFF */ addi r0, r3, -1
/* 00003340 901D001C */ stw r0, 0x1c(r29)
lbl_00003344:
/* 00003344 801D001C */ lwz r0, 0x1c(r29)
/* 00003348 2C000001 */ cmpwi r0, 1
/* 0000334C 408200E0 */ bne lbl_0000342C
/* 00003350 38000000 */ li r0, 0
/* 00003354 3C600000 */ lis r3, debugFlags@ha
/* 00003358 901E6EC0 */ stw r0, 0x6ec0(r30)
/* 0000335C 38830000 */ addi r4, r3, debugFlags@l
/* 00003360 80040000 */ lwz r0, 0(r4)
/* 00003364 38600000 */ li r3, 0
/* 00003368 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 0000336C 90040000 */ stw r0, 0(r4)
/* 00003370 4BFFCE3D */ bl light_init
/* 00003374 4BFFCE39 */ bl event_finish_all
/* 00003378 38600010 */ li r3, 0x10
/* 0000337C 4BFFCE31 */ bl event_start
/* 00003380 38600012 */ li r3, 0x12
/* 00003384 4BFFCE29 */ bl event_start
/* 00003388 38600005 */ li r3, 5
/* 0000338C 4BFFCE21 */ bl call_bitmap_free_group
/* 00003390 38600004 */ li r3, 4
/* 00003394 4BFFCE19 */ bl call_bitmap_load_group
/* 00003398 4BFFCE15 */ bl create_sprite
/* 0000339C 7C651B79 */ or. r5, r3, r3
/* 000033A0 41820054 */ beq lbl_000033F4
/* 000033A4 38000001 */ li r0, 1
/* 000033A8 4CC63182 */ crclr 6
/* 000033AC 98050000 */ stb r0, 0(r5)
/* 000033B0 38000404 */ li r0, 0x404
/* 000033B4 3C600000 */ lis r3, lbl_0000C884@ha
/* 000033B8 B005003C */ sth r0, 0x3c(r5)
/* 000033BC 38830000 */ addi r4, r3, lbl_0000C884@l
/* 000033C0 38000004 */ li r0, 4
/* 000033C4 C01F00D4 */ lfs f0, 0xd4(r31)
/* 000033C8 3865008C */ addi r3, r5, 0x8c
/* 000033CC D0050004 */ stfs f0, 4(r5)
/* 000033D0 C01F011C */ lfs f0, 0x11c(r31)
/* 000033D4 D0050008 */ stfs f0, 8(r5)
/* 000033D8 C01F0120 */ lfs f0, 0x120(r31)
/* 000033DC D005004C */ stfs f0, 0x4c(r5)
/* 000033E0 98050003 */ stb r0, 3(r5)
/* 000033E4 80050074 */ lwz r0, 0x74(r5)
/* 000033E8 64000004 */ oris r0, r0, 4
/* 000033EC 90050074 */ stw r0, 0x74(r5)
/* 000033F0 4BFFCDBD */ bl sprintf
lbl_000033F4:
/* 000033F4 38600049 */ li r3, 0x49
/* 000033F8 38800000 */ li r4, 0
/* 000033FC 4BFFCDB1 */ bl u_play_music
/* 00003400 38600100 */ li r3, 0x100
/* 00003404 38800000 */ li r4, 0
/* 00003408 38A0001E */ li r5, 0x1e
/* 0000340C 4BFFCDA1 */ bl start_screen_fade
/* 00003410 480036C1 */ bl lbl_00006AD0
/* 00003414 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00003418 380000BD */ li r0, 0xbd
/* 0000341C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00003420 38000001 */ li r0, 1
/* 00003424 901D0010 */ stw r0, 0x10(r29)
/* 00003428 4800046C */ b lbl_00003894
lbl_0000342C:
/* 0000342C 2C000000 */ cmpwi r0, 0
/* 00003430 4082004C */ bne lbl_0000347C
/* 00003434 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003438 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000343C A0030004 */ lhz r0, 4(r3)
/* 00003440 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00003444 41820038 */ beq lbl_0000347C
/* 00003448 3C600000 */ lis r3, debugFlags@ha
/* 0000344C 80030000 */ lwz r0, debugFlags@l(r3)
/* 00003450 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003454 40820028 */ bne lbl_0000347C
/* 00003458 3800001F */ li r0, 0x1f
/* 0000345C 901D001C */ stw r0, 0x1c(r29)
/* 00003460 3860001E */ li r3, 0x1e
/* 00003464 38800002 */ li r4, 2
/* 00003468 4BFFCD45 */ bl u_play_music
/* 0000346C 38600101 */ li r3, 0x101
/* 00003470 38800000 */ li r4, 0
/* 00003474 38A0001E */ li r5, 0x1e
/* 00003478 4BFFCD35 */ bl start_screen_fade
lbl_0000347C:
/* 0000347C 881A0003 */ lbz r0, 3(r26)
/* 00003480 2C00000A */ cmpwi r0, 0xa
/* 00003484 41820010 */ beq lbl_00003494
/* 00003488 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 0000348C 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003490 40820068 */ bne lbl_000034F8
lbl_00003494:
/* 00003494 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00003498 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000349C A0A30004 */ lhz r5, 4(r3)
/* 000034A0 54A007FF */ clrlwi. r0, r5, 0x1f
/* 000034A4 41820028 */ beq lbl_000034CC
/* 000034A8 A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 000034AC 389E6EB6 */ addi r4, r30, 0x6eb6
/* 000034B0 3803FFFF */ addi r0, r3, -1
/* 000034B4 B01E6EB6 */ sth r0, 0x6eb6(r30)
/* 000034B8 A81E6EB6 */ lha r0, 0x6eb6(r30)
/* 000034BC 2C000000 */ cmpwi r0, 0
/* 000034C0 4080000C */ bge lbl_000034CC
/* 000034C4 38000001 */ li r0, 1
/* 000034C8 B0040000 */ sth r0, 0(r4)
lbl_000034CC:
/* 000034CC 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 000034D0 41820028 */ beq lbl_000034F8
/* 000034D4 A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 000034D8 389E6EB6 */ addi r4, r30, 0x6eb6
/* 000034DC 38030001 */ addi r0, r3, 1
/* 000034E0 B01E6EB6 */ sth r0, 0x6eb6(r30)
/* 000034E4 A81E6EB6 */ lha r0, 0x6eb6(r30)
/* 000034E8 2C000001 */ cmpwi r0, 1
/* 000034EC 4081000C */ ble lbl_000034F8
/* 000034F0 38000000 */ li r0, 0
/* 000034F4 B0040000 */ sth r0, 0(r4)
lbl_000034F8:
/* 000034F8 A87E6EB6 */ lha r3, 0x6eb6(r30)
/* 000034FC 3B1E6EB6 */ addi r24, r30, 0x6eb6
/* 00003500 2C03FFFF */ cmpwi r3, -1
/* 00003504 41820018 */ beq lbl_0000351C
/* 00003508 48000689 */ bl lbl_00003B90
/* 0000350C A8780000 */ lha r3, 0(r24)
/* 00003510 3800FFFF */ li r0, -1
/* 00003514 B07E6EB4 */ sth r3, 0x6eb4(r30)
/* 00003518 B0180000 */ sth r0, 0(r24)
lbl_0000351C:
/* 0000351C 807E6EB8 */ lwz r3, 0x6eb8(r30)
/* 00003520 3BBE6EB8 */ addi r29, r30, 0x6eb8
/* 00003524 546007FF */ clrlwi. r0, r3, 0x1f
/* 00003528 40820058 */ bne lbl_00003580
/* 0000352C A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003530 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00003534 4182004C */ beq lbl_00003580
/* 00003538 881A0003 */ lbz r0, 3(r26)
/* 0000353C 2C00000A */ cmpwi r0, 0xa
/* 00003540 41820040 */ beq lbl_00003580
/* 00003544 60600001 */ ori r0, r3, 1
/* 00003548 901D0000 */ stw r0, 0(r29)
/* 0000354C 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00003550 3C600000 */ lis r3, u_somePlayerId@ha
/* 00003554 80DA00FC */ lwz r6, 0xfc(r26)
/* 00003558 38A40000 */ addi r5, r4, lbl_802F1DFC@l
/* 0000355C 38830000 */ addi r4, r3, u_somePlayerId@l
/* 00003560 80060010 */ lwz r0, 0x10(r6)
/* 00003564 3860001D */ li r3, 0x1d
/* 00003568 90050000 */ stw r0, 0(r5)
/* 0000356C 881A002E */ lbz r0, 0x2e(r26)
/* 00003570 7C000774 */ extsb r0, r0
/* 00003574 90040000 */ stw r0, 0(r4)
/* 00003578 4BFFCC35 */ bl u_play_sound_1_dupe
/* 0000357C 907E6EBC */ stw r3, 0x6ebc(r30)
lbl_00003580:
/* 00003580 A81E6EB4 */ lha r0, 0x6eb4(r30)
/* 00003584 2C000000 */ cmpwi r0, 0
/* 00003588 41820008 */ beq lbl_00003590
/* 0000358C 48000098 */ b lbl_00003624
lbl_00003590:
/* 00003590 889A0003 */ lbz r4, 3(r26)
/* 00003594 2C04000A */ cmpwi r4, 0xa
/* 00003598 4182008C */ beq lbl_00003624
/* 0000359C A07E6E9C */ lhz r3, 0x6e9c(r30)
/* 000035A0 70600081 */ andi. r0, r3, 0x81
/* 000035A4 41820030 */ beq lbl_000035D4
/* 000035A8 881B001E */ lbz r0, 0x1e(r27)
/* 000035AC 7C000774 */ extsb r0, r0
/* 000035B0 2C00000E */ cmpwi r0, 0xe
/* 000035B4 41820070 */ beq lbl_00003624
/* 000035B8 2C00000F */ cmpwi r0, 0xf
/* 000035BC 41820068 */ beq lbl_00003624
/* 000035C0 3800000E */ li r0, 0xe
/* 000035C4 981B001E */ stb r0, 0x1e(r27)
/* 000035C8 38000002 */ li r0, 2
/* 000035CC 98190008 */ stb r0, 8(r25)
/* 000035D0 48000054 */ b lbl_00003624
lbl_000035D4:
/* 000035D4 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 000035D8 41820024 */ beq lbl_000035FC
/* 000035DC 881B001E */ lbz r0, 0x1e(r27)
/* 000035E0 2C000004 */ cmpwi r0, 4
/* 000035E4 41820040 */ beq lbl_00003624
/* 000035E8 38000004 */ li r0, 4
/* 000035EC 981B001E */ stb r0, 0x1e(r27)
/* 000035F0 38000002 */ li r0, 2
/* 000035F4 98190008 */ stb r0, 8(r25)
/* 000035F8 4800002C */ b lbl_00003624
lbl_000035FC:
/* 000035FC 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 00003600 41820024 */ beq lbl_00003624
/* 00003604 7C800775 */ extsb. r0, r4
/* 00003608 4182001C */ beq lbl_00003624
/* 0000360C 38000000 */ li r0, 0
/* 00003610 981A0003 */ stb r0, 3(r26)
/* 00003614 38600015 */ li r3, 0x15
/* 00003618 38000004 */ li r0, 4
/* 0000361C 987B001E */ stb r3, 0x1e(r27)
/* 00003620 98190008 */ stb r0, 8(r25)
lbl_00003624:
/* 00003624 881A0003 */ lbz r0, 3(r26)
/* 00003628 2C000004 */ cmpwi r0, 4
/* 0000362C 40820024 */ bne lbl_00003650
/* 00003630 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003634 54000631 */ rlwinm. r0, r0, 0, 0x18, 0x18
/* 00003638 41820018 */ beq lbl_00003650
/* 0000363C 38000005 */ li r0, 5
/* 00003640 981A0003 */ stb r0, 3(r26)
/* 00003644 801A0094 */ lwz r0, 0x94(r26)
/* 00003648 60003500 */ ori r0, r0, 0x3500
/* 0000364C 901A0094 */ stw r0, 0x94(r26)
lbl_00003650:
/* 00003650 881A0003 */ lbz r0, 3(r26)
/* 00003654 2C00000A */ cmpwi r0, 0xa
/* 00003658 4182001C */ beq lbl_00003674
/* 0000365C 3C600000 */ lis r3, infoWork@ha
/* 00003660 38830000 */ addi r4, r3, infoWork@l
/* 00003664 80640000 */ lwz r3, 0(r4)
/* 00003668 3800F7EF */ li r0, -2065
/* 0000366C 7C600038 */ and r0, r3, r0
/* 00003670 90040000 */ stw r0, 0(r4)
lbl_00003674:
/* 00003674 3C600000 */ lis r3, debugFlags@ha
/* 00003678 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000367C 7000000A */ andi. r0, r0, 0xa
/* 00003680 40820024 */ bne lbl_000036A4
/* 00003684 881A0003 */ lbz r0, 3(r26)
/* 00003688 2C00000A */ cmpwi r0, 0xa
/* 0000368C 41820018 */ beq lbl_000036A4
/* 00003690 3C600000 */ lis r3, modeCtrl@ha
/* 00003694 38830000 */ addi r4, r3, modeCtrl@l
/* 00003698 80640018 */ lwz r3, 0x18(r4)
/* 0000369C 3803FFFF */ addi r0, r3, -1
/* 000036A0 90040018 */ stw r0, 0x18(r4)
lbl_000036A4:
/* 000036A4 3C600000 */ lis r3, modeCtrl@ha
/* 000036A8 38630000 */ addi r3, r3, modeCtrl@l
/* 000036AC 3B630018 */ addi r27, r3, 0x18
/* 000036B0 80030018 */ lwz r0, 0x18(r3)
/* 000036B4 2C000000 */ cmpwi r0, 0
/* 000036B8 408001DC */ bge lbl_00003894
/* 000036BC 38600001 */ li r3, 1
/* 000036C0 4BFFCAED */ bl event_finish
/* 000036C4 38600004 */ li r3, 4
/* 000036C8 4BFFCAE5 */ bl event_finish
/* 000036CC 38600005 */ li r3, 5
/* 000036D0 4BFFCADD */ bl event_finish
/* 000036D4 3860000D */ li r3, 0xd
/* 000036D8 4BFFCAD5 */ bl event_finish
/* 000036DC 38600014 */ li r3, 0x14
/* 000036E0 4BFFCACD */ bl event_finish
/* 000036E4 38600013 */ li r3, 0x13
/* 000036E8 4BFFCAC5 */ bl event_finish
/* 000036EC 38600003 */ li r3, 3
/* 000036F0 4BFFCABD */ bl event_finish
/* 000036F4 38600012 */ li r3, 0x12
/* 000036F8 4BFFCAB5 */ bl event_finish
/* 000036FC 801C0000 */ lwz r0, 0(r28)
/* 00003700 3C600000 */ lis r3, g_recplayInfo@ha
/* 00003704 3BE30000 */ addi r31, r3, g_recplayInfo@l
/* 00003708 5400103A */ slwi r0, r0, 2
/* 0000370C 7C7F0214 */ add r3, r31, r0
/* 00003710 80630000 */ lwz r3, 0(r3)
/* 00003714 38810020 */ addi r4, r1, 0x20
/* 00003718 4BFFCA95 */ bl recplay_get_header
/* 0000371C 801C0000 */ lwz r0, 0(r28)
/* 00003720 5400103A */ slwi r0, r0, 2
/* 00003724 7C7F0214 */ add r3, r31, r0
/* 00003728 80630000 */ lwz r3, 0(r3)
/* 0000372C 4BFFCA81 */ bl func_80049514
/* 00003730 3C600000 */ lis r3, infoWork@ha
/* 00003734 3B030000 */ addi r24, r3, infoWork@l
/* 00003738 80180000 */ lwz r0, 0(r24)
/* 0000373C 3C600000 */ lis r3, currStageId@ha
/* 00003740 3B230000 */ addi r25, r3, currStageId@l
/* 00003744 60000010 */ ori r0, r0, 0x10
/* 00003748 90180000 */ stw r0, 0(r24)
/* 0000374C A8790000 */ lha r3, 0(r25)
/* 00003750 4BFFCA5D */ bl load_stage
/* 00003754 38600001 */ li r3, 1
/* 00003758 4BFFCA55 */ bl event_start
/* 0000375C 38600004 */ li r3, 4
/* 00003760 4BFFCA4D */ bl event_start
/* 00003764 38600005 */ li r3, 5
/* 00003768 4BFFCA45 */ bl event_start
/* 0000376C 3860000D */ li r3, 0xd
/* 00003770 4BFFCA3D */ bl event_start
/* 00003774 38600014 */ li r3, 0x14
/* 00003778 4BFFCA35 */ bl event_start
/* 0000377C 38600013 */ li r3, 0x13
/* 00003780 4BFFCA2D */ bl event_start
/* 00003784 38600003 */ li r3, 3
/* 00003788 4BFFCA25 */ bl event_start
/* 0000378C 38600012 */ li r3, 0x12
/* 00003790 4BFFCA1D */ bl event_start
/* 00003794 80180000 */ lwz r0, 0(r24)
/* 00003798 60000008 */ ori r0, r0, 8
/* 0000379C 90180000 */ stw r0, 0(r24)
/* 000037A0 4BFFCA0D */ bl rend_efc_mirror_enable
/* 000037A4 38610008 */ addi r3, r1, 8
/* 000037A8 38800000 */ li r4, 0
/* 000037AC 38A00018 */ li r5, 0x18
/* 000037B0 4BFFC9FD */ bl memset
/* 000037B4 3C600001 */ lis r3, 1
/* 000037B8 3803FFFF */ addi r0, r3, -1
/* 000037BC B001000E */ sth r0, 0xe(r1)
/* 000037C0 38A10008 */ addi r5, r1, 8
/* 000037C4 38600002 */ li r3, 2
/* 000037C8 38800003 */ li r4, 3
/* 000037CC 4BFFC9E1 */ bl rend_efc_enable
/* 000037D0 A8790000 */ lha r3, 0(r25)
/* 000037D4 4BFFC9D9 */ bl light_init
/* 000037D8 38000009 */ li r0, 9
/* 000037DC 981A0003 */ stb r0, 3(r26)
/* 000037E0 38000000 */ li r0, 0
/* 000037E4 901A0078 */ stw r0, 0x78(r26)
/* 000037E8 801C0000 */ lwz r0, 0(r28)
/* 000037EC 5400103A */ slwi r0, r0, 2
/* 000037F0 7C7F0214 */ add r3, r31, r0
/* 000037F4 80630000 */ lwz r3, 0(r3)
/* 000037F8 4BFFC9B5 */ bl recplay_get_time
/* 000037FC D03F0010 */ stfs f1, 0x10(r31)
/* 00003800 801C0000 */ lwz r0, 0(r28)
/* 00003804 C03F0010 */ lfs f1, 0x10(r31)
/* 00003808 5400103A */ slwi r0, r0, 2
/* 0000380C 7C7F0214 */ add r3, r31, r0
/* 00003810 80630000 */ lwz r3, 0(r3)
/* 00003814 4BFFC999 */ bl recplay_get_stage_timer
/* 00003818 4BFFC995 */ bl animate_anim_groups
/* 0000381C A87E6EB4 */ lha r3, 0x6eb4(r30)
/* 00003820 48000371 */ bl lbl_00003B90
/* 00003824 A01E6E9C */ lhz r0, 0x6e9c(r30)
/* 00003828 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000382C 41820010 */ beq lbl_0000383C
/* 00003830 3800003C */ li r0, 0x3c
/* 00003834 901B0000 */ stw r0, 0(r27)
/* 00003838 4800000C */ b lbl_00003844
lbl_0000383C:
/* 0000383C 380000B4 */ li r0, 0xb4
/* 00003840 901B0000 */ stw r0, 0(r27)
lbl_00003844:
/* 00003844 801D0000 */ lwz r0, 0(r29)
/* 00003848 3B1E6EBC */ addi r24, r30, 0x6ebc
/* 0000384C 5400003C */ rlwinm r0, r0, 0, 0, 0x1e
/* 00003850 901D0000 */ stw r0, 0(r29)
/* 00003854 801E6EBC */ lwz r0, 0x6ebc(r30)
/* 00003858 2C00FFFF */ cmpwi r0, -1
/* 0000385C 41820038 */ beq lbl_00003894
/* 00003860 80BA00FC */ lwz r5, 0xfc(r26)
/* 00003864 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 00003868 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000386C 80050010 */ lwz r0, 0x10(r5)
/* 00003870 90040000 */ stw r0, lbl_802F1DFC@l(r4)
/* 00003874 881A002E */ lbz r0, 0x2e(r26)
/* 00003878 7C000774 */ extsb r0, r0
/* 0000387C 90030000 */ stw r0, u_somePlayerId@l(r3)
/* 00003880 80180000 */ lwz r0, 0(r24)
/* 00003884 5403043E */ clrlwi r3, r0, 0x10
/* 00003888 4BFFC925 */ bl SoundOff
/* 0000388C 3800FFFF */ li r0, -1
/* 00003890 90180000 */ stw r0, 0(r24)
lbl_00003894:
/* 00003894 BB010038 */ lmw r24, 0x38(r1)
/* 00003898 8001005C */ lwz r0, 0x5c(r1)
/* 0000389C 38210058 */ addi r1, r1, 0x58
/* 000038A0 7C0803A6 */ mtlr r0
/* 000038A4 4E800020 */ blr 
