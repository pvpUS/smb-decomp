/* 000021D8 7C0802A6 */ mflr r0
/* 000021DC 3C600000 */ lis r3, modeCtrl@ha
/* 000021E0 90010004 */ stw r0, 4(r1)
/* 000021E4 38830000 */ addi r4, r3, modeCtrl@l
/* 000021E8 3C600000 */ lis r3, lbl_10000000@ha
/* 000021EC 9421FFE8 */ stwu r1, -0x18(r1)
/* 000021F0 38630000 */ addi r3, r3, lbl_10000000@l
/* 000021F4 93E10014 */ stw r31, 0x14(r1)
/* 000021F8 3BE40008 */ addi r31, r4, 8
/* 000021FC 93C10010 */ stw r30, 0x10(r1)
/* 00002200 93A1000C */ stw r29, 0xc(r1)
/* 00002204 93810008 */ stw r28, 8(r1)
/* 00002208 3B83009C */ addi r28, r3, 0x9c
/* 0000220C 80040008 */ lwz r0, 8(r4)
/* 00002210 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002214 40820104 */ bne lbl_00002318
/* 00002218 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000221C 80BC0014 */ lwz r5, 0x14(r28)
/* 00002220 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002224 A0830008 */ lhz r4, 8(r3)
/* 00002228 3BA50000 */ addi r29, r5, 0
/* 0000222C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00002230 40820018 */ bne lbl_00002248
/* 00002234 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002238 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000223C A0030008 */ lhz r0, 8(r3)
/* 00002240 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002244 41820010 */ beq lbl_00002254
lbl_00002248:
/* 00002248 37BDFFFF */ addic. r29, r29, -1
/* 0000224C 40800008 */ bge lbl_00002254
/* 00002250 3BA00002 */ li r29, 2
lbl_00002254:
/* 00002254 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00002258 40820018 */ bne lbl_00002270
/* 0000225C 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002260 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002264 A0030008 */ lhz r0, 8(r3)
/* 00002268 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000226C 41820014 */ beq lbl_00002280
lbl_00002270:
/* 00002270 3BBD0001 */ addi r29, r29, 1
/* 00002274 281D0003 */ cmplwi r29, 3
/* 00002278 41800008 */ blt lbl_00002280
/* 0000227C 3BA00000 */ li r29, 0
lbl_00002280:
/* 00002280 7C1D2800 */ cmpw r29, r5
/* 00002284 41820010 */ beq lbl_00002294
/* 00002288 3860006C */ li r3, 0x6c
/* 0000228C 4BFFDF21 */ bl u_play_sound_0
/* 00002290 93BC0014 */ stw r29, 0x14(r28)
lbl_00002294:
/* 00002294 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002298 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000229C A0630004 */ lhz r3, 4(r3)
/* 000022A0 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 000022A4 4182004C */ beq lbl_000022F0
/* 000022A8 3860006A */ li r3, 0x6a
/* 000022AC 4BFFDF01 */ bl u_play_sound_0
/* 000022B0 801C0014 */ lwz r0, 0x14(r28)
/* 000022B4 2C000000 */ cmpwi r0, 0
/* 000022B8 40820014 */ bne lbl_000022CC
/* 000022BC 3C600000 */ lis r3, modeCtrl@ha
/* 000022C0 3800001E */ li r0, 0x1e
/* 000022C4 90030000 */ stw r0, modeCtrl@l(r3)
/* 000022C8 48000010 */ b lbl_000022D8
lbl_000022CC:
/* 000022CC 3C600000 */ lis r3, modeCtrl@ha
/* 000022D0 3800001E */ li r0, 0x1e
/* 000022D4 90030000 */ stw r0, modeCtrl@l(r3)
lbl_000022D8:
/* 000022D8 3860005B */ li r3, 0x5b
/* 000022DC 48001F29 */ bl lbl_00004204
/* 000022E0 801F0000 */ lwz r0, 0(r31)
/* 000022E4 60000004 */ ori r0, r0, 4
/* 000022E8 901F0000 */ stw r0, 0(r31)
/* 000022EC 48000360 */ b lbl_0000264C
lbl_000022F0:
/* 000022F0 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 000022F4 41820358 */ beq lbl_0000264C
/* 000022F8 3860006B */ li r3, 0x6b
/* 000022FC 4BFFDEB1 */ bl u_play_sound_0
/* 00002300 3860005B */ li r3, 0x5b
/* 00002304 48001F5D */ bl lbl_00004260
/* 00002308 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000230C 380000AE */ li r0, 0xae
/* 00002310 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002314 48000338 */ b lbl_0000264C
lbl_00002318:
/* 00002318 801C0014 */ lwz r0, 0x14(r28)
/* 0000231C 2C000000 */ cmpwi r0, 0
/* 00002320 40820170 */ bne lbl_00002490
/* 00002324 80640000 */ lwz r3, 0(r4)
/* 00002328 2C030000 */ cmpwi r3, 0
/* 0000232C 40810064 */ ble lbl_00002390
/* 00002330 3803FFFF */ addi r0, r3, -1
/* 00002334 90040000 */ stw r0, 0(r4)
/* 00002338 80040000 */ lwz r0, 0(r4)
/* 0000233C 2C000000 */ cmpwi r0, 0
/* 00002340 418102A4 */ bgt lbl_000025E4
/* 00002344 3800001E */ li r0, 0x1e
/* 00002348 901C001C */ stw r0, 0x1c(r28)
/* 0000234C 38000000 */ li r0, 0
/* 00002350 3C600000 */ lis r3, stageHeap@ha
/* 00002354 901C0018 */ stw r0, 0x18(r28)
/* 00002358 38630000 */ addi r3, r3, stageHeap@l
/* 0000235C 80630000 */ lwz r3, 0(r3)
/* 00002360 4BFFDE4D */ bl OSSetCurrentHeap
/* 00002364 3BA30000 */ addi r29, r3, 0
/* 00002368 38600003 */ li r3, 3
/* 0000236C 4BFFDE41 */ bl call_bitmap_load_group
/* 00002370 7FA3EB78 */ mr r3, r29
/* 00002374 4BFFDE39 */ bl OSSetCurrentHeap
/* 00002378 4BFFDE35 */ bl func_800885EC
/* 0000237C 38600000 */ li r3, 0
/* 00002380 4BFFDE2D */ bl init_ranking_screen
/* 00002384 4BFFDE29 */ bl func_800AB68C
/* 00002388 4BFFDE25 */ bl func_800AB5F8
/* 0000238C 48000258 */ b lbl_000025E4
lbl_00002390:
/* 00002390 4BFFDE1D */ bl func_80088AF4
/* 00002394 2C030000 */ cmpwi r3, 0
/* 00002398 418200E0 */ beq lbl_00002478
/* 0000239C 801C001C */ lwz r0, 0x1c(r28)
/* 000023A0 2C000000 */ cmpwi r0, 0
/* 000023A4 418100D4 */ bgt lbl_00002478
/* 000023A8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000023AC 80BC0018 */ lwz r5, 0x18(r28)
/* 000023B0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000023B4 A0830008 */ lhz r4, 8(r3)
/* 000023B8 3BA50000 */ addi r29, r5, 0
/* 000023BC 548007FF */ clrlwi. r0, r4, 0x1f
/* 000023C0 40820020 */ bne lbl_000023E0
/* 000023C4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000023C8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000023CC A0030008 */ lhz r0, 8(r3)
/* 000023D0 540007FF */ clrlwi. r0, r0, 0x1f
/* 000023D4 4082000C */ bne lbl_000023E0
/* 000023D8 54800673 */ rlwinm. r0, r4, 0, 0x19, 0x19
/* 000023DC 41820010 */ beq lbl_000023EC
lbl_000023E0:
/* 000023E0 37BDFFFF */ addic. r29, r29, -1
/* 000023E4 40800008 */ bge lbl_000023EC
/* 000023E8 3BA00000 */ li r29, 0
lbl_000023EC:
/* 000023EC 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000023F0 40820020 */ bne lbl_00002410
/* 000023F4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000023F8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000023FC A0030008 */ lhz r0, 8(r3)
/* 00002400 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002404 4082000C */ bne lbl_00002410
/* 00002408 548006B5 */ rlwinm. r0, r4, 0, 0x1a, 0x1a
/* 0000240C 41820014 */ beq lbl_00002420
lbl_00002410:
/* 00002410 3BBD0001 */ addi r29, r29, 1
/* 00002414 2C1D0003 */ cmpwi r29, 3
/* 00002418 41800008 */ blt lbl_00002420
/* 0000241C 3BA00002 */ li r29, 2
lbl_00002420:
/* 00002420 7C1D2800 */ cmpw r29, r5
/* 00002424 41820054 */ beq lbl_00002478
/* 00002428 38600065 */ li r3, 0x65
/* 0000242C 4BFFDD81 */ bl destroy_sprite_with_tag
/* 00002430 38600000 */ li r3, 0
/* 00002434 4BFFDD79 */ bl ranking_screen_8008897C
/* 00002438 7FA3EB78 */ mr r3, r29
/* 0000243C 4BFFDD71 */ bl init_ranking_screen
/* 00002440 2C1D0001 */ cmpwi r29, 1
/* 00002444 41820020 */ beq lbl_00002464
/* 00002448 40800008 */ bge lbl_00002450
/* 0000244C 48000010 */ b lbl_0000245C
lbl_00002450:
/* 00002450 2C1D0003 */ cmpwi r29, 3
/* 00002454 40800008 */ bge lbl_0000245C
/* 00002458 48000018 */ b lbl_00002470
lbl_0000245C:
/* 0000245C 4BFFDD51 */ bl func_800AB5F8
/* 00002460 48000014 */ b lbl_00002474
lbl_00002464:
/* 00002464 4BFFDD49 */ bl func_800AB5F8
/* 00002468 4BFFDD45 */ bl func_800AB564
/* 0000246C 48000008 */ b lbl_00002474
lbl_00002470:
/* 00002470 4BFFDD3D */ bl func_800AB564
lbl_00002474:
/* 00002474 93BC0018 */ stw r29, 0x18(r28)
lbl_00002478:
/* 00002478 807C001C */ lwz r3, 0x1c(r28)
/* 0000247C 2C030000 */ cmpwi r3, 0
/* 00002480 40810164 */ ble lbl_000025E4
/* 00002484 3803FFFF */ addi r0, r3, -1
/* 00002488 901C001C */ stw r0, 0x1c(r28)
/* 0000248C 48000158 */ b lbl_000025E4
lbl_00002490:
/* 00002490 80640000 */ lwz r3, 0(r4)
/* 00002494 2C030000 */ cmpwi r3, 0
/* 00002498 40810070 */ ble lbl_00002508
/* 0000249C 3803FFFF */ addi r0, r3, -1
/* 000024A0 90040000 */ stw r0, 0(r4)
/* 000024A4 80040000 */ lwz r0, 0(r4)
/* 000024A8 2C000000 */ cmpwi r0, 0
/* 000024AC 41810138 */ bgt lbl_000025E4
/* 000024B0 80BC0014 */ lwz r5, 0x14(r28)
/* 000024B4 38000000 */ li r0, 0
/* 000024B8 3C600000 */ lis r3, stageHeap@ha
/* 000024BC 901C0018 */ stw r0, 0x18(r28)
/* 000024C0 38630000 */ addi r3, r3, stageHeap@l
/* 000024C4 3C800000 */ lis r4, lbl_0000C850@ha
/* 000024C8 54A51838 */ slwi r5, r5, 3
/* 000024CC 80630000 */ lwz r3, 0(r3)
/* 000024D0 38040000 */ addi r0, r4, lbl_0000C850@l
/* 000024D4 7FA02A14 */ add r29, r0, r5
/* 000024D8 4BFFDCD5 */ bl OSSetCurrentHeap
/* 000024DC 80BD0000 */ lwz r5, 0(r29)
/* 000024E0 3BA30000 */ addi r29, r3, 0
/* 000024E4 801C0018 */ lwz r0, 0x18(r28)
/* 000024E8 38800000 */ li r4, 0
/* 000024EC 7C6500AE */ lbzx r3, r5, r0
/* 000024F0 7C630774 */ extsb r3, r3
/* 000024F4 4BFFDCB9 */ bl func_800AB2A0
/* 000024F8 7FA3EB78 */ mr r3, r29
/* 000024FC 4BFFDCB1 */ bl OSSetCurrentHeap
/* 00002500 4BFFDCAD */ bl func_800AB5F8
/* 00002504 480000E0 */ b lbl_000025E4
lbl_00002508:
/* 00002508 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000250C 80DC0018 */ lwz r6, 0x18(r28)
/* 00002510 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002514 A0A30008 */ lhz r5, 8(r3)
/* 00002518 54041838 */ slwi r4, r0, 3
/* 0000251C 3C600000 */ lis r3, lbl_0000C850@ha
/* 00002520 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00002524 38030000 */ addi r0, r3, lbl_0000C850@l
/* 00002528 3BC60000 */ addi r30, r6, 0
/* 0000252C 7FA02214 */ add r29, r0, r4
/* 00002530 40820020 */ bne lbl_00002550
/* 00002534 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002538 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000253C A0030008 */ lhz r0, 8(r3)
/* 00002540 540007FF */ clrlwi. r0, r0, 0x1f
/* 00002544 4082000C */ bne lbl_00002550
/* 00002548 54A00673 */ rlwinm. r0, r5, 0, 0x19, 0x19
/* 0000254C 41820010 */ beq lbl_0000255C
lbl_00002550:
/* 00002550 37DEFFFF */ addic. r30, r30, -1
/* 00002554 40800008 */ bge lbl_0000255C
/* 00002558 3BC00000 */ li r30, 0
lbl_0000255C:
/* 0000255C 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00002560 40820020 */ bne lbl_00002580
/* 00002564 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002568 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000256C A0030008 */ lhz r0, 8(r3)
/* 00002570 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 00002574 4082000C */ bne lbl_00002580
/* 00002578 54A006B5 */ rlwinm. r0, r5, 0, 0x1a, 0x1a
/* 0000257C 4182001C */ beq lbl_00002598
lbl_00002580:
/* 00002580 887D0004 */ lbz r3, 4(r29)
/* 00002584 3BDE0001 */ addi r30, r30, 1
/* 00002588 7C630774 */ extsb r3, r3
/* 0000258C 7C1E1800 */ cmpw r30, r3
/* 00002590 41800008 */ blt lbl_00002598
/* 00002594 3BC3FFFF */ addi r30, r3, -1
lbl_00002598:
/* 00002598 7C1E3000 */ cmpw r30, r6
/* 0000259C 41820048 */ beq lbl_000025E4
/* 000025A0 807D0000 */ lwz r3, 0(r29)
/* 000025A4 38800000 */ li r4, 0
/* 000025A8 7C63F0AE */ lbzx r3, r3, r30
/* 000025AC 7C630774 */ extsb r3, r3
/* 000025B0 4BFFDBFD */ bl func_800AB358
/* 000025B4 2C1E0000 */ cmpwi r30, 0
/* 000025B8 41820008 */ beq lbl_000025C0
/* 000025BC 4BFFDBF1 */ bl func_800AB564
lbl_000025C0:
/* 000025C0 881D0004 */ lbz r0, 4(r29)
/* 000025C4 7C030774 */ extsb r3, r0
/* 000025C8 3803FFFF */ addi r0, r3, -1
/* 000025CC 7C1E0000 */ cmpw r30, r0
/* 000025D0 40800008 */ bge lbl_000025D8
/* 000025D4 4BFFDBD9 */ bl func_800AB5F8
lbl_000025D8:
/* 000025D8 38600065 */ li r3, 0x65
/* 000025DC 4BFFDBD1 */ bl u_play_sound_0
/* 000025E0 93DC0018 */ stw r30, 0x18(r28)
lbl_000025E4:
/* 000025E4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000025E8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000025EC A0030004 */ lhz r0, 4(r3)
/* 000025F0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000025F4 41820058 */ beq lbl_0000264C
/* 000025F8 801C0014 */ lwz r0, 0x14(r28)
/* 000025FC 2C000000 */ cmpwi r0, 0
/* 00002600 40820020 */ bne lbl_00002620
/* 00002604 38600001 */ li r3, 1
/* 00002608 4BFFDBA5 */ bl ranking_screen_8008897C
/* 0000260C 38600065 */ li r3, 0x65
/* 00002610 4BFFDB9D */ bl destroy_sprite_with_tag
/* 00002614 38600003 */ li r3, 3
/* 00002618 4BFFDB95 */ bl call_bitmap_free_group
/* 0000261C 48000018 */ b lbl_00002634
lbl_00002620:
/* 00002620 3C600000 */ lis r3, modeCtrl@ha
/* 00002624 80030000 */ lwz r0, modeCtrl@l(r3)
/* 00002628 2C000000 */ cmpwi r0, 0
/* 0000262C 41810008 */ bgt lbl_00002634
/* 00002630 4BFFDB7D */ bl func_800AB444
lbl_00002634:
/* 00002634 48006C29 */ bl lbl_0000925C
/* 00002638 3860006B */ li r3, 0x6b
/* 0000263C 4BFFDB71 */ bl u_play_sound_0
/* 00002640 801F0000 */ lwz r0, 0(r31)
/* 00002644 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00002648 901F0000 */ stw r0, 0(r31)
lbl_0000264C:
/* 0000264C 8001001C */ lwz r0, 0x1c(r1)
/* 00002650 83E10014 */ lwz r31, 0x14(r1)
/* 00002654 83C10010 */ lwz r30, 0x10(r1)
/* 00002658 7C0803A6 */ mtlr r0
/* 0000265C 83A1000C */ lwz r29, 0xc(r1)
/* 00002660 83810008 */ lwz r28, 8(r1)
/* 00002664 38210018 */ addi r1, r1, 0x18
/* 00002668 4E800020 */ blr 
