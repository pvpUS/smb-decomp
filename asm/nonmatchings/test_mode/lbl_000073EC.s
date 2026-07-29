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
