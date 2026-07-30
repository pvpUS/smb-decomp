/* 0000C928 7C0802A6 */ mflr r0
/* 0000C92C 3C600000 */ lis r3, lbl_10017520@ha
/* 0000C930 90010004 */ stw r0, 4(r1)
/* 0000C934 3800000F */ li r0, 0xf
/* 0000C938 3C800003 */ lis r4, 3
/* 0000C93C 9421FF98 */ stwu r1, -0x68(r1)
/* 0000C940 3CA00000 */ lis r5, lbl_0001C238@ha
/* 0000C944 93E10064 */ stw r31, 0x64(r1)
/* 0000C948 3BE50000 */ addi r31, r5, lbl_0001C238@l
/* 0000C94C 38A0001E */ li r5, 0x1e
/* 0000C950 93C10060 */ stw r30, 0x60(r1)
/* 0000C954 3BC30000 */ addi r30, r3, lbl_10017520@l
/* 0000C958 3C600000 */ lis r3, modeCtrl@ha
/* 0000C95C 93A1005C */ stw r29, 0x5c(r1)
/* 0000C960 B01E0146 */ sth r0, 0x146(r30)
/* 0000C964 38044BC0 */ addi r0, r4, 0x4bc0
/* 0000C968 38800000 */ li r4, 0
/* 0000C96C 90030000 */ stw r0, modeCtrl@l(r3)
/* 0000C970 38600100 */ li r3, 0x100
/* 0000C974 4BFF37F1 */ bl start_screen_fade
/* 0000C978 4BFF37ED */ bl event_finish_all
/* 0000C97C 4BFF37E9 */ bl func_80044920
/* 0000C980 3C600000 */ lis r3, currStageId@ha
/* 0000C984 3BA30000 */ addi r29, r3, currStageId@l
/* 0000C988 A87D0000 */ lha r3, 0(r29)
/* 0000C98C 4BFF37D9 */ bl load_stage
/* 0000C990 38600001 */ li r3, 1
/* 0000C994 4BFF37D1 */ bl event_start
/* 0000C998 38600004 */ li r3, 4
/* 0000C99C 4BFF37C9 */ bl event_start
/* 0000C9A0 38600005 */ li r3, 5
/* 0000C9A4 4BFF37C1 */ bl event_start
/* 0000C9A8 3860000F */ li r3, 0xf
/* 0000C9AC 4BFF37B9 */ bl event_start
/* 0000C9B0 38600010 */ li r3, 0x10
/* 0000C9B4 4BFF37B1 */ bl event_start
/* 0000C9B8 38600012 */ li r3, 0x12
/* 0000C9BC 4BFF37A9 */ bl event_start
/* 0000C9C0 3860000D */ li r3, 0xd
/* 0000C9C4 4BFF37A1 */ bl event_start
/* 0000C9C8 38600014 */ li r3, 0x14
/* 0000C9CC 4BFF3799 */ bl event_start
/* 0000C9D0 38600013 */ li r3, 0x13
/* 0000C9D4 4BFF3791 */ bl event_start
/* 0000C9D8 38600009 */ li r3, 9
/* 0000C9DC 4BFF3789 */ bl event_start
/* 0000C9E0 3860000B */ li r3, 0xb
/* 0000C9E4 4BFF3781 */ bl event_start
/* 0000C9E8 A87D0000 */ lha r3, 0(r29)
/* 0000C9EC 4BFF3779 */ bl light_init
/* 0000C9F0 4BFF3775 */ bl rend_efc_mirror_enable
/* 0000C9F4 3C600000 */ lis r3, g_poolInfo@ha
/* 0000C9F8 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000C9FC 389E014C */ addi r4, r30, 0x14c
/* 0000CA00 38A10028 */ addi r5, r1, 0x28
/* 0000CA04 3BA30008 */ addi r29, r3, 8
/* 0000CA08 38600000 */ li r3, 0
/* 0000CA0C 4800001C */ b lbl_0000CA28
lbl_0000CA10:
/* 0000CA10 A8040004 */ lha r0, 4(r4)
/* 0000CA14 38840018 */ addi r4, r4, 0x18
/* 0000CA18 90050000 */ stw r0, 0(r5)
/* 0000CA1C 90650004 */ stw r3, 4(r5)
/* 0000CA20 38630001 */ addi r3, r3, 1
/* 0000CA24 38A50008 */ addi r5, r5, 8
lbl_0000CA28:
/* 0000CA28 801D0000 */ lwz r0, 0(r29)
/* 0000CA2C 7C030000 */ cmpw r3, r0
/* 0000CA30 4180FFE0 */ blt lbl_0000CA10
/* 0000CA34 38A00000 */ li r5, 0
/* 0000CA38 4800006C */ b lbl_0000CAA4
lbl_0000CA3C:
/* 0000CA3C 38810028 */ addi r4, r1, 0x28
/* 0000CA40 38C00000 */ li r6, 0
/* 0000CA44 48000048 */ b lbl_0000CA8C
lbl_0000CA48:
/* 0000CA48 80640008 */ lwz r3, 8(r4)
/* 0000CA4C 80040000 */ lwz r0, 0(r4)
/* 0000CA50 7C030000 */ cmpw r3, r0
/* 0000CA54 40810030 */ ble lbl_0000CA84
/* 0000CA58 8004000C */ lwz r0, 0xc(r4)
/* 0000CA5C 90610020 */ stw r3, 0x20(r1)
/* 0000CA60 90010024 */ stw r0, 0x24(r1)
/* 0000CA64 80640000 */ lwz r3, 0(r4)
/* 0000CA68 80040004 */ lwz r0, 4(r4)
/* 0000CA6C 90640008 */ stw r3, 8(r4)
/* 0000CA70 9004000C */ stw r0, 0xc(r4)
/* 0000CA74 80610020 */ lwz r3, 0x20(r1)
/* 0000CA78 80010024 */ lwz r0, 0x24(r1)
/* 0000CA7C 90640000 */ stw r3, 0(r4)
/* 0000CA80 90040004 */ stw r0, 4(r4)
lbl_0000CA84:
/* 0000CA84 38C60001 */ addi r6, r6, 1
/* 0000CA88 38840008 */ addi r4, r4, 8
lbl_0000CA8C:
/* 0000CA8C 807D0000 */ lwz r3, 0(r29)
/* 0000CA90 3803FFFF */ addi r0, r3, -1
/* 0000CA94 7C050050 */ subf r0, r5, r0
/* 0000CA98 7C060000 */ cmpw r6, r0
/* 0000CA9C 4180FFAC */ blt lbl_0000CA48
/* 0000CAA0 38A50001 */ addi r5, r5, 1
lbl_0000CAA4:
/* 0000CAA4 807D0000 */ lwz r3, 0(r29)
/* 0000CAA8 3803FFFF */ addi r0, r3, -1
/* 0000CAAC 7C050000 */ cmpw r5, r0
/* 0000CAB0 4180FF8C */ blt lbl_0000CA3C
/* 0000CAB4 38600046 */ li r3, 0x46
/* 0000CAB8 4BFF36AD */ bl camera_set_state_all
/* 0000CABC 38C0FFFF */ li r6, -1
/* 0000CAC0 80010028 */ lwz r0, 0x28(r1)
/* 0000CAC4 98C10050 */ stb r6, 0x50(r1)
/* 0000CAC8 3C600000 */ lis r3, g_poolInfo@ha
/* 0000CACC 3C800000 */ lis r4, playerCharacterSelection@ha
/* 0000CAD0 98C10051 */ stb r6, 0x51(r1)
/* 0000CAD4 38A30000 */ addi r5, r3, g_poolInfo@l
/* 0000CAD8 38610028 */ addi r3, r1, 0x28
/* 0000CADC 98C10052 */ stb r6, 0x52(r1)
/* 0000CAE0 38E40000 */ addi r7, r4, playerCharacterSelection@l
/* 0000CAE4 39010050 */ addi r8, r1, 0x50
/* 0000CAE8 98C10053 */ stb r6, 0x53(r1)
/* 0000CAEC 38C1004C */ addi r6, r1, 0x4c
/* 0000CAF0 38800000 */ li r4, 0
/* 0000CAF4 813D0000 */ lwz r9, 0(r29)
/* 0000CAF8 8145000C */ lwz r10, 0xc(r5)
/* 0000CAFC 2C090000 */ cmpwi r9, 0
/* 0000CB00 7D2903A6 */ mtctr r9
/* 0000CB04 40810098 */ ble lbl_0000CB9C
lbl_0000CB08:
/* 0000CB08 81830004 */ lwz r12, 4(r3)
/* 0000CB0C 1D2C0018 */ mulli r9, r12, 0x18
/* 0000CB10 7CAA60AE */ lbzx r5, r10, r12
/* 0000CB14 7D3E4A14 */ add r9, r30, r9
/* 0000CB18 7CA50775 */ extsb. r5, r5
/* 0000CB1C 3969014C */ addi r11, r9, 0x14c
/* 0000CB20 40820010 */ bne lbl_0000CB30
/* 0000CB24 38A0FFFF */ li r5, -1
/* 0000CB28 7CA861AE */ stbx r5, r8, r12
/* 0000CB2C 48000068 */ b lbl_0000CB94
lbl_0000CB30:
/* 0000CB30 5585103A */ slwi r5, r12, 2
/* 0000CB34 7CA72A14 */ add r5, r7, r5
/* 0000CB38 80A50000 */ lwz r5, 0(r5)
/* 0000CB3C 39210050 */ addi r9, r1, 0x50
/* 0000CB40 7D296214 */ add r9, r9, r12
/* 0000CB44 7CA50774 */ extsb r5, r5
/* 0000CB48 98A90000 */ stb r5, 0(r9)
/* 0000CB4C A0AB0012 */ lhz r5, 0x12(r11)
/* 0000CB50 54A507FF */ clrlwi. r5, r5, 0x1f
/* 0000CB54 41820010 */ beq lbl_0000CB64
/* 0000CB58 88A90000 */ lbz r5, 0(r9)
/* 0000CB5C 60A50040 */ ori r5, r5, 0x40
/* 0000CB60 98A90000 */ stb r5, 0(r9)
lbl_0000CB64:
/* 0000CB64 80A30000 */ lwz r5, 0(r3)
/* 0000CB68 7C002800 */ cmpw r0, r5
/* 0000CB6C 4182000C */ beq lbl_0000CB78
/* 0000CB70 38050000 */ addi r0, r5, 0
/* 0000CB74 38840001 */ addi r4, r4, 1
lbl_0000CB78:
/* 0000CB78 2C040000 */ cmpwi r4, 0
/* 0000CB7C 40820010 */ bne lbl_0000CB8C
/* 0000CB80 38A00000 */ li r5, 0
/* 0000CB84 7CA661AE */ stbx r5, r6, r12
/* 0000CB88 4800000C */ b lbl_0000CB94
lbl_0000CB8C:
/* 0000CB8C 38A00003 */ li r5, 3
/* 0000CB90 7CA661AE */ stbx r5, r6, r12
lbl_0000CB94:
/* 0000CB94 38630008 */ addi r3, r3, 8
/* 0000CB98 4200FF70 */ bdnz lbl_0000CB08
lbl_0000CB9C:
/* 0000CB9C 3C600000 */ lis r3, stageHeap@ha
/* 0000CBA0 38630000 */ addi r3, r3, stageHeap@l
/* 0000CBA4 80630000 */ lwz r3, 0(r3)
/* 0000CBA8 4BFF35BD */ bl OSSetCurrentHeap
/* 0000CBAC 3BA30000 */ addi r29, r3, 0
/* 0000CBB0 38610050 */ addi r3, r1, 0x50
/* 0000CBB4 3881004C */ addi r4, r1, 0x4c
/* 0000CBB8 4BFF35AD */ bl func_8009C5E4
/* 0000CBBC 7FA3EB78 */ mr r3, r29
/* 0000CBC0 4BFF35A5 */ bl OSSetCurrentHeap
/* 0000CBC4 3C600000 */ lis r3, lbl_10018CFC@ha
/* 0000CBC8 38830000 */ addi r4, r3, lbl_10018CFC@l
/* 0000CBCC 80040000 */ lwz r0, 0(r4)
/* 0000CBD0 3C600000 */ lis r3, currStageId@ha
/* 0000CBD4 3BA30000 */ addi r29, r3, currStageId@l
/* 0000CBD8 60000001 */ ori r0, r0, 1
/* 0000CBDC 90040000 */ stw r0, 0(r4)
/* 0000CBE0 A87D0000 */ lha r3, 0(r29)
/* 0000CBE4 3803FF71 */ addi r0, r3, -143
/* 0000CBE8 5400043E */ clrlwi r0, r0, 0x10
/* 0000CBEC 28000001 */ cmplwi r0, 1
/* 0000CBF0 41810060 */ bgt lbl_0000CC50
/* 0000CBF4 38600001 */ li r3, 1
/* 0000CBF8 38800000 */ li r4, 0
/* 0000CBFC 4BFF3569 */ bl alloc_pool_light
/* 0000CC00 28030000 */ cmplwi r3, 0
/* 0000CC04 4182004C */ beq lbl_0000CC50
/* 0000CC08 A81D0000 */ lha r0, 0(r29)
/* 0000CC0C 2C00008F */ cmpwi r0, 0x8f
/* 0000CC10 40820018 */ bne lbl_0000CC28
/* 0000CC14 38001080 */ li r0, 0x1080
/* 0000CC18 B0030024 */ sth r0, 0x24(r3)
/* 0000CC1C 38005C00 */ li r0, 0x5c00
/* 0000CC20 B0030026 */ sth r0, 0x26(r3)
/* 0000CC24 4800002C */ b lbl_0000CC50
lbl_0000CC28:
/* 0000CC28 2C000090 */ cmpwi r0, 0x90
/* 0000CC2C 40820024 */ bne lbl_0000CC50
/* 0000CC30 38001F00 */ li r0, 0x1f00
/* 0000CC34 B0030024 */ sth r0, 0x24(r3)
/* 0000CC38 38004500 */ li r0, 0x4500
/* 0000CC3C B0030026 */ sth r0, 0x26(r3)
/* 0000CC40 C03F0044 */ lfs f1, 0x44(r31)
/* 0000CC44 C05F0048 */ lfs f2, 0x48(r31)
/* 0000CC48 C07F001C */ lfs f3, 0x1c(r31)
/* 0000CC4C 4BFF3519 */ bl set_bg_ambient
lbl_0000CC50:
/* 0000CC50 3C600000 */ lis r3, backgroundInfo@ha
/* 0000CC54 A8030000 */ lha r0, backgroundInfo@l(r3)
/* 0000CC58 2C000011 */ cmpwi r0, 0x11
/* 0000CC5C 41820030 */ beq lbl_0000CC8C
/* 0000CC60 4080004C */ bge lbl_0000CCAC
/* 0000CC64 2C00000D */ cmpwi r0, 0xd
/* 0000CC68 41820008 */ beq lbl_0000CC70
/* 0000CC6C 48000040 */ b lbl_0000CCAC
lbl_0000CC70:
/* 0000CC70 C03F004C */ lfs f1, 0x4c(r31)
/* 0000CC74 C05F0050 */ lfs f2, 0x50(r31)
/* 0000CC78 C07F0054 */ lfs f3, 0x54(r31)
/* 0000CC7C 4BFF34E9 */ bl mathutil_mtxA_from_translate_xyz
/* 0000CC80 38604000 */ li r3, 0x4000
/* 0000CC84 4BFF34E1 */ bl mathutil_mtxA_rotate_y
/* 0000CC88 48000078 */ b lbl_0000CD00
lbl_0000CC8C:
/* 0000CC8C C03F0058 */ lfs f1, 0x58(r31)
/* 0000CC90 C05F0050 */ lfs f2, 0x50(r31)
/* 0000CC94 C07F0018 */ lfs f3, 0x18(r31)
/* 0000CC98 4BFF34CD */ bl mathutil_mtxA_from_translate_xyz
/* 0000CC9C 3C600001 */ lis r3, 1
/* 0000CCA0 3863C000 */ addi r3, r3, -16384
/* 0000CCA4 4BFF34C1 */ bl mathutil_mtxA_rotate_y
/* 0000CCA8 48000058 */ b lbl_0000CD00
lbl_0000CCAC:
/* 0000CCAC 3C600000 */ lis r3, g_bgLightInfo@ha
/* 0000CCB0 3BA30000 */ addi r29, r3, g_bgLightInfo@l
/* 0000CCB4 A87D0042 */ lha r3, 0x42(r29)
/* 0000CCB8 4BFF34AD */ bl mathutil_mtxA_from_rotate_y
/* 0000CCBC A87D0040 */ lha r3, 0x40(r29)
/* 0000CCC0 4BFF34A5 */ bl mathutil_mtxA_rotate_x
/* 0000CCC4 C03F000C */ lfs f1, 0xc(r31)
/* 0000CCC8 38610014 */ addi r3, r1, 0x14
/* 0000CCCC C07F0040 */ lfs f3, 0x40(r31)
/* 0000CCD0 FC400890 */ fmr f2, f1
/* 0000CCD4 4BFF3491 */ bl mathutil_mtxA_tf_vec_xyz
/* 0000CCD8 C0210014 */ lfs f1, 0x14(r1)
/* 0000CCDC C041001C */ lfs f2, 0x1c(r1)
/* 0000CCE0 4BFF3485 */ bl mathutil_atan2
/* 0000CCE4 3C63FFFF */ addis r3, r3, 0xffff
/* 0000CCE8 38636000 */ addi r3, r3, 0x6000
/* 0000CCEC 4BFF3479 */ bl mathutil_mtxA_from_rotate_y
/* 0000CCF0 C03F000C */ lfs f1, 0xc(r31)
/* 0000CCF4 C05F005C */ lfs f2, 0x5c(r31)
/* 0000CCF8 C07F0040 */ lfs f3, 0x40(r31)
/* 0000CCFC 4BFF3469 */ bl mathutil_mtxA_translate_xyz
lbl_0000CD00:
/* 0000CD00 3C600000 */ lis r3, mathutilData@ha
/* 0000CD04 38630000 */ addi r3, r3, mathutilData@l
/* 0000CD08 80630000 */ lwz r3, 0(r3)
/* 0000CD0C 4BFF3459 */ bl func_8009DB40
/* 0000CD10 4800B53D */ bl lbl_0001824C
/* 0000CD14 8001006C */ lwz r0, 0x6c(r1)
/* 0000CD18 83E10064 */ lwz r31, 0x64(r1)
/* 0000CD1C 83C10060 */ lwz r30, 0x60(r1)
/* 0000CD20 7C0803A6 */ mtlr r0
/* 0000CD24 83A1005C */ lwz r29, 0x5c(r1)
/* 0000CD28 38210068 */ addi r1, r1, 0x68
/* 0000CD2C 4E800020 */ blr 
