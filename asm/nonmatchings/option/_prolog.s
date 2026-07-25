/* 000000C8 7C0802A6 */ mflr r0
/* 000000CC 3C600000 */ lis r3, lbl_802F2130@ha
/* 000000D0 90010004 */ stw r0, 4(r1)
/* 000000D4 38000001 */ li r0, 1
/* 000000D8 9421FFF8 */ stwu r1, -8(r1)
/* 000000DC 90030000 */ stw r0, lbl_802F2130@l(r3)
/* 000000E0 480000CD */ bl u_clear_buffers_2_and_5
/* 000000E4 480000C9 */ bl free_all_bitmap_groups_except_com
/* 000000E8 480000C5 */ bl func_800249D4
/* 000000EC 480000C1 */ bl unload_stage
/* 000000F0 38600000 */ li r3, 0
/* 000000F4 480000B9 */ bl light_init
/* 000000F8 480000B5 */ bl event_finish_all
/* 000000FC 38600010 */ li r3, 0x10
/* 00000100 480000AD */ bl event_start
/* 00000104 38600012 */ li r3, 0x12
/* 00000108 480000A5 */ bl event_start
/* 0000010C 38600004 */ li r3, 4
/* 00000110 4800009D */ bl call_bitmap_load_group
/* 00000114 480046BD */ bl lbl_000047D0
/* 00000118 38600100 */ li r3, 0x100
/* 0000011C 38800000 */ li r4, 0
/* 00000120 38A0001E */ li r5, 0x1e
/* 00000124 48000089 */ bl start_screen_fade
/* 00000128 3CE00000 */ lis r7, lbl_00000258@ha
/* 0000012C 3CC00000 */ lis r6, lbl_802F1B74@ha
/* 00000130 38070000 */ addi r0, r7, lbl_00000258@l
/* 00000134 3CA00000 */ lis r5, lbl_00003F10@ha
/* 00000138 90060000 */ stw r0, lbl_802F1B74@l(r6)
/* 0000013C 3C600000 */ lis r3, lbl_0000C6A8@ha
/* 00000140 3C800000 */ lis r4, lbl_802F1B70@ha
/* 00000144 38050000 */ addi r0, r5, lbl_00003F10@l
/* 00000148 90040000 */ stw r0, lbl_802F1B70@l(r4)
/* 0000014C 38630000 */ addi r3, r3, lbl_0000C6A8@l
/* 00000150 4800005D */ bl puts
/* 00000154 8001000C */ lwz r0, 0xc(r1)
/* 00000158 38210008 */ addi r1, r1, 8
/* 0000015C 7C0803A6 */ mtlr r0
/* 00000160 4E800020 */ blr 
