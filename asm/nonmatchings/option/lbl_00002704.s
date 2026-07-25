/* 00002704 7C0802A6 */ mflr r0
/* 00002708 3C600000 */ lis r3, lbl_10000000@ha
/* 0000270C 90010004 */ stw r0, 4(r1)
/* 00002710 9421FFE0 */ stwu r1, -0x20(r1)
/* 00002714 BF61000C */ stmw r27, 0xc(r1)
/* 00002718 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 0000271C 3BDF005C */ addi r30, r31, 0x5c
/* 00002720 807F0078 */ lwz r3, 0x78(r31)
/* 00002724 2C030000 */ cmpwi r3, 0
/* 00002728 4081000C */ ble lbl_00002734
/* 0000272C 3803FFFF */ addi r0, r3, -1
/* 00002730 901E001C */ stw r0, 0x1c(r30)
lbl_00002734:
/* 00002734 3C600000 */ lis r3, eventInfo@ha
/* 00002738 88030000 */ lbz r0, eventInfo@l(r3)
/* 0000273C 2C000002 */ cmpwi r0, 2
/* 00002740 41820520 */ beq lbl_00002C60
/* 00002744 801E0010 */ lwz r0, 0x10(r30)
/* 00002748 28000006 */ cmplwi r0, 6
/* 0000274C 41810514 */ bgt lbl_00002C60
/* 00002750 3C600000 */ lis r3, lbl_0000C868@ha
/* 00002754 38630000 */ addi r3, r3, lbl_0000C868@l
/* 00002758 5400103A */ slwi r0, r0, 2
/* 0000275C 7C03002E */ lwzx r0, r3, r0
/* 00002760 7C0903A6 */ mtctr r0
/* 00002764 4E800420 */ bctr 
lbl_00002768:
/* 00002768 4BFFDA45 */ bl sub_8009F554
/* 0000276C 2C030000 */ cmpwi r3, 0
/* 00002770 40820028 */ bne lbl_00002798
/* 00002774 4BFFDA39 */ bl memcard_cancel_and_unmount
/* 00002778 3860006B */ li r3, 0x6b
/* 0000277C 4BFFDA31 */ bl u_play_sound_0
/* 00002780 38600059 */ li r3, 0x59
/* 00002784 48001ADD */ bl lbl_00004260
/* 00002788 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000278C 380000AE */ li r0, 0xae
/* 00002790 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002794 480004CC */ b lbl_00002C60
lbl_00002798:
/* 00002798 38000001 */ li r0, 1
/* 0000279C 901E0010 */ stw r0, 0x10(r30)
/* 000027A0 801E0014 */ lwz r0, 0x14(r30)
/* 000027A4 7C000734 */ extsh r0, r0
/* 000027A8 B01F001C */ sth r0, 0x1c(r31)
/* 000027AC 48004325 */ bl lbl_00006AD0
/* 000027B0 480004B0 */ b lbl_00002C60
lbl_000027B4:
/* 000027B4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000027B8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000027BC A0030004 */ lhz r0, 4(r3)
/* 000027C0 3BA30004 */ addi r29, r3, 4
/* 000027C4 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000027C8 41820028 */ beq lbl_000027F0
/* 000027CC 4BFFD9E1 */ bl memcard_cancel_and_unmount
/* 000027D0 3860006B */ li r3, 0x6b
/* 000027D4 4BFFD9D9 */ bl u_play_sound_0
/* 000027D8 38600059 */ li r3, 0x59
/* 000027DC 48001A85 */ bl lbl_00004260
/* 000027E0 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000027E4 380000AE */ li r0, 0xae
/* 000027E8 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000027EC 48000474 */ b lbl_00002C60
lbl_000027F0:
/* 000027F0 A0830008 */ lhz r4, 8(r3)
/* 000027F4 80BE0014 */ lwz r5, 0x14(r30)
/* 000027F8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000027FC 7CA60774 */ extsb r6, r5
/* 00002800 40820018 */ bne lbl_00002818
/* 00002804 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002808 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000280C A0630008 */ lhz r3, 8(r3)
/* 00002810 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 00002814 4182003C */ beq lbl_00002850
lbl_00002818:
/* 00002818 1C060018 */ mulli r0, r6, 0x18
/* 0000281C 7C7F0214 */ add r3, r31, r0
/* 00002820 3863629C */ addi r3, r3, 0x629c
lbl_00002824:
/* 00002824 38C6FFFF */ addi r6, r6, -1
/* 00002828 7CC00775 */ extsb. r0, r6
/* 0000282C 3863FFE8 */ addi r3, r3, -24
/* 00002830 4080000C */ bge lbl_0000283C
/* 00002834 7CA60774 */ extsb r6, r5
/* 00002838 48000070 */ b lbl_000028A8
lbl_0000283C:
/* 0000283C 88030014 */ lbz r0, 0x14(r3)
/* 00002840 7C000774 */ extsb r0, r0
/* 00002844 2C00FFFE */ cmpwi r0, -2
/* 00002848 4182FFDC */ beq lbl_00002824
/* 0000284C 4800005C */ b lbl_000028A8
lbl_00002850:
/* 00002850 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002854 4082000C */ bne lbl_00002860
/* 00002858 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000285C 4182004C */ beq lbl_000028A8
lbl_00002860:
/* 00002860 1C060018 */ mulli r0, r6, 0x18
/* 00002864 7C9F0214 */ add r4, r31, r0
/* 00002868 3884629C */ addi r4, r4, 0x629c
lbl_0000286C:
/* 0000286C 38C60001 */ addi r6, r6, 1
/* 00002870 7CC00774 */ extsb r0, r6
/* 00002874 1C000018 */ mulli r0, r0, 0x18
/* 00002878 7C7F0214 */ add r3, r31, r0
/* 0000287C 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002880 38840018 */ addi r4, r4, 0x18
/* 00002884 7C000774 */ extsb r0, r0
/* 00002888 2C00FFFF */ cmpwi r0, -1
/* 0000288C 4082000C */ bne lbl_00002898
/* 00002890 7CA60774 */ extsb r6, r5
/* 00002894 48000014 */ b lbl_000028A8
lbl_00002898:
/* 00002898 88040014 */ lbz r0, 0x14(r4)
/* 0000289C 7C000774 */ extsb r0, r0
/* 000028A0 2C00FFFE */ cmpwi r0, -2
/* 000028A4 4182FFC8 */ beq lbl_0000286C
lbl_000028A8:
/* 000028A8 7CDC0774 */ extsb r28, r6
/* 000028AC 7C1C2800 */ cmpw r28, r5
/* 000028B0 41820010 */ beq lbl_000028C0
/* 000028B4 3860006C */ li r3, 0x6c
/* 000028B8 4BFFD8F5 */ bl u_play_sound_0
/* 000028BC 939E0014 */ stw r28, 0x14(r30)
lbl_000028C0:
/* 000028C0 A01D0000 */ lhz r0, 0(r29)
/* 000028C4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000028C8 41820398 */ beq lbl_00002C60
/* 000028CC 3860006A */ li r3, 0x6a
/* 000028D0 4BFFD8DD */ bl u_play_sound_0
/* 000028D4 38000002 */ li r0, 2
/* 000028D8 901E0010 */ stw r0, 0x10(r30)
/* 000028DC 38000000 */ li r0, 0
/* 000028E0 901E0018 */ stw r0, 0x18(r30)
/* 000028E4 4800037C */ b lbl_00002C60
lbl_000028E8:
/* 000028E8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000028EC 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000028F0 A0030004 */ lhz r0, 4(r3)
/* 000028F4 3BA30004 */ addi r29, r3, 4
/* 000028F8 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 000028FC 41820018 */ beq lbl_00002914
/* 00002900 3860006B */ li r3, 0x6b
/* 00002904 4BFFD8A9 */ bl u_play_sound_0
/* 00002908 38000001 */ li r0, 1
/* 0000290C 901E0010 */ stw r0, 0x10(r30)
/* 00002910 48000350 */ b lbl_00002C60
lbl_00002914:
/* 00002914 A0830008 */ lhz r4, 8(r3)
/* 00002918 80BE0018 */ lwz r5, 0x18(r30)
/* 0000291C 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00002920 3B850000 */ addi r28, r5, 0
/* 00002924 40820018 */ bne lbl_0000293C
/* 00002928 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 0000292C 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002930 A0030008 */ lhz r0, 8(r3)
/* 00002934 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002938 41820008 */ beq lbl_00002940
lbl_0000293C:
/* 0000293C 3B800000 */ li r28, 0
lbl_00002940:
/* 00002940 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002944 40820018 */ bne lbl_0000295C
/* 00002948 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 0000294C 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002950 A0030008 */ lhz r0, 8(r3)
/* 00002954 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002958 41820008 */ beq lbl_00002960
lbl_0000295C:
/* 0000295C 3B800001 */ li r28, 1
lbl_00002960:
/* 00002960 801E0014 */ lwz r0, 0x14(r30)
/* 00002964 1C000018 */ mulli r0, r0, 0x18
/* 00002968 7C7F0214 */ add r3, r31, r0
/* 0000296C A003629E */ lhz r0, 0x629e(r3)
/* 00002970 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002974 41820008 */ beq lbl_0000297C
/* 00002978 3B800001 */ li r28, 1
lbl_0000297C:
/* 0000297C 7C1C2800 */ cmpw r28, r5
/* 00002980 41820010 */ beq lbl_00002990
/* 00002984 3860006C */ li r3, 0x6c
/* 00002988 4BFFD825 */ bl u_play_sound_0
/* 0000298C 939E0018 */ stw r28, 0x18(r30)
lbl_00002990:
/* 00002990 A01D0000 */ lhz r0, 0(r29)
/* 00002994 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002998 418202C8 */ beq lbl_00002C60
/* 0000299C 3860006A */ li r3, 0x6a
/* 000029A0 4BFFD80D */ bl u_play_sound_0
/* 000029A4 801E0018 */ lwz r0, 0x18(r30)
/* 000029A8 2C000000 */ cmpwi r0, 0
/* 000029AC 4082002C */ bne lbl_000029D8
/* 000029B0 38600004 */ li r3, 4
/* 000029B4 4BFFD7F9 */ bl memcard_set_mode
/* 000029B8 387F629C */ addi r3, r31, 0x629c
/* 000029BC 809E0014 */ lwz r4, 0x14(r30)
/* 000029C0 4BFFD7ED */ bl func_8009F4B8
/* 000029C4 38600000 */ li r3, 0
/* 000029C8 4BFFD7E5 */ bl event_start
/* 000029CC 38000003 */ li r0, 3
/* 000029D0 901E0010 */ stw r0, 0x10(r30)
/* 000029D4 4800028C */ b lbl_00002C60
lbl_000029D8:
/* 000029D8 38000001 */ li r0, 1
/* 000029DC 901F0004 */ stw r0, 4(r31)
/* 000029E0 38000005 */ li r0, 5
/* 000029E4 901E0010 */ stw r0, 0x10(r30)
/* 000029E8 48000278 */ b lbl_00002C60
lbl_000029EC:
/* 000029EC 4BFFD7C1 */ bl sub_8009F554
/* 000029F0 2C030000 */ cmpwi r3, 0
/* 000029F4 40820028 */ bne lbl_00002A1C
/* 000029F8 4BFFD7B5 */ bl memcard_cancel_and_unmount
/* 000029FC 3860006B */ li r3, 0x6b
/* 00002A00 4BFFD7AD */ bl u_play_sound_0
/* 00002A04 38600059 */ li r3, 0x59
/* 00002A08 48001859 */ bl lbl_00004260
/* 00002A0C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002A10 380000AE */ li r0, 0xae
/* 00002A14 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A18 48000248 */ b lbl_00002C60
lbl_00002A1C:
/* 00002A1C 3860001E */ li r3, 0x1e
/* 00002A20 38800002 */ li r4, 2
/* 00002A24 4BFFD789 */ bl u_play_music
/* 00002A28 38600101 */ li r3, 0x101
/* 00002A2C 38800000 */ li r4, 0
/* 00002A30 38A0001E */ li r5, 0x1e
/* 00002A34 4BFFD779 */ bl start_screen_fade
/* 00002A38 3800001E */ li r0, 0x1e
/* 00002A3C 901E001C */ stw r0, 0x1c(r30)
/* 00002A40 38000004 */ li r0, 4
/* 00002A44 901E0010 */ stw r0, 0x10(r30)
/* 00002A48 48000218 */ b lbl_00002C60
lbl_00002A4C:
/* 00002A4C 801E001C */ lwz r0, 0x1c(r30)
/* 00002A50 2C000000 */ cmpwi r0, 0
/* 00002A54 4181020C */ bgt lbl_00002C60
/* 00002A58 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002A5C 380000C0 */ li r0, 0xc0
/* 00002A60 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002A64 480001FC */ b lbl_00002C60
lbl_00002A68:
/* 00002A68 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00002A6C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00002A70 A0030004 */ lhz r0, 4(r3)
/* 00002A74 3BA30004 */ addi r29, r3, 4
/* 00002A78 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00002A7C 41820018 */ beq lbl_00002A94
/* 00002A80 3860006B */ li r3, 0x6b
/* 00002A84 4BFFD729 */ bl u_play_sound_0
/* 00002A88 38000002 */ li r0, 2
/* 00002A8C 901E0010 */ stw r0, 0x10(r30)
/* 00002A90 480001D0 */ b lbl_00002C60
lbl_00002A94:
/* 00002A94 A0830008 */ lhz r4, 8(r3)
/* 00002A98 3B9F0004 */ addi r28, r31, 4
/* 00002A9C 80BF0004 */ lwz r5, 4(r31)
/* 00002AA0 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00002AA4 3B650000 */ addi r27, r5, 0
/* 00002AA8 40820018 */ bne lbl_00002AC0
/* 00002AAC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002AB0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002AB4 A0030008 */ lhz r0, 8(r3)
/* 00002AB8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00002ABC 41820008 */ beq lbl_00002AC4
lbl_00002AC0:
/* 00002AC0 3B600000 */ li r27, 0
lbl_00002AC4:
/* 00002AC4 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00002AC8 40820018 */ bne lbl_00002AE0
/* 00002ACC 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00002AD0 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 00002AD4 A0030008 */ lhz r0, 8(r3)
/* 00002AD8 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00002ADC 41820008 */ beq lbl_00002AE4
lbl_00002AE0:
/* 00002AE0 3B600001 */ li r27, 1
lbl_00002AE4:
/* 00002AE4 7C1B2800 */ cmpw r27, r5
/* 00002AE8 41820010 */ beq lbl_00002AF8
/* 00002AEC 3860006C */ li r3, 0x6c
/* 00002AF0 4BFFD6BD */ bl u_play_sound_0
/* 00002AF4 937C0000 */ stw r27, 0(r28)
lbl_00002AF8:
/* 00002AF8 A01D0000 */ lhz r0, 0(r29)
/* 00002AFC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00002B00 41820160 */ beq lbl_00002C60
/* 00002B04 801C0000 */ lwz r0, 0(r28)
/* 00002B08 2C000001 */ cmpwi r0, 1
/* 00002B0C 40820018 */ bne lbl_00002B24
/* 00002B10 3860006B */ li r3, 0x6b
/* 00002B14 4BFFD699 */ bl u_play_sound_0
/* 00002B18 38000002 */ li r0, 2
/* 00002B1C 901E0010 */ stw r0, 0x10(r30)
/* 00002B20 48000140 */ b lbl_00002C60
lbl_00002B24:
/* 00002B24 3860006A */ li r3, 0x6a
/* 00002B28 4BFFD685 */ bl u_play_sound_0
/* 00002B2C 38600007 */ li r3, 7
/* 00002B30 4BFFD67D */ bl memcard_set_mode
/* 00002B34 387F629C */ addi r3, r31, 0x629c
/* 00002B38 809E0014 */ lwz r4, 0x14(r30)
/* 00002B3C 4BFFD671 */ bl func_8009F4B8
/* 00002B40 38600000 */ li r3, 0
/* 00002B44 4BFFD669 */ bl event_start
/* 00002B48 38000006 */ li r0, 6
/* 00002B4C 901E0010 */ stw r0, 0x10(r30)
/* 00002B50 48000110 */ b lbl_00002C60
lbl_00002B54:
/* 00002B54 4BFFD659 */ bl sub_8009F554
/* 00002B58 2C030000 */ cmpwi r3, 0
/* 00002B5C 40820028 */ bne lbl_00002B84
/* 00002B60 4BFFD64D */ bl memcard_cancel_and_unmount
/* 00002B64 3860006B */ li r3, 0x6b
/* 00002B68 4BFFD645 */ bl u_play_sound_0
/* 00002B6C 38600059 */ li r3, 0x59
/* 00002B70 480016F1 */ bl lbl_00004260
/* 00002B74 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002B78 380000AE */ li r0, 0xae
/* 00002B7C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002B80 480000E0 */ b lbl_00002C60
lbl_00002B84:
/* 00002B84 807E0014 */ lwz r3, 0x14(r30)
/* 00002B88 3880FFFE */ li r4, -2
/* 00002B8C 38000020 */ li r0, 0x20
/* 00002B90 7C660774 */ extsb r6, r3
/* 00002B94 1C660018 */ mulli r3, r6, 0x18
/* 00002B98 7C7F1A14 */ add r3, r31, r3
/* 00002B9C 988362B0 */ stb r4, 0x62b0(r3)
/* 00002BA0 389F001C */ addi r4, r31, 0x1c
/* 00002BA4 98DF003A */ stb r6, 0x3a(r31)
/* 00002BA8 981F003B */ stb r0, 0x3b(r31)
lbl_00002BAC:
/* 00002BAC A8640000 */ lha r3, 0(r4)
/* 00002BB0 7CC00774 */ extsb r0, r6
/* 00002BB4 7C001800 */ cmpw r0, r3
/* 00002BB8 4082000C */ bne lbl_00002BC4
/* 00002BBC 38030001 */ addi r0, r3, 1
/* 00002BC0 B0040000 */ sth r0, 0(r4)
lbl_00002BC4:
/* 00002BC4 38C60001 */ addi r6, r6, 1
/* 00002BC8 7CC00774 */ extsb r0, r6
/* 00002BCC 1C000018 */ mulli r0, r0, 0x18
/* 00002BD0 7C7F0214 */ add r3, r31, r0
/* 00002BD4 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002BD8 7C000774 */ extsb r0, r0
/* 00002BDC 2C00FFFF */ cmpwi r0, -1
/* 00002BE0 4082004C */ bne lbl_00002C2C
/* 00002BE4 3863629C */ addi r3, r3, 0x629c
lbl_00002BE8:
/* 00002BE8 38C6FFFF */ addi r6, r6, -1
/* 00002BEC 7CC00775 */ extsb. r0, r6
/* 00002BF0 3863FFE8 */ addi r3, r3, -24
/* 00002BF4 40800028 */ bge lbl_00002C1C
/* 00002BF8 4BFFD5B5 */ bl memcard_cancel_and_unmount
/* 00002BFC 3860006B */ li r3, 0x6b
/* 00002C00 4BFFD5AD */ bl u_play_sound_0
/* 00002C04 38600059 */ li r3, 0x59
/* 00002C08 48001659 */ bl lbl_00004260
/* 00002C0C 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002C10 380000AE */ li r0, 0xae
/* 00002C14 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002C18 48000048 */ b lbl_00002C60
lbl_00002C1C:
/* 00002C1C 88030014 */ lbz r0, 0x14(r3)
/* 00002C20 7C000774 */ extsb r0, r0
/* 00002C24 2C00FFFE */ cmpwi r0, -2
/* 00002C28 4182FFC0 */ beq lbl_00002BE8
lbl_00002C2C:
/* 00002C2C 7CC50774 */ extsb r5, r6
/* 00002C30 1C050018 */ mulli r0, r5, 0x18
/* 00002C34 7C7F0214 */ add r3, r31, r0
/* 00002C38 880362B0 */ lbz r0, 0x62b0(r3)
/* 00002C3C 7C000774 */ extsb r0, r0
/* 00002C40 2C00FFFE */ cmpwi r0, -2
/* 00002C44 4182FF68 */ beq lbl_00002BAC
/* 00002C48 801E0014 */ lwz r0, 0x14(r30)
/* 00002C4C 7C050000 */ cmpw r5, r0
/* 00002C50 41820008 */ beq lbl_00002C58
/* 00002C54 90BE0014 */ stw r5, 0x14(r30)
lbl_00002C58:
/* 00002C58 38000001 */ li r0, 1
/* 00002C5C 901E0010 */ stw r0, 0x10(r30)
lbl_00002C60:
/* 00002C60 BB61000C */ lmw r27, 0xc(r1)
/* 00002C64 80010024 */ lwz r0, 0x24(r1)
/* 00002C68 38210020 */ addi r1, r1, 0x20
/* 00002C6C 7C0803A6 */ mtlr r0
/* 00002C70 4E800020 */ blr 
