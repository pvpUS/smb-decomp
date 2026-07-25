/* 000073EC 7C0802A6 */ mflr r0
/* 000073F0 3C600000 */ lis r3, lbl_0000FE78@ha
/* 000073F4 90010004 */ stw r0, 4(r1)
/* 000073F8 9421FF88 */ stwu r1, -0x78(r1)
/* 000073FC BF610064 */ stmw r27, 0x64(r1)
/* 00007400 3BC30000 */ addi r30, r3, lbl_0000FE78@l
/* 00007404 3C600000 */ lis r3, lbl_10000000@ha
/* 00007408 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000740C 801E01C8 */ lwz r0, 0x1c8(r30)
/* 00007410 9001001C */ stw r0, 0x1c(r1)
/* 00007414 881F0D5B */ lbz r0, 0xd5b(r31)
/* 00007418 28000000 */ cmplwi r0, 0
/* 0000741C 4182006C */ beq lbl_00007488
/* 00007420 807F0190 */ lwz r3, 0x190(r31)
/* 00007424 801F05A8 */ lwz r0, 0x5a8(r31)
/* 00007428 80630008 */ lwz r3, 8(r3)
/* 0000742C 54001838 */ slwi r0, r0, 3
/* 00007430 7FA3002E */ lwzx r29, r3, r0
/* 00007434 4BFF8D29 */ bl mathutil_mtxA_from_mtxB
/* 00007438 281D0000 */ cmplwi r29, 0
/* 0000743C 41820018 */ beq lbl_00007454
/* 00007440 C83E01D0 */ lfd f1, 0x1d0(r30)
/* 00007444 C01D0014 */ lfs f0, 0x14(r29)
/* 00007448 FC210032 */ fmul f1, f1, f0
/* 0000744C FC200818 */ frsp f1, f1
/* 00007450 4BFF8D0D */ bl mathutil_mtxA_scale_s
lbl_00007454:
/* 00007454 3C600000 */ lis r3, mathutilData@ha
/* 00007458 3BA30000 */ addi r29, r3, mathutilData@l
/* 0000745C 807D0000 */ lwz r3, 0(r29)
/* 00007460 38800000 */ li r4, 0
/* 00007464 4BFF8CF9 */ bl GXLoadPosMtxImm
/* 00007468 807D0000 */ lwz r3, 0(r29)
/* 0000746C 38800000 */ li r4, 0
/* 00007470 4BFF8CED */ bl GXLoadNrmMtxImm
/* 00007474 3C600000 */ lis r3, g_commonNlObj@ha
/* 00007478 38630000 */ addi r3, r3, g_commonNlObj@l
/* 0000747C 80630000 */ lwz r3, 0(r3)
/* 00007480 806300A8 */ lwz r3, 0xa8(r3)
/* 00007484 4BFF8CD9 */ bl nl2ngc_draw_model_sort_translucent_alt2
lbl_00007488:
/* 00007488 4BFF8CD5 */ bl mathutil_mtxA_from_mtxB
/* 0000748C C03E0060 */ lfs f1, 0x60(r30)
/* 00007490 38610010 */ addi r3, r1, 0x10
/* 00007494 C05E018C */ lfs f2, 0x18c(r30)
/* 00007498 C07E0190 */ lfs f3, 0x190(r30)
/* 0000749C 4BFF8CC1 */ bl mathutil_mtxA_tf_point_xyz
/* 000074A0 C03E0060 */ lfs f1, 0x60(r30)
/* 000074A4 38610020 */ addi r3, r1, 0x20
/* 000074A8 38800000 */ li r4, 0
/* 000074AC 4BFF8CB1 */ bl GXInitLightSpot
/* 000074B0 C03E0194 */ lfs f1, 0x194(r30)
/* 000074B4 38610020 */ addi r3, r1, 0x20
/* 000074B8 C05E0198 */ lfs f2, 0x198(r30)
/* 000074BC 38800000 */ li r4, 0
/* 000074C0 4BFF8C9D */ bl GXInitLightDistAttn
/* 000074C4 C0210010 */ lfs f1, 0x10(r1)
/* 000074C8 38610020 */ addi r3, r1, 0x20
/* 000074CC C0410014 */ lfs f2, 0x14(r1)
/* 000074D0 C0610018 */ lfs f3, 0x18(r1)
/* 000074D4 4BFF8C89 */ bl GXInitLightPos
/* 000074D8 8001001C */ lwz r0, 0x1c(r1)
/* 000074DC 38810008 */ addi r4, r1, 8
/* 000074E0 38610020 */ addi r3, r1, 0x20
/* 000074E4 90010008 */ stw r0, 8(r1)
/* 000074E8 4BFF8C75 */ bl GXInitLightColor
/* 000074EC 38610020 */ addi r3, r1, 0x20
/* 000074F0 38800001 */ li r4, 1
/* 000074F4 4BFF8C69 */ bl GXLoadLightObjImm
/* 000074F8 4BFF8C65 */ bl mathutil_mtxA_from_mtxB
/* 000074FC 3C600000 */ lis r3, mathutilData@ha
/* 00007500 3BA30000 */ addi r29, r3, mathutilData@l
/* 00007504 807D0000 */ lwz r3, 0(r29)
/* 00007508 38800000 */ li r4, 0
/* 0000750C 4BFF8C51 */ bl GXLoadPosMtxImm
/* 00007510 807D0000 */ lwz r3, 0(r29)
/* 00007514 38800000 */ li r4, 0
/* 00007518 4BFF8C45 */ bl GXLoadNrmMtxImm
/* 0000751C 881F0D5A */ lbz r0, 0xd5a(r31)
/* 00007520 28000000 */ cmplwi r0, 0
/* 00007524 41820008 */ beq lbl_0000752C
/* 00007528 4BFFF0C9 */ bl lbl_000065F0
lbl_0000752C:
/* 0000752C 38600001 */ li r3, 1
/* 00007530 38800023 */ li r4, 0x23
/* 00007534 4BFF8C29 */ bl window_set_cursor_pos
/* 00007538 A87F0D42 */ lha r3, 0xd42(r31)
/* 0000753C A81F0D40 */ lha r0, 0xd40(r31)
/* 00007540 7C030000 */ cmpw r3, r0
/* 00007544 408201C0 */ bne lbl_00007704
/* 00007548 801F0190 */ lwz r0, 0x190(r31)
/* 0000754C 28000000 */ cmplwi r0, 0
/* 00007550 418201B4 */ beq lbl_00007704
/* 00007554 4BFF8C09 */ bl mathutil_mtxA_from_mtxB
/* 00007558 3C600000 */ lis r3, mathutilData@ha
/* 0000755C 3BA30000 */ addi r29, r3, mathutilData@l
/* 00007560 807D0000 */ lwz r3, 0(r29)
/* 00007564 38800000 */ li r4, 0
/* 00007568 4BFF8BF5 */ bl GXLoadPosMtxImm
/* 0000756C 807D0000 */ lwz r3, 0(r29)
/* 00007570 38800000 */ li r4, 0
/* 00007574 4BFF8BE9 */ bl GXLoadNrmMtxImm
/* 00007578 38600000 */ li r3, 0
/* 0000757C 4BFF8BE1 */ bl perf_start_timer
/* 00007580 801F05AC */ lwz r0, 0x5ac(r31)
/* 00007584 2C000000 */ cmpwi r0, 0
/* 00007588 41820060 */ beq lbl_000075E8
/* 0000758C 3B800000 */ li r28, 0
/* 00007590 3BA00000 */ li r29, 0
/* 00007594 48000040 */ b lbl_000075D4
lbl_00007598:
/* 00007598 80630008 */ lwz r3, 8(r3)
/* 0000759C 7C03E82E */ lwzx r0, r3, r29
/* 000075A0 28000000 */ cmplwi r0, 0
/* 000075A4 7C1B0378 */ mr r27, r0
/* 000075A8 41820024 */ beq lbl_000075CC
/* 000075AC 801B0004 */ lwz r0, 4(r27)
/* 000075B0 5400073B */ rlwinm. r0, r0, 0, 0x1c, 0x1d
/* 000075B4 41820010 */ beq lbl_000075C4
/* 000075B8 387B0000 */ addi r3, r27, 0
/* 000075BC 38800000 */ li r4, 0
/* 000075C0 4BFF8B9D */ bl avdisp_get_matrices
lbl_000075C4:
/* 000075C4 7F63DB78 */ mr r3, r27
/* 000075C8 4BFF8B95 */ bl avdisp_draw_model_culled_sort_none
lbl_000075CC:
/* 000075CC 3BBD0008 */ addi r29, r29, 8
/* 000075D0 3B9C0001 */ addi r28, r28, 1
lbl_000075D4:
/* 000075D4 807F0190 */ lwz r3, 0x190(r31)
/* 000075D8 80030000 */ lwz r0, 0(r3)
/* 000075DC 7C1C0000 */ cmpw r28, r0
/* 000075E0 4180FFB8 */ blt lbl_00007598
/* 000075E4 48000064 */ b lbl_00007648
lbl_000075E8:
/* 000075E8 807F0190 */ lwz r3, 0x190(r31)
/* 000075EC 801F05A8 */ lwz r0, 0x5a8(r31)
/* 000075F0 80630008 */ lwz r3, 8(r3)
/* 000075F4 54001838 */ slwi r0, r0, 3
/* 000075F8 7C03002E */ lwzx r0, r3, r0
/* 000075FC 28000000 */ cmplwi r0, 0
/* 00007600 7C1B0378 */ mr r27, r0
/* 00007604 41820044 */ beq lbl_00007648
/* 00007608 801B0004 */ lwz r0, 4(r27)
/* 0000760C 5400073B */ rlwinm. r0, r0, 0, 0x1c, 0x1d
/* 00007610 41820010 */ beq lbl_00007620
/* 00007614 387B0000 */ addi r3, r27, 0
/* 00007618 38800000 */ li r4, 0
/* 0000761C 4BFF8B41 */ bl avdisp_get_matrices
lbl_00007620:
/* 00007620 7F63DB78 */ mr r3, r27
/* 00007624 4BFF8B39 */ bl avdisp_draw_model_culled_sort_none
/* 00007628 38600014 */ li r3, 0x14
/* 0000762C 38800001 */ li r4, 1
/* 00007630 4BFF8B2D */ bl window_set_cursor_pos
/* 00007634 3C600000 */ lis r3, lbl_00014638@ha
/* 00007638 C03B0014 */ lfs f1, 0x14(r27)
/* 0000763C 38630000 */ addi r3, r3, lbl_00014638@l
/* 00007640 4CC63242 */ crset 6
/* 00007644 4BFF8B19 */ bl window_printf_2
lbl_00007648:
/* 00007648 38600028 */ li r3, 0x28
/* 0000764C 38800001 */ li r4, 1
/* 00007650 4BFF8B0D */ bl window_set_cursor_pos
/* 00007654 38600000 */ li r3, 0
/* 00007658 4BFF8B05 */ bl perf_stop_timer
/* 0000765C 3CA00000 */ lis r5, lbl_00013920@ha
/* 00007660 4CC63182 */ crclr 6
/* 00007664 38830000 */ addi r4, r3, 0
/* 00007668 38650000 */ addi r3, r5, lbl_00013920@l
/* 0000766C 4BFF8AF1 */ bl window_printf_2
/* 00007670 881F0D5B */ lbz r0, 0xd5b(r31)
/* 00007674 28000000 */ cmplwi r0, 0
/* 00007678 41820080 */ beq lbl_000076F8
/* 0000767C 807F0190 */ lwz r3, 0x190(r31)
/* 00007680 801F05A8 */ lwz r0, 0x5a8(r31)
/* 00007684 80630008 */ lwz r3, 8(r3)
/* 00007688 54001838 */ slwi r0, r0, 3
/* 0000768C 7F63002E */ lwzx r27, r3, r0
/* 00007690 4BFF8ACD */ bl mathutil_mtxA_from_mtxB
/* 00007694 C03E01BC */ lfs f1, 0x1bc(r30)
/* 00007698 4BFF8AC5 */ bl avdisp_set_alpha
/* 0000769C 281B0000 */ cmplwi r27, 0
/* 000076A0 4182000C */ beq lbl_000076AC
/* 000076A4 387B0008 */ addi r3, r27, 8
/* 000076A8 4BFF8AB5 */ bl mathutil_mtxA_translate
lbl_000076AC:
/* 000076AC C03F0D50 */ lfs f1, 0xd50(r31)
/* 000076B0 C81E01D8 */ lfd f0, 0x1d8(r30)
/* 000076B4 FC210024 */ fdiv f1, f1, f0
/* 000076B8 FC200818 */ frsp f1, f1
/* 000076BC 4BFF8AA1 */ bl mathutil_mtxA_scale_s
/* 000076C0 3C600000 */ lis r3, mathutilData@ha
/* 000076C4 3BC30000 */ addi r30, r3, mathutilData@l
/* 000076C8 807E0000 */ lwz r3, 0(r30)
/* 000076CC 38800000 */ li r4, 0
/* 000076D0 4BFF8A8D */ bl GXLoadPosMtxImm
/* 000076D4 807E0000 */ lwz r3, 0(r30)
/* 000076D8 38800000 */ li r4, 0
/* 000076DC 4BFF8A81 */ bl GXLoadNrmMtxImm
/* 000076E0 3C600000 */ lis r3, commonGma@ha
/* 000076E4 38630000 */ addi r3, r3, commonGma@l
/* 000076E8 80630000 */ lwz r3, 0(r3)
/* 000076EC 80630008 */ lwz r3, 8(r3)
/* 000076F0 806300A0 */ lwz r3, 0xa0(r3)
/* 000076F4 4BFF8A69 */ bl avdisp_draw_model_unculled_sort_none
lbl_000076F8:
/* 000076F8 A87F0188 */ lha r3, 0x188(r31)
/* 000076FC 38030200 */ addi r0, r3, 0x200
/* 00007700 B01F0188 */ sth r0, 0x188(r31)
lbl_00007704:
/* 00007704 BB610064 */ lmw r27, 0x64(r1)
/* 00007708 8001007C */ lwz r0, 0x7c(r1)
/* 0000770C 38210078 */ addi r1, r1, 0x78
/* 00007710 7C0803A6 */ mtlr r0
/* 00007714 4E800020 */ blr 
lbl_00007718:
/* 00007718 7C0802A6 */ mflr r0
/* 0000771C 3C600000 */ lis r3, stageHeap@ha
/* 00007720 90010004 */ stw r0, 4(r1)
/* 00007724 38630000 */ addi r3, r3, stageHeap@l
/* 00007728 3CC00000 */ lis r6, lbl_0000FE78@ha
/* 0000772C 9421FFD0 */ stwu r1, -0x30(r1)
/* 00007730 3CA00000 */ lis r5, lbl_10000000@ha
/* 00007734 3C800000 */ lis r4, lbl_000102B0@ha
/* 00007738 BEE1000C */ stmw r23, 0xc(r1)
/* 0000773C 3B260000 */ addi r25, r6, lbl_0000FE78@l
/* 00007740 3BA50000 */ addi r29, r5, lbl_10000000@l
/* 00007744 3BC40000 */ addi r30, r4, lbl_000102B0@l
/* 00007748 80630000 */ lwz r3, 0(r3)
/* 0000774C 4BFF8A11 */ bl OSSetCurrentHeap
/* 00007750 3B030000 */ addi r24, r3, 0
/* 00007754 3860000F */ li r3, 0xf
/* 00007758 4BFF8A05 */ bl event_start
/* 0000775C 38600002 */ li r3, 2
/* 00007760 4BFF89FD */ bl camera_set_state_all
/* 00007764 3C600000 */ lis r3, currentCamera@ha
/* 00007768 C0190060 */ lfs f0, 0x60(r25)
/* 0000776C 38C30000 */ addi r6, r3, currentCamera@l
/* 00007770 80860000 */ lwz r4, 0(r6)
/* 00007774 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007778 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000777C D0040000 */ stfs f0, 0(r4)
/* 00007780 38800020 */ li r4, 0x20
/* 00007784 C019012C */ lfs f0, 0x12c(r25)
/* 00007788 80A60000 */ lwz r5, 0(r6)
/* 0000778C D0050004 */ stfs f0, 4(r5)
/* 00007790 C0190170 */ lfs f0, 0x170(r25)
/* 00007794 80A60000 */ lwz r5, 0(r6)
/* 00007798 D0050008 */ stfs f0, 8(r5)
/* 0000779C C0190060 */ lfs f0, 0x60(r25)
/* 000077A0 80A60000 */ lwz r5, 0(r6)
/* 000077A4 D005000C */ stfs f0, 0xc(r5)
/* 000077A8 C0190060 */ lfs f0, 0x60(r25)
/* 000077AC 80A60000 */ lwz r5, 0(r6)
/* 000077B0 D0050010 */ stfs f0, 0x10(r5)
/* 000077B4 C0190060 */ lfs f0, 0x60(r25)
/* 000077B8 80A60000 */ lwz r5, 0(r6)
/* 000077BC D0050014 */ stfs f0, 0x14(r5)
/* 000077C0 80630000 */ lwz r3, 0(r3)
/* 000077C4 4BFF8999 */ bl OSAllocFromHeap
/* 000077C8 907D0D5C */ stw r3, 0xd5c(r29)
/* 000077CC 801D0D5C */ lwz r0, 0xd5c(r29)
/* 000077D0 28000000 */ cmplwi r0, 0
/* 000077D4 40820018 */ bne lbl_000077EC
/* 000077D8 387E0134 */ addi r3, r30, 0x134
/* 000077DC 4CC63182 */ crclr 6
/* 000077E0 38BE439C */ addi r5, r30, 0x439c
/* 000077E4 388013A5 */ li r4, 0x13a5
/* 000077E8 4BFF8975 */ bl OSPanic
lbl_000077EC:
/* 000077EC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000077F0 38800000 */ li r4, 0
/* 000077F4 38A00020 */ li r5, 0x20
/* 000077F8 4BFF8965 */ bl memset
/* 000077FC 387E3010 */ addi r3, r30, 0x3010
/* 00007800 4BFF895D */ bl DVDChangeDir
/* 00007804 387E43AC */ addi r3, r30, 0x43ac
/* 00007808 4BFF8955 */ bl load_tpl
/* 0000780C 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007810 90640000 */ stw r3, 0(r4)
/* 00007814 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007818 80830000 */ lwz r4, 0(r3)
/* 0000781C 28040000 */ cmplwi r4, 0
/* 00007820 41820014 */ beq lbl_00007834
/* 00007824 387E43B8 */ addi r3, r30, 0x43b8
/* 00007828 4BFF8935 */ bl load_gma
/* 0000782C 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007830 90640004 */ stw r3, 4(r4)
lbl_00007834:
/* 00007834 387E35F8 */ addi r3, r30, 0x35f8
/* 00007838 4BFF8925 */ bl DVDChangeDir
/* 0000783C 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007840 80630004 */ lwz r3, 4(r3)
/* 00007844 80030000 */ lwz r0, 0(r3)
/* 00007848 2C000000 */ cmpwi r0, 0
/* 0000784C 408102B8 */ ble lbl_00007B04
/* 00007850 3B400000 */ li r26, 0
/* 00007854 3B200000 */ li r25, 0
/* 00007858 48000094 */ b lbl_000078EC
lbl_0000785C:
/* 0000785C 57231838 */ slwi r3, r25, 3
/* 00007860 80840008 */ lwz r4, 8(r4)
/* 00007864 38030004 */ addi r0, r3, 4
/* 00007868 7EE4002E */ lwzx r23, r4, r0
/* 0000786C 7EE3BB78 */ mr r3, r23
/* 00007870 4BFF88ED */ bl strlen
/* 00007874 7C7B1B78 */ mr r27, r3
/* 00007878 48000008 */ b lbl_00007880
lbl_0000787C:
/* 0000787C 3B7BFFFF */ addi r27, r27, -1
lbl_00007880:
/* 00007880 381BFFFF */ addi r0, r27, -1
/* 00007884 7C1700AE */ lbzx r0, r23, r0
/* 00007888 7C000774 */ extsb r0, r0
/* 0000788C 2C000030 */ cmpwi r0, 0x30
/* 00007890 4180000C */ blt lbl_0000789C
/* 00007894 2C000039 */ cmpwi r0, 0x39
/* 00007898 4081FFE4 */ ble lbl_0000787C
lbl_0000789C:
/* 0000789C 3B990001 */ addi r28, r25, 1
/* 000078A0 57991838 */ slwi r25, r28, 3
/* 000078A4 4800002C */ b lbl_000078D0
lbl_000078A8:
/* 000078A8 80830008 */ lwz r4, 8(r3)
/* 000078AC 38190004 */ addi r0, r25, 4
/* 000078B0 38770000 */ addi r3, r23, 0
/* 000078B4 7C84002E */ lwzx r4, r4, r0
/* 000078B8 7F65DB78 */ mr r5, r27
/* 000078BC 4BFF88A1 */ bl strncmp
/* 000078C0 2C030000 */ cmpwi r3, 0
/* 000078C4 40820020 */ bne lbl_000078E4
/* 000078C8 3B390008 */ addi r25, r25, 8
/* 000078CC 3B9C0001 */ addi r28, r28, 1
lbl_000078D0:
/* 000078D0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000078D4 80630004 */ lwz r3, 4(r3)
/* 000078D8 80030000 */ lwz r0, 0(r3)
/* 000078DC 7C1C0000 */ cmpw r28, r0
/* 000078E0 4180FFC8 */ blt lbl_000078A8
lbl_000078E4:
/* 000078E4 3B3C0000 */ addi r25, r28, 0
/* 000078E8 3B5A0001 */ addi r26, r26, 1
lbl_000078EC:
/* 000078EC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000078F0 80830004 */ lwz r4, 4(r3)
/* 000078F4 80040000 */ lwz r0, 0(r4)
/* 000078F8 7C190000 */ cmpw r25, r0
/* 000078FC 4180FF60 */ blt lbl_0000785C
/* 00007900 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007904 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00007908 5757103A */ slwi r23, r26, 2
/* 0000790C 80630000 */ lwz r3, 0(r3)
/* 00007910 7EE4BB78 */ mr r4, r23
/* 00007914 4BFF8849 */ bl OSAllocFromHeap
/* 00007918 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000791C 90640014 */ stw r3, 0x14(r4)
/* 00007920 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007924 80030014 */ lwz r0, 0x14(r3)
/* 00007928 28000000 */ cmplwi r0, 0
/* 0000792C 40820018 */ bne lbl_00007944
/* 00007930 387E0134 */ addi r3, r30, 0x134
/* 00007934 4CC63182 */ crclr 6
/* 00007938 38BE439C */ addi r5, r30, 0x439c
/* 0000793C 388013CC */ li r4, 0x13cc
/* 00007940 4BFF881D */ bl OSPanic
lbl_00007944:
/* 00007944 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007948 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000794C 80630000 */ lwz r3, 0(r3)
/* 00007950 7EE4BB78 */ mr r4, r23
/* 00007954 4BFF8809 */ bl OSAllocFromHeap
/* 00007958 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000795C 90640018 */ stw r3, 0x18(r4)
/* 00007960 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007964 80030018 */ lwz r0, 0x18(r3)
/* 00007968 28000000 */ cmplwi r0, 0
/* 0000796C 40820018 */ bne lbl_00007984
/* 00007970 387E0134 */ addi r3, r30, 0x134
/* 00007974 4CC63182 */ crclr 6
/* 00007978 38BE439C */ addi r5, r30, 0x439c
/* 0000797C 388013CE */ li r4, 0x13ce
/* 00007980 4BFF87DD */ bl OSPanic
lbl_00007984:
/* 00007984 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007988 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000798C 80630000 */ lwz r3, 0(r3)
/* 00007990 7EE4BB78 */ mr r4, r23
/* 00007994 4BFF87C9 */ bl OSAllocFromHeap
/* 00007998 809D0D5C */ lwz r4, 0xd5c(r29)
/* 0000799C 9064001C */ stw r3, 0x1c(r4)
/* 000079A0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 000079A4 8003001C */ lwz r0, 0x1c(r3)
/* 000079A8 28000000 */ cmplwi r0, 0
/* 000079AC 40820018 */ bne lbl_000079C4
/* 000079B0 387E0134 */ addi r3, r30, 0x134
/* 000079B4 4CC63182 */ crclr 6
/* 000079B8 38BE439C */ addi r5, r30, 0x439c
/* 000079BC 388013D0 */ li r4, 0x13d0
/* 000079C0 4BFF879D */ bl OSPanic
lbl_000079C4:
/* 000079C4 809D0D5C */ lwz r4, 0xd5c(r29)
/* 000079C8 3B200000 */ li r25, 0
/* 000079CC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000079D0 93440008 */ stw r26, 8(r4)
/* 000079D4 3B990000 */ addi r28, r25, 0
/* 000079D8 3BE30000 */ addi r31, r3, __OSCurrHeap@l
/* 000079DC 48000114 */ b lbl_00007AF0
lbl_000079E0:
/* 000079E0 57231838 */ slwi r3, r25, 3
/* 000079E4 80840008 */ lwz r4, 8(r4)
/* 000079E8 38030004 */ addi r0, r3, 4
/* 000079EC 7F64002E */ lwzx r27, r4, r0
/* 000079F0 7F63DB78 */ mr r3, r27
/* 000079F4 4BFF8769 */ bl strlen
/* 000079F8 7C7A1B78 */ mr r26, r3
/* 000079FC 48000008 */ b lbl_00007A04
lbl_00007A00:
/* 00007A00 3B5AFFFF */ addi r26, r26, -1
lbl_00007A04:
/* 00007A04 381AFFFF */ addi r0, r26, -1
/* 00007A08 7C1B00AE */ lbzx r0, r27, r0
/* 00007A0C 7C000774 */ extsb r0, r0
/* 00007A10 2C000030 */ cmpwi r0, 0x30
/* 00007A14 4180000C */ blt lbl_00007A20
/* 00007A18 2C000039 */ cmpwi r0, 0x39
/* 00007A1C 4081FFE4 */ ble lbl_00007A00
lbl_00007A20:
/* 00007A20 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A24 389A0001 */ addi r4, r26, 1
/* 00007A28 80630014 */ lwz r3, 0x14(r3)
/* 00007A2C 7F23E12E */ stwx r25, r3, r28
/* 00007A30 807F0000 */ lwz r3, 0(r31)
/* 00007A34 4BFF8729 */ bl OSAllocFromHeap
/* 00007A38 809D0D5C */ lwz r4, 0xd5c(r29)
/* 00007A3C 8084001C */ lwz r4, 0x1c(r4)
/* 00007A40 7C64E12E */ stwx r3, r4, r28
/* 00007A44 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A48 8063001C */ lwz r3, 0x1c(r3)
/* 00007A4C 7C03E02E */ lwzx r0, r3, r28
/* 00007A50 28000000 */ cmplwi r0, 0
/* 00007A54 40820018 */ bne lbl_00007A6C
/* 00007A58 387E0134 */ addi r3, r30, 0x134
/* 00007A5C 4CC63182 */ crclr 6
/* 00007A60 38BE439C */ addi r5, r30, 0x439c
/* 00007A64 388013DC */ li r4, 0x13dc
/* 00007A68 4BFF86F5 */ bl OSPanic
lbl_00007A6C:
/* 00007A6C 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A70 389B0000 */ addi r4, r27, 0
/* 00007A74 38BA0000 */ addi r5, r26, 0
/* 00007A78 8063001C */ lwz r3, 0x1c(r3)
/* 00007A7C 7C63E02E */ lwzx r3, r3, r28
/* 00007A80 4BFF86DD */ bl strncpy
/* 00007A84 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007A88 3B390001 */ addi r25, r25, 1
/* 00007A8C 38000000 */ li r0, 0
/* 00007A90 8063001C */ lwz r3, 0x1c(r3)
/* 00007A94 57371838 */ slwi r23, r25, 3
/* 00007A98 7C63E02E */ lwzx r3, r3, r28
/* 00007A9C 7C03D1AE */ stbx r0, r3, r26
/* 00007AA0 4800002C */ b lbl_00007ACC
lbl_00007AA4:
/* 00007AA4 80830008 */ lwz r4, 8(r3)
/* 00007AA8 38170004 */ addi r0, r23, 4
/* 00007AAC 387B0000 */ addi r3, r27, 0
/* 00007AB0 7C84002E */ lwzx r4, r4, r0
/* 00007AB4 7F45D378 */ mr r5, r26
/* 00007AB8 4BFF86A5 */ bl strncmp
/* 00007ABC 2C030000 */ cmpwi r3, 0
/* 00007AC0 40820020 */ bne lbl_00007AE0
/* 00007AC4 3AF70008 */ addi r23, r23, 8
/* 00007AC8 3B390001 */ addi r25, r25, 1
lbl_00007ACC:
/* 00007ACC 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AD0 80630004 */ lwz r3, 4(r3)
/* 00007AD4 80030000 */ lwz r0, 0(r3)
/* 00007AD8 7C190000 */ cmpw r25, r0
/* 00007ADC 4180FFC8 */ blt lbl_00007AA4
lbl_00007AE0:
/* 00007AE0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AE4 80630018 */ lwz r3, 0x18(r3)
/* 00007AE8 7F23E12E */ stwx r25, r3, r28
/* 00007AEC 3B9C0004 */ addi r28, r28, 4
lbl_00007AF0:
/* 00007AF0 807D0D5C */ lwz r3, 0xd5c(r29)
/* 00007AF4 80830004 */ lwz r4, 4(r3)
/* 00007AF8 80040000 */ lwz r0, 0(r4)
/* 00007AFC 7C190000 */ cmpw r25, r0
/* 00007B00 4180FEE0 */ blt lbl_000079E0
lbl_00007B04:
/* 00007B04 7F03C378 */ mr r3, r24
/* 00007B08 4BFF8655 */ bl OSSetCurrentHeap
/* 00007B0C 3CA00000 */ lis r5, lbl_00007BE0@ha
/* 00007B10 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00007B14 38050000 */ addi r0, r5, lbl_00007BE0@l
/* 00007B18 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00007B1C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00007B20 3800007F */ li r0, 0x7f
/* 00007B24 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00007B28 BAE1000C */ lmw r23, 0xc(r1)
/* 00007B2C 80010034 */ lwz r0, 0x34(r1)
/* 00007B30 38210030 */ addi r1, r1, 0x30
/* 00007B34 7C0803A6 */ mtlr r0
/* 00007B38 4E800020 */ blr 
lbl_00007B3C:
/* 00007B3C 3C600000 */ lis r3, controllerInfo@ha
/* 00007B40 38630000 */ addi r3, r3, controllerInfo@l
/* 00007B44 38C30018 */ addi r6, r3, 0x18
/* 00007B48 3C600000 */ lis r3, lbl_10000D5C@ha
/* 00007B4C A0860000 */ lhz r4, 0(r6)
/* 00007B50 38630000 */ addi r3, r3, lbl_10000D5C@l
/* 00007B54 80630000 */ lwz r3, 0(r3)
/* 00007B58 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00007B5C 80E3000C */ lwz r7, 0xc(r3)
/* 00007B60 38A3000C */ addi r5, r3, 0xc
/* 00007B64 41820018 */ beq lbl_00007B7C
/* 00007B68 80030008 */ lwz r0, 8(r3)
/* 00007B6C 38E70001 */ addi r7, r7, 1
/* 00007B70 7C070000 */ cmpw r7, r0
/* 00007B74 41800008 */ blt lbl_00007B7C
/* 00007B78 38E00000 */ li r7, 0
lbl_00007B7C:
/* 00007B7C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00007B80 41820014 */ beq lbl_00007B94
/* 00007B84 34E7FFFF */ addic. r7, r7, -1
/* 00007B88 4080000C */ bge lbl_00007B94
/* 00007B8C 80630008 */ lwz r3, 8(r3)
/* 00007B90 38E3FFFF */ addi r7, r3, -1
lbl_00007B94:
/* 00007B94 90E50000 */ stw r7, 0(r5)
/* 00007B98 3C600000 */ lis r3, lbl_10000D5C@ha
/* 00007B9C 38630000 */ addi r3, r3, lbl_10000D5C@l
/* 00007BA0 A0860000 */ lhz r4, 0(r6)
/* 00007BA4 80630000 */ lwz r3, 0(r3)
/* 00007BA8 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00007BAC 84A30010 */ lwzu r5, 0x10(r3)
/* 00007BB0 41820014 */ beq lbl_00007BC4
/* 00007BB4 38A50001 */ addi r5, r5, 1
/* 00007BB8 2C05000A */ cmpwi r5, 0xa
/* 00007BBC 40810008 */ ble lbl_00007BC4
/* 00007BC0 38A0000A */ li r5, 0xa
lbl_00007BC4:
/* 00007BC4 548007FF */ clrlwi. r0, r4, 0x1f
/* 00007BC8 41820010 */ beq lbl_00007BD8
/* 00007BCC 34A5FFFF */ addic. r5, r5, -1
/* 00007BD0 40800008 */ bge lbl_00007BD8
/* 00007BD4 38A00000 */ li r5, 0
lbl_00007BD8:
/* 00007BD8 90A30000 */ stw r5, 0(r3)
/* 00007BDC 4E800020 */ blr 
