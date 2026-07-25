/* 0001A554 7C0802A6 */ mflr r0
/* 0001A558 3CA00000 */ lis r5, lbl_0001C888@ha
/* 0001A55C 90010004 */ stw r0, 4(r1)
/* 0001A560 9421FEB8 */ stwu r1, -0x148(r1)
/* 0001A564 DBE10140 */ stfd f31, 0x140(r1)
/* 0001A568 BEC10118 */ stmw r22, 0x118(r1)
/* 0001A56C 7C791B78 */ mr r25, r3
/* 0001A570 3BE50000 */ addi r31, r5, lbl_0001C888@l
/* 0001A574 8803002E */ lbz r0, 0x2e(r3)
/* 0001A578 3C600000 */ lis r3, lbl_10019040@ha
/* 0001A57C 7C000774 */ extsb r0, r0
/* 0001A580 1C80014C */ mulli r4, r0, 0x14c
/* 0001A584 38030000 */ addi r0, r3, lbl_10019040@l
/* 0001A588 7FA02214 */ add r29, r0, r4
/* 0001A58C 38790000 */ addi r3, r25, 0
/* 0001A590 3B5D003C */ addi r26, r29, 0x3c
/* 0001A594 48000EA9 */ bl lbl_0001B43C
/* 0001A598 A81D0114 */ lha r0, 0x114(r29)
/* 0001A59C 2C000001 */ cmpwi r0, 1
/* 0001A5A0 41820190 */ beq lbl_0001A730
/* 0001A5A4 408001EC */ bge lbl_0001A790
/* 0001A5A8 2C000000 */ cmpwi r0, 0
/* 0001A5AC 40800008 */ bge lbl_0001A5B4
/* 0001A5B0 480001E0 */ b lbl_0001A790
lbl_0001A5B4:
/* 0001A5B4 80190094 */ lwz r0, 0x94(r25)
/* 0001A5B8 540007FF */ clrlwi. r0, r0, 0x1f
/* 0001A5BC 4082000C */ bne lbl_0001A5C8
/* 0001A5C0 38000001 */ li r0, 1
/* 0001A5C4 B01D0114 */ sth r0, 0x114(r29)
lbl_0001A5C8:
/* 0001A5C8 387D0128 */ addi r3, r29, 0x128
/* 0001A5CC C0230000 */ lfs f1, 0(r3)
/* 0001A5D0 C0430004 */ lfs f2, 4(r3)
/* 0001A5D4 C0030008 */ lfs f0, 8(r3)
/* 0001A5D8 EC210072 */ fmuls f1, f1, f1
/* 0001A5DC EC2208BA */ fmadds f1, f2, f2, f1
/* 0001A5E0 EC20083A */ fmadds f1, f0, f0, f1
/* 0001A5E4 4BFE5B81 */ bl mathutil_sqrt
/* 0001A5E8 FFE00890 */ fmr f31, f1
/* 0001A5EC 38790004 */ addi r3, r25, 4
/* 0001A5F0 C0230000 */ lfs f1, 0(r3)
/* 0001A5F4 C0430004 */ lfs f2, 4(r3)
/* 0001A5F8 C0030008 */ lfs f0, 8(r3)
/* 0001A5FC EC210072 */ fmuls f1, f1, f1
/* 0001A600 EC2208BA */ fmadds f1, f2, f2, f1
/* 0001A604 EC20083A */ fmadds f1, f0, f0, f1
/* 0001A608 4BFE5B5D */ bl mathutil_sqrt
/* 0001A60C EC3F0828 */ fsubs f1, f31, f1
/* 0001A610 C01A0004 */ lfs f0, 4(r26)
/* 0001A614 FC010040 */ fcmpo cr0, f1, f0
/* 0001A618 4081000C */ ble lbl_0001A624
/* 0001A61C 38000001 */ li r0, 1
/* 0001A620 B01D0114 */ sth r0, 0x114(r29)
lbl_0001A624:
/* 0001A624 38790004 */ addi r3, r25, 4
/* 0001A628 3899001C */ addi r4, r25, 0x1c
/* 0001A62C 4BFE5B39 */ bl mathutil_vec_dot_normalized_safe
/* 0001A630 C01F0008 */ lfs f0, 8(r31)
/* 0001A634 FC010040 */ fcmpo cr0, f1, f0
/* 0001A638 4080001C */ bge lbl_0001A654
/* 0001A63C D00100C4 */ stfs f0, 0xc4(r1)
/* 0001A640 C01F0008 */ lfs f0, 8(r31)
/* 0001A644 D00100C8 */ stfs f0, 0xc8(r1)
/* 0001A648 C01F0008 */ lfs f0, 8(r31)
/* 0001A64C D00100CC */ stfs f0, 0xcc(r1)
/* 0001A650 48000030 */ b lbl_0001A680
lbl_0001A654:
/* 0001A654 80B90004 */ lwz r5, 4(r25)
/* 0001A658 386100C4 */ addi r3, r1, 0xc4
/* 0001A65C 80190008 */ lwz r0, 8(r25)
/* 0001A660 7C641B78 */ mr r4, r3
/* 0001A664 90A100C4 */ stw r5, 0xc4(r1)
/* 0001A668 900100C8 */ stw r0, 0xc8(r1)
/* 0001A66C 8019000C */ lwz r0, 0xc(r25)
/* 0001A670 900100CC */ stw r0, 0xcc(r1)
/* 0001A674 C01A0010 */ lfs f0, 0x10(r26)
/* 0001A678 EC200072 */ fmuls f1, f0, f1
/* 0001A67C 4BFE5AE9 */ bl mathutil_vec_set_len
lbl_0001A680:
/* 0001A680 C06100C4 */ lfs f3, 0xc4(r1)
/* 0001A684 386100EC */ addi r3, r1, 0xec
/* 0001A688 C0590004 */ lfs f2, 4(r25)
/* 0001A68C 388100D0 */ addi r4, r1, 0xd0
/* 0001A690 C03A0034 */ lfs f1, 0x34(r26)
/* 0001A694 C019001C */ lfs f0, 0x1c(r25)
/* 0001A698 EC43102A */ fadds f2, f3, f2
/* 0001A69C C08100C8 */ lfs f4, 0xc8(r1)
/* 0001A6A0 38A00000 */ li r5, 0
/* 0001A6A4 EC010032 */ fmuls f0, f1, f0
/* 0001A6A8 C06100CC */ lfs f3, 0xcc(r1)
/* 0001A6AC EC02002A */ fadds f0, f2, f0
/* 0001A6B0 D00100EC */ stfs f0, 0xec(r1)
/* 0001A6B4 C0590008 */ lfs f2, 8(r25)
/* 0001A6B8 C03A0034 */ lfs f1, 0x34(r26)
/* 0001A6BC C0190020 */ lfs f0, 0x20(r25)
/* 0001A6C0 EC44102A */ fadds f2, f4, f2
/* 0001A6C4 EC010032 */ fmuls f0, f1, f0
/* 0001A6C8 EC02002A */ fadds f0, f2, f0
/* 0001A6CC D00100F0 */ stfs f0, 0xf0(r1)
/* 0001A6D0 C059000C */ lfs f2, 0xc(r25)
/* 0001A6D4 C03A0034 */ lfs f1, 0x34(r26)
/* 0001A6D8 C0190024 */ lfs f0, 0x24(r25)
/* 0001A6DC EC43102A */ fadds f2, f3, f2
/* 0001A6E0 EC010032 */ fmuls f0, f1, f0
/* 0001A6E4 EC02002A */ fadds f0, f2, f0
/* 0001A6E8 D00100F4 */ stfs f0, 0xf4(r1)
/* 0001A6EC 4BFE5A79 */ bl raycast_stage_down
/* 0001A6F0 2C030000 */ cmpwi r3, 0
/* 0001A6F4 41820028 */ beq lbl_0001A71C
/* 0001A6F8 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 0001A6FC C02100D8 */ lfs f1, 0xd8(r1)
/* 0001A700 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 0001A704 80840000 */ lwz r4, 0(r4)
/* 0001A708 80840014 */ lwz r4, 0x14(r4)
/* 0001A70C C0040000 */ lfs f0, 0(r4)
/* 0001A710 FC010040 */ fcmpo cr0, f1, f0
/* 0001A714 40800008 */ bge lbl_0001A71C
/* 0001A718 38600000 */ li r3, 0
lbl_0001A71C:
/* 0001A71C 2C030000 */ cmpwi r3, 0
/* 0001A720 40820070 */ bne lbl_0001A790
/* 0001A724 38000001 */ li r0, 1
/* 0001A728 B01D0114 */ sth r0, 0x114(r29)
/* 0001A72C 48000064 */ b lbl_0001A790
lbl_0001A730:
/* 0001A730 3B600000 */ li r27, 0
/* 0001A734 937D0148 */ stw r27, 0x148(r29)
/* 0001A738 387D0128 */ addi r3, r29, 0x128
/* 0001A73C C0230000 */ lfs f1, 0(r3)
/* 0001A740 C0430004 */ lfs f2, 4(r3)
/* 0001A744 C0030008 */ lfs f0, 8(r3)
/* 0001A748 EC210072 */ fmuls f1, f1, f1
/* 0001A74C EC2208BA */ fmadds f1, f2, f2, f1
/* 0001A750 EC20083A */ fmadds f1, f0, f0, f1
/* 0001A754 4BFE5A11 */ bl mathutil_sqrt
/* 0001A758 FFE00890 */ fmr f31, f1
/* 0001A75C 38790004 */ addi r3, r25, 4
/* 0001A760 C0230000 */ lfs f1, 0(r3)
/* 0001A764 C0430004 */ lfs f2, 4(r3)
/* 0001A768 C0030008 */ lfs f0, 8(r3)
/* 0001A76C EC210072 */ fmuls f1, f1, f1
/* 0001A770 EC2208BA */ fmadds f1, f2, f2, f1
/* 0001A774 EC20083A */ fmadds f1, f0, f0, f1
/* 0001A778 4BFE59ED */ bl mathutil_sqrt
/* 0001A77C EC3F0828 */ fsubs f1, f31, f1
/* 0001A780 C01A0000 */ lfs f0, 0(r26)
/* 0001A784 FC010040 */ fcmpo cr0, f1, f0
/* 0001A788 40810008 */ ble lbl_0001A790
/* 0001A78C B37D0114 */ sth r27, 0x114(r29)
lbl_0001A790:
/* 0001A790 C01F0008 */ lfs f0, 8(r31)
/* 0001A794 3B600000 */ li r27, 0
/* 0001A798 D00100F8 */ stfs f0, 0xf8(r1)
/* 0001A79C C01F0008 */ lfs f0, 8(r31)
/* 0001A7A0 D00100FC */ stfs f0, 0xfc(r1)
/* 0001A7A4 C01F0008 */ lfs f0, 8(r31)
/* 0001A7A8 D0010100 */ stfs f0, 0x100(r1)
/* 0001A7AC A81D0114 */ lha r0, 0x114(r29)
/* 0001A7B0 2C000001 */ cmpwi r0, 1
/* 0001A7B4 4182052C */ beq lbl_0001ACE0
/* 0001A7B8 40800BE4 */ bge lbl_0001B39C
/* 0001A7BC 2C000000 */ cmpwi r0, 0
/* 0001A7C0 40800008 */ bge lbl_0001A7C8
/* 0001A7C4 48000BD8 */ b lbl_0001B39C
lbl_0001A7C8:
/* 0001A7C8 8819002E */ lbz r0, 0x2e(r25)
/* 0001A7CC 3C800000 */ lis r4, lbl_0001C8A8@ha
/* 0001A7D0 3C600000 */ lis r3, lbl_10017664@ha
/* 0001A7D4 C8240000 */ lfd f1, lbl_0001C8A8@l(r4)
/* 0001A7D8 7C000774 */ extsb r0, r0
/* 0001A7DC 1CA001B4 */ mulli r5, r0, 0x1b4
/* 0001A7E0 C07F000C */ lfs f3, 0xc(r31)
/* 0001A7E4 38030000 */ addi r0, r3, lbl_10017664@l
/* 0001A7E8 7C602A14 */ add r3, r0, r5
/* 0001A7EC 3B830068 */ addi r28, r3, 0x68
/* 0001A7F0 A863007C */ lha r3, 0x7c(r3)
/* 0001A7F4 3CA00000 */ lis r5, lbl_802F1E70@ha
/* 0001A7F8 801C001C */ lwz r0, 0x1c(r28)
/* 0001A7FC 6C638000 */ xoris r3, r3, 0x8000
/* 0001A800 C0450000 */ lfs f2, lbl_802F1E70@l(r5)
/* 0001A804 90610114 */ stw r3, 0x114(r1)
/* 0001A808 3C604330 */ lis r3, 0x4330
/* 0001A80C 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0001A810 82DC0024 */ lwz r22, 0x24(r28)
/* 0001A814 90610110 */ stw r3, 0x110(r1)
/* 0001A818 3C600000 */ lis r3, lbl_802F1E74@ha
/* 0001A81C C8010110 */ lfd f0, 0x110(r1)
/* 0001A820 C0830000 */ lfs f4, lbl_802F1E74@l(r3)
/* 0001A824 EC000828 */ fsubs f0, f0, f1
/* 0001A828 EC020032 */ fmuls f0, f2, f0
/* 0001A82C EC03002A */ fadds f0, f3, f0
/* 0001A830 EFE40032 */ fmuls f31, f4, f0
/* 0001A834 40820020 */ bne lbl_0001A854
/* 0001A838 807D0118 */ lwz r3, 0x118(r29)
/* 0001A83C 801D011C */ lwz r0, 0x11c(r29)
/* 0001A840 906100B8 */ stw r3, 0xb8(r1)
/* 0001A844 900100BC */ stw r0, 0xbc(r1)
/* 0001A848 801D0120 */ lwz r0, 0x120(r29)
/* 0001A84C 900100C0 */ stw r0, 0xc0(r1)
/* 0001A850 4800001C */ b lbl_0001A86C
lbl_0001A854:
/* 0001A854 807600B4 */ lwz r3, 0xb4(r22)
/* 0001A858 801600B8 */ lwz r0, 0xb8(r22)
/* 0001A85C 906100B8 */ stw r3, 0xb8(r1)
/* 0001A860 900100BC */ stw r0, 0xbc(r1)
/* 0001A864 801600BC */ lwz r0, 0xbc(r22)
/* 0001A868 900100C0 */ stw r0, 0xc0(r1)
lbl_0001A86C:
/* 0001A86C FC20F890 */ fmr f1, f31
/* 0001A870 386100B8 */ addi r3, r1, 0xb8
/* 0001A874 38830000 */ addi r4, r3, 0
/* 0001A878 4BFE58ED */ bl mathutil_vec_set_len
/* 0001A87C C039001C */ lfs f1, 0x1c(r25)
/* 0001A880 3876001C */ addi r3, r22, 0x1c
/* 0001A884 C01A0014 */ lfs f0, 0x14(r26)
/* 0001A888 388100B8 */ addi r4, r1, 0xb8
/* 0001A88C C0590004 */ lfs f2, 4(r25)
/* 0001A890 EC010032 */ fmuls f0, f1, f0
/* 0001A894 C02100B8 */ lfs f1, 0xb8(r1)
/* 0001A898 38BD0128 */ addi r5, r29, 0x128
/* 0001A89C 38C100AC */ addi r6, r1, 0xac
/* 0001A8A0 EC02002A */ fadds f0, f2, f0
/* 0001A8A4 EC01002A */ fadds f0, f1, f0
/* 0001A8A8 D00100B8 */ stfs f0, 0xb8(r1)
/* 0001A8AC C0390020 */ lfs f1, 0x20(r25)
/* 0001A8B0 C01A0014 */ lfs f0, 0x14(r26)
/* 0001A8B4 C0590008 */ lfs f2, 8(r25)
/* 0001A8B8 EC010032 */ fmuls f0, f1, f0
/* 0001A8BC C02100BC */ lfs f1, 0xbc(r1)
/* 0001A8C0 EC02002A */ fadds f0, f2, f0
/* 0001A8C4 EC01002A */ fadds f0, f1, f0
/* 0001A8C8 D00100BC */ stfs f0, 0xbc(r1)
/* 0001A8CC C0390024 */ lfs f1, 0x24(r25)
/* 0001A8D0 C01A0014 */ lfs f0, 0x14(r26)
/* 0001A8D4 C059000C */ lfs f2, 0xc(r25)
/* 0001A8D8 EC010032 */ fmuls f0, f1, f0
/* 0001A8DC C02100C0 */ lfs f1, 0xc0(r1)
/* 0001A8E0 EC02002A */ fadds f0, f2, f0
/* 0001A8E4 EC01002A */ fadds f0, f1, f0
/* 0001A8E8 D00100C0 */ stfs f0, 0xc0(r1)
/* 0001A8EC C03D0134 */ lfs f1, 0x134(r29)
/* 0001A8F0 C01A0018 */ lfs f0, 0x18(r26)
/* 0001A8F4 C05D0128 */ lfs f2, 0x128(r29)
/* 0001A8F8 EC010032 */ fmuls f0, f1, f0
/* 0001A8FC EC02002A */ fadds f0, f2, f0
/* 0001A900 D00100AC */ stfs f0, 0xac(r1)
/* 0001A904 C03D0138 */ lfs f1, 0x138(r29)
/* 0001A908 C01A0018 */ lfs f0, 0x18(r26)
/* 0001A90C C05D012C */ lfs f2, 0x12c(r29)
/* 0001A910 EC010032 */ fmuls f0, f1, f0
/* 0001A914 EC02002A */ fadds f0, f2, f0
/* 0001A918 D00100B0 */ stfs f0, 0xb0(r1)
/* 0001A91C C03D013C */ lfs f1, 0x13c(r29)
/* 0001A920 C01A0018 */ lfs f0, 0x18(r26)
/* 0001A924 C05D0130 */ lfs f2, 0x130(r29)
/* 0001A928 EC010032 */ fmuls f0, f1, f0
/* 0001A92C EC02002A */ fadds f0, f2, f0
/* 0001A930 D00100B4 */ stfs f0, 0xb4(r1)
/* 0001A934 C0360034 */ lfs f1, 0x34(r22)
/* 0001A938 C05D0140 */ lfs f2, 0x140(r29)
/* 0001A93C 4BFE5829 */ bl func_8006A9B8
/* 0001A940 28030000 */ cmplwi r3, 0
/* 0001A944 41820020 */ beq lbl_0001A964
/* 0001A948 C03F0000 */ lfs f1, 0(r31)
/* 0001A94C C01A0068 */ lfs f0, 0x68(r26)
/* 0001A950 EC010032 */ fmuls f0, f1, f0
/* 0001A954 FC00001E */ fctiwz f0, f0
/* 0001A958 D8010110 */ stfd f0, 0x110(r1)
/* 0001A95C 80010114 */ lwz r0, 0x114(r1)
/* 0001A960 901D0148 */ stw r0, 0x148(r29)
lbl_0001A964:
/* 0001A964 801C001C */ lwz r0, 0x1c(r28)
/* 0001A968 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 0001A96C 41820034 */ beq lbl_0001A9A0
/* 0001A970 C03D0144 */ lfs f1, 0x144(r29)
/* 0001A974 C0160034 */ lfs f0, 0x34(r22)
/* 0001A978 EC21F828 */ fsubs f1, f1, f31
/* 0001A97C FC010040 */ fcmpo cr0, f1, f0
/* 0001A980 40800020 */ bge lbl_0001A9A0
/* 0001A984 C03F0000 */ lfs f1, 0(r31)
/* 0001A988 C01A0068 */ lfs f0, 0x68(r26)
/* 0001A98C EC010032 */ fmuls f0, f1, f0
/* 0001A990 FC00001E */ fctiwz f0, f0
/* 0001A994 D8010110 */ stfd f0, 0x110(r1)
/* 0001A998 80010114 */ lwz r0, 0x114(r1)
/* 0001A99C 901D0148 */ stw r0, 0x148(r29)
lbl_0001A9A0:
/* 0001A9A0 C03D0128 */ lfs f1, 0x128(r29)
/* 0001A9A4 386100A0 */ addi r3, r1, 0xa0
/* 0001A9A8 C0190004 */ lfs f0, 4(r25)
/* 0001A9AC EC010028 */ fsubs f0, f1, f0
/* 0001A9B0 D0010094 */ stfs f0, 0x94(r1)
/* 0001A9B4 C01F0008 */ lfs f0, 8(r31)
/* 0001A9B8 D0010098 */ stfs f0, 0x98(r1)
/* 0001A9BC C03D0130 */ lfs f1, 0x130(r29)
/* 0001A9C0 C019000C */ lfs f0, 0xc(r25)
/* 0001A9C4 EC010028 */ fsubs f0, f1, f0
/* 0001A9C8 D001009C */ stfs f0, 0x9c(r1)
/* 0001A9CC 80010094 */ lwz r0, 0x94(r1)
/* 0001A9D0 80810098 */ lwz r4, 0x98(r1)
/* 0001A9D4 900100A0 */ stw r0, 0xa0(r1)
/* 0001A9D8 8001009C */ lwz r0, 0x9c(r1)
/* 0001A9DC 908100A4 */ stw r4, 0xa4(r1)
/* 0001A9E0 900100A8 */ stw r0, 0xa8(r1)
/* 0001A9E4 4BFE5781 */ bl mathutil_vec_normalize_len
/* 0001A9E8 C07D0134 */ lfs f3, 0x134(r29)
/* 0001A9EC C05A000C */ lfs f2, 0xc(r26)
/* 0001A9F0 C039001C */ lfs f1, 0x1c(r25)
/* 0001A9F4 C01A0008 */ lfs f0, 8(r26)
/* 0001A9F8 EC4300B2 */ fmuls f2, f3, f2
/* 0001A9FC EC010032 */ fmuls f0, f1, f0
/* 0001AA00 EC020028 */ fsubs f0, f2, f0
/* 0001AA04 D0010088 */ stfs f0, 0x88(r1)
/* 0001AA08 C01F0008 */ lfs f0, 8(r31)
/* 0001AA0C D001008C */ stfs f0, 0x8c(r1)
/* 0001AA10 C07D013C */ lfs f3, 0x13c(r29)
/* 0001AA14 C05A000C */ lfs f2, 0xc(r26)
/* 0001AA18 C0390024 */ lfs f1, 0x24(r25)
/* 0001AA1C C01A0008 */ lfs f0, 8(r26)
/* 0001AA20 EC4300B2 */ fmuls f2, f3, f2
/* 0001AA24 EC010032 */ fmuls f0, f1, f0
/* 0001AA28 EC020028 */ fsubs f0, f2, f0
/* 0001AA2C D0010090 */ stfs f0, 0x90(r1)
/* 0001AA30 C0A10088 */ lfs f5, 0x88(r1)
/* 0001AA34 C04100A0 */ lfs f2, 0xa0(r1)
/* 0001AA38 C081008C */ lfs f4, 0x8c(r1)
/* 0001AA3C C02100A4 */ lfs f1, 0xa4(r1)
/* 0001AA40 C0610090 */ lfs f3, 0x90(r1)
/* 0001AA44 C00100A8 */ lfs f0, 0xa8(r1)
/* 0001AA48 EC4500B2 */ fmuls f2, f5, f2
/* 0001AA4C EC44107A */ fmadds f2, f4, f1, f2
/* 0001AA50 EC43103A */ fmadds f2, f3, f0, f2
/* 0001AA54 C01F0008 */ lfs f0, 8(r31)
/* 0001AA58 FC020040 */ fcmpo cr0, f2, f0
/* 0001AA5C 40800034 */ bge lbl_0001AA90
/* 0001AA60 C01F0010 */ lfs f0, 0x10(r31)
/* 0001AA64 C02100A0 */ lfs f1, 0xa0(r1)
/* 0001AA68 EC620032 */ fmuls f3, f2, f0
/* 0001AA6C C00100A8 */ lfs f0, 0xa8(r1)
/* 0001AA70 C0410088 */ lfs f2, 0x88(r1)
/* 0001AA74 EC230072 */ fmuls f1, f3, f1
/* 0001AA78 EC030032 */ fmuls f0, f3, f0
/* 0001AA7C EC22082A */ fadds f1, f2, f1
/* 0001AA80 D0210088 */ stfs f1, 0x88(r1)
/* 0001AA84 C0210090 */ lfs f1, 0x90(r1)
/* 0001AA88 EC01002A */ fadds f0, f1, f0
/* 0001AA8C D0010090 */ stfs f0, 0x90(r1)
lbl_0001AA90:
/* 0001AA90 C0410094 */ lfs f2, 0x94(r1)
/* 0001AA94 3C600000 */ lis r3, g_itemInfo@ha
/* 0001AA98 C0010088 */ lfs f0, 0x88(r1)
/* 0001AA9C 38030000 */ addi r0, r3, g_itemInfo@l
/* 0001AAA0 C021009C */ lfs f1, 0x9c(r1)
/* 0001AAA4 EC620028 */ fsubs f3, f2, f0
/* 0001AAA8 C0010090 */ lfs f0, 0x90(r1)
/* 0001AAAC 3C800000 */ lis r4, g_poolInfo@ha
/* 0001AAB0 C04100F8 */ lfs f2, 0xf8(r1)
/* 0001AAB4 EC010028 */ fsubs f0, f1, f0
/* 0001AAB8 D0610104 */ stfs f3, 0x104(r1)
/* 0001AABC 38640000 */ addi r3, r4, g_poolInfo@l
/* 0001AAC0 7C160378 */ mr r22, r0
/* 0001AAC4 D001010C */ stfs f0, 0x10c(r1)
/* 0001AAC8 C0210104 */ lfs f1, 0x104(r1)
/* 0001AACC C001010C */ lfs f0, 0x10c(r1)
/* 0001AAD0 EC22082A */ fadds f1, f2, f1
/* 0001AAD4 D02100F8 */ stfs f1, 0xf8(r1)
/* 0001AAD8 C0210100 */ lfs f1, 0x100(r1)
/* 0001AADC EC01002A */ fadds f0, f1, f0
/* 0001AAE0 D0010100 */ stfs f0, 0x100(r1)
/* 0001AAE4 C019001C */ lfs f0, 0x1c(r25)
/* 0001AAE8 C06100F8 */ lfs f3, 0xf8(r1)
/* 0001AAEC FC000050 */ fneg f0, f0
/* 0001AAF0 D0010104 */ stfs f0, 0x104(r1)
/* 0001AAF4 C01F0008 */ lfs f0, 8(r31)
/* 0001AAF8 D0010108 */ stfs f0, 0x108(r1)
/* 0001AAFC C0190024 */ lfs f0, 0x24(r25)
/* 0001AB00 FC000050 */ fneg f0, f0
/* 0001AB04 D001010C */ stfs f0, 0x10c(r1)
/* 0001AB08 C05A001C */ lfs f2, 0x1c(r26)
/* 0001AB0C C0210104 */ lfs f1, 0x104(r1)
/* 0001AB10 C001010C */ lfs f0, 0x10c(r1)
/* 0001AB14 EC220072 */ fmuls f1, f2, f1
/* 0001AB18 EC23082A */ fadds f1, f3, f1
/* 0001AB1C D02100F8 */ stfs f1, 0xf8(r1)
/* 0001AB20 C03A001C */ lfs f1, 0x1c(r26)
/* 0001AB24 C0410100 */ lfs f2, 0x100(r1)
/* 0001AB28 EC010032 */ fmuls f0, f1, f0
/* 0001AB2C EC02002A */ fadds f0, f2, f0
/* 0001AB30 D0010100 */ stfs f0, 0x100(r1)
/* 0001AB34 C01F0008 */ lfs f0, 8(r31)
/* 0001AB38 D0010104 */ stfs f0, 0x104(r1)
/* 0001AB3C C01F0008 */ lfs f0, 8(r31)
/* 0001AB40 D0010108 */ stfs f0, 0x108(r1)
/* 0001AB44 C01F0008 */ lfs f0, 8(r31)
/* 0001AB48 D001010C */ stfs f0, 0x10c(r1)
/* 0001AB4C 8383001C */ lwz r28, 0x1c(r3)
/* 0001AB50 83C30018 */ lwz r30, 0x18(r3)
/* 0001AB54 48000120 */ b lbl_0001AC74
lbl_0001AB58:
/* 0001AB58 881C0000 */ lbz r0, 0(r28)
/* 0001AB5C 7C000775 */ extsb. r0, r0
/* 0001AB60 41820108 */ beq lbl_0001AC68
/* 0001AB64 C0360020 */ lfs f1, 0x20(r22)
/* 0001AB68 38610070 */ addi r3, r1, 0x70
/* 0001AB6C C0190004 */ lfs f0, 4(r25)
/* 0001AB70 EC010028 */ fsubs f0, f1, f0
/* 0001AB74 D0010070 */ stfs f0, 0x70(r1)
/* 0001AB78 C0360024 */ lfs f1, 0x24(r22)
/* 0001AB7C C0190008 */ lfs f0, 8(r25)
/* 0001AB80 EC010028 */ fsubs f0, f1, f0
/* 0001AB84 D0010074 */ stfs f0, 0x74(r1)
/* 0001AB88 C0360028 */ lfs f1, 0x28(r22)
/* 0001AB8C C019000C */ lfs f0, 0xc(r25)
/* 0001AB90 EC010028 */ fsubs f0, f1, f0
/* 0001AB94 D0010078 */ stfs f0, 0x78(r1)
/* 0001AB98 4BFE55CD */ bl mathutil_vec_normalize_len
/* 0001AB9C C0590068 */ lfs f2, 0x68(r25)
/* 0001ABA0 C0160014 */ lfs f0, 0x14(r22)
/* 0001ABA4 EC02002A */ fadds f0, f2, f0
/* 0001ABA8 FC010040 */ fcmpo cr0, f1, f0
/* 0001ABAC 418000BC */ blt lbl_0001AC68
/* 0001ABB0 C059001C */ lfs f2, 0x1c(r25)
/* 0001ABB4 C016002C */ lfs f0, 0x2c(r22)
/* 0001ABB8 EC020028 */ fsubs f0, f2, f0
/* 0001ABBC D001007C */ stfs f0, 0x7c(r1)
/* 0001ABC0 C0590020 */ lfs f2, 0x20(r25)
/* 0001ABC4 C0160030 */ lfs f0, 0x30(r22)
/* 0001ABC8 EC020028 */ fsubs f0, f2, f0
/* 0001ABCC D0010080 */ stfs f0, 0x80(r1)
/* 0001ABD0 C0590024 */ lfs f2, 0x24(r25)
/* 0001ABD4 C0160034 */ lfs f0, 0x34(r22)
/* 0001ABD8 EC020028 */ fsubs f0, f2, f0
/* 0001ABDC D0010084 */ stfs f0, 0x84(r1)
/* 0001ABE0 C0C10070 */ lfs f6, 0x70(r1)
/* 0001ABE4 C061007C */ lfs f3, 0x7c(r1)
/* 0001ABE8 C0A10074 */ lfs f5, 0x74(r1)
/* 0001ABEC C0410080 */ lfs f2, 0x80(r1)
/* 0001ABF0 C0810078 */ lfs f4, 0x78(r1)
/* 0001ABF4 C0010084 */ lfs f0, 0x84(r1)
/* 0001ABF8 EC6600F2 */ fmuls f3, f6, f3
/* 0001ABFC EC6518BA */ fmadds f3, f5, f2, f3
/* 0001AC00 EC64183A */ fmadds f3, f4, f0, f3
/* 0001AC04 C01F0008 */ lfs f0, 8(r31)
/* 0001AC08 FC030040 */ fcmpo cr0, f3, f0
/* 0001AC0C 4C401382 */ cror 2, 0, 2
/* 0001AC10 41820058 */ beq lbl_0001AC68
/* 0001AC14 C01A0048 */ lfs f0, 0x48(r26)
/* 0001AC18 C0BF000C */ lfs f5, 0xc(r31)
/* 0001AC1C EC030032 */ fmuls f0, f3, f0
/* 0001AC20 C0610070 */ lfs f3, 0x70(r1)
/* 0001AC24 C0810104 */ lfs f4, 0x104(r1)
/* 0001AC28 C0410074 */ lfs f2, 0x74(r1)
/* 0001AC2C ECC10024 */ fdivs f6, f1, f0
/* 0001AC30 C0010078 */ lfs f0, 0x78(r1)
/* 0001AC34 ECC6282A */ fadds f6, f6, f5
/* 0001AC38 ECC53024 */ fdivs f6, f5, f6
/* 0001AC3C EC6600F2 */ fmuls f3, f6, f3
/* 0001AC40 EC2600B2 */ fmuls f1, f6, f2
/* 0001AC44 EC060032 */ fmuls f0, f6, f0
/* 0001AC48 EC44182A */ fadds f2, f4, f3
/* 0001AC4C D0410104 */ stfs f2, 0x104(r1)
/* 0001AC50 C0410108 */ lfs f2, 0x108(r1)
/* 0001AC54 EC22082A */ fadds f1, f2, f1
/* 0001AC58 D0210108 */ stfs f1, 0x108(r1)
/* 0001AC5C C021010C */ lfs f1, 0x10c(r1)
/* 0001AC60 EC01002A */ fadds f0, f1, f0
/* 0001AC64 D001010C */ stfs f0, 0x10c(r1)
lbl_0001AC68:
/* 0001AC68 3BDEFFFF */ addi r30, r30, -1
/* 0001AC6C 3B9C0001 */ addi r28, r28, 1
/* 0001AC70 3AD6008C */ addi r22, r22, 0x8c
lbl_0001AC74:
/* 0001AC74 2C1E0000 */ cmpwi r30, 0
/* 0001AC78 4181FEE0 */ bgt lbl_0001AB58
/* 0001AC7C C03A0044 */ lfs f1, 0x44(r26)
/* 0001AC80 C0010104 */ lfs f0, 0x104(r1)
/* 0001AC84 C06100F8 */ lfs f3, 0xf8(r1)
/* 0001AC88 EC410032 */ fmuls f2, f1, f0
/* 0001AC8C C0210108 */ lfs f1, 0x108(r1)
/* 0001AC90 C001010C */ lfs f0, 0x10c(r1)
/* 0001AC94 EC43102A */ fadds f2, f3, f2
/* 0001AC98 D04100F8 */ stfs f2, 0xf8(r1)
/* 0001AC9C C05A0044 */ lfs f2, 0x44(r26)
/* 0001ACA0 C06100FC */ lfs f3, 0xfc(r1)
/* 0001ACA4 EC220072 */ fmuls f1, f2, f1
/* 0001ACA8 EC23082A */ fadds f1, f3, f1
/* 0001ACAC D02100FC */ stfs f1, 0xfc(r1)
/* 0001ACB0 C03A0044 */ lfs f1, 0x44(r26)
/* 0001ACB4 C0410100 */ lfs f2, 0x100(r1)
/* 0001ACB8 EC010032 */ fmuls f0, f1, f0
/* 0001ACBC EC02002A */ fadds f0, f2, f0
/* 0001ACC0 D0010100 */ stfs f0, 0x100(r1)
/* 0001ACC4 807D0148 */ lwz r3, 0x148(r29)
/* 0001ACC8 2C030000 */ cmpwi r3, 0
/* 0001ACCC 408106D0 */ ble lbl_0001B39C
/* 0001ACD0 3803FFFF */ addi r0, r3, -1
/* 0001ACD4 901D0148 */ stw r0, 0x148(r29)
/* 0001ACD8 3B600001 */ li r27, 1
/* 0001ACDC 480006C0 */ b lbl_0001B39C
lbl_0001ACE0:
/* 0001ACE0 C019001C */ lfs f0, 0x1c(r25)
/* 0001ACE4 38790004 */ addi r3, r25, 4
/* 0001ACE8 C06100F8 */ lfs f3, 0xf8(r1)
/* 0001ACEC 3899001C */ addi r4, r25, 0x1c
/* 0001ACF0 FC000050 */ fneg f0, f0
/* 0001ACF4 D0010104 */ stfs f0, 0x104(r1)
/* 0001ACF8 C01F0008 */ lfs f0, 8(r31)
/* 0001ACFC D0010108 */ stfs f0, 0x108(r1)
/* 0001AD00 C0190024 */ lfs f0, 0x24(r25)
/* 0001AD04 FC000050 */ fneg f0, f0
/* 0001AD08 D001010C */ stfs f0, 0x10c(r1)
/* 0001AD0C C05A0020 */ lfs f2, 0x20(r26)
/* 0001AD10 C0210104 */ lfs f1, 0x104(r1)
/* 0001AD14 C001010C */ lfs f0, 0x10c(r1)
/* 0001AD18 EC220072 */ fmuls f1, f2, f1
/* 0001AD1C EC23082A */ fadds f1, f3, f1
/* 0001AD20 D02100F8 */ stfs f1, 0xf8(r1)
/* 0001AD24 C03A0020 */ lfs f1, 0x20(r26)
/* 0001AD28 C0410100 */ lfs f2, 0x100(r1)
/* 0001AD2C EC010032 */ fmuls f0, f1, f0
/* 0001AD30 EC02002A */ fadds f0, f2, f0
/* 0001AD34 D0010100 */ stfs f0, 0x100(r1)
/* 0001AD38 C0190004 */ lfs f0, 4(r25)
/* 0001AD3C C06100F8 */ lfs f3, 0xf8(r1)
/* 0001AD40 FC000050 */ fneg f0, f0
/* 0001AD44 D0010104 */ stfs f0, 0x104(r1)
/* 0001AD48 C01F0008 */ lfs f0, 8(r31)
/* 0001AD4C D0010108 */ stfs f0, 0x108(r1)
/* 0001AD50 C019000C */ lfs f0, 0xc(r25)
/* 0001AD54 FC000050 */ fneg f0, f0
/* 0001AD58 D001010C */ stfs f0, 0x10c(r1)
/* 0001AD5C C05A0030 */ lfs f2, 0x30(r26)
/* 0001AD60 C0210104 */ lfs f1, 0x104(r1)
/* 0001AD64 C001010C */ lfs f0, 0x10c(r1)
/* 0001AD68 EC220072 */ fmuls f1, f2, f1
/* 0001AD6C EC23082A */ fadds f1, f3, f1
/* 0001AD70 D02100F8 */ stfs f1, 0xf8(r1)
/* 0001AD74 C03A0030 */ lfs f1, 0x30(r26)
/* 0001AD78 C0410100 */ lfs f2, 0x100(r1)
/* 0001AD7C EC010032 */ fmuls f0, f1, f0
/* 0001AD80 EC02002A */ fadds f0, f2, f0
/* 0001AD84 D0010100 */ stfs f0, 0x100(r1)
/* 0001AD88 4BFE53DD */ bl mathutil_vec_dot_normalized_safe
/* 0001AD8C C01F0008 */ lfs f0, 8(r31)
/* 0001AD90 FC010040 */ fcmpo cr0, f1, f0
/* 0001AD94 4080001C */ bge lbl_0001ADB0
/* 0001AD98 D001003C */ stfs f0, 0x3c(r1)
/* 0001AD9C C01F0008 */ lfs f0, 8(r31)
/* 0001ADA0 D0010040 */ stfs f0, 0x40(r1)
/* 0001ADA4 C01F0008 */ lfs f0, 8(r31)
/* 0001ADA8 D0010044 */ stfs f0, 0x44(r1)
/* 0001ADAC 48000030 */ b lbl_0001ADDC
lbl_0001ADB0:
/* 0001ADB0 80B90004 */ lwz r5, 4(r25)
/* 0001ADB4 3861003C */ addi r3, r1, 0x3c
/* 0001ADB8 80190008 */ lwz r0, 8(r25)
/* 0001ADBC 7C641B78 */ mr r4, r3
/* 0001ADC0 90A1003C */ stw r5, 0x3c(r1)
/* 0001ADC4 90010040 */ stw r0, 0x40(r1)
/* 0001ADC8 8019000C */ lwz r0, 0xc(r25)
/* 0001ADCC 90010044 */ stw r0, 0x44(r1)
/* 0001ADD0 C01A003C */ lfs f0, 0x3c(r26)
/* 0001ADD4 EC200072 */ fmuls f1, f0, f1
/* 0001ADD8 4BFE538D */ bl mathutil_vec_set_len
lbl_0001ADDC:
/* 0001ADDC C061003C */ lfs f3, 0x3c(r1)
/* 0001ADE0 38610064 */ addi r3, r1, 0x64
/* 0001ADE4 C0590004 */ lfs f2, 4(r25)
/* 0001ADE8 38810048 */ addi r4, r1, 0x48
/* 0001ADEC C03A0034 */ lfs f1, 0x34(r26)
/* 0001ADF0 C019001C */ lfs f0, 0x1c(r25)
/* 0001ADF4 EC43102A */ fadds f2, f3, f2
/* 0001ADF8 C0810040 */ lfs f4, 0x40(r1)
/* 0001ADFC 38A00000 */ li r5, 0
/* 0001AE00 EC010032 */ fmuls f0, f1, f0
/* 0001AE04 C0610044 */ lfs f3, 0x44(r1)
/* 0001AE08 EC02002A */ fadds f0, f2, f0
/* 0001AE0C D0010064 */ stfs f0, 0x64(r1)
/* 0001AE10 C0590008 */ lfs f2, 8(r25)
/* 0001AE14 C03A0034 */ lfs f1, 0x34(r26)
/* 0001AE18 C0190020 */ lfs f0, 0x20(r25)
/* 0001AE1C EC44102A */ fadds f2, f4, f2
/* 0001AE20 EC010032 */ fmuls f0, f1, f0
/* 0001AE24 EC02002A */ fadds f0, f2, f0
/* 0001AE28 D0010068 */ stfs f0, 0x68(r1)
/* 0001AE2C C059000C */ lfs f2, 0xc(r25)
/* 0001AE30 C03A0034 */ lfs f1, 0x34(r26)
/* 0001AE34 C0190024 */ lfs f0, 0x24(r25)
/* 0001AE38 EC43102A */ fadds f2, f3, f2
/* 0001AE3C EC010032 */ fmuls f0, f1, f0
/* 0001AE40 EC02002A */ fadds f0, f2, f0
/* 0001AE44 D001006C */ stfs f0, 0x6c(r1)
/* 0001AE48 4BFE531D */ bl raycast_stage_down
/* 0001AE4C 2C030000 */ cmpwi r3, 0
/* 0001AE50 41820028 */ beq lbl_0001AE78
/* 0001AE54 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 0001AE58 C0210050 */ lfs f1, 0x50(r1)
/* 0001AE5C 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 0001AE60 80840000 */ lwz r4, 0(r4)
/* 0001AE64 80840014 */ lwz r4, 0x14(r4)
/* 0001AE68 C0040000 */ lfs f0, 0(r4)
/* 0001AE6C FC010040 */ fcmpo cr0, f1, f0
/* 0001AE70 40800008 */ bge lbl_0001AE78
/* 0001AE74 38600000 */ li r3, 0
lbl_0001AE78:
/* 0001AE78 2C030000 */ cmpwi r3, 0
/* 0001AE7C 4082013C */ bne lbl_0001AFB8
/* 0001AE80 C0190004 */ lfs f0, 4(r25)
/* 0001AE84 3879001C */ addi r3, r25, 0x1c
/* 0001AE88 FC000050 */ fneg f0, f0
/* 0001AE8C D0010104 */ stfs f0, 0x104(r1)
/* 0001AE90 C01F0008 */ lfs f0, 8(r31)
/* 0001AE94 D0010108 */ stfs f0, 0x108(r1)
/* 0001AE98 C019000C */ lfs f0, 0xc(r25)
/* 0001AE9C FC000050 */ fneg f0, f0
/* 0001AEA0 D001010C */ stfs f0, 0x10c(r1)
/* 0001AEA4 C0230000 */ lfs f1, 0(r3)
/* 0001AEA8 C0430004 */ lfs f2, 4(r3)
/* 0001AEAC C0030008 */ lfs f0, 8(r3)
/* 0001AEB0 EC210072 */ fmuls f1, f1, f1
/* 0001AEB4 EC2208BA */ fmadds f1, f2, f2, f1
/* 0001AEB8 EC20083A */ fmadds f1, f0, f0, f1
/* 0001AEBC 4BFE52A9 */ bl mathutil_sqrt
/* 0001AEC0 C01F0014 */ lfs f0, 0x14(r31)
/* 0001AEC4 38610104 */ addi r3, r1, 0x104
/* 0001AEC8 38830000 */ addi r4, r3, 0
/* 0001AECC EC20082A */ fadds f1, f0, f1
/* 0001AED0 4BFE5295 */ bl mathutil_vec_set_len
/* 0001AED4 C03A0038 */ lfs f1, 0x38(r26)
/* 0001AED8 38610064 */ addi r3, r1, 0x64
/* 0001AEDC C0010104 */ lfs f0, 0x104(r1)
/* 0001AEE0 38810048 */ addi r4, r1, 0x48
/* 0001AEE4 C04100F8 */ lfs f2, 0xf8(r1)
/* 0001AEE8 EC210032 */ fmuls f1, f1, f0
/* 0001AEEC C001010C */ lfs f0, 0x10c(r1)
/* 0001AEF0 C0A1003C */ lfs f5, 0x3c(r1)
/* 0001AEF4 38A00000 */ li r5, 0
/* 0001AEF8 C0810040 */ lfs f4, 0x40(r1)
/* 0001AEFC EC22082A */ fadds f1, f2, f1
/* 0001AF00 C0610044 */ lfs f3, 0x44(r1)
/* 0001AF04 D02100F8 */ stfs f1, 0xf8(r1)
/* 0001AF08 C03A0038 */ lfs f1, 0x38(r26)
/* 0001AF0C C0410100 */ lfs f2, 0x100(r1)
/* 0001AF10 EC010032 */ fmuls f0, f1, f0
/* 0001AF14 EC02002A */ fadds f0, f2, f0
/* 0001AF18 D0010100 */ stfs f0, 0x100(r1)
/* 0001AF1C C0590004 */ lfs f2, 4(r25)
/* 0001AF20 C03A0040 */ lfs f1, 0x40(r26)
/* 0001AF24 C019001C */ lfs f0, 0x1c(r25)
/* 0001AF28 EC45102A */ fadds f2, f5, f2
/* 0001AF2C EC010032 */ fmuls f0, f1, f0
/* 0001AF30 EC02002A */ fadds f0, f2, f0
/* 0001AF34 D0010064 */ stfs f0, 0x64(r1)
/* 0001AF38 C0590008 */ lfs f2, 8(r25)
/* 0001AF3C C03A0040 */ lfs f1, 0x40(r26)
/* 0001AF40 C0190020 */ lfs f0, 0x20(r25)
/* 0001AF44 EC44102A */ fadds f2, f4, f2
/* 0001AF48 EC010032 */ fmuls f0, f1, f0
/* 0001AF4C EC02002A */ fadds f0, f2, f0
/* 0001AF50 D0010068 */ stfs f0, 0x68(r1)
/* 0001AF54 C059000C */ lfs f2, 0xc(r25)
/* 0001AF58 C03A0040 */ lfs f1, 0x40(r26)
/* 0001AF5C C0190024 */ lfs f0, 0x24(r25)
/* 0001AF60 EC43102A */ fadds f2, f3, f2
/* 0001AF64 EC010032 */ fmuls f0, f1, f0
/* 0001AF68 EC02002A */ fadds f0, f2, f0
/* 0001AF6C D001006C */ stfs f0, 0x6c(r1)
/* 0001AF70 4BFE51F5 */ bl raycast_stage_down
/* 0001AF74 2C030000 */ cmpwi r3, 0
/* 0001AF78 41820028 */ beq lbl_0001AFA0
/* 0001AF7C 3C800000 */ lis r4, decodedStageLzPtr@ha
/* 0001AF80 C0210050 */ lfs f1, 0x50(r1)
/* 0001AF84 38840000 */ addi r4, r4, decodedStageLzPtr@l
/* 0001AF88 80840000 */ lwz r4, 0(r4)
/* 0001AF8C 80840014 */ lwz r4, 0x14(r4)
/* 0001AF90 C0040000 */ lfs f0, 0(r4)
/* 0001AF94 FC010040 */ fcmpo cr0, f1, f0
/* 0001AF98 40800008 */ bge lbl_0001AFA0
/* 0001AF9C 38600000 */ li r3, 0
lbl_0001AFA0:
/* 0001AFA0 2C030000 */ cmpwi r3, 0
/* 0001AFA4 40820014 */ bne lbl_0001AFB8
/* 0001AFA8 80190094 */ lwz r0, 0x94(r25)
/* 0001AFAC 540007FF */ clrlwi. r0, r0, 0x1f
/* 0001AFB0 41820008 */ beq lbl_0001AFB8
/* 0001AFB4 3B600001 */ li r27, 1
lbl_0001AFB8:
/* 0001AFB8 C01F0008 */ lfs f0, 8(r31)
/* 0001AFBC 3C600000 */ lis r3, ballInfo@ha
/* 0001AFC0 38030000 */ addi r0, r3, ballInfo@l
/* 0001AFC4 D0010104 */ stfs f0, 0x104(r1)
/* 0001AFC8 3C800000 */ lis r4, g_poolInfo@ha
/* 0001AFCC 38640000 */ addi r3, r4, g_poolInfo@l
/* 0001AFD0 C01F0008 */ lfs f0, 8(r31)
/* 0001AFD4 7C160378 */ mr r22, r0
/* 0001AFD8 3AE10024 */ addi r23, r1, 0x24
/* 0001AFDC D0010108 */ stfs f0, 0x108(r1)
/* 0001AFE0 C01F0008 */ lfs f0, 8(r31)
/* 0001AFE4 D001010C */ stfs f0, 0x10c(r1)
/* 0001AFE8 8383000C */ lwz r28, 0xc(r3)
/* 0001AFEC 83C30008 */ lwz r30, 8(r3)
/* 0001AFF0 480001B8 */ b lbl_0001B1A8
lbl_0001AFF4:
/* 0001AFF4 881C0000 */ lbz r0, 0(r28)
/* 0001AFF8 7C000775 */ extsb. r0, r0
/* 0001AFFC 418201A0 */ beq lbl_0001B19C
/* 0001B000 7C19B040 */ cmplw r25, r22
/* 0001B004 41820198 */ beq lbl_0001B19C
/* 0001B008 3B16001C */ addi r24, r22, 0x1c
/* 0001B00C C0380000 */ lfs f1, 0(r24)
/* 0001B010 C0580004 */ lfs f2, 4(r24)
/* 0001B014 C0180008 */ lfs f0, 8(r24)
/* 0001B018 EC210072 */ fmuls f1, f1, f1
/* 0001B01C EC2208BA */ fmadds f1, f2, f2, f1
/* 0001B020 EC20083A */ fmadds f1, f0, f0, f1
/* 0001B024 4BFE5141 */ bl mathutil_sqrt
/* 0001B028 FFE00890 */ fmr f31, f1
/* 0001B02C C01F0014 */ lfs f0, 0x14(r31)
/* 0001B030 FC1F0040 */ fcmpo cr0, f31, f0
/* 0001B034 41800168 */ blt lbl_0001B19C
/* 0001B038 C0390004 */ lfs f1, 4(r25)
/* 0001B03C 38610030 */ addi r3, r1, 0x30
/* 0001B040 C0160004 */ lfs f0, 4(r22)
/* 0001B044 EC010028 */ fsubs f0, f1, f0
/* 0001B048 D0010030 */ stfs f0, 0x30(r1)
/* 0001B04C C0390008 */ lfs f1, 8(r25)
/* 0001B050 C0160008 */ lfs f0, 8(r22)
/* 0001B054 EC010028 */ fsubs f0, f1, f0
/* 0001B058 D0010034 */ stfs f0, 0x34(r1)
/* 0001B05C C039000C */ lfs f1, 0xc(r25)
/* 0001B060 C016000C */ lfs f0, 0xc(r22)
/* 0001B064 EC010028 */ fsubs f0, f1, f0
/* 0001B068 D0010038 */ stfs f0, 0x38(r1)
/* 0001B06C 4BFE50F9 */ bl mathutil_vec_normalize_len
/* 0001B070 C0C10030 */ lfs f6, 0x30(r1)
/* 0001B074 C0780000 */ lfs f3, 0(r24)
/* 0001B078 C0A10034 */ lfs f5, 0x34(r1)
/* 0001B07C C0580004 */ lfs f2, 4(r24)
/* 0001B080 C0810038 */ lfs f4, 0x38(r1)
/* 0001B084 C0180008 */ lfs f0, 8(r24)
/* 0001B088 EC6600F2 */ fmuls f3, f6, f3
/* 0001B08C EC6518BA */ fmadds f3, f5, f2, f3
/* 0001B090 EC64183A */ fmadds f3, f4, f0, f3
/* 0001B094 C01F0008 */ lfs f0, 8(r31)
/* 0001B098 FC030040 */ fcmpo cr0, f3, f0
/* 0001B09C 41800100 */ blt lbl_0001B19C
/* 0001B0A0 C01A0028 */ lfs f0, 0x28(r26)
/* 0001B0A4 8079001C */ lwz r3, 0x1c(r25)
/* 0001B0A8 EC000072 */ fmuls f0, f0, f1
/* 0001B0AC 80190020 */ lwz r0, 0x20(r25)
/* 0001B0B0 90610024 */ stw r3, 0x24(r1)
/* 0001B0B4 EFFF0024 */ fdivs f31, f31, f0
/* 0001B0B8 90010028 */ stw r0, 0x28(r1)
/* 0001B0BC 80190024 */ lwz r0, 0x24(r25)
/* 0001B0C0 9001002C */ stw r0, 0x2c(r1)
/* 0001B0C4 C03F0008 */ lfs f1, 8(r31)
/* 0001B0C8 C0010024 */ lfs f0, 0x24(r1)
/* 0001B0CC FC010000 */ fcmpu cr0, f1, f0
/* 0001B0D0 40820038 */ bne lbl_0001B108
/* 0001B0D4 C0010028 */ lfs f0, 0x28(r1)
/* 0001B0D8 FC010000 */ fcmpu cr0, f1, f0
/* 0001B0DC 4082002C */ bne lbl_0001B108
/* 0001B0E0 C001002C */ lfs f0, 0x2c(r1)
/* 0001B0E4 FC010000 */ fcmpu cr0, f1, f0
/* 0001B0E8 40820020 */ bne lbl_0001B108
/* 0001B0EC C0010038 */ lfs f0, 0x38(r1)
/* 0001B0F0 C0210034 */ lfs f1, 0x34(r1)
/* 0001B0F4 FC400050 */ fneg f2, f0
/* 0001B0F8 C0010030 */ lfs f0, 0x30(r1)
/* 0001B0FC D0410024 */ stfs f2, 0x24(r1)
/* 0001B100 D0210028 */ stfs f1, 0x28(r1)
/* 0001B104 D001002C */ stfs f0, 0x2c(r1)
lbl_0001B108:
/* 0001B108 38610024 */ addi r3, r1, 0x24
/* 0001B10C 4BFE5059 */ bl mathutil_vec_normalize_len
/* 0001B110 C0A10030 */ lfs f5, 0x30(r1)
/* 0001B114 C0410024 */ lfs f2, 0x24(r1)
/* 0001B118 C0810034 */ lfs f4, 0x34(r1)
/* 0001B11C C0210028 */ lfs f1, 0x28(r1)
/* 0001B120 C0610038 */ lfs f3, 0x38(r1)
/* 0001B124 C001002C */ lfs f0, 0x2c(r1)
/* 0001B128 ECA500B2 */ fmuls f5, f5, f2
/* 0001B12C ECA4287A */ fmadds f5, f4, f1, f5
/* 0001B130 ECA3283A */ fmadds f5, f3, f0, f5
/* 0001B134 C01A002C */ lfs f0, 0x2c(r26)
/* 0001B138 C0410030 */ lfs f2, 0x30(r1)
/* 0001B13C FC20F890 */ fmr f1, f31
/* 0001B140 C0610024 */ lfs f3, 0x24(r1)
/* 0001B144 EC800172 */ fmuls f4, f0, f5
/* 0001B148 C0010038 */ lfs f0, 0x38(r1)
/* 0001B14C 38770000 */ addi r3, r23, 0
/* 0001B150 38970000 */ addi r4, r23, 0
/* 0001B154 EC4400B2 */ fmuls f2, f4, f2
/* 0001B158 EC040032 */ fmuls f0, f4, f0
/* 0001B15C EC43102A */ fadds f2, f3, f2
/* 0001B160 D0410024 */ stfs f2, 0x24(r1)
/* 0001B164 C05F0008 */ lfs f2, 8(r31)
/* 0001B168 D0410028 */ stfs f2, 0x28(r1)
/* 0001B16C C041002C */ lfs f2, 0x2c(r1)
/* 0001B170 EC02002A */ fadds f0, f2, f0
/* 0001B174 D001002C */ stfs f0, 0x2c(r1)
/* 0001B178 4BFE4FED */ bl mathutil_vec_set_len
/* 0001B17C C0410104 */ lfs f2, 0x104(r1)
/* 0001B180 C0210024 */ lfs f1, 0x24(r1)
/* 0001B184 C001002C */ lfs f0, 0x2c(r1)
/* 0001B188 EC22082A */ fadds f1, f2, f1
/* 0001B18C D0210104 */ stfs f1, 0x104(r1)
/* 0001B190 C021010C */ lfs f1, 0x10c(r1)
/* 0001B194 EC01002A */ fadds f0, f1, f0
/* 0001B198 D001010C */ stfs f0, 0x10c(r1)
lbl_0001B19C:
/* 0001B19C 3BDEFFFF */ addi r30, r30, -1
/* 0001B1A0 3B9C0001 */ addi r28, r28, 1
/* 0001B1A4 3AD601A4 */ addi r22, r22, 0x1a4
lbl_0001B1A8:
/* 0001B1A8 2C1E0000 */ cmpwi r30, 0
/* 0001B1AC 4181FE48 */ bgt lbl_0001AFF4
/* 0001B1B0 C03A0024 */ lfs f1, 0x24(r26)
/* 0001B1B4 3C600000 */ lis r3, g_itemInfo@ha
/* 0001B1B8 C0010104 */ lfs f0, 0x104(r1)
/* 0001B1BC 38030000 */ addi r0, r3, g_itemInfo@l
/* 0001B1C0 3C800000 */ lis r4, g_poolInfo@ha
/* 0001B1C4 EC410032 */ fmuls f2, f1, f0
/* 0001B1C8 C06100F8 */ lfs f3, 0xf8(r1)
/* 0001B1CC C0210108 */ lfs f1, 0x108(r1)
/* 0001B1D0 38640000 */ addi r3, r4, g_poolInfo@l
/* 0001B1D4 C001010C */ lfs f0, 0x10c(r1)
/* 0001B1D8 EC43102A */ fadds f2, f3, f2
/* 0001B1DC 7C160378 */ mr r22, r0
/* 0001B1E0 D04100F8 */ stfs f2, 0xf8(r1)
/* 0001B1E4 C05A0024 */ lfs f2, 0x24(r26)
/* 0001B1E8 C06100FC */ lfs f3, 0xfc(r1)
/* 0001B1EC EC220072 */ fmuls f1, f2, f1
/* 0001B1F0 EC23082A */ fadds f1, f3, f1
/* 0001B1F4 D02100FC */ stfs f1, 0xfc(r1)
/* 0001B1F8 C03A0024 */ lfs f1, 0x24(r26)
/* 0001B1FC C0410100 */ lfs f2, 0x100(r1)
/* 0001B200 EC010032 */ fmuls f0, f1, f0
/* 0001B204 EC02002A */ fadds f0, f2, f0
/* 0001B208 D0010100 */ stfs f0, 0x100(r1)
/* 0001B20C C01F0008 */ lfs f0, 8(r31)
/* 0001B210 D0010104 */ stfs f0, 0x104(r1)
/* 0001B214 C01F0008 */ lfs f0, 8(r31)
/* 0001B218 D0010108 */ stfs f0, 0x108(r1)
/* 0001B21C C01F0008 */ lfs f0, 8(r31)
/* 0001B220 D001010C */ stfs f0, 0x10c(r1)
/* 0001B224 8383001C */ lwz r28, 0x1c(r3)
/* 0001B228 83C30018 */ lwz r30, 0x18(r3)
/* 0001B22C 48000120 */ b lbl_0001B34C
lbl_0001B230:
/* 0001B230 881C0000 */ lbz r0, 0(r28)
/* 0001B234 7C000775 */ extsb. r0, r0
/* 0001B238 41820108 */ beq lbl_0001B340
/* 0001B23C C0360020 */ lfs f1, 0x20(r22)
/* 0001B240 3861000C */ addi r3, r1, 0xc
/* 0001B244 C0190004 */ lfs f0, 4(r25)
/* 0001B248 EC010028 */ fsubs f0, f1, f0
/* 0001B24C D001000C */ stfs f0, 0xc(r1)
/* 0001B250 C0360024 */ lfs f1, 0x24(r22)
/* 0001B254 C0190008 */ lfs f0, 8(r25)
/* 0001B258 EC010028 */ fsubs f0, f1, f0
/* 0001B25C D0010010 */ stfs f0, 0x10(r1)
/* 0001B260 C0360028 */ lfs f1, 0x28(r22)
/* 0001B264 C019000C */ lfs f0, 0xc(r25)
/* 0001B268 EC010028 */ fsubs f0, f1, f0
/* 0001B26C D0010014 */ stfs f0, 0x14(r1)
/* 0001B270 4BFE4EF5 */ bl mathutil_vec_normalize_len
/* 0001B274 C0590068 */ lfs f2, 0x68(r25)
/* 0001B278 C0160014 */ lfs f0, 0x14(r22)
/* 0001B27C EC02002A */ fadds f0, f2, f0
/* 0001B280 FC010040 */ fcmpo cr0, f1, f0
/* 0001B284 418000BC */ blt lbl_0001B340
/* 0001B288 C059001C */ lfs f2, 0x1c(r25)
/* 0001B28C C016002C */ lfs f0, 0x2c(r22)
/* 0001B290 EC020028 */ fsubs f0, f2, f0
/* 0001B294 D0010018 */ stfs f0, 0x18(r1)
/* 0001B298 C0590020 */ lfs f2, 0x20(r25)
/* 0001B29C C0160030 */ lfs f0, 0x30(r22)
/* 0001B2A0 EC020028 */ fsubs f0, f2, f0
/* 0001B2A4 D001001C */ stfs f0, 0x1c(r1)
/* 0001B2A8 C0590024 */ lfs f2, 0x24(r25)
/* 0001B2AC C0160034 */ lfs f0, 0x34(r22)
/* 0001B2B0 EC020028 */ fsubs f0, f2, f0
/* 0001B2B4 D0010020 */ stfs f0, 0x20(r1)
/* 0001B2B8 C0C1000C */ lfs f6, 0xc(r1)
/* 0001B2BC C0610018 */ lfs f3, 0x18(r1)
/* 0001B2C0 C0A10010 */ lfs f5, 0x10(r1)
/* 0001B2C4 C041001C */ lfs f2, 0x1c(r1)
/* 0001B2C8 C0810014 */ lfs f4, 0x14(r1)
/* 0001B2CC C0010020 */ lfs f0, 0x20(r1)
/* 0001B2D0 EC6600F2 */ fmuls f3, f6, f3
/* 0001B2D4 EC6518BA */ fmadds f3, f5, f2, f3
/* 0001B2D8 EC64183A */ fmadds f3, f4, f0, f3
/* 0001B2DC C01F0008 */ lfs f0, 8(r31)
/* 0001B2E0 FC030040 */ fcmpo cr0, f3, f0
/* 0001B2E4 4C401382 */ cror 2, 0, 2
/* 0001B2E8 41820058 */ beq lbl_0001B340
/* 0001B2EC C01A0048 */ lfs f0, 0x48(r26)
/* 0001B2F0 C0BF000C */ lfs f5, 0xc(r31)
/* 0001B2F4 EC030032 */ fmuls f0, f3, f0
/* 0001B2F8 C061000C */ lfs f3, 0xc(r1)
/* 0001B2FC C0810104 */ lfs f4, 0x104(r1)
/* 0001B300 C0410010 */ lfs f2, 0x10(r1)
/* 0001B304 ECC10024 */ fdivs f6, f1, f0
/* 0001B308 C0010014 */ lfs f0, 0x14(r1)
/* 0001B30C ECC6282A */ fadds f6, f6, f5
/* 0001B310 ECC53024 */ fdivs f6, f5, f6
/* 0001B314 EC6600F2 */ fmuls f3, f6, f3
/* 0001B318 EC2600B2 */ fmuls f1, f6, f2
/* 0001B31C EC060032 */ fmuls f0, f6, f0
/* 0001B320 EC44182A */ fadds f2, f4, f3
/* 0001B324 D0410104 */ stfs f2, 0x104(r1)
/* 0001B328 C0410108 */ lfs f2, 0x108(r1)
/* 0001B32C EC22082A */ fadds f1, f2, f1
/* 0001B330 D0210108 */ stfs f1, 0x108(r1)
/* 0001B334 C021010C */ lfs f1, 0x10c(r1)
/* 0001B338 EC01002A */ fadds f0, f1, f0
/* 0001B33C D001010C */ stfs f0, 0x10c(r1)
lbl_0001B340:
/* 0001B340 3BDEFFFF */ addi r30, r30, -1
/* 0001B344 3B9C0001 */ addi r28, r28, 1
/* 0001B348 3AD6008C */ addi r22, r22, 0x8c
lbl_0001B34C:
/* 0001B34C 2C1E0000 */ cmpwi r30, 0
/* 0001B350 4181FEE0 */ bgt lbl_0001B230
/* 0001B354 C03A0044 */ lfs f1, 0x44(r26)
/* 0001B358 C0010104 */ lfs f0, 0x104(r1)
/* 0001B35C C06100F8 */ lfs f3, 0xf8(r1)
/* 0001B360 EC410032 */ fmuls f2, f1, f0
/* 0001B364 C0210108 */ lfs f1, 0x108(r1)
/* 0001B368 C001010C */ lfs f0, 0x10c(r1)
/* 0001B36C EC43102A */ fadds f2, f3, f2
/* 0001B370 D04100F8 */ stfs f2, 0xf8(r1)
/* 0001B374 C05A0044 */ lfs f2, 0x44(r26)
/* 0001B378 C06100FC */ lfs f3, 0xfc(r1)
/* 0001B37C EC220072 */ fmuls f1, f2, f1
/* 0001B380 EC23082A */ fadds f1, f3, f1
/* 0001B384 D02100FC */ stfs f1, 0xfc(r1)
/* 0001B388 C03A0044 */ lfs f1, 0x44(r26)
/* 0001B38C C0410100 */ lfs f2, 0x100(r1)
/* 0001B390 EC010032 */ fmuls f0, f1, f0
/* 0001B394 EC02002A */ fadds f0, f2, f0
/* 0001B398 D0010100 */ stfs f0, 0x100(r1)
lbl_0001B39C:
/* 0001B39C C03F0008 */ lfs f1, 8(r31)
/* 0001B3A0 C00100F8 */ lfs f0, 0xf8(r1)
/* 0001B3A4 FC010000 */ fcmpu cr0, f1, f0
/* 0001B3A8 4082001C */ bne lbl_0001B3C4
/* 0001B3AC C00100FC */ lfs f0, 0xfc(r1)
/* 0001B3B0 FC010000 */ fcmpu cr0, f1, f0
/* 0001B3B4 40820010 */ bne lbl_0001B3C4
/* 0001B3B8 C0010100 */ lfs f0, 0x100(r1)
/* 0001B3BC FC010000 */ fcmpu cr0, f1, f0
/* 0001B3C0 4182000C */ beq lbl_0001B3CC
lbl_0001B3C4:
/* 0001B3C4 386100F8 */ addi r3, r1, 0xf8
/* 0001B3C8 4BFE4D9D */ bl mathutil_vec_normalize_len
lbl_0001B3CC:
/* 0001B3CC C05D0118 */ lfs f2, 0x118(r29)
/* 0001B3D0 C00100F8 */ lfs f0, 0xf8(r1)
/* 0001B3D4 C03F0018 */ lfs f1, 0x18(r31)
/* 0001B3D8 EC001028 */ fsubs f0, f0, f2
/* 0001B3DC EC010032 */ fmuls f0, f1, f0
/* 0001B3E0 EC02002A */ fadds f0, f2, f0
/* 0001B3E4 D01D0118 */ stfs f0, 0x118(r29)
/* 0001B3E8 C05D011C */ lfs f2, 0x11c(r29)
/* 0001B3EC C00100FC */ lfs f0, 0xfc(r1)
/* 0001B3F0 C03F0018 */ lfs f1, 0x18(r31)
/* 0001B3F4 EC001028 */ fsubs f0, f0, f2
/* 0001B3F8 EC010032 */ fmuls f0, f1, f0
/* 0001B3FC EC02002A */ fadds f0, f2, f0
/* 0001B400 D01D011C */ stfs f0, 0x11c(r29)
/* 0001B404 C05D0120 */ lfs f2, 0x120(r29)
/* 0001B408 C0010100 */ lfs f0, 0x100(r1)
/* 0001B40C C03F0018 */ lfs f1, 0x18(r31)
/* 0001B410 EC001028 */ fsubs f0, f0, f2
/* 0001B414 EC010032 */ fmuls f0, f1, f0
/* 0001B418 EC02002A */ fadds f0, f2, f0
/* 0001B41C D01D0120 */ stfs f0, 0x120(r29)
/* 0001B420 937D0124 */ stw r27, 0x124(r29)
/* 0001B424 8001014C */ lwz r0, 0x14c(r1)
/* 0001B428 CBE10140 */ lfd f31, 0x140(r1)
/* 0001B42C BAC10118 */ lmw r22, 0x118(r1)
/* 0001B430 38210148 */ addi r1, r1, 0x148
/* 0001B434 7C0803A6 */ mtlr r0
/* 0001B438 4E800020 */ blr 
