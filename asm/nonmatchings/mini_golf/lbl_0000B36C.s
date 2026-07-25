/* 0000B36C 7C0802A6 */ mflr r0
/* 0000B370 3CA00000 */ lis r5, debugFlags@ha
/* 0000B374 90010004 */ stw r0, 4(r1)
/* 0000B378 3CC00000 */ lis r6, lbl_00026378@ha
/* 0000B37C 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000B380 93E10034 */ stw r31, 0x34(r1)
/* 0000B384 93C10030 */ stw r30, 0x30(r1)
/* 0000B388 3BC60000 */ addi r30, r6, lbl_00026378@l
/* 0000B38C 93A1002C */ stw r29, 0x2c(r1)
/* 0000B390 3BA40000 */ addi r29, r4, 0
/* 0000B394 93810028 */ stw r28, 0x28(r1)
/* 0000B398 3B830000 */ addi r28, r3, 0
/* 0000B39C 80050000 */ lwz r0, debugFlags@l(r5)
/* 0000B3A0 3CA00000 */ lis r5, lbl_10000130@ha
/* 0000B3A4 3BE50000 */ addi r31, r5, lbl_10000130@l
/* 0000B3A8 7000000A */ andi. r0, r0, 0xa
/* 0000B3AC 40820388 */ bne lbl_0000B734
/* 0000B3B0 4BFFE065 */ bl lbl_00009414
/* 0000B3B4 5460043F */ clrlwi. r0, r3, 0x10
/* 0000B3B8 41820020 */ beq lbl_0000B3D8
/* 0000B3BC 3C600000 */ lis r3, modeCtrl@ha
/* 0000B3C0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000B3C4 8083002C */ lwz r4, 0x2c(r3)
/* 0000B3C8 3C600000 */ lis r3, ballInfo@ha
/* 0000B3CC 38030000 */ addi r0, r3, ballInfo@l
/* 0000B3D0 1C6401A4 */ mulli r3, r4, 0x1a4
/* 0000B3D4 7FA01A14 */ add r29, r0, r3
lbl_0000B3D8:
/* 0000B3D8 881C001F */ lbz r0, 0x1f(r28)
/* 0000B3DC 7C000774 */ extsb r0, r0
/* 0000B3E0 28000013 */ cmplwi r0, 0x13
/* 0000B3E4 41810350 */ bgt lbl_0000B734
/* 0000B3E8 3C600000 */ lis r3, lbl_00026D50@ha
/* 0000B3EC 38630000 */ addi r3, r3, lbl_00026D50@l
/* 0000B3F0 5400103A */ slwi r0, r0, 2
/* 0000B3F4 7C03002E */ lwzx r0, r3, r0
/* 0000B3F8 7C0903A6 */ mtctr r0
/* 0000B3FC 4E800420 */ bctr 
lbl_0000B400:
/* 0000B400 38600000 */ li r3, 0
/* 0000B404 38804000 */ li r4, 0x4000
/* 0000B408 4BFF4DC9 */ bl lens_flare_set_light_angle
/* 0000B40C C01E0000 */ lfs f0, 0(r30)
/* 0000B410 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B414 807D0004 */ lwz r3, 4(r29)
/* 0000B418 801D0008 */ lwz r0, 8(r29)
/* 0000B41C 907C000C */ stw r3, 0xc(r28)
/* 0000B420 901C0010 */ stw r0, 0x10(r28)
/* 0000B424 801D000C */ lwz r0, 0xc(r29)
/* 0000B428 901C0014 */ stw r0, 0x14(r28)
/* 0000B42C C07C000C */ lfs f3, 0xc(r28)
/* 0000B430 C03C0000 */ lfs f1, 0(r28)
/* 0000B434 C05C0014 */ lfs f2, 0x14(r28)
/* 0000B438 C01C0008 */ lfs f0, 8(r28)
/* 0000B43C EC230828 */ fsubs f1, f3, f1
/* 0000B440 EC420028 */ fsubs f2, f2, f0
/* 0000B444 4BFF4D8D */ bl mathutil_atan2
/* 0000B448 38038000 */ addi r0, r3, -32768
/* 0000B44C B01C001A */ sth r0, 0x1a(r28)
/* 0000B450 C07C0014 */ lfs f3, 0x14(r28)
/* 0000B454 C05C0008 */ lfs f2, 8(r28)
/* 0000B458 C03C000C */ lfs f1, 0xc(r28)
/* 0000B45C C01C0000 */ lfs f0, 0(r28)
/* 0000B460 EC431028 */ fsubs f2, f3, f2
/* 0000B464 EC210028 */ fsubs f1, f1, f0
/* 0000B468 EC210072 */ fmuls f1, f1, f1
/* 0000B46C EC2208BA */ fmadds f1, f2, f2, f1
/* 0000B470 4BFF4D61 */ bl mathutil_sqrt
/* 0000B474 C07C0010 */ lfs f3, 0x10(r28)
/* 0000B478 FC400890 */ fmr f2, f1
/* 0000B47C C01C0004 */ lfs f0, 4(r28)
/* 0000B480 EC230028 */ fsubs f1, f3, f0
/* 0000B484 4BFF4D4D */ bl mathutil_atan2
/* 0000B488 B07C0018 */ sth r3, 0x18(r28)
/* 0000B48C 38000000 */ li r0, 0
/* 0000B490 B01C001C */ sth r0, 0x1c(r28)
/* 0000B494 480002A0 */ b lbl_0000B734
lbl_0000B498:
/* 0000B498 38600000 */ li r3, 0
/* 0000B49C 38804000 */ li r4, 0x4000
/* 0000B4A0 4BFF4D31 */ bl lens_flare_set_light_angle
/* 0000B4A4 C01E0000 */ lfs f0, 0(r30)
/* 0000B4A8 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B4AC 48000288 */ b lbl_0000B734
lbl_0000B4B0:
/* 0000B4B0 C01E0000 */ lfs f0, 0(r30)
/* 0000B4B4 3C600000 */ lis r3, g_bgLightInfo@ha
/* 0000B4B8 38630000 */ addi r3, r3, g_bgLightInfo@l
/* 0000B4BC D01F0020 */ stfs f0, 0x20(r31)
/* 0000B4C0 38800C00 */ li r4, 0xc00
/* 0000B4C4 A8630042 */ lha r3, 0x42(r3)
/* 0000B4C8 4BFF4D09 */ bl lens_flare_set_light_angle
/* 0000B4CC 387C0000 */ addi r3, r28, 0
/* 0000B4D0 389D0000 */ addi r4, r29, 0
/* 0000B4D4 480034C9 */ bl lbl_0000E99C
/* 0000B4D8 4800025C */ b lbl_0000B734
lbl_0000B4DC:
/* 0000B4DC C01E0000 */ lfs f0, 0(r30)
/* 0000B4E0 387C0000 */ addi r3, r28, 0
/* 0000B4E4 389D0000 */ addi r4, r29, 0
/* 0000B4E8 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B4EC 48000269 */ bl lbl_0000B754
/* 0000B4F0 48000244 */ b lbl_0000B734
lbl_0000B4F4:
/* 0000B4F4 38600000 */ li r3, 0
/* 0000B4F8 38804000 */ li r4, 0x4000
/* 0000B4FC 4BFF4CD5 */ bl lens_flare_set_light_angle
/* 0000B500 387C0000 */ addi r3, r28, 0
/* 0000B504 389D0000 */ addi r4, r29, 0
/* 0000B508 48000E35 */ bl lbl_0000C33C
/* 0000B50C 48000228 */ b lbl_0000B734
lbl_0000B510:
/* 0000B510 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000B514 38630000 */ addi r3, r3, globalAnimTimer@l
/* 0000B518 80630000 */ lwz r3, 0(r3)
/* 0000B51C 3CE04330 */ lis r7, 0x4330
/* 0000B520 3D000000 */ lis r8, lbl_00026380@ha
/* 0000B524 3803FFFF */ addi r0, r3, -1
/* 0000B528 901F0034 */ stw r0, 0x34(r31)
/* 0000B52C 3CC00000 */ lis r6, lbl_00026380@ha
/* 0000B530 3CA00000 */ lis r5, lbl_00026380@ha
/* 0000B534 807F001C */ lwz r3, 0x1c(r31)
/* 0000B538 38804000 */ li r4, 0x4000
/* 0000B53C 38030001 */ addi r0, r3, 1
/* 0000B540 901F001C */ stw r0, 0x1c(r31)
/* 0000B544 38600000 */ li r3, 0
/* 0000B548 801F001C */ lwz r0, 0x1c(r31)
/* 0000B54C C8280000 */ lfd f1, lbl_00026380@l(r8)
/* 0000B550 90010024 */ stw r0, 0x24(r1)
/* 0000B554 C05C0094 */ lfs f2, 0x94(r28)
/* 0000B558 90E10020 */ stw r7, 0x20(r1)
/* 0000B55C C07C0000 */ lfs f3, 0(r28)
/* 0000B560 C8010020 */ lfd f0, 0x20(r1)
/* 0000B564 EC000828 */ fsubs f0, f0, f1
/* 0000B568 EC020024 */ fdivs f0, f2, f0
/* 0000B56C EC03002A */ fadds f0, f3, f0
/* 0000B570 D01C0000 */ stfs f0, 0(r28)
/* 0000B574 801F001C */ lwz r0, 0x1c(r31)
/* 0000B578 C8260000 */ lfd f1, lbl_00026380@l(r6)
/* 0000B57C 9001001C */ stw r0, 0x1c(r1)
/* 0000B580 C05C0098 */ lfs f2, 0x98(r28)
/* 0000B584 90E10018 */ stw r7, 0x18(r1)
/* 0000B588 C07C0004 */ lfs f3, 4(r28)
/* 0000B58C C8010018 */ lfd f0, 0x18(r1)
/* 0000B590 EC000828 */ fsubs f0, f0, f1
/* 0000B594 EC020024 */ fdivs f0, f2, f0
/* 0000B598 EC03002A */ fadds f0, f3, f0
/* 0000B59C D01C0004 */ stfs f0, 4(r28)
/* 0000B5A0 801F001C */ lwz r0, 0x1c(r31)
/* 0000B5A4 C8250000 */ lfd f1, lbl_00026380@l(r5)
/* 0000B5A8 90010014 */ stw r0, 0x14(r1)
/* 0000B5AC C05C009C */ lfs f2, 0x9c(r28)
/* 0000B5B0 90E10010 */ stw r7, 0x10(r1)
/* 0000B5B4 C07C0008 */ lfs f3, 8(r28)
/* 0000B5B8 C8010010 */ lfd f0, 0x10(r1)
/* 0000B5BC EC000828 */ fsubs f0, f0, f1
/* 0000B5C0 EC020024 */ fdivs f0, f2, f0
/* 0000B5C4 EC03002A */ fadds f0, f3, f0
/* 0000B5C8 D01C0008 */ stfs f0, 8(r28)
/* 0000B5CC 4BFF4C05 */ bl lens_flare_set_light_angle
/* 0000B5D0 801F001C */ lwz r0, 0x1c(r31)
/* 0000B5D4 2800003C */ cmplwi r0, 0x3c
/* 0000B5D8 4081015C */ ble lbl_0000B734
/* 0000B5DC 38000001 */ li r0, 1
/* 0000B5E0 981C001F */ stb r0, 0x1f(r28)
/* 0000B5E4 48000150 */ b lbl_0000B734
lbl_0000B5E8:
/* 0000B5E8 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000B5EC 38630000 */ addi r3, r3, globalAnimTimer@l
/* 0000B5F0 80630000 */ lwz r3, 0(r3)
/* 0000B5F4 3803FFFF */ addi r0, r3, -1
/* 0000B5F8 901F0034 */ stw r0, 0x34(r31)
/* 0000B5FC 807F001C */ lwz r3, 0x1c(r31)
/* 0000B600 38030001 */ addi r0, r3, 1
/* 0000B604 901F001C */ stw r0, 0x1c(r31)
/* 0000B608 801F001C */ lwz r0, 0x1c(r31)
/* 0000B60C 2800001E */ cmplwi r0, 0x1e
/* 0000B610 40810014 */ ble lbl_0000B624
/* 0000B614 38000000 */ li r0, 0
/* 0000B618 901F001C */ stw r0, 0x1c(r31)
/* 0000B61C 38000004 */ li r0, 4
/* 0000B620 981C001F */ stb r0, 0x1f(r28)
lbl_0000B624:
/* 0000B624 38600000 */ li r3, 0
/* 0000B628 38804000 */ li r4, 0x4000
/* 0000B62C 4BFF4BA5 */ bl lens_flare_set_light_angle
/* 0000B630 387C0000 */ addi r3, r28, 0
/* 0000B634 389D0000 */ addi r4, r29, 0
/* 0000B638 48002015 */ bl lbl_0000D64C
/* 0000B63C 480000F8 */ b lbl_0000B734
lbl_0000B640:
/* 0000B640 C01E0000 */ lfs f0, 0(r30)
/* 0000B644 D01F0020 */ stfs f0, 0x20(r31)
lbl_0000B648:
/* 0000B648 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000B64C 38630000 */ addi r3, r3, globalAnimTimer@l
/* 0000B650 80630000 */ lwz r3, 0(r3)
/* 0000B654 3803FFFF */ addi r0, r3, -1
/* 0000B658 901F0034 */ stw r0, 0x34(r31)
lbl_0000B65C:
/* 0000B65C 38000000 */ li r0, 0
/* 0000B660 901F001C */ stw r0, 0x1c(r31)
/* 0000B664 38600000 */ li r3, 0
/* 0000B668 38804000 */ li r4, 0x4000
/* 0000B66C 4BFF4B65 */ bl lens_flare_set_light_angle
/* 0000B670 387C0000 */ addi r3, r28, 0
/* 0000B674 389D0000 */ addi r4, r29, 0
/* 0000B678 48001FD5 */ bl lbl_0000D64C
/* 0000B67C 480000B8 */ b lbl_0000B734
lbl_0000B680:
/* 0000B680 C01E0000 */ lfs f0, 0(r30)
/* 0000B684 38000000 */ li r0, 0
/* 0000B688 D01F0020 */ stfs f0, 0x20(r31)
/* 0000B68C 901F001C */ stw r0, 0x1c(r31)
lbl_0000B690:
/* 0000B690 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000B694 80830000 */ lwz r4, globalAnimTimer@l(r3)
/* 0000B698 3C600000 */ lis r3, g_bgLightInfo@ha
/* 0000B69C 38630000 */ addi r3, r3, g_bgLightInfo@l
/* 0000B6A0 3804FFFF */ addi r0, r4, -1
/* 0000B6A4 901F0034 */ stw r0, 0x34(r31)
/* 0000B6A8 38800C00 */ li r4, 0xc00
/* 0000B6AC A8630042 */ lha r3, 0x42(r3)
/* 0000B6B0 4BFF4B21 */ bl lens_flare_set_light_angle
/* 0000B6B4 387C0000 */ addi r3, r28, 0
/* 0000B6B8 389D0000 */ addi r4, r29, 0
/* 0000B6BC 48001F91 */ bl lbl_0000D64C
/* 0000B6C0 48000074 */ b lbl_0000B734
lbl_0000B6C4:
/* 0000B6C4 38000000 */ li r0, 0
/* 0000B6C8 901F001C */ stw r0, 0x1c(r31)
/* 0000B6CC 38600000 */ li r3, 0
/* 0000B6D0 38804000 */ li r4, 0x4000
/* 0000B6D4 4BFF4AFD */ bl lens_flare_set_light_angle
/* 0000B6D8 387C0000 */ addi r3, r28, 0
/* 0000B6DC 389D0000 */ addi r4, r29, 0
/* 0000B6E0 48000B51 */ bl lbl_0000C230
/* 0000B6E4 48000050 */ b lbl_0000B734
lbl_0000B6E8:
/* 0000B6E8 387C0000 */ addi r3, r28, 0
/* 0000B6EC 389D0000 */ addi r4, r29, 0
/* 0000B6F0 480031BD */ bl lbl_0000E8AC
/* 0000B6F4 48000040 */ b lbl_0000B734
lbl_0000B6F8:
/* 0000B6F8 387C0000 */ addi r3, r28, 0
/* 0000B6FC 389D0000 */ addi r4, r29, 0
/* 0000B700 48003299 */ bl lbl_0000E998
/* 0000B704 48000030 */ b lbl_0000B734
lbl_0000B708:
/* 0000B708 387C0000 */ addi r3, r28, 0
/* 0000B70C 389D0000 */ addi r4, r29, 0
/* 0000B710 48000199 */ bl lbl_0000B8A8
/* 0000B714 48000020 */ b lbl_0000B734
lbl_0000B718:
/* 0000B718 387C0000 */ addi r3, r28, 0
/* 0000B71C 389D0000 */ addi r4, r29, 0
/* 0000B720 480006CD */ bl lbl_0000BDEC
/* 0000B724 48000010 */ b lbl_0000B734
lbl_0000B728:
/* 0000B728 387C0000 */ addi r3, r28, 0
/* 0000B72C 389D0000 */ addi r4, r29, 0
/* 0000B730 480009F9 */ bl lbl_0000C128
lbl_0000B734:
/* 0000B734 8001003C */ lwz r0, 0x3c(r1)
/* 0000B738 83E10034 */ lwz r31, 0x34(r1)
/* 0000B73C 83C10030 */ lwz r30, 0x30(r1)
/* 0000B740 7C0803A6 */ mtlr r0
/* 0000B744 83A1002C */ lwz r29, 0x2c(r1)
/* 0000B748 83810028 */ lwz r28, 0x28(r1)
/* 0000B74C 38210038 */ addi r1, r1, 0x38
/* 0000B750 4E800020 */ blr 
