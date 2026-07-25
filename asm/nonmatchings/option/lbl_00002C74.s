/* 00002C74 7C0802A6 */ mflr r0
/* 00002C78 38600003 */ li r3, 3
/* 00002C7C 90010004 */ stw r0, 4(r1)
/* 00002C80 9421FFF0 */ stwu r1, -0x10(r1)
/* 00002C84 93E1000C */ stw r31, 0xc(r1)
/* 00002C88 4BFFD525 */ bl memcard_set_mode
/* 00002C8C 38600000 */ li r3, 0
/* 00002C90 4BFFD51D */ bl event_start
/* 00002C94 3C600000 */ lis r3, modeCtrl@ha
/* 00002C98 3BE30000 */ addi r31, r3, modeCtrl@l
/* 00002C9C 38000064 */ li r0, 0x64
/* 00002CA0 901F0000 */ stw r0, 0(r31)
/* 00002CA4 38600101 */ li r3, 0x101
/* 00002CA8 38800000 */ li r4, 0
/* 00002CAC 80BF0000 */ lwz r5, 0(r31)
/* 00002CB0 4BFFD4FD */ bl start_screen_fade
/* 00002CB4 807F0000 */ lwz r3, 0(r31)
/* 00002CB8 38800002 */ li r4, 2
/* 00002CBC 4BFFD4F1 */ bl u_play_music
/* 00002CC0 801F0008 */ lwz r0, 8(r31)
/* 00002CC4 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002CC8 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00002CCC 901F0008 */ stw r0, 8(r31)
/* 00002CD0 380000BB */ li r0, 0xbb
/* 00002CD4 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002CD8 80010014 */ lwz r0, 0x14(r1)
/* 00002CDC 83E1000C */ lwz r31, 0xc(r1)
/* 00002CE0 38210010 */ addi r1, r1, 0x10
/* 00002CE4 7C0803A6 */ mtlr r0
/* 00002CE8 4E800020 */ blr 
