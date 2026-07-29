/* 00000270 7C0802A6 */ mflr r0
/* 00000274 3C600000 */ lis r3, lbl_802F2130@ha
/* 00000278 90010004 */ stw r0, 4(r1)
/* 0000027C 9421FFF0 */ stwu r1, -0x10(r1)
/* 00000280 93E1000C */ stw r31, 0xc(r1)
/* 00000284 3BE00000 */ li r31, 0
/* 00000288 93E30000 */ stw r31, lbl_802F2130@l(r3)
/* 0000028C 4BFFFED1 */ bl reset_camera_viewport
/* 00000290 4800B1BD */ bl lbl_0000B44C
/* 00000294 4800BD0D */ bl lbl_0000BFA0
/* 00000298 48009229 */ bl lbl_000094C0
/* 0000029C 48001E6D */ bl lbl_00002108
/* 000002A0 480024C1 */ bl lbl_00002760
/* 000002A4 38600000 */ li r3, 0
/* 000002A8 38800000 */ li r4, 0
/* 000002AC 38A00001 */ li r5, 1
/* 000002B0 4BFFFEAD */ bl start_screen_fade
/* 000002B4 3860FFFF */ li r3, -1
/* 000002B8 38800001 */ li r4, 1
/* 000002BC 4BFFFEA1 */ bl u_play_music
/* 000002C0 3860000E */ li r3, 0xe
/* 000002C4 4BFFFE99 */ bl bitmap_free_group
/* 000002C8 4BFFFE95 */ bl func_800249D4
/* 000002CC 4BFFFE91 */ bl unload_stage
/* 000002D0 4BFFFE8D */ bl event_finish_all
/* 000002D4 38600000 */ li r3, 0
/* 000002D8 4BFFFE85 */ bl light_init
/* 000002DC 3C600000 */ lis r3, lbl_10000000@ha
/* 000002E0 38830000 */ addi r4, r3, lbl_10000000@l
/* 000002E4 93E40000 */ stw r31, 0(r4)
/* 000002E8 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 000002EC 38000060 */ li r0, 0x60
/* 000002F0 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 000002F4 80010014 */ lwz r0, 0x14(r1)
/* 000002F8 83E1000C */ lwz r31, 0xc(r1)
/* 000002FC 38210010 */ addi r1, r1, 0x10
/* 00000300 7C0803A6 */ mtlr r0
/* 00000304 4E800020 */ blr 
