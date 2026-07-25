/* 000003B4 7C0802A6 */ mflr r0
/* 000003B8 90010004 */ stw r0, 4(r1)
/* 000003BC 9421FFF0 */ stwu r1, -0x10(r1)
/* 000003C0 93E1000C */ stw r31, 0xc(r1)
/* 000003C4 4BFFFD89 */ bl event_finish_all
/* 000003C8 3C800000 */ lis r4, stageHeap@ha
/* 000003CC 3C600000 */ lis r3, lbl_1000003C@ha
/* 000003D0 3BE40000 */ addi r31, r4, stageHeap@l
/* 000003D4 38830000 */ addi r4, r3, lbl_1000003C@l
/* 000003D8 807F0000 */ lwz r3, 0(r31)
/* 000003DC 80840000 */ lwz r4, 0(r4)
/* 000003E0 4BFFFD6D */ bl OSFreeToHeap
/* 000003E4 3C800000 */ lis r4, lbl_10000038@ha
/* 000003E8 807F0000 */ lwz r3, 0(r31)
/* 000003EC 38840000 */ addi r4, r4, lbl_10000038@l
/* 000003F0 80840000 */ lwz r4, 0(r4)
/* 000003F4 4BFFFD59 */ bl OSFreeToHeap
/* 000003F8 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 000003FC 3BE30000 */ addi r31, r3, lbl_802F1FD0@l
/* 00000400 801F0000 */ lwz r0, 0(r31)
/* 00000404 5400077B */ rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 00000408 41820014 */ beq lbl_0000041C
/* 0000040C 4BFFFD41 */ bl mini_commend_free_data
/* 00000410 801F0000 */ lwz r0, 0(r31)
/* 00000414 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 00000418 901F0000 */ stw r0, 0(r31)
lbl_0000041C:
/* 0000041C 48000251 */ bl lbl_0000066C
/* 00000420 3860000B */ li r3, 0xb
/* 00000424 4BFFFD29 */ bl bitmap_free_group
/* 00000428 4BFFFD25 */ bl SoundGroupFree
/* 0000042C 3C600000 */ lis r3, lbl_802F1FD0@ha
/* 00000430 38000000 */ li r0, 0
/* 00000434 90030000 */ stw r0, lbl_802F1FD0@l(r3)
/* 00000438 80010014 */ lwz r0, 0x14(r1)
/* 0000043C 83E1000C */ lwz r31, 0xc(r1)
/* 00000440 38210010 */ addi r1, r1, 0x10
/* 00000444 7C0803A6 */ mtlr r0
/* 00000448 4E800020 */ blr 
