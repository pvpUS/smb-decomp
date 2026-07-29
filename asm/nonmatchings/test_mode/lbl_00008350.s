/* 00008350 7C0802A6 */ mflr r0
/* 00008354 3C600000 */ lis r3, modeCtrl@ha
/* 00008358 90010004 */ stw r0, 4(r1)
/* 0000835C 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 00008360 3C800000 */ lis r4, lbl_10000000@ha
/* 00008364 9421FEC0 */ stwu r1, -0x140(r1)
/* 00008368 BF410128 */ stmw r26, 0x128(r1)
/* 0000836C 3B430000 */ addi r26, r3, modeCtrl@l
/* 00008370 3C600000 */ lis r3, lbl_000102B0@ha
/* 00008374 3B9A0008 */ addi r28, r26, 8
/* 00008378 3BE50000 */ addi r31, r5, lbl_0000FE78@l
/* 0000837C 3BA40000 */ addi r29, r4, lbl_10000000@l
/* 00008380 3BC30000 */ addi r30, r3, lbl_000102B0@l
/* 00008384 801A0008 */ lwz r0, 8(r26)
/* 00008388 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000838C 40820254 */ bne lbl_000085E0
/* 00008390 3C600000 */ lis r3, controllerInfo@ha
/* 00008394 809A0010 */ lwz r4, 0x10(r26)
/* 00008398 38C30000 */ addi r6, r3, controllerInfo@l
/* 0000839C A0E60030 */ lhz r7, 0x30(r6)
/* 000083A0 387A0010 */ addi r3, r26, 0x10
/* 000083A4 54E00739 */ rlwinm. r0, r7, 0, 0x1c, 0x1c
/* 000083A8 40820040 */ bne lbl_000083E8
/* 000083AC 3CA00000 */ lis r5, analogInputs@ha
/* 000083B0 38A50000 */ addi r5, r5, analogInputs@l
/* 000083B4 A0050008 */ lhz r0, 8(r5)
/* 000083B8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083BC 4082002C */ bne lbl_000083E8
/* 000083C0 A0060000 */ lhz r0, 0(r6)
/* 000083C4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083C8 40820010 */ bne lbl_000083D8
/* 000083CC A0050000 */ lhz r0, 0(r5)
/* 000083D0 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 000083D4 41820020 */ beq lbl_000083F4
lbl_000083D8:
/* 000083D8 3CA00000 */ lis r5, analogInputs@ha
/* 000083DC A0050000 */ lhz r0, analogInputs@l(r5)
/* 000083E0 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000083E4 41820010 */ beq lbl_000083F4
lbl_000083E8:
/* 000083E8 3484FFFF */ addic. r4, r4, -1
/* 000083EC 40800008 */ bge lbl_000083F4
/* 000083F0 38800008 */ li r4, 8
lbl_000083F4:
/* 000083F4 54E0077B */ rlwinm. r0, r7, 0, 0x1d, 0x1d
/* 000083F8 40820044 */ bne lbl_0000843C
/* 000083FC 3CA00000 */ lis r5, analogInputs@ha
/* 00008400 38C50000 */ addi r6, r5, analogInputs@l
/* 00008404 A0060008 */ lhz r0, 8(r6)
/* 00008408 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000840C 40820030 */ bne lbl_0000843C
/* 00008410 3CA00000 */ lis r5, controllerInfo@ha
/* 00008414 A0050000 */ lhz r0, controllerInfo@l(r5)
/* 00008418 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0000841C 40820010 */ bne lbl_0000842C
/* 00008420 A0060000 */ lhz r0, 0(r6)
/* 00008424 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00008428 41820024 */ beq lbl_0000844C
lbl_0000842C:
/* 0000842C 3CA00000 */ lis r5, analogInputs@ha
/* 00008430 A0050000 */ lhz r0, analogInputs@l(r5)
/* 00008434 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00008438 41820014 */ beq lbl_0000844C
lbl_0000843C:
/* 0000843C 38840001 */ addi r4, r4, 1
/* 00008440 28040009 */ cmplwi r4, 9
/* 00008444 41800008 */ blt lbl_0000844C
/* 00008448 38800000 */ li r4, 0
lbl_0000844C:
/* 0000844C 3CA00000 */ lis r5, controllerInfo@ha
/* 00008450 90830000 */ stw r4, 0(r3)
/* 00008454 38850000 */ addi r4, r5, controllerInfo@l
/* 00008458 A0040018 */ lhz r0, 0x18(r4)
/* 0000845C 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00008460 41820394 */ beq lbl_000087F4
/* 00008464 80030000 */ lwz r0, 0(r3)
/* 00008468 3B600000 */ li r27, 0
/* 0000846C 3F404330 */ lis r26, 0x4330
/* 00008470 1C00000C */ mulli r0, r0, 0xc
/* 00008474 7FDE0214 */ add r30, r30, r0
/* 00008478 3BDE4464 */ addi r30, r30, 0x4464
lbl_0000847C:
/* 0000847C A0BE0004 */ lhz r5, 4(r30)
/* 00008480 3CC00000 */ lis r6, lbl_0000FED0@ha
/* 00008484 A0FE0006 */ lhz r7, 6(r30)
/* 00008488 3C600000 */ lis r3, lbl_0000FED0@ha
/* 0000848C 20850270 */ subfic r4, r5, 0x270
/* 00008490 6C848000 */ xoris r4, r4, 0x8000
/* 00008494 90A10114 */ stw r5, 0x114(r1)
/* 00008498 200701B0 */ subfic r0, r7, 0x1b0
/* 0000849C C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 000084A0 90810124 */ stw r4, 0x124(r1)
/* 000084A4 6C008000 */ xoris r0, r0, 0x8000
/* 000084A8 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000084AC C8660000 */ lfd f3, lbl_0000FED0@l(r6)
/* 000084B0 93410120 */ stw r26, 0x120(r1)
/* 000084B4 C8FF01E0 */ lfd f7, 0x1e0(r31)
/* 000084B8 3C800000 */ lis r4, lbl_0000FEC8@ha
/* 000084BC 9001011C */ stw r0, 0x11c(r1)
/* 000084C0 7F63DB78 */ mr r3, r27
/* 000084C4 C8410120 */ lfd f2, 0x120(r1)
/* 000084C8 90E1010C */ stw r7, 0x10c(r1)
/* 000084CC FC421828 */ fsub f2, f2, f3
/* 000084D0 C8850000 */ lfd f4, lbl_0000FEC8@l(r5)
/* 000084D4 93410118 */ stw r26, 0x118(r1)
/* 000084D8 C8BF01E8 */ lfd f5, 0x1e8(r31)
/* 000084DC 93410110 */ stw r26, 0x110(r1)
/* 000084E0 C8010118 */ lfd f0, 0x118(r1)
/* 000084E4 C8610110 */ lfd f3, 0x110(r1)
/* 000084E8 FCC00828 */ fsub f6, f0, f1
/* 000084EC 93410108 */ stw r26, 0x108(r1)
/* 000084F0 FC223824 */ fdiv f1, f2, f7
/* 000084F4 C8440000 */ lfd f2, lbl_0000FEC8@l(r4)
/* 000084F8 C8010108 */ lfd f0, 0x108(r1)
/* 000084FC FC632028 */ fsub f3, f3, f4
/* 00008500 FC001028 */ fsub f0, f0, f2
/* 00008504 FC462824 */ fdiv f2, f6, f5
/* 00008508 FC633824 */ fdiv f3, f3, f7
/* 0000850C FC802824 */ fdiv f4, f0, f5
/* 00008510 FC200818 */ frsp f1, f1
/* 00008514 FC401018 */ frsp f2, f2
/* 00008518 FC601818 */ frsp f3, f3
/* 0000851C FC802018 */ frsp f4, f4
/* 00008520 4BFF7C3D */ bl setup_camera_viewport
/* 00008524 3B7B0001 */ addi r27, r27, 1
/* 00008528 2C1B0004 */ cmpwi r27, 4
/* 0000852C 4180FF50 */ blt lbl_0000847C
/* 00008530 38000001 */ li r0, 1
/* 00008534 B01D0D62 */ sth r0, 0xd62(r29)
/* 00008538 4BFF7C25 */ bl event_finish_all
/* 0000853C A87D0D62 */ lha r3, 0xd62(r29)
/* 00008540 4BFF7C1D */ bl background_set_random_seed
/* 00008544 A87D0D62 */ lha r3, 0xd62(r29)
/* 00008548 4BFF7C15 */ bl load_stage
/* 0000854C 801E0008 */ lwz r0, 8(r30)
/* 00008550 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008554 41820028 */ beq lbl_0000857C
/* 00008558 38600001 */ li r3, 1
/* 0000855C 4BFF7C01 */ bl event_start
/* 00008560 3860000F */ li r3, 0xf
/* 00008564 4BFF7BF9 */ bl event_start
/* 00008568 38600010 */ li r3, 0x10
/* 0000856C 4BFF7BF1 */ bl event_start
/* 00008570 38600048 */ li r3, 0x48
/* 00008574 4BFF7BE9 */ bl camera_set_state_all
/* 00008578 4800004C */ b lbl_000085C4
lbl_0000857C:
/* 0000857C A87D0D62 */ lha r3, 0xd62(r29)
/* 00008580 4BFF7BDD */ bl background_set_random_seed
/* 00008584 38600001 */ li r3, 1
/* 00008588 4BFF7BD5 */ bl event_start
/* 0000858C 38600004 */ li r3, 4
/* 00008590 4BFF7BCD */ bl event_start
/* 00008594 3860000D */ li r3, 0xd
/* 00008598 4BFF7BC5 */ bl event_start
/* 0000859C 38600013 */ li r3, 0x13
/* 000085A0 4BFF7BBD */ bl event_start
/* 000085A4 3860000F */ li r3, 0xf
/* 000085A8 4BFF7BB5 */ bl event_start
/* 000085AC 38600005 */ li r3, 5
/* 000085B0 4BFF7BAD */ bl event_start
/* 000085B4 38600010 */ li r3, 0x10
/* 000085B8 4BFF7BA5 */ bl event_start
/* 000085BC 3860000C */ li r3, 0xc
/* 000085C0 4BFF7B9D */ bl camera_set_state_all
lbl_000085C4:
/* 000085C4 801C0000 */ lwz r0, 0(r28)
/* 000085C8 3C600000 */ lis r3, modeCtrl@ha
/* 000085CC 60000004 */ ori r0, r0, 4
/* 000085D0 901C0000 */ stw r0, 0(r28)
/* 000085D4 38000000 */ li r0, 0
/* 000085D8 90030000 */ stw r0, modeCtrl@l(r3)
/* 000085DC 48000218 */ b lbl_000087F4
lbl_000085E0:
/* 000085E0 3C600000 */ lis r3, globalAnimTimer@ha
/* 000085E4 3BE00000 */ li r31, 0
/* 000085E8 93E30000 */ stw r31, globalAnimTimer@l(r3)
/* 000085EC 4BFF7B71 */ bl event_finish_all
/* 000085F0 807A0010 */ lwz r3, 0x10(r26)
/* 000085F4 801A0000 */ lwz r0, 0(r26)
/* 000085F8 1C63000C */ mulli r3, r3, 0xc
/* 000085FC 5400073E */ clrlwi r0, r0, 0x1c
/* 00008600 7F7E1A14 */ add r27, r30, r3
/* 00008604 2C00000A */ cmpwi r0, 0xa
/* 00008608 3B7B4464 */ addi r27, r27, 0x4464
/* 0000860C 41820020 */ beq lbl_0000862C
/* 00008610 40800010 */ bge lbl_00008620
/* 00008614 2C000000 */ cmpwi r0, 0
/* 00008618 418200A4 */ beq lbl_000086BC
/* 0000861C 48000128 */ b lbl_00008744
lbl_00008620:
/* 00008620 2C00000F */ cmpwi r0, 0xf
/* 00008624 418200AC */ beq lbl_000086D0
/* 00008628 4800011C */ b lbl_00008744
lbl_0000862C:
/* 0000862C A07B0004 */ lhz r3, 4(r27)
/* 00008630 38A00005 */ li r5, 5
/* 00008634 A09B0006 */ lhz r4, 6(r27)
/* 00008638 38C00000 */ li r6, 0
/* 0000863C 38E00000 */ li r7, 0
/* 00008640 4BFF7B1D */ bl GXGetTexBufferSize
/* 00008644 7C601B78 */ mr r0, r3
/* 00008648 807D0D64 */ lwz r3, 0xd64(r29)
/* 0000864C 7C1F0378 */ mr r31, r0
/* 00008650 389F0000 */ addi r4, r31, 0
/* 00008654 4BFF7B09 */ bl DCFlushRange
/* 00008658 A0BB0004 */ lhz r5, 4(r27)
/* 0000865C 38610008 */ addi r3, r1, 8
/* 00008660 A0DB0006 */ lhz r6, 6(r27)
/* 00008664 389E44E0 */ addi r4, r30, 0x44e0
/* 00008668 A8FD0D62 */ lha r7, 0xd62(r29)
/* 0000866C 4CC63182 */ crclr 6
/* 00008670 4BFF7AED */ bl sprintf
/* 00008674 38610008 */ addi r3, r1, 8
/* 00008678 38800002 */ li r4, 2
/* 0000867C 4BFF7AE1 */ bl func_800A722C
/* 00008680 7C7A1B79 */ or. r26, r3, r3
/* 00008684 40820018 */ bne lbl_0000869C
/* 00008688 387E0134 */ addi r3, r30, 0x134
/* 0000868C 4CC63182 */ crclr 6
/* 00008690 38BE4510 */ addi r5, r30, 0x4510
/* 00008694 38801561 */ li r4, 0x1561
/* 00008698 4BFF7AC5 */ bl OSPanic
lbl_0000869C:
/* 0000869C 381F001F */ addi r0, r31, 0x1f
/* 000086A0 809D0D64 */ lwz r4, 0xd64(r29)
/* 000086A4 387A0000 */ addi r3, r26, 0
/* 000086A8 54050034 */ rlwinm r5, r0, 0, 0, 0x1a
/* 000086AC 4BFF7AB1 */ bl func_800A7440
/* 000086B0 7F43D378 */ mr r3, r26
/* 000086B4 4BFF7AA9 */ bl func_800A7314
/* 000086B8 4800008C */ b lbl_00008744
lbl_000086BC:
/* 000086BC 3C600000 */ lis r3, debugFlags@ha
/* 000086C0 84030000 */ lwzu r0, debugFlags@l(r3)
/* 000086C4 60000002 */ ori r0, r0, 2
/* 000086C8 90030000 */ stw r0, 0(r3)
/* 000086CC 48000078 */ b lbl_00008744
lbl_000086D0:
/* 000086D0 3C600000 */ lis r3, debugFlags@ha
/* 000086D4 84030000 */ lwzu r0, debugFlags@l(r3)
/* 000086D8 540007FA */ rlwinm r0, r0, 0, 0x1f, 0x1d
/* 000086DC 90030000 */ stw r0, 0(r3)
/* 000086E0 AB5D0D62 */ lha r26, 0xd62(r29)
/* 000086E4 3B5A0001 */ addi r26, r26, 1
/* 000086E8 2C1A00C8 */ cmpwi r26, 0xc8
/* 000086EC 40810018 */ ble lbl_00008704
/* 000086F0 4BFF7A6D */ bl destroy_all_sprites
/* 000086F4 801C0000 */ lwz r0, 0(r28)
/* 000086F8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 000086FC 901C0000 */ stw r0, 0(r28)
/* 00008700 48000044 */ b lbl_00008744
lbl_00008704:
/* 00008704 7F400734 */ extsh r0, r26
/* 00008708 B01D0D62 */ sth r0, 0xd62(r29)
/* 0000870C 7F43D378 */ mr r3, r26
/* 00008710 4BFF7A4D */ bl background_set_random_seed
/* 00008714 7F43D378 */ mr r3, r26
/* 00008718 4BFF7A45 */ bl load_stage
/* 0000871C 801B0008 */ lwz r0, 8(r27)
/* 00008720 540007FF */ clrlwi. r0, r0, 0x1f
/* 00008724 4182001C */ beq lbl_00008740
/* 00008728 7F43D378 */ mr r3, r26
/* 0000872C 4BFF7A31 */ bl is_bonus_stage
/* 00008730 28030000 */ cmplwi r3, 0
/* 00008734 4182000C */ beq lbl_00008740
/* 00008738 3C600000 */ lis r3, s_u_lightPool@ha
/* 0000873C 9BE30000 */ stb r31, s_u_lightPool@l(r3)
lbl_00008740:
/* 00008740 4BFF7A1D */ bl GXInvalidateTexAll
lbl_00008744:
/* 00008744 801B0008 */ lwz r0, 8(r27)
/* 00008748 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000874C 41820028 */ beq lbl_00008774
/* 00008750 38600001 */ li r3, 1
/* 00008754 4BFF7A09 */ bl event_start
/* 00008758 3860000F */ li r3, 0xf
/* 0000875C 4BFF7A01 */ bl event_start
/* 00008760 38600010 */ li r3, 0x10
/* 00008764 4BFF79F9 */ bl event_start
/* 00008768 38600048 */ li r3, 0x48
/* 0000876C 4BFF79F1 */ bl camera_set_state_all
/* 00008770 4800004C */ b lbl_000087BC
lbl_00008774:
/* 00008774 A87D0D62 */ lha r3, 0xd62(r29)
/* 00008778 4BFF79E5 */ bl background_set_random_seed
/* 0000877C 38600001 */ li r3, 1
/* 00008780 4BFF79DD */ bl event_start
/* 00008784 38600004 */ li r3, 4
/* 00008788 4BFF79D5 */ bl event_start
/* 0000878C 3860000D */ li r3, 0xd
/* 00008790 4BFF79CD */ bl event_start
/* 00008794 38600013 */ li r3, 0x13
/* 00008798 4BFF79C5 */ bl event_start
/* 0000879C 3860000F */ li r3, 0xf
/* 000087A0 4BFF79BD */ bl event_start
/* 000087A4 38600005 */ li r3, 5
/* 000087A8 4BFF79B5 */ bl event_start
/* 000087AC 38600010 */ li r3, 0x10
/* 000087B0 4BFF79AD */ bl event_start
/* 000087B4 3860000C */ li r3, 0xc
/* 000087B8 4BFF79A5 */ bl camera_set_state_all
lbl_000087BC:
/* 000087BC 3C600000 */ lis r3, controllerInfo@ha
/* 000087C0 38630000 */ addi r3, r3, controllerInfo@l
/* 000087C4 A0030018 */ lhz r0, 0x18(r3)
/* 000087C8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000087CC 41820014 */ beq lbl_000087E0
/* 000087D0 4BFF798D */ bl destroy_all_sprites
/* 000087D4 801C0000 */ lwz r0, 0(r28)
/* 000087D8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 000087DC 901C0000 */ stw r0, 0(r28)
lbl_000087E0:
/* 000087E0 3C600000 */ lis r3, modeCtrl@ha
/* 000087E4 38830000 */ addi r4, r3, modeCtrl@l
/* 000087E8 80640000 */ lwz r3, 0(r4)
/* 000087EC 38030001 */ addi r0, r3, 1
/* 000087F0 90040000 */ stw r0, 0(r4)
lbl_000087F4:
/* 000087F4 BB410128 */ lmw r26, 0x128(r1)
/* 000087F8 80010144 */ lwz r0, 0x144(r1)
/* 000087FC 38210140 */ addi r1, r1, 0x140
/* 00008800 7C0803A6 */ mtlr r0
/* 00008804 4E800020 */ blr 
