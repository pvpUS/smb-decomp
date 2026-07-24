/* 00001888 7C0802A6 */ mflr r0
/* 0000188C 90010004 */ stw r0, 4(r1)
/* 00001890 9421FFF0 */ stwu r1, -0x10(r1)
/* 00001894 93E1000C */ stw r31, 0xc(r1)
/* 00001898 93C10008 */ stw r30, 8(r1)
/* 0000189C 4BFFE8C5 */ bl u_clear_buffers_2_and_5
/* 000018A0 4BFFE8C1 */ bl event_finish_all
/* 000018A4 3C600000 */ lis r3, polyDisp@ha
/* 000018A8 84030000 */ lwzu r0, polyDisp@l(r3)
/* 000018AC 540006F2 */ rlwinm r0, r0, 0, 0x1b, 0x19
/* 000018B0 90030000 */ stw r0, 0(r3)
/* 000018B4 4BFFE8AD */ bl u_free_minigame_graphics
/* 000018B8 38600006 */ li r3, 6
/* 000018BC 4BFFE8A5 */ bl bitmap_free_group
/* 000018C0 4BFFE8A1 */ bl SoundGroupFree
/* 000018C4 3C600000 */ lis r3, apeThreadNo@ha
/* 000018C8 38630000 */ addi r3, r3, apeThreadNo@l
/* 000018CC 3BE3003C */ addi r31, r3, 0x3c
/* 000018D0 3BC0000F */ li r30, 0xf
lbl_000018D4:
/* 000018D4 807F0000 */ lwz r3, 0(r31)
/* 000018D8 2C03FFFF */ cmpwi r3, -1
/* 000018DC 41820008 */ beq lbl_000018E4
/* 000018E0 4BFFE881 */ bl thread_kill
lbl_000018E4:
/* 000018E4 37DEFFFF */ addic. r30, r30, -1
/* 000018E8 3BFFFFFC */ addi r31, r31, -4
/* 000018EC 4080FFE8 */ bge lbl_000018D4
/* 000018F0 80010014 */ lwz r0, 0x14(r1)
/* 000018F4 83E1000C */ lwz r31, 0xc(r1)
/* 000018F8 83C10008 */ lwz r30, 8(r1)
/* 000018FC 7C0803A6 */ mtlr r0
/* 00001900 38210010 */ addi r1, r1, 0x10
/* 00001904 4E800020 */ blr 
