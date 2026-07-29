/* 00002684 7C0802A6 */ mflr r0
/* 00002688 3C600000 */ lis r3, lbl_10000000@ha
/* 0000268C 90010004 */ stw r0, 4(r1)
/* 00002690 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002694 93E10014 */ stw r31, 0x14(r1)
/* 00002698 3BE00000 */ li r31, 0
/* 0000269C 93C10010 */ stw r30, 0x10(r1)
/* 000026A0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000026A4 93A1000C */ stw r29, 0xc(r1)
/* 000026A8 3BBE0078 */ addi r29, r30, 0x78
/* 000026AC 93810008 */ stw r28, 8(r1)
/* 000026B0 3B9E0070 */ addi r28, r30, 0x70
/* 000026B4 93FE006C */ stw r31, 0x6c(r30)
/* 000026B8 93FE0070 */ stw r31, 0x70(r30)
/* 000026BC 807E0078 */ lwz r3, 0x78(r30)
/* 000026C0 28030000 */ cmplwi r3, 0
/* 000026C4 4182000C */ beq lbl_000026D0
/* 000026C8 4BFFDA95 */ bl bitmap_free_tpl
/* 000026CC 93FD0000 */ stw r31, 0(r29)
lbl_000026D0:
/* 000026D0 3BDE0074 */ addi r30, r30, 0x74
/* 000026D4 809E0000 */ lwz r4, 0(r30)
/* 000026D8 28040000 */ cmplwi r4, 0
/* 000026DC 4182001C */ beq lbl_000026F8
/* 000026E0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000026E4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000026E8 80630000 */ lwz r3, 0(r3)
/* 000026EC 4BFFDA71 */ bl OSFreeToHeap
/* 000026F0 38000000 */ li r0, 0
/* 000026F4 901E0000 */ stw r0, 0(r30)
lbl_000026F8:
/* 000026F8 809C0000 */ lwz r4, 0(r28)
/* 000026FC 3C600000 */ lis r3, lbl_00012330@ha
/* 00002700 38030000 */ addi r0, r3, lbl_00012330@l
/* 00002704 1C64000C */ mulli r3, r4, 0xc
/* 00002708 7C801A14 */ add r4, r0, r3
/* 0000270C 80A40004 */ lwz r5, 4(r4)
/* 00002710 7FC3F378 */ mr r3, r30
/* 00002714 80C40008 */ lwz r6, 8(r4)
/* 00002718 7FA4EB78 */ mr r4, r29
/* 0000271C 4BFFDA41 */ bl nlObjModelListLoad
/* 00002720 4BFFDA3D */ bl event_finish_all
/* 00002724 3860000F */ li r3, 0xf
/* 00002728 4BFFDA35 */ bl event_start
/* 0000272C 38600002 */ li r3, 2
/* 00002730 4BFFDA2D */ bl camera_set_state_all
/* 00002734 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002738 38000070 */ li r0, 0x70
/* 0000273C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002740 8001001C */ lwz r0, 0x1c(r1)
/* 00002744 83E10014 */ lwz r31, 0x14(r1)
/* 00002748 83C10010 */ lwz r30, 0x10(r1)
/* 0000274C 7C0803A6 */ mtlr r0
/* 00002750 83A1000C */ lwz r29, 0xc(r1)
/* 00002754 83810008 */ lwz r28, 8(r1)
/* 00002758 38210018 */ addi r1, r1, 0x18
/* 0000275C 4E800020 */ blr 
