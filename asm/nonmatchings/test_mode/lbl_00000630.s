/* 00000630 7C0802A6 */ mflr r0
/* 00000634 3C600000 */ lis r3, lbl_000102B0@ha
/* 00000638 90010004 */ stw r0, 4(r1)
/* 0000063C 38800001 */ li r4, 1
/* 00000640 9421FFE0 */ stwu r1, -0x20(r1)
/* 00000644 BF410008 */ stmw r26, 8(r1)
/* 00000648 3B830000 */ addi r28, r3, lbl_000102B0@l
/* 0000064C 38600001 */ li r3, 1
/* 00000650 4BFFFB0D */ bl window_set_cursor_pos
/* 00000654 387C03C0 */ addi r3, r28, 0x3c0
/* 00000658 4CC63182 */ crclr 6
/* 0000065C 4BFFFB01 */ bl window_printf_2
/* 00000660 3C800000 */ lis r4, lbl_802F1F40@ha
/* 00000664 3C600000 */ lis r3, bgTypeNames@ha
/* 00000668 3CA00000 */ lis r5, loadingStageIdRequest@ha
/* 0000066C 3B7C027C */ addi r27, r28, 0x27c
/* 00000670 3BC40000 */ addi r30, r4, lbl_802F1F40@l
/* 00000674 3BE30000 */ addi r31, r3, bgTypeNames@l
/* 00000678 3BA50000 */ addi r29, r5, loadingStageIdRequest@l
/* 0000067C 3B400000 */ li r26, 0
lbl_00000680:
/* 00000680 3860000E */ li r3, 0xe
/* 00000684 389A0003 */ addi r4, r26, 3
/* 00000688 4BFFFAD5 */ bl window_set_cursor_pos
/* 0000068C 801B0000 */ lwz r0, 0(r27)
/* 00000690 2C000002 */ cmpwi r0, 2
/* 00000694 41820078 */ beq lbl_0000070C
/* 00000698 40800014 */ bge lbl_000006AC
/* 0000069C 2C000000 */ cmpwi r0, 0
/* 000006A0 41820044 */ beq lbl_000006E4
/* 000006A4 40800054 */ bge lbl_000006F8
/* 000006A8 48000080 */ b lbl_00000728
lbl_000006AC:
/* 000006AC 2C000004 */ cmpwi r0, 4
/* 000006B0 40800078 */ bge lbl_00000728
/* 000006B4 38600002 */ li r3, 2
/* 000006B8 4BFFFAA5 */ bl window_set_text_color
/* 000006BC 3860FFF8 */ li r3, -8
/* 000006C0 38800001 */ li r4, 1
/* 000006C4 4BFFFA99 */ bl window_move_cursor
/* 000006C8 809B0004 */ lwz r4, 4(r27)
/* 000006CC 387C03CC */ addi r3, r28, 0x3cc
/* 000006D0 4CC63182 */ crclr 6
/* 000006D4 4BFFFA89 */ bl window_printf_2
/* 000006D8 38600000 */ li r3, 0
/* 000006DC 4BFFFA81 */ bl window_set_text_color
/* 000006E0 48000048 */ b lbl_00000728
lbl_000006E4:
/* 000006E4 809B0004 */ lwz r4, 4(r27)
/* 000006E8 387C03CC */ addi r3, r28, 0x3cc
/* 000006EC 4CC63182 */ crclr 6
/* 000006F0 4BFFFA6D */ bl window_printf_2
/* 000006F4 48000034 */ b lbl_00000728
lbl_000006F8:
/* 000006F8 A89D0000 */ lha r4, 0(r29)
/* 000006FC 387C03D0 */ addi r3, r28, 0x3d0
/* 00000700 4CC63182 */ crclr 6
/* 00000704 4BFFFA59 */ bl window_printf_2
/* 00000708 48000020 */ b lbl_00000728
lbl_0000070C:
/* 0000070C A89E0000 */ lha r4, 0(r30)
/* 00000710 387C03E0 */ addi r3, r28, 0x3e0
/* 00000714 4CC63182 */ crclr 6
/* 00000718 5480103A */ slwi r0, r4, 2
/* 0000071C 7CBF0214 */ add r5, r31, r0
/* 00000720 80A50000 */ lwz r5, 0(r5)
/* 00000724 4BFFFA39 */ bl window_printf_2
lbl_00000728:
/* 00000728 3B5A0001 */ addi r26, r26, 1
/* 0000072C 281A001B */ cmplwi r26, 0x1b
/* 00000730 3B7B000C */ addi r27, r27, 0xc
/* 00000734 4180FF4C */ blt lbl_00000680
/* 00000738 3C600000 */ lis r3, lbl_10000000@ha
/* 0000073C 80830000 */ lwz r4, lbl_10000000@l(r3)
/* 00000740 3860000C */ li r3, 0xc
/* 00000744 38840003 */ addi r4, r4, 3
/* 00000748 5484043E */ clrlwi r4, r4, 0x10
/* 0000074C 4BFFFA11 */ bl window_set_cursor_pos
/* 00000750 38600001 */ li r3, 1
/* 00000754 4BFFFA09 */ bl window_set_text_color
/* 00000758 387C0400 */ addi r3, r28, 0x400
/* 0000075C 4CC63182 */ crclr 6
/* 00000760 4BFFF9FD */ bl window_printf_2
/* 00000764 38600000 */ li r3, 0
/* 00000768 4BFFF9F5 */ bl window_set_text_color
/* 0000076C BB410008 */ lmw r26, 8(r1)
/* 00000770 80010024 */ lwz r0, 0x24(r1)
/* 00000774 38210020 */ addi r1, r1, 0x20
/* 00000778 7C0803A6 */ mtlr r0
/* 0000077C 4E800020 */ blr 
