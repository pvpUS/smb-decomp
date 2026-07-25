/* 000040B4 4E800020 */ blr 
lbl_000040B8:
/* 000040B8 7C0802A6 */ mflr r0
/* 000040BC 3C600000 */ lis r3, debugFlags@ha
/* 000040C0 90010004 */ stw r0, 4(r1)
/* 000040C4 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000040C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000040CC 93E10014 */ stw r31, 0x14(r1)
/* 000040D0 3BE40000 */ addi r31, r4, lbl_0000FE78@l
/* 000040D4 93C10010 */ stw r30, 0x10(r1)
/* 000040D8 93A1000C */ stw r29, 0xc(r1)
/* 000040DC 80030000 */ lwz r0, debugFlags@l(r3)
/* 000040E0 3C600000 */ lis r3, lbl_10000000@ha
/* 000040E4 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000040E8 7000000A */ andi. r0, r0, 0xa
/* 000040EC 408200BC */ bne lbl_000041A8
/* 000040F0 3860000F */ li r3, 0xf
/* 000040F4 4BFFC069 */ bl event_start
/* 000040F8 38600003 */ li r3, 3
/* 000040FC 4BFFC061 */ bl camera_set_state_all
/* 00004100 3C600000 */ lis r3, currentCamera@ha
/* 00004104 C01F0060 */ lfs f0, 0x60(r31)
/* 00004108 38830000 */ addi r4, r3, currentCamera@l
/* 0000410C 80640000 */ lwz r3, 0(r4)
/* 00004110 3BC00000 */ li r30, 0
/* 00004114 D0030000 */ stfs f0, 0(r3)
/* 00004118 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000411C 80640000 */ lwz r3, 0(r4)
/* 00004120 D0030004 */ stfs f0, 4(r3)
/* 00004124 C01F0128 */ lfs f0, 0x128(r31)
/* 00004128 80640000 */ lwz r3, 0(r4)
/* 0000412C D0030008 */ stfs f0, 8(r3)
/* 00004130 C01F0060 */ lfs f0, 0x60(r31)
/* 00004134 80640000 */ lwz r3, 0(r4)
/* 00004138 D003000C */ stfs f0, 0xc(r3)
/* 0000413C C01F0078 */ lfs f0, 0x78(r31)
/* 00004140 80640000 */ lwz r3, 0(r4)
/* 00004144 D0030010 */ stfs f0, 0x10(r3)
/* 00004148 C01F0060 */ lfs f0, 0x60(r31)
/* 0000414C 80640000 */ lwz r3, 0(r4)
/* 00004150 D0030014 */ stfs f0, 0x14(r3)
/* 00004154 93DD0158 */ stw r30, 0x158(r29)
/* 00004158 93DD0154 */ stw r30, 0x154(r29)
/* 0000415C 93DD0150 */ stw r30, 0x150(r29)
/* 00004160 93DD013C */ stw r30, 0x13c(r29)
/* 00004164 4BFFFC31 */ bl lbl_00003D94
/* 00004168 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000416C 3C600000 */ lis r3, modeCtrl@ha
/* 00004170 3CA00000 */ lis r5, lbl_000040B4@ha
/* 00004174 D01D0140 */ stfs f0, 0x140(r29)
/* 00004178 38630000 */ addi r3, r3, modeCtrl@l
/* 0000417C 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00004180 93C30010 */ stw r30, 0x10(r3)
/* 00004184 38050000 */ addi r0, r5, lbl_000040B4@l
/* 00004188 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000418C 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00004190 38000078 */ li r0, 0x78
/* 00004194 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00004198 C03F012C */ lfs f1, 0x12c(r31)
/* 0000419C FC400890 */ fmr f2, f1
/* 000041A0 FC600890 */ fmr f3, f1
/* 000041A4 4BFFBFB9 */ bl avdisp_set_ambient
lbl_000041A8:
/* 000041A8 8001001C */ lwz r0, 0x1c(r1)
/* 000041AC 83E10014 */ lwz r31, 0x14(r1)
/* 000041B0 83C10010 */ lwz r30, 0x10(r1)
/* 000041B4 7C0803A6 */ mtlr r0
/* 000041B8 83A1000C */ lwz r29, 0xc(r1)
/* 000041BC 38210018 */ addi r1, r1, 0x18
/* 000041C0 4E800020 */ blr 
lbl_000041C4:
/* 000041C4 7C0802A6 */ mflr r0
/* 000041C8 3C600000 */ lis r3, lbl_10000000@ha
/* 000041CC 90010004 */ stw r0, 4(r1)
/* 000041D0 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000041D4 9421FF48 */ stwu r1, -0xb8(r1)
/* 000041D8 BE21007C */ stmw r17, 0x7c(r1)
/* 000041DC 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000041E0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000041E4 3AE40000 */ addi r23, r4, lbl_0000FE78@l
/* 000041E8 3B030000 */ addi r24, r3, lbl_000102B0@l
/* 000041EC 801F0150 */ lwz r0, 0x150(r31)
/* 000041F0 83DF00BC */ lwz r30, 0xbc(r31)
/* 000041F4 2C000000 */ cmpwi r0, 0
/* 000041F8 41820080 */ beq lbl_00004278
/* 000041FC 4800B9AD */ bl lbl_0000FBA8
/* 00004200 2C030000 */ cmpwi r3, 0
/* 00004204 907F0150 */ stw r3, 0x150(r31)
/* 00004208 40820DF0 */ bne lbl_00004FF8
/* 0000420C 4BFFBF51 */ bl u_clear_buffers_2_and_5
/* 00004210 38600003 */ li r3, 3
/* 00004214 4BFFBF49 */ bl camera_set_state_all
/* 00004218 3C600000 */ lis r3, currentCamera@ha
/* 0000421C C0170060 */ lfs f0, 0x60(r23)
/* 00004220 38830000 */ addi r4, r3, currentCamera@l
/* 00004224 80640000 */ lwz r3, 0(r4)
/* 00004228 38000000 */ li r0, 0
/* 0000422C D0030000 */ stfs f0, 0(r3)
/* 00004230 C01700B8 */ lfs f0, 0xb8(r23)
/* 00004234 80640000 */ lwz r3, 0(r4)
/* 00004238 D0030004 */ stfs f0, 4(r3)
/* 0000423C C0170128 */ lfs f0, 0x128(r23)
/* 00004240 80640000 */ lwz r3, 0(r4)
/* 00004244 D0030008 */ stfs f0, 8(r3)
/* 00004248 C0170060 */ lfs f0, 0x60(r23)
/* 0000424C 80640000 */ lwz r3, 0(r4)
/* 00004250 D003000C */ stfs f0, 0xc(r3)
/* 00004254 C0170078 */ lfs f0, 0x78(r23)
/* 00004258 80640000 */ lwz r3, 0(r4)
/* 0000425C D0030010 */ stfs f0, 0x10(r3)
/* 00004260 C0170060 */ lfs f0, 0x60(r23)
/* 00004264 80640000 */ lwz r3, 0(r4)
/* 00004268 D0030014 */ stfs f0, 0x14(r3)
/* 0000426C 901F013C */ stw r0, 0x13c(r31)
/* 00004270 4BFFFB25 */ bl lbl_00003D94
/* 00004274 48000D84 */ b lbl_00004FF8
lbl_00004278:
/* 00004278 3C600000 */ lis r3, controllerInfo@ha
/* 0000427C 38630000 */ addi r3, r3, controllerInfo@l
/* 00004280 A0830030 */ lhz r4, 0x30(r3)
/* 00004284 3AA30030 */ addi r21, r3, 0x30
/* 00004288 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 0000428C 40820020 */ bne lbl_000042AC
/* 00004290 A0A30000 */ lhz r5, 0(r3)
/* 00004294 54A00739 */ rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 00004298 4182003C */ beq lbl_000042D4
/* 0000429C 3C600000 */ lis r3, analogInputs@ha
/* 000042A0 A0030000 */ lhz r0, analogInputs@l(r3)
/* 000042A4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000042A8 4182002C */ beq lbl_000042D4
lbl_000042AC:
/* 000042AC 3C600000 */ lis r3, modeCtrl@ha
/* 000042B0 38630000 */ addi r3, r3, modeCtrl@l
/* 000042B4 38830010 */ addi r4, r3, 0x10
/* 000042B8 80630010 */ lwz r3, 0x10(r3)
/* 000042BC 3403FFFF */ addic. r0, r3, -1
/* 000042C0 90040000 */ stw r0, 0(r4)
/* 000042C4 40800058 */ bge lbl_0000431C
/* 000042C8 38000007 */ li r0, 7
/* 000042CC 90040000 */ stw r0, 0(r4)
/* 000042D0 4800004C */ b lbl_0000431C
lbl_000042D4:
/* 000042D4 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 000042D8 4082001C */ bne lbl_000042F4
/* 000042DC 54A0077B */ rlwinm. r0, r5, 0, 0x1d, 0x1d
/* 000042E0 4182003C */ beq lbl_0000431C
/* 000042E4 3C600000 */ lis r3, analogInputs@ha
/* 000042E8 A0030000 */ lhz r0, analogInputs@l(r3)
/* 000042EC 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000042F0 4182002C */ beq lbl_0000431C
lbl_000042F4:
/* 000042F4 3C600000 */ lis r3, modeCtrl@ha
/* 000042F8 38630000 */ addi r3, r3, modeCtrl@l
/* 000042FC 38830010 */ addi r4, r3, 0x10
/* 00004300 80630010 */ lwz r3, 0x10(r3)
/* 00004304 38030001 */ addi r0, r3, 1
/* 00004308 2C000008 */ cmpwi r0, 8
/* 0000430C 90040000 */ stw r0, 0(r4)
/* 00004310 4180000C */ blt lbl_0000431C
/* 00004314 38000000 */ li r0, 0
/* 00004318 90040000 */ stw r0, 0(r4)
lbl_0000431C:
/* 0000431C 38600002 */ li r3, 2
/* 00004320 38800001 */ li r4, 1
/* 00004324 4BFFBE39 */ bl window_set_cursor_pos
/* 00004328 3C800000 */ lis r4, u_motAnimCount@ha
/* 0000432C 3C600000 */ lis r3, motLabel@ha
/* 00004330 3CA00000 */ lis r5, motsklFileData@ha
/* 00004334 3CE00000 */ lis r7, modeCtrl@ha
/* 00004338 3CC00000 */ lis r6, lbl_00013178@ha
/* 0000433C 3B440000 */ addi r26, r4, u_motAnimCount@l
/* 00004340 3B630000 */ addi r27, r3, motLabel@l
/* 00004344 3A410038 */ addi r18, r1, 0x38
/* 00004348 3B250000 */ addi r25, r5, motsklFileData@l
/* 0000434C 3A870000 */ addi r20, r7, modeCtrl@l
/* 00004350 3A660000 */ addi r19, r6, lbl_00013178@l
/* 00004354 3AC00000 */ li r22, 0
/* 00004358 3BA00000 */ li r29, 0
/* 0000435C 3F804330 */ lis r28, 0x4330
lbl_00004360:
/* 00004360 80770130 */ lwz r3, 0x130(r23)
/* 00004364 80170134 */ lwz r0, 0x134(r23)
/* 00004368 90610038 */ stw r3, 0x38(r1)
/* 0000436C 9001003C */ stw r0, 0x3c(r1)
/* 00004370 80770138 */ lwz r3, 0x138(r23)
/* 00004374 8017013C */ lwz r0, 0x13c(r23)
/* 00004378 90610040 */ stw r3, 0x40(r1)
/* 0000437C 90010044 */ stw r0, 0x44(r1)
/* 00004380 80140010 */ lwz r0, 0x10(r20)
/* 00004384 7C160000 */ cmpw r22, r0
/* 00004388 40820024 */ bne lbl_000043AC
/* 0000438C 38600002 */ li r3, 2
/* 00004390 4BFFBDCD */ bl window_set_text_color
/* 00004394 3860FFFF */ li r3, -1
/* 00004398 38800000 */ li r4, 0
/* 0000439C 4BFFBDC1 */ bl window_move_cursor
/* 000043A0 38782E1C */ addi r3, r24, 0x2e1c
/* 000043A4 4BFFBDB9 */ bl u_debug_print
/* 000043A8 4800000C */ b lbl_000043B4
lbl_000043AC:
/* 000043AC 38600000 */ li r3, 0
/* 000043B0 4BFFBDAD */ bl window_set_text_color
lbl_000043B4:
/* 000043B4 28160007 */ cmplwi r22, 7
/* 000043B8 41810184 */ bgt lbl_0000453C
/* 000043BC 7C13E82E */ lwzx r0, r19, r29
/* 000043C0 7C0903A6 */ mtctr r0
/* 000043C4 4E800420 */ bctr 
lbl_000043C8:
/* 000043C8 811E0000 */ lwz r8, 0(r30)
/* 000043CC 38782E20 */ addi r3, r24, 0x2e20
/* 000043D0 80DB0000 */ lwz r6, 0(r27)
/* 000043D4 4CC63182 */ crclr 6
/* 000043D8 A0880032 */ lhz r4, 0x32(r8)
/* 000043DC A0E80038 */ lhz r7, 0x38(r8)
/* 000043E0 5480103A */ slwi r0, r4, 2
/* 000043E4 80BA0000 */ lwz r5, 0(r26)
/* 000043E8 A108003A */ lhz r8, 0x3a(r8)
/* 000043EC 7CC6002E */ lwzx r6, r6, r0
/* 000043F0 4BFFBD6D */ bl window_printf_2
/* 000043F4 48000148 */ b lbl_0000453C
lbl_000043F8:
/* 000043F8 809F0154 */ lwz r4, 0x154(r31)
/* 000043FC 38782E3C */ addi r3, r24, 0x2e3c
/* 00004400 80B90000 */ lwz r5, 0(r25)
/* 00004404 4CC63182 */ crclr 6
/* 00004408 1CC40018 */ mulli r6, r4, 0x18
/* 0000440C 80E50000 */ lwz r7, 0(r5)
/* 00004410 80A50004 */ lwz r5, 4(r5)
/* 00004414 38060014 */ addi r0, r6, 0x14
/* 00004418 7CC7002E */ lwzx r6, r7, r0
/* 0000441C 4BFFBD41 */ bl window_printf_2
/* 00004420 4800011C */ b lbl_0000453C
lbl_00004424:
/* 00004424 809F0158 */ lwz r4, 0x158(r31)
/* 00004428 38782E3C */ addi r3, r24, 0x2e3c
/* 0000442C 80B90000 */ lwz r5, 0(r25)
/* 00004430 4CC63182 */ crclr 6
/* 00004434 1C04001C */ mulli r0, r4, 0x1c
/* 00004438 80C50008 */ lwz r6, 8(r5)
/* 0000443C 80A5000C */ lwz r5, 0xc(r5)
/* 00004440 7CC6002E */ lwzx r6, r6, r0
/* 00004444 4BFFBD19 */ bl window_printf_2
/* 00004448 480000F4 */ b lbl_0000453C
lbl_0000444C:
/* 0000444C 809E00B4 */ lwz r4, 0xb4(r30)
/* 00004450 38782E4C */ addi r3, r24, 0x2e4c
/* 00004454 4CC63182 */ crclr 6
/* 00004458 5480103A */ slwi r0, r4, 2
/* 0000445C 7CB2002E */ lwzx r5, r18, r0
/* 00004460 4BFFBCFD */ bl window_printf_2
/* 00004464 480000D8 */ b lbl_0000453C
lbl_00004468:
/* 00004468 809E0090 */ lwz r4, 0x90(r30)
/* 0000446C 38782E5C */ addi r3, r24, 0x2e5c
/* 00004470 4CC63182 */ crclr 6
/* 00004474 38A00004 */ li r5, 4
/* 00004478 5480103A */ slwi r0, r4, 2
/* 0000447C 7CD80214 */ add r6, r24, r0
/* 00004480 80C62DC4 */ lwz r6, 0x2dc4(r6)
/* 00004484 4BFFBCD9 */ bl window_printf_2
/* 00004488 480000B4 */ b lbl_0000453C
lbl_0000448C:
/* 0000448C C03F0140 */ lfs f1, 0x140(r31)
/* 00004490 38782E70 */ addi r3, r24, 0x2e70
/* 00004494 4CC63242 */ crset 6
/* 00004498 4BFFBCC5 */ bl window_printf_2
/* 0000449C 480000A0 */ b lbl_0000453C
lbl_000044A0:
/* 000044A0 80FE0000 */ lwz r7, 0(r30)
/* 000044A4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000044A8 C8450000 */ lfd f2, lbl_0000FEC8@l(r5)
/* 000044AC 38782E88 */ addi r3, r24, 0x2e88
/* 000044B0 A007008E */ lhz r0, 0x8e(r7)
/* 000044B4 A087008C */ lhz r4, 0x8c(r7)
/* 000044B8 4CC63242 */ crset 6
/* 000044BC 90010074 */ stw r0, 0x74(r1)
/* 000044C0 C0070098 */ lfs f0, 0x98(r7)
/* 000044C4 5480103A */ slwi r0, r4, 2
/* 000044C8 93810070 */ stw r28, 0x70(r1)
/* 000044CC 80DB0000 */ lwz r6, 0(r27)
/* 000044D0 C8210070 */ lfd f1, 0x70(r1)
/* 000044D4 80BA0000 */ lwz r5, 0(r26)
/* 000044D8 EC211028 */ fsubs f1, f1, f2
/* 000044DC 7CC6002E */ lwzx r6, r6, r0
/* 000044E0 C04700A0 */ lfs f2, 0xa0(r7)
/* 000044E4 EC21002A */ fadds f1, f1, f0
/* 000044E8 4BFFBC75 */ bl window_printf_2
/* 000044EC 48000050 */ b lbl_0000453C
lbl_000044F0:
/* 000044F0 80FE0000 */ lwz r7, 0(r30)
/* 000044F4 3CA00000 */ lis r5, lbl_0000FEC8@ha
/* 000044F8 C8450000 */ lfd f2, lbl_0000FEC8@l(r5)
/* 000044FC 38782E88 */ addi r3, r24, 0x2e88
/* 00004500 A007411E */ lhz r0, 0x411e(r7)
/* 00004504 A087411C */ lhz r4, 0x411c(r7)
/* 00004508 4CC63242 */ crset 6
/* 0000450C 90010074 */ stw r0, 0x74(r1)
/* 00004510 C0074128 */ lfs f0, 0x4128(r7)
/* 00004514 5480103A */ slwi r0, r4, 2
/* 00004518 93810070 */ stw r28, 0x70(r1)
/* 0000451C 80DB0000 */ lwz r6, 0(r27)
/* 00004520 C8210070 */ lfd f1, 0x70(r1)
/* 00004524 80BA0000 */ lwz r5, 0(r26)
/* 00004528 EC211028 */ fsubs f1, f1, f2
/* 0000452C 7CC6002E */ lwzx r6, r6, r0
/* 00004530 C0474130 */ lfs f2, 0x4130(r7)
/* 00004534 EC21002A */ fadds f1, f1, f0
/* 00004538 4BFFBC25 */ bl window_printf_2
lbl_0000453C:
/* 0000453C 3AD60001 */ addi r22, r22, 1
/* 00004540 2C160008 */ cmpwi r22, 8
/* 00004544 3BBD0004 */ addi r29, r29, 4
/* 00004548 4180FE18 */ blt lbl_00004360
/* 0000454C 38600000 */ li r3, 0
/* 00004550 4BFFBC0D */ bl window_set_text_color
/* 00004554 3C600000 */ lis r3, debugFlags@ha
/* 00004558 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000455C 7000000A */ andi. r0, r0, 0xa
/* 00004560 40820A98 */ bne lbl_00004FF8
/* 00004564 4BFFBBF9 */ bl mathutil_mtxA_from_mtxB
/* 00004568 3C600000 */ lis r3, controllerInfo@ha
/* 0000456C C8970140 */ lfd f4, 0x140(r23)
/* 00004570 3A430000 */ addi r18, r3, controllerInfo@l
/* 00004574 88920002 */ lbz r4, 2(r18)
/* 00004578 3CA00000 */ lis r5, lbl_0000FED0@ha
/* 0000457C 88120004 */ lbz r0, 4(r18)
/* 00004580 3C600000 */ lis r3, lbl_0000FED0@ha
/* 00004584 7C840774 */ extsb r4, r4
/* 00004588 7C000774 */ extsb r0, r0
/* 0000458C C8650000 */ lfd f3, lbl_0000FED0@l(r5)
/* 00004590 6C848000 */ xoris r4, r4, 0x8000
/* 00004594 C8230000 */ lfd f1, lbl_0000FED0@l(r3)
/* 00004598 6C008000 */ xoris r0, r0, 0x8000
/* 0000459C 90810074 */ stw r4, 0x74(r1)
/* 000045A0 3CE04330 */ lis r7, 0x4330
/* 000045A4 9001006C */ stw r0, 0x6c(r1)
/* 000045A8 38610048 */ addi r3, r1, 0x48
/* 000045AC 3CC00000 */ lis r6, lbl_0000FED0@ha
/* 000045B0 90E10070 */ stw r7, 0x70(r1)
/* 000045B4 3CA00000 */ lis r5, lbl_0000FED0@ha
/* 000045B8 7C641B78 */ mr r4, r3
/* 000045BC 90E10068 */ stw r7, 0x68(r1)
/* 000045C0 C8410070 */ lfd f2, 0x70(r1)
/* 000045C4 C8010068 */ lfd f0, 0x68(r1)
/* 000045C8 FC421828 */ fsub f2, f2, f3
/* 000045CC FC000828 */ fsub f0, f0, f1
/* 000045D0 FC2400B2 */ fmul f1, f4, f2
/* 000045D4 FC040032 */ fmul f0, f4, f0
/* 000045D8 FC010028 */ fsub f0, f1, f0
/* 000045DC FC000018 */ frsp f0, f0
/* 000045E0 D0010048 */ stfs f0, 0x48(r1)
/* 000045E4 88120003 */ lbz r0, 3(r18)
/* 000045E8 C8260000 */ lfd f1, lbl_0000FED0@l(r6)
/* 000045EC 7C000774 */ extsb r0, r0
/* 000045F0 C8570140 */ lfd f2, 0x140(r23)
/* 000045F4 6C008000 */ xoris r0, r0, 0x8000
/* 000045F8 90010064 */ stw r0, 0x64(r1)
/* 000045FC 90E10060 */ stw r7, 0x60(r1)
/* 00004600 C8010060 */ lfd f0, 0x60(r1)
/* 00004604 FC000828 */ fsub f0, f0, f1
/* 00004608 FC020032 */ fmul f0, f2, f0
/* 0000460C FC000018 */ frsp f0, f0
/* 00004610 D001004C */ stfs f0, 0x4c(r1)
/* 00004614 88120005 */ lbz r0, 5(r18)
/* 00004618 C8250000 */ lfd f1, lbl_0000FED0@l(r5)
/* 0000461C 7C000774 */ extsb r0, r0
/* 00004620 C8570148 */ lfd f2, 0x148(r23)
/* 00004624 6C008000 */ xoris r0, r0, 0x8000
/* 00004628 9001005C */ stw r0, 0x5c(r1)
/* 0000462C 90E10058 */ stw r7, 0x58(r1)
/* 00004630 C8010058 */ lfd f0, 0x58(r1)
/* 00004634 FC000828 */ fsub f0, f0, f1
/* 00004638 FC020032 */ fmul f0, f2, f0
/* 0000463C FC000018 */ frsp f0, f0
/* 00004640 D0010050 */ stfs f0, 0x50(r1)
/* 00004644 4BFFBB19 */ bl mathutil_mtxA_rigid_inv_tf_vec
/* 00004648 3C600000 */ lis r3, currentCamera@ha
/* 0000464C C0210048 */ lfs f1, 0x48(r1)
/* 00004650 3A630000 */ addi r19, r3, currentCamera@l
/* 00004654 80730000 */ lwz r3, 0(r19)
/* 00004658 C0030000 */ lfs f0, 0(r3)
/* 0000465C EC01002A */ fadds f0, f1, f0
/* 00004660 D0030000 */ stfs f0, 0(r3)
/* 00004664 80730000 */ lwz r3, 0(r19)
/* 00004668 C021004C */ lfs f1, 0x4c(r1)
/* 0000466C C4030004 */ lfsu f0, 4(r3)
/* 00004670 EC01002A */ fadds f0, f1, f0
/* 00004674 D0030000 */ stfs f0, 0(r3)
/* 00004678 80730000 */ lwz r3, 0(r19)
/* 0000467C C0210050 */ lfs f1, 0x50(r1)
/* 00004680 C4030008 */ lfsu f0, 8(r3)
/* 00004684 EC01002A */ fadds f0, f1, f0
/* 00004688 D0030000 */ stfs f0, 0(r3)
/* 0000468C A4120018 */ lhzu r0, 0x18(r18)
/* 00004690 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00004694 41820054 */ beq lbl_000046E8
/* 00004698 38600003 */ li r3, 3
/* 0000469C 4BFFBAC1 */ bl camera_set_state_all
/* 000046A0 C0170060 */ lfs f0, 0x60(r23)
/* 000046A4 80730000 */ lwz r3, 0(r19)
/* 000046A8 D0030000 */ stfs f0, 0(r3)
/* 000046AC C01700B8 */ lfs f0, 0xb8(r23)
/* 000046B0 80730000 */ lwz r3, 0(r19)
/* 000046B4 D0030004 */ stfs f0, 4(r3)
/* 000046B8 C0170128 */ lfs f0, 0x128(r23)
/* 000046BC 80730000 */ lwz r3, 0(r19)
/* 000046C0 D0030008 */ stfs f0, 8(r3)
/* 000046C4 C0170060 */ lfs f0, 0x60(r23)
/* 000046C8 80730000 */ lwz r3, 0(r19)
/* 000046CC D003000C */ stfs f0, 0xc(r3)
/* 000046D0 C0170078 */ lfs f0, 0x78(r23)
/* 000046D4 80730000 */ lwz r3, 0(r19)
/* 000046D8 D0030010 */ stfs f0, 0x10(r3)
/* 000046DC C0170060 */ lfs f0, 0x60(r23)
/* 000046E0 80730000 */ lwz r3, 0(r19)
/* 000046E4 D0030014 */ stfs f0, 0x14(r3)
lbl_000046E8:
/* 000046E8 3C600000 */ lis r3, modeCtrl@ha
/* 000046EC 38630000 */ addi r3, r3, modeCtrl@l
/* 000046F0 80030010 */ lwz r0, 0x10(r3)
/* 000046F4 28000007 */ cmplwi r0, 7
/* 000046F8 418108E0 */ bgt lbl_00004FD8
/* 000046FC 3C600000 */ lis r3, lbl_00013158@ha
/* 00004700 38630000 */ addi r3, r3, lbl_00013158@l
/* 00004704 5400103A */ slwi r0, r0, 2
/* 00004708 7C03002E */ lwzx r0, r3, r0
/* 0000470C 7C0903A6 */ mtctr r0
/* 00004710 4E800420 */ bctr 
lbl_00004714:
/* 00004714 A0B50000 */ lhz r5, 0(r21)
/* 00004718 809E0000 */ lwz r4, 0(r30)
/* 0000471C 54A307FF */ clrlwi. r3, r5, 0x1f
/* 00004720 A0040032 */ lhz r0, 0x32(r4)
/* 00004724 7C160378 */ mr r22, r0
/* 00004728 40820028 */ bne lbl_00004750
/* 0000472C 3C600000 */ lis r3, controllerInfo@ha
/* 00004730 A0830000 */ lhz r4, controllerInfo@l(r3)
/* 00004734 548307FF */ clrlwi. r3, r4, 0x1f
/* 00004738 4182006C */ beq lbl_000047A4
/* 0000473C 3C600000 */ lis r3, analogInputs@ha
/* 00004740 38630000 */ addi r3, r3, analogInputs@l
/* 00004744 A0630000 */ lhz r3, 0(r3)
/* 00004748 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 0000474C 41820058 */ beq lbl_000047A4
lbl_00004750:
/* 00004750 3C800000 */ lis r4, u_motAnimCount@ha
/* 00004754 3C600000 */ lis r3, motDat@ha
/* 00004758 38840000 */ addi r4, r4, u_motAnimCount@l
/* 0000475C 80A30000 */ lwz r5, motDat@l(r3)
/* 00004760 80840000 */ lwz r4, 0(r4)
lbl_00004764:
/* 00004764 3AD6FFFF */ addi r22, r22, -1
/* 00004768 2C160001 */ cmpwi r22, 1
/* 0000476C 40800008 */ bge lbl_00004774
/* 00004770 7C962378 */ mr r22, r4
lbl_00004774:
/* 00004774 38D6FFFF */ addi r6, r22, -1
/* 00004778 7CC30734 */ extsh r3, r6
/* 0000477C 2C030001 */ cmpwi r3, 1
/* 00004780 40800008 */ bge lbl_00004788
/* 00004784 7C860734 */ extsh r6, r4
lbl_00004788:
/* 00004788 7CC30734 */ extsh r3, r6
/* 0000478C 1C630018 */ mulli r3, r3, 0x18
/* 00004790 38630002 */ addi r3, r3, 2
/* 00004794 7C651A2E */ lhzx r3, r5, r3
/* 00004798 28030000 */ cmplwi r3, 0
/* 0000479C 4082FFC8 */ bne lbl_00004764
/* 000047A0 48000078 */ b lbl_00004818
lbl_000047A4:
/* 000047A4 54A307BD */ rlwinm. r3, r5, 0, 0x1e, 0x1e
/* 000047A8 40820020 */ bne lbl_000047C8
/* 000047AC 548307BD */ rlwinm. r3, r4, 0, 0x1e, 0x1e
/* 000047B0 41820068 */ beq lbl_00004818
/* 000047B4 3C600000 */ lis r3, analogInputs@ha
/* 000047B8 38630000 */ addi r3, r3, analogInputs@l
/* 000047BC A0630000 */ lhz r3, 0(r3)
/* 000047C0 546305AD */ rlwinm. r3, r3, 0, 0x16, 0x16
/* 000047C4 41820054 */ beq lbl_00004818
lbl_000047C8:
/* 000047C8 3C800000 */ lis r4, u_motAnimCount@ha
/* 000047CC 3C600000 */ lis r3, motDat@ha
/* 000047D0 38840000 */ addi r4, r4, u_motAnimCount@l
/* 000047D4 80A30000 */ lwz r5, motDat@l(r3)
/* 000047D8 80840000 */ lwz r4, 0(r4)
lbl_000047DC:
/* 000047DC 3AD60001 */ addi r22, r22, 1
/* 000047E0 7C162000 */ cmpw r22, r4
/* 000047E4 40810008 */ ble lbl_000047EC
/* 000047E8 3AC00001 */ li r22, 1
lbl_000047EC:
/* 000047EC 38D6FFFF */ addi r6, r22, -1
/* 000047F0 7CC30734 */ extsh r3, r6
/* 000047F4 2C030001 */ cmpwi r3, 1
/* 000047F8 40800008 */ bge lbl_00004800
/* 000047FC 7C860734 */ extsh r6, r4
lbl_00004800:
/* 00004800 7CC30734 */ extsh r3, r6
/* 00004804 1C630018 */ mulli r3, r3, 0x18
/* 00004808 38630002 */ addi r3, r3, 2
/* 0000480C 7C651A2E */ lhzx r3, r5, r3
/* 00004810 28030000 */ cmplwi r3, 0
/* 00004814 4082FFC8 */ bne lbl_000047DC
lbl_00004818:
/* 00004818 7C00B000 */ cmpw r0, r22
/* 0000481C 418207BC */ beq lbl_00004FD8
/* 00004820 3AA00000 */ li r21, 0
/* 00004824 56A0103A */ slwi r0, r21, 2
/* 00004828 7E7F0214 */ add r19, r31, r0
/* 0000482C 3C600000 */ lis r3, motLabel@ha
/* 00004830 56D4103A */ slwi r20, r22, 2
/* 00004834 3A230000 */ addi r17, r3, motLabel@l
/* 00004838 3A7300BC */ addi r19, r19, 0xbc
/* 0000483C 480001B4 */ b lbl_000049F0
lbl_00004840:
/* 00004840 80110000 */ lwz r0, 0(r17)
/* 00004844 7FB4002E */ lwzx r29, r20, r0
/* 00004848 7FA3EB78 */ mr r3, r29
/* 0000484C 4BFFB911 */ bl strlen
/* 00004850 3B400000 */ li r26, 0
/* 00004854 5740103A */ slwi r0, r26, 2
/* 00004858 7FD80214 */ add r30, r24, r0
/* 0000485C 3AE30000 */ addi r23, r3, 0
/* 00004860 3BDE2DE4 */ addi r30, r30, 0x2de4
lbl_00004864:
/* 00004864 807E0000 */ lwz r3, 0(r30)
/* 00004868 4BFFB8F5 */ bl strlen
/* 0000486C 3B830000 */ addi r28, r3, 0
/* 00004870 7C7CB850 */ subf r3, r28, r23
/* 00004874 3B630001 */ addi r27, r3, 1
/* 00004878 3B200000 */ li r25, 0
/* 0000487C 48000024 */ b lbl_000048A0
lbl_00004880:
/* 00004880 807E0000 */ lwz r3, 0(r30)
/* 00004884 38BC0000 */ addi r5, r28, 0
/* 00004888 7C9DCA14 */ add r4, r29, r25
/* 0000488C 4BFFB8D1 */ bl strncmp
/* 00004890 2C030000 */ cmpwi r3, 0
/* 00004894 40820008 */ bne lbl_0000489C
/* 00004898 48000024 */ b lbl_000048BC
lbl_0000489C:
/* 0000489C 3B390001 */ addi r25, r25, 1
lbl_000048A0:
/* 000048A0 7C19D800 */ cmpw r25, r27
/* 000048A4 4180FFDC */ blt lbl_00004880
/* 000048A8 3B5A0001 */ addi r26, r26, 1
/* 000048AC 2C1A0004 */ cmpwi r26, 4
/* 000048B0 3BDE0004 */ addi r30, r30, 4
/* 000048B4 4180FFB0 */ blt lbl_00004864
/* 000048B8 3B40FFFF */ li r26, -1
lbl_000048BC:
/* 000048BC 2C1A0002 */ cmpwi r26, 2
/* 000048C0 418200A0 */ beq lbl_00004960
/* 000048C4 40800014 */ bge lbl_000048D8
/* 000048C8 2C1A0000 */ cmpwi r26, 0
/* 000048CC 41820018 */ beq lbl_000048E4
/* 000048D0 40800050 */ bge lbl_00004920
/* 000048D4 48000108 */ b lbl_000049DC
lbl_000048D8:
/* 000048D8 2C1A0004 */ cmpwi r26, 4
/* 000048DC 40800100 */ bge lbl_000049DC
/* 000048E0 480000C0 */ b lbl_000049A0
lbl_000048E4:
/* 000048E4 807F013C */ lwz r3, 0x13c(r31)
/* 000048E8 2C030001 */ cmpwi r3, 1
/* 000048EC 41800020 */ blt lbl_0000490C
/* 000048F0 3803FFFF */ addi r0, r3, -1
/* 000048F4 901F013C */ stw r0, 0x13c(r31)
/* 000048F8 801F013C */ lwz r0, 0x13c(r31)
/* 000048FC 5400103A */ slwi r0, r0, 2
/* 00004900 7C7F0214 */ add r3, r31, r0
/* 00004904 806300FC */ lwz r3, 0xfc(r3)
/* 00004908 4BFFB855 */ bl thread_kill
lbl_0000490C:
/* 0000490C 38000000 */ li r0, 0
/* 00004910 901F0154 */ stw r0, 0x154(r31)
/* 00004914 901F0158 */ stw r0, 0x158(r31)
/* 00004918 4BFFF47D */ bl lbl_00003D94
/* 0000491C 480000C0 */ b lbl_000049DC
lbl_00004920:
/* 00004920 807F013C */ lwz r3, 0x13c(r31)
/* 00004924 2C030001 */ cmpwi r3, 1
/* 00004928 41800020 */ blt lbl_00004948
/* 0000492C 3803FFFF */ addi r0, r3, -1
/* 00004930 901F013C */ stw r0, 0x13c(r31)
/* 00004934 801F013C */ lwz r0, 0x13c(r31)
/* 00004938 5400103A */ slwi r0, r0, 2
/* 0000493C 7C7F0214 */ add r3, r31, r0
/* 00004940 806300FC */ lwz r3, 0xfc(r3)
/* 00004944 4BFFB819 */ bl thread_kill
lbl_00004948:
/* 00004948 38000002 */ li r0, 2
/* 0000494C 901F0154 */ stw r0, 0x154(r31)
/* 00004950 38000001 */ li r0, 1
/* 00004954 901F0158 */ stw r0, 0x158(r31)
/* 00004958 4BFFF43D */ bl lbl_00003D94
/* 0000495C 48000080 */ b lbl_000049DC
lbl_00004960:
/* 00004960 807F013C */ lwz r3, 0x13c(r31)
/* 00004964 2C030001 */ cmpwi r3, 1
/* 00004968 41800020 */ blt lbl_00004988
/* 0000496C 3803FFFF */ addi r0, r3, -1
/* 00004970 901F013C */ stw r0, 0x13c(r31)
/* 00004974 801F013C */ lwz r0, 0x13c(r31)
/* 00004978 5400103A */ slwi r0, r0, 2
/* 0000497C 7C7F0214 */ add r3, r31, r0
/* 00004980 806300FC */ lwz r3, 0xfc(r3)
/* 00004984 4BFFB7D9 */ bl thread_kill
lbl_00004988:
/* 00004988 38000003 */ li r0, 3
/* 0000498C 901F0154 */ stw r0, 0x154(r31)
/* 00004990 38000002 */ li r0, 2
/* 00004994 901F0158 */ stw r0, 0x158(r31)
/* 00004998 4BFFF3FD */ bl lbl_00003D94
/* 0000499C 48000040 */ b lbl_000049DC
lbl_000049A0:
/* 000049A0 807F013C */ lwz r3, 0x13c(r31)
/* 000049A4 2C030001 */ cmpwi r3, 1
/* 000049A8 41800020 */ blt lbl_000049C8
/* 000049AC 3803FFFF */ addi r0, r3, -1
/* 000049B0 901F013C */ stw r0, 0x13c(r31)
/* 000049B4 801F013C */ lwz r0, 0x13c(r31)
/* 000049B8 5400103A */ slwi r0, r0, 2
/* 000049BC 7C7F0214 */ add r3, r31, r0
/* 000049C0 806300FC */ lwz r3, 0xfc(r3)
/* 000049C4 4BFFB799 */ bl thread_kill
lbl_000049C8:
/* 000049C8 38000004 */ li r0, 4
/* 000049CC 901F0154 */ stw r0, 0x154(r31)
/* 000049D0 38000003 */ li r0, 3
/* 000049D4 901F0158 */ stw r0, 0x158(r31)
/* 000049D8 4BFFF3BD */ bl lbl_00003D94
lbl_000049DC:
/* 000049DC 80730000 */ lwz r3, 0(r19)
/* 000049E0 7EC4B378 */ mr r4, r22
/* 000049E4 4BFFB779 */ bl func_8008B9DC
/* 000049E8 3A730004 */ addi r19, r19, 4
/* 000049EC 3AB50001 */ addi r21, r21, 1
lbl_000049F0:
/* 000049F0 801F013C */ lwz r0, 0x13c(r31)
/* 000049F4 7C150000 */ cmpw r21, r0
/* 000049F8 4180FE48 */ blt lbl_00004840
/* 000049FC 480005DC */ b lbl_00004FD8
lbl_00004A00:
/* 00004A00 A0950000 */ lhz r4, 0(r21)
/* 00004A04 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004A08 40820024 */ bne lbl_00004A2C
/* 00004A0C 3C600000 */ lis r3, controllerInfo@ha
/* 00004A10 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004A14 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004A18 41820064 */ beq lbl_00004A7C
/* 00004A1C 3C600000 */ lis r3, analogInputs@ha
/* 00004A20 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004A24 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004A28 41820054 */ beq lbl_00004A7C
lbl_00004A2C:
/* 00004A2C 807F013C */ lwz r3, 0x13c(r31)
/* 00004A30 809E0000 */ lwz r4, 0(r30)
/* 00004A34 2C030001 */ cmpwi r3, 1
/* 00004A38 A2240032 */ lhz r17, 0x32(r4)
/* 00004A3C 41800020 */ blt lbl_00004A5C
/* 00004A40 3803FFFF */ addi r0, r3, -1
/* 00004A44 901F013C */ stw r0, 0x13c(r31)
/* 00004A48 801F013C */ lwz r0, 0x13c(r31)
/* 00004A4C 5400103A */ slwi r0, r0, 2
/* 00004A50 7C7F0214 */ add r3, r31, r0
/* 00004A54 806300FC */ lwz r3, 0xfc(r3)
/* 00004A58 4BFFB705 */ bl thread_kill
lbl_00004A5C:
/* 00004A5C 807F0154 */ lwz r3, 0x154(r31)
/* 00004A60 3803FFFF */ addi r0, r3, -1
/* 00004A64 901F0154 */ stw r0, 0x154(r31)
/* 00004A68 4BFFF32D */ bl lbl_00003D94
/* 00004A6C 387E0000 */ addi r3, r30, 0
/* 00004A70 38910000 */ addi r4, r17, 0
/* 00004A74 4BFFB6E9 */ bl func_8008B9DC
/* 00004A78 48000560 */ b lbl_00004FD8
lbl_00004A7C:
/* 00004A7C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004A80 4082001C */ bne lbl_00004A9C
/* 00004A84 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004A88 41820550 */ beq lbl_00004FD8
/* 00004A8C 3C600000 */ lis r3, analogInputs@ha
/* 00004A90 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004A94 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004A98 41820540 */ beq lbl_00004FD8
lbl_00004A9C:
/* 00004A9C 807F013C */ lwz r3, 0x13c(r31)
/* 00004AA0 809E0000 */ lwz r4, 0(r30)
/* 00004AA4 2C030001 */ cmpwi r3, 1
/* 00004AA8 A2240032 */ lhz r17, 0x32(r4)
/* 00004AAC 41800020 */ blt lbl_00004ACC
/* 00004AB0 3803FFFF */ addi r0, r3, -1
/* 00004AB4 901F013C */ stw r0, 0x13c(r31)
/* 00004AB8 801F013C */ lwz r0, 0x13c(r31)
/* 00004ABC 5400103A */ slwi r0, r0, 2
/* 00004AC0 7C7F0214 */ add r3, r31, r0
/* 00004AC4 806300FC */ lwz r3, 0xfc(r3)
/* 00004AC8 4BFFB695 */ bl thread_kill
lbl_00004ACC:
/* 00004ACC 807F0154 */ lwz r3, 0x154(r31)
/* 00004AD0 38030001 */ addi r0, r3, 1
/* 00004AD4 901F0154 */ stw r0, 0x154(r31)
/* 00004AD8 4BFFF2BD */ bl lbl_00003D94
/* 00004ADC 387E0000 */ addi r3, r30, 0
/* 00004AE0 38910000 */ addi r4, r17, 0
/* 00004AE4 4BFFB679 */ bl func_8008B9DC
/* 00004AE8 480004F0 */ b lbl_00004FD8
lbl_00004AEC:
/* 00004AEC A0950000 */ lhz r4, 0(r21)
/* 00004AF0 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004AF4 40820024 */ bne lbl_00004B18
/* 00004AF8 3C600000 */ lis r3, controllerInfo@ha
/* 00004AFC A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004B00 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004B04 41820088 */ beq lbl_00004B8C
/* 00004B08 3C600000 */ lis r3, analogInputs@ha
/* 00004B0C A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004B10 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004B14 41820078 */ beq lbl_00004B8C
lbl_00004B18:
/* 00004B18 807F013C */ lwz r3, 0x13c(r31)
/* 00004B1C 809E0000 */ lwz r4, 0(r30)
/* 00004B20 2C030001 */ cmpwi r3, 1
/* 00004B24 A2240032 */ lhz r17, 0x32(r4)
/* 00004B28 41800020 */ blt lbl_00004B48
/* 00004B2C 3803FFFF */ addi r0, r3, -1
/* 00004B30 901F013C */ stw r0, 0x13c(r31)
/* 00004B34 801F013C */ lwz r0, 0x13c(r31)
/* 00004B38 5400103A */ slwi r0, r0, 2
/* 00004B3C 7C7F0214 */ add r3, r31, r0
/* 00004B40 806300FC */ lwz r3, 0xfc(r3)
/* 00004B44 4BFFB619 */ bl thread_kill
lbl_00004B48:
/* 00004B48 807F0158 */ lwz r3, 0x158(r31)
/* 00004B4C 3803FFFF */ addi r0, r3, -1
/* 00004B50 901F0158 */ stw r0, 0x158(r31)
/* 00004B54 801F0158 */ lwz r0, 0x158(r31)
/* 00004B58 2C000000 */ cmpwi r0, 0
/* 00004B5C 4080001C */ bge lbl_00004B78
/* 00004B60 3C600000 */ lis r3, motsklFileData@ha
/* 00004B64 38630000 */ addi r3, r3, motsklFileData@l
/* 00004B68 80630000 */ lwz r3, 0(r3)
/* 00004B6C 8063000C */ lwz r3, 0xc(r3)
/* 00004B70 3803FFFF */ addi r0, r3, -1
/* 00004B74 901F0158 */ stw r0, 0x158(r31)
lbl_00004B78:
/* 00004B78 4BFFF21D */ bl lbl_00003D94
/* 00004B7C 387E0000 */ addi r3, r30, 0
/* 00004B80 38910000 */ addi r4, r17, 0
/* 00004B84 4BFFB5D9 */ bl func_8008B9DC
/* 00004B88 48000450 */ b lbl_00004FD8
lbl_00004B8C:
/* 00004B8C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004B90 4082001C */ bne lbl_00004BAC
/* 00004B94 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004B98 41820440 */ beq lbl_00004FD8
/* 00004B9C 3C600000 */ lis r3, analogInputs@ha
/* 00004BA0 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004BA4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004BA8 41820430 */ beq lbl_00004FD8
lbl_00004BAC:
/* 00004BAC 807F013C */ lwz r3, 0x13c(r31)
/* 00004BB0 809E0000 */ lwz r4, 0(r30)
/* 00004BB4 2C030001 */ cmpwi r3, 1
/* 00004BB8 A2240032 */ lhz r17, 0x32(r4)
/* 00004BBC 41800020 */ blt lbl_00004BDC
/* 00004BC0 3803FFFF */ addi r0, r3, -1
/* 00004BC4 901F013C */ stw r0, 0x13c(r31)
/* 00004BC8 801F013C */ lwz r0, 0x13c(r31)
/* 00004BCC 5400103A */ slwi r0, r0, 2
/* 00004BD0 7C7F0214 */ add r3, r31, r0
/* 00004BD4 806300FC */ lwz r3, 0xfc(r3)
/* 00004BD8 4BFFB585 */ bl thread_kill
lbl_00004BDC:
/* 00004BDC 809F0158 */ lwz r4, 0x158(r31)
/* 00004BE0 3C600000 */ lis r3, motsklFileData@ha
/* 00004BE4 38630000 */ addi r3, r3, motsklFileData@l
/* 00004BE8 38040001 */ addi r0, r4, 1
/* 00004BEC 901F0158 */ stw r0, 0x158(r31)
/* 00004BF0 80630000 */ lwz r3, 0(r3)
/* 00004BF4 809F0158 */ lwz r4, 0x158(r31)
/* 00004BF8 8003000C */ lwz r0, 0xc(r3)
/* 00004BFC 7C040040 */ cmplw r4, r0
/* 00004C00 4180000C */ blt lbl_00004C0C
/* 00004C04 38000000 */ li r0, 0
/* 00004C08 901F0158 */ stw r0, 0x158(r31)
lbl_00004C0C:
/* 00004C0C 4BFFF189 */ bl lbl_00003D94
/* 00004C10 387E0000 */ addi r3, r30, 0
/* 00004C14 38910000 */ addi r4, r17, 0
/* 00004C18 4BFFB545 */ bl func_8008B9DC
/* 00004C1C 480003BC */ b lbl_00004FD8
lbl_00004C20:
/* 00004C20 A0950000 */ lhz r4, 0(r21)
/* 00004C24 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004C28 40820024 */ bne lbl_00004C4C
/* 00004C2C 3C600000 */ lis r3, controllerInfo@ha
/* 00004C30 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004C34 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004C38 41820028 */ beq lbl_00004C60
/* 00004C3C 3C600000 */ lis r3, analogInputs@ha
/* 00004C40 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004C44 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004C48 41820018 */ beq lbl_00004C60
lbl_00004C4C:
/* 00004C4C 809E0090 */ lwz r4, 0x90(r30)
/* 00004C50 387E0000 */ addi r3, r30, 0
/* 00004C54 3884FFFF */ addi r4, r4, -1
/* 00004C58 4BFFB505 */ bl set_ape_model_lod
/* 00004C5C 4800037C */ b lbl_00004FD8
lbl_00004C60:
/* 00004C60 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004C64 4082001C */ bne lbl_00004C80
/* 00004C68 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004C6C 4182036C */ beq lbl_00004FD8
/* 00004C70 3C600000 */ lis r3, analogInputs@ha
/* 00004C74 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004C78 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004C7C 4182035C */ beq lbl_00004FD8
lbl_00004C80:
/* 00004C80 809E0090 */ lwz r4, 0x90(r30)
/* 00004C84 38840001 */ addi r4, r4, 1
/* 00004C88 28040004 */ cmplwi r4, 4
/* 00004C8C 41800008 */ blt lbl_00004C94
/* 00004C90 38800000 */ li r4, 0
lbl_00004C94:
/* 00004C94 7FC3F378 */ mr r3, r30
/* 00004C98 4BFFB4C5 */ bl set_ape_model_lod
/* 00004C9C 4800033C */ b lbl_00004FD8
lbl_00004CA0:
/* 00004CA0 A0750000 */ lhz r3, 0(r21)
/* 00004CA4 546007FF */ clrlwi. r0, r3, 0x1f
/* 00004CA8 41820020 */ beq lbl_00004CC8
/* 00004CAC 807E00B4 */ lwz r3, 0xb4(r30)
/* 00004CB0 3403FFFF */ addic. r0, r3, -1
/* 00004CB4 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CB8 40800320 */ bge lbl_00004FD8
/* 00004CBC 38000003 */ li r0, 3
/* 00004CC0 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CC4 48000314 */ b lbl_00004FD8
lbl_00004CC8:
/* 00004CC8 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00004CCC 4182030C */ beq lbl_00004FD8
/* 00004CD0 807E00B4 */ lwz r3, 0xb4(r30)
/* 00004CD4 38030001 */ addi r0, r3, 1
/* 00004CD8 2C000003 */ cmpwi r0, 3
/* 00004CDC 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CE0 408102F8 */ ble lbl_00004FD8
/* 00004CE4 38000000 */ li r0, 0
/* 00004CE8 901E00B4 */ stw r0, 0xb4(r30)
/* 00004CEC 480002EC */ b lbl_00004FD8
lbl_00004CF0:
/* 00004CF0 A0950000 */ lhz r4, 0(r21)
/* 00004CF4 548007FF */ clrlwi. r0, r4, 0x1f
/* 00004CF8 40820024 */ bne lbl_00004D1C
/* 00004CFC 3C600000 */ lis r3, controllerInfo@ha
/* 00004D00 A0A30000 */ lhz r5, controllerInfo@l(r3)
/* 00004D04 54A007FF */ clrlwi. r0, r5, 0x1f
/* 00004D08 41820044 */ beq lbl_00004D4C
/* 00004D0C 3C600000 */ lis r3, analogInputs@ha
/* 00004D10 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004D14 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004D18 41820034 */ beq lbl_00004D4C
lbl_00004D1C:
/* 00004D1C C03F0140 */ lfs f1, 0x140(r31)
/* 00004D20 C81700C0 */ lfd f0, 0xc0(r23)
/* 00004D24 FC010028 */ fsub f0, f1, f0
/* 00004D28 FC000018 */ frsp f0, f0
/* 00004D2C D01F0140 */ stfs f0, 0x140(r31)
/* 00004D30 C03F0140 */ lfs f1, 0x140(r31)
/* 00004D34 C81700C8 */ lfd f0, 0xc8(r23)
/* 00004D38 FC010040 */ fcmpo cr0, f1, f0
/* 00004D3C 4080029C */ bge lbl_00004FD8
/* 00004D40 C0170060 */ lfs f0, 0x60(r23)
/* 00004D44 D01F0140 */ stfs f0, 0x140(r31)
/* 00004D48 48000290 */ b lbl_00004FD8
lbl_00004D4C:
/* 00004D4C 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 00004D50 4082001C */ bne lbl_00004D6C
/* 00004D54 54A007BD */ rlwinm. r0, r5, 0, 0x1e, 0x1e
/* 00004D58 41820280 */ beq lbl_00004FD8
/* 00004D5C 3C600000 */ lis r3, analogInputs@ha
/* 00004D60 A0030000 */ lhz r0, analogInputs@l(r3)
/* 00004D64 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00004D68 41820270 */ beq lbl_00004FD8
lbl_00004D6C:
/* 00004D6C C03F0140 */ lfs f1, 0x140(r31)
/* 00004D70 C81700C0 */ lfd f0, 0xc0(r23)
/* 00004D74 FC01002A */ fadd f0, f1, f0
/* 00004D78 FC000018 */ frsp f0, f0
/* 00004D7C D01F0140 */ stfs f0, 0x140(r31)
/* 00004D80 C03F0140 */ lfs f1, 0x140(r31)
/* 00004D84 C8170150 */ lfd f0, 0x150(r23)
/* 00004D88 FC010040 */ fcmpo cr0, f1, f0
/* 00004D8C 4081024C */ ble lbl_00004FD8
/* 00004D90 C0170158 */ lfs f0, 0x158(r23)
/* 00004D94 D01F0140 */ stfs f0, 0x140(r31)
/* 00004D98 48000240 */ b lbl_00004FD8
lbl_00004D9C:
/* 00004D9C A0D50000 */ lhz r6, 0(r21)
/* 00004DA0 807E0000 */ lwz r3, 0(r30)
/* 00004DA4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00004DA8 A003008C */ lhz r0, 0x8c(r3)
/* 00004DAC 7C040378 */ mr r4, r0
/* 00004DB0 40820028 */ bne lbl_00004DD8
/* 00004DB4 3CA00000 */ lis r5, controllerInfo@ha
/* 00004DB8 A0E50000 */ lhz r7, controllerInfo@l(r5)
/* 00004DBC 54E507FF */ clrlwi. r5, r7, 0x1f
/* 00004DC0 4182006C */ beq lbl_00004E2C
/* 00004DC4 3CA00000 */ lis r5, analogInputs@ha
/* 00004DC8 38A50000 */ addi r5, r5, analogInputs@l
/* 00004DCC A0A50000 */ lhz r5, 0(r5)
/* 00004DD0 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004DD4 41820058 */ beq lbl_00004E2C
lbl_00004DD8:
/* 00004DD8 3CC00000 */ lis r6, u_motAnimCount@ha
/* 00004DDC 3CA00000 */ lis r5, motDat@ha
/* 00004DE0 38C60000 */ addi r6, r6, u_motAnimCount@l
/* 00004DE4 80E50000 */ lwz r7, motDat@l(r5)
/* 00004DE8 80C60000 */ lwz r6, 0(r6)
lbl_00004DEC:
/* 00004DEC 3884FFFF */ addi r4, r4, -1
/* 00004DF0 2C040001 */ cmpwi r4, 1
/* 00004DF4 40800008 */ bge lbl_00004DFC
/* 00004DF8 7CC43378 */ mr r4, r6
lbl_00004DFC:
/* 00004DFC 3904FFFF */ addi r8, r4, -1
/* 00004E00 7D050734 */ extsh r5, r8
/* 00004E04 2C050001 */ cmpwi r5, 1
/* 00004E08 40800008 */ bge lbl_00004E10
/* 00004E0C 7CC80734 */ extsh r8, r6
lbl_00004E10:
/* 00004E10 7D050734 */ extsh r5, r8
/* 00004E14 1CA50018 */ mulli r5, r5, 0x18
/* 00004E18 38A50002 */ addi r5, r5, 2
/* 00004E1C 7CA72A2E */ lhzx r5, r7, r5
/* 00004E20 28050003 */ cmplwi r5, 3
/* 00004E24 4082FFC8 */ bne lbl_00004DEC
/* 00004E28 48000078 */ b lbl_00004EA0
lbl_00004E2C:
/* 00004E2C 54C507BD */ rlwinm. r5, r6, 0, 0x1e, 0x1e
/* 00004E30 40820020 */ bne lbl_00004E50
/* 00004E34 54E507BD */ rlwinm. r5, r7, 0, 0x1e, 0x1e
/* 00004E38 41820068 */ beq lbl_00004EA0
/* 00004E3C 3CA00000 */ lis r5, analogInputs@ha
/* 00004E40 38A50000 */ addi r5, r5, analogInputs@l
/* 00004E44 A0A50000 */ lhz r5, 0(r5)
/* 00004E48 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004E4C 41820054 */ beq lbl_00004EA0
lbl_00004E50:
/* 00004E50 3CC00000 */ lis r6, u_motAnimCount@ha
/* 00004E54 3CA00000 */ lis r5, motDat@ha
/* 00004E58 38C60000 */ addi r6, r6, u_motAnimCount@l
/* 00004E5C 80E50000 */ lwz r7, motDat@l(r5)
/* 00004E60 80C60000 */ lwz r6, 0(r6)
lbl_00004E64:
/* 00004E64 38840001 */ addi r4, r4, 1
/* 00004E68 7C043000 */ cmpw r4, r6
/* 00004E6C 40810008 */ ble lbl_00004E74
/* 00004E70 38800001 */ li r4, 1
lbl_00004E74:
/* 00004E74 3904FFFF */ addi r8, r4, -1
/* 00004E78 7D050734 */ extsh r5, r8
/* 00004E7C 2C050001 */ cmpwi r5, 1
/* 00004E80 40800008 */ bge lbl_00004E88
/* 00004E84 7CC80734 */ extsh r8, r6
lbl_00004E88:
/* 00004E88 7D050734 */ extsh r5, r8
/* 00004E8C 1CA50018 */ mulli r5, r5, 0x18
/* 00004E90 38A50002 */ addi r5, r5, 2
/* 00004E94 7CA72A2E */ lhzx r5, r7, r5
/* 00004E98 28050003 */ cmplwi r5, 3
/* 00004E9C 4082FFC8 */ bne lbl_00004E64
lbl_00004EA0:
/* 00004EA0 7C002000 */ cmpw r0, r4
/* 00004EA4 41820134 */ beq lbl_00004FD8
/* 00004EA8 38630084 */ addi r3, r3, 0x84
/* 00004EAC 5484043E */ clrlwi r4, r4, 0x10
/* 00004EB0 38A00001 */ li r5, 1
/* 00004EB4 4BFFB2A9 */ bl func_80036000
/* 00004EB8 48000120 */ b lbl_00004FD8
lbl_00004EBC:
/* 00004EBC A0D50000 */ lhz r6, 0(r21)
/* 00004EC0 807E0000 */ lwz r3, 0(r30)
/* 00004EC4 54C407FF */ clrlwi. r4, r6, 0x1f
/* 00004EC8 A003411C */ lhz r0, 0x411c(r3)
/* 00004ECC 7C040378 */ mr r4, r0
/* 00004ED0 40820028 */ bne lbl_00004EF8
/* 00004ED4 3CA00000 */ lis r5, controllerInfo@ha
/* 00004ED8 A0E50000 */ lhz r7, controllerInfo@l(r5)
/* 00004EDC 54E507FF */ clrlwi. r5, r7, 0x1f
/* 00004EE0 4182006C */ beq lbl_00004F4C
/* 00004EE4 3CA00000 */ lis r5, analogInputs@ha
/* 00004EE8 38A50000 */ addi r5, r5, analogInputs@l
/* 00004EEC A0A50000 */ lhz r5, 0(r5)
/* 00004EF0 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004EF4 41820058 */ beq lbl_00004F4C
lbl_00004EF8:
/* 00004EF8 3CC00000 */ lis r6, u_motAnimCount@ha
/* 00004EFC 3CA00000 */ lis r5, motDat@ha
/* 00004F00 38C60000 */ addi r6, r6, u_motAnimCount@l
/* 00004F04 80E50000 */ lwz r7, motDat@l(r5)
/* 00004F08 80C60000 */ lwz r6, 0(r6)
lbl_00004F0C:
/* 00004F0C 3884FFFF */ addi r4, r4, -1
/* 00004F10 2C040001 */ cmpwi r4, 1
/* 00004F14 40800008 */ bge lbl_00004F1C
/* 00004F18 7CC43378 */ mr r4, r6
lbl_00004F1C:
/* 00004F1C 3904FFFF */ addi r8, r4, -1
/* 00004F20 7D050734 */ extsh r5, r8
/* 00004F24 2C050001 */ cmpwi r5, 1
/* 00004F28 40800008 */ bge lbl_00004F30
/* 00004F2C 7CC80734 */ extsh r8, r6
lbl_00004F30:
/* 00004F30 7D050734 */ extsh r5, r8
/* 00004F34 1CA50018 */ mulli r5, r5, 0x18
/* 00004F38 38A50002 */ addi r5, r5, 2
/* 00004F3C 7CA72A2E */ lhzx r5, r7, r5
/* 00004F40 28050003 */ cmplwi r5, 3
/* 00004F44 4082FFC8 */ bne lbl_00004F0C
/* 00004F48 48000078 */ b lbl_00004FC0
lbl_00004F4C:
/* 00004F4C 54C507BD */ rlwinm. r5, r6, 0, 0x1e, 0x1e
/* 00004F50 40820020 */ bne lbl_00004F70
/* 00004F54 54E507BD */ rlwinm. r5, r7, 0, 0x1e, 0x1e
/* 00004F58 41820068 */ beq lbl_00004FC0
/* 00004F5C 3CA00000 */ lis r5, analogInputs@ha
/* 00004F60 38A50000 */ addi r5, r5, analogInputs@l
/* 00004F64 A0A50000 */ lhz r5, 0(r5)
/* 00004F68 54A505AD */ rlwinm. r5, r5, 0, 0x16, 0x16
/* 00004F6C 41820054 */ beq lbl_00004FC0
lbl_00004F70:
/* 00004F70 3CC00000 */ lis r6, u_motAnimCount@ha
/* 00004F74 3CA00000 */ lis r5, motDat@ha
/* 00004F78 38C60000 */ addi r6, r6, u_motAnimCount@l
/* 00004F7C 80E50000 */ lwz r7, motDat@l(r5)
/* 00004F80 80C60000 */ lwz r6, 0(r6)
lbl_00004F84:
/* 00004F84 38840001 */ addi r4, r4, 1
/* 00004F88 7C043000 */ cmpw r4, r6
/* 00004F8C 40810008 */ ble lbl_00004F94
/* 00004F90 38800001 */ li r4, 1
lbl_00004F94:
/* 00004F94 3904FFFF */ addi r8, r4, -1
/* 00004F98 7D050734 */ extsh r5, r8
/* 00004F9C 2C050001 */ cmpwi r5, 1
/* 00004FA0 40800008 */ bge lbl_00004FA8
/* 00004FA4 7CC80734 */ extsh r8, r6
lbl_00004FA8:
/* 00004FA8 7D050734 */ extsh r5, r8
/* 00004FAC 1CA50018 */ mulli r5, r5, 0x18
/* 00004FB0 38A50002 */ addi r5, r5, 2
/* 00004FB4 7CA72A2E */ lhzx r5, r7, r5
/* 00004FB8 28050003 */ cmplwi r5, 3
/* 00004FBC 4082FFC8 */ bne lbl_00004F84
lbl_00004FC0:
/* 00004FC0 7C002000 */ cmpw r0, r4
/* 00004FC4 41820014 */ beq lbl_00004FD8
/* 00004FC8 38634114 */ addi r3, r3, 0x4114
/* 00004FCC 5484043E */ clrlwi r4, r4, 0x10
/* 00004FD0 38A00001 */ li r5, 1
/* 00004FD4 4BFFB189 */ bl func_80036000
lbl_00004FD8:
/* 00004FD8 A0120000 */ lhz r0, 0(r18)
/* 00004FDC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00004FE0 41820018 */ beq lbl_00004FF8
/* 00004FE4 38000001 */ li r0, 1
/* 00004FE8 901F0150 */ stw r0, 0x150(r31)
/* 00004FEC 807F00FC */ lwz r3, 0xfc(r31)
/* 00004FF0 4BFFB16D */ bl thread_kill
/* 00004FF4 4800A94D */ bl lbl_0000F940
lbl_00004FF8:
/* 00004FF8 BA21007C */ lmw r17, 0x7c(r1)
/* 00004FFC 800100BC */ lwz r0, 0xbc(r1)
/* 00005000 382100B8 */ addi r1, r1, 0xb8
/* 00005004 7C0803A6 */ mtlr r0
/* 00005008 4E800020 */ blr 
lbl_0000500C:
/* 0000500C 3C600000 */ lis r3, gameModeRequest@ha
/* 00005010 38830000 */ addi r4, r3, gameModeRequest@l
/* 00005014 38000000 */ li r0, 0
/* 00005018 B0040000 */ sth r0, 0(r4)
/* 0000501C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00005020 3800000F */ li r0, 0xf
/* 00005024 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005028 4E800020 */ blr 
