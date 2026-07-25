/* 0000077C 7C0802A6 */ mflr r0
/* 00000780 3C600000 */ lis r3, eventInfo@ha
/* 00000784 90010004 */ stw r0, 4(r1)
/* 00000788 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000078C 93E10014 */ stw r31, 0x14(r1)
/* 00000790 93C10010 */ stw r30, 0x10(r1)
/* 00000794 93A1000C */ stw r29, 0xc(r1)
/* 00000798 93810008 */ stw r28, 8(r1)
/* 0000079C 88030000 */ lbz r0, eventInfo@l(r3)
/* 000007A0 3C600000 */ lis r3, lbl_10000000@ha
/* 000007A4 3BE30000 */ addi r31, r3, lbl_10000000@l
/* 000007A8 2C000002 */ cmpwi r0, 2
/* 000007AC 41820314 */ beq lbl_00000AC0
/* 000007B0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000007B4 839F0130 */ lwz r28, 0x130(r31)
/* 000007B8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000007BC A0830008 */ lhz r4, 8(r3)
/* 000007C0 3BA30008 */ addi r29, r3, 8
/* 000007C4 3BDF0130 */ addi r30, r31, 0x130
/* 000007C8 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 000007CC 38BC0000 */ addi r5, r28, 0
/* 000007D0 40820018 */ bne lbl_000007E8
/* 000007D4 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000007D8 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000007DC A0630008 */ lhz r3, 8(r3)
/* 000007E0 54600739 */ rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 000007E4 4182001C */ beq lbl_00000800
lbl_000007E8:
/* 000007E8 2C1C0003 */ cmpwi r28, 3
/* 000007EC 4181003C */ bgt lbl_00000828
/* 000007F0 379CFFFF */ addic. r28, r28, -1
/* 000007F4 40800034 */ bge lbl_00000828
/* 000007F8 3B800003 */ li r28, 3
/* 000007FC 4800002C */ b lbl_00000828
lbl_00000800:
/* 00000800 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 00000804 4082000C */ bne lbl_00000810
/* 00000808 5460077B */ rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 0000080C 4182001C */ beq lbl_00000828
lbl_00000810:
/* 00000810 2C1C0003 */ cmpwi r28, 3
/* 00000814 41810014 */ bgt lbl_00000828
/* 00000818 3B9C0001 */ addi r28, r28, 1
/* 0000081C 2C1C0003 */ cmpwi r28, 3
/* 00000820 40810008 */ ble lbl_00000828
/* 00000824 3B800000 */ li r28, 0
lbl_00000828:
/* 00000828 7C1C2800 */ cmpw r28, r5
/* 0000082C 41820010 */ beq lbl_0000083C
/* 00000830 3860006C */ li r3, 0x6c
/* 00000834 4BFFF979 */ bl u_play_sound_0
/* 00000838 939E0000 */ stw r28, 0(r30)
lbl_0000083C:
/* 0000083C 801E0000 */ lwz r0, 0(r30)
/* 00000840 2C000004 */ cmpwi r0, 4
/* 00000844 40800044 */ bge lbl_00000888
/* 00000848 2C000000 */ cmpwi r0, 0
/* 0000084C 40800008 */ bge lbl_00000854
/* 00000850 48000038 */ b lbl_00000888
lbl_00000854:
/* 00000854 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000858 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000085C A0030004 */ lhz r0, 4(r3)
/* 00000860 540005AD */ rlwinm. r0, r0, 0, 0x16, 0x16
/* 00000864 41820024 */ beq lbl_00000888
/* 00000868 3860006B */ li r3, 0x6b
/* 0000086C 4BFFF941 */ bl u_play_sound_0
/* 00000870 3860005F */ li r3, 0x5f
/* 00000874 480039ED */ bl lbl_00004260
/* 00000878 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000087C 380000AE */ li r0, 0xae
/* 00000880 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00000884 4800023C */ b lbl_00000AC0
lbl_00000888:
/* 00000888 2C1C0003 */ cmpwi r28, 3
/* 0000088C 4182011C */ beq lbl_000009A8
/* 00000890 4080001C */ bge lbl_000008AC
/* 00000894 2C1C0001 */ cmpwi r28, 1
/* 00000898 41820064 */ beq lbl_000008FC
/* 0000089C 408000A0 */ bge lbl_0000093C
/* 000008A0 2C1C0000 */ cmpwi r28, 0
/* 000008A4 40800018 */ bge lbl_000008BC
/* 000008A8 48000218 */ b lbl_00000AC0
lbl_000008AC:
/* 000008AC 2C1C0005 */ cmpwi r28, 5
/* 000008B0 418201EC */ beq lbl_00000A9C
/* 000008B4 4080020C */ bge lbl_00000AC0
/* 000008B8 48000120 */ b lbl_000009D8
lbl_000008BC:
/* 000008BC 38000000 */ li r0, 0
/* 000008C0 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000008C4 901F0134 */ stw r0, 0x134(r31)
/* 000008C8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000008CC A0030004 */ lhz r0, 4(r3)
/* 000008D0 3BDF0134 */ addi r30, r31, 0x134
/* 000008D4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000008D8 418201E8 */ beq lbl_00000AC0
/* 000008DC 3860006A */ li r3, 0x6a
/* 000008E0 4BFFF8CD */ bl u_play_sound_0
/* 000008E4 801E0000 */ lwz r0, 0(r30)
/* 000008E8 5403063E */ clrlwi r3, r0, 0x18
/* 000008EC 4BFFF8C1 */ bl memcard_set_mode
/* 000008F0 38600000 */ li r3, 0
/* 000008F4 4BFFF8B9 */ bl event_start
/* 000008F8 480001C8 */ b lbl_00000AC0
lbl_000008FC:
/* 000008FC 38000001 */ li r0, 1
/* 00000900 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000904 901F0134 */ stw r0, 0x134(r31)
/* 00000908 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000090C A0030004 */ lhz r0, 4(r3)
/* 00000910 3BDF0134 */ addi r30, r31, 0x134
/* 00000914 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00000918 418201A8 */ beq lbl_00000AC0
/* 0000091C 3860006A */ li r3, 0x6a
/* 00000920 4BFFF88D */ bl u_play_sound_0
/* 00000924 801E0000 */ lwz r0, 0(r30)
/* 00000928 5403063E */ clrlwi r3, r0, 0x18
/* 0000092C 4BFFF881 */ bl memcard_set_mode
/* 00000930 38600000 */ li r3, 0
/* 00000934 4BFFF879 */ bl event_start
/* 00000938 48000188 */ b lbl_00000AC0
lbl_0000093C:
/* 0000093C 4BFFF871 */ bl func_8009F4C4
/* 00000940 A09D0000 */ lhz r4, 0(r29)
/* 00000944 547D063E */ clrlwi r29, r3, 0x18
/* 00000948 38BD0000 */ addi r5, r29, 0
/* 0000094C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00000950 40820028 */ bne lbl_00000978
/* 00000954 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 00000958 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 0000095C A0630008 */ lhz r3, 8(r3)
/* 00000960 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000964 40820014 */ bne lbl_00000978
/* 00000968 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 0000096C 4082000C */ bne lbl_00000978
/* 00000970 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000974 41820018 */ beq lbl_0000098C
lbl_00000978:
/* 00000978 2C1D0001 */ cmpwi r29, 1
/* 0000097C 4082000C */ bne lbl_00000988
/* 00000980 3BA00000 */ li r29, 0
/* 00000984 48000008 */ b lbl_0000098C
lbl_00000988:
/* 00000988 3BA00001 */ li r29, 1
lbl_0000098C:
/* 0000098C 7C05E800 */ cmpw r5, r29
/* 00000990 41820130 */ beq lbl_00000AC0
/* 00000994 38600065 */ li r3, 0x65
/* 00000998 4BFFF815 */ bl u_play_sound_0
/* 0000099C 57A3063E */ clrlwi r3, r29, 0x18
/* 000009A0 4BFFF80D */ bl func_8009F4CC
/* 000009A4 4800011C */ b lbl_00000AC0
lbl_000009A8:
/* 000009A8 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 000009AC 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 000009B0 A0030004 */ lhz r0, 4(r3)
/* 000009B4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 000009B8 41820108 */ beq lbl_00000AC0
/* 000009BC 3860006A */ li r3, 0x6a
/* 000009C0 4BFFF7ED */ bl u_play_sound_0
/* 000009C4 38000004 */ li r0, 4
/* 000009C8 901E0000 */ stw r0, 0(r30)
/* 000009CC 38000000 */ li r0, 0
/* 000009D0 901F0138 */ stw r0, 0x138(r31)
/* 000009D4 480000EC */ b lbl_00000AC0
lbl_000009D8:
/* 000009D8 A09D0000 */ lhz r4, 0(r29)
/* 000009DC 3BBF0138 */ addi r29, r31, 0x138
/* 000009E0 80BF0138 */ lwz r5, 0x138(r31)
/* 000009E4 548007BD */ rlwinm. r0, r4, 0, 0x1e, 0x1e
/* 000009E8 3BE50000 */ addi r31, r5, 0
/* 000009EC 40820018 */ bne lbl_00000A04
/* 000009F0 3C600000 */ lis r3, g_currPlayerAnalogButtons@ha
/* 000009F4 38630000 */ addi r3, r3, g_currPlayerAnalogButtons@l
/* 000009F8 A0630008 */ lhz r3, 8(r3)
/* 000009FC 546007BD */ rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 00000A00 4182000C */ beq lbl_00000A0C
lbl_00000A04:
/* 00000A04 3BE00000 */ li r31, 0
/* 00000A08 48000018 */ b lbl_00000A20
lbl_00000A0C:
/* 00000A0C 548007FF */ clrlwi. r0, r4, 0x1f
/* 00000A10 4082000C */ bne lbl_00000A1C
/* 00000A14 546007FF */ clrlwi. r0, r3, 0x1f
/* 00000A18 41820008 */ beq lbl_00000A20
lbl_00000A1C:
/* 00000A1C 3BE00001 */ li r31, 1
lbl_00000A20:
/* 00000A20 7C1F2800 */ cmpw r31, r5
/* 00000A24 41820010 */ beq lbl_00000A34
/* 00000A28 3860006C */ li r3, 0x6c
/* 00000A2C 4BFFF781 */ bl u_play_sound_0
/* 00000A30 93FD0000 */ stw r31, 0(r29)
lbl_00000A34:
/* 00000A34 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000A38 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000A3C A0630004 */ lhz r3, 4(r3)
/* 00000A40 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00000A44 4182003C */ beq lbl_00000A80
/* 00000A48 801D0000 */ lwz r0, 0(r29)
/* 00000A4C 2C000001 */ cmpwi r0, 1
/* 00000A50 4082001C */ bne lbl_00000A6C
/* 00000A54 3860006A */ li r3, 0x6a
/* 00000A58 4BFFF755 */ bl u_play_sound_0
/* 00000A5C 4BFFF751 */ bl func_800A4DF0
/* 00000A60 38000005 */ li r0, 5
/* 00000A64 901E0000 */ stw r0, 0(r30)
/* 00000A68 48000058 */ b lbl_00000AC0
lbl_00000A6C:
/* 00000A6C 3860006B */ li r3, 0x6b
/* 00000A70 4BFFF73D */ bl u_play_sound_0
/* 00000A74 38000003 */ li r0, 3
/* 00000A78 901E0000 */ stw r0, 0(r30)
/* 00000A7C 48000044 */ b lbl_00000AC0
lbl_00000A80:
/* 00000A80 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00000A84 4182003C */ beq lbl_00000AC0
/* 00000A88 3860006B */ li r3, 0x6b
/* 00000A8C 4BFFF721 */ bl u_play_sound_0
/* 00000A90 38000003 */ li r0, 3
/* 00000A94 901E0000 */ stw r0, 0(r30)
/* 00000A98 48000028 */ b lbl_00000AC0
lbl_00000A9C:
/* 00000A9C 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 00000AA0 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 00000AA4 A0030004 */ lhz r0, 4(r3)
/* 00000AA8 28000000 */ cmplwi r0, 0
/* 00000AAC 41820014 */ beq lbl_00000AC0
/* 00000AB0 3860006B */ li r3, 0x6b
/* 00000AB4 4BFFF6F9 */ bl u_play_sound_0
/* 00000AB8 38000003 */ li r0, 3
/* 00000ABC 901E0000 */ stw r0, 0(r30)
lbl_00000AC0:
/* 00000AC0 8001001C */ lwz r0, 0x1c(r1)
/* 00000AC4 83E10014 */ lwz r31, 0x14(r1)
/* 00000AC8 83C10010 */ lwz r30, 0x10(r1)
/* 00000ACC 7C0803A6 */ mtlr r0
/* 00000AD0 83A1000C */ lwz r29, 0xc(r1)
/* 00000AD4 83810008 */ lwz r28, 8(r1)
/* 00000AD8 38210018 */ addi r1, r1, 0x18
/* 00000ADC 4E800020 */ blr 
