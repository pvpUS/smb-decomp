/* 00009E34 7C0802A6 */ mflr r0
/* 00009E38 90010004 */ stw r0, 4(r1)
/* 00009E3C 9421FFE8 */ stwu r1, -0x18(r1)
/* 00009E40 93E10014 */ stw r31, 0x14(r1)
/* 00009E44 93C10010 */ stw r30, 0x10(r1)
/* 00009E48 93A1000C */ stw r29, 0xc(r1)
/* 00009E4C 4BFF62E9 */ bl u_clear_buffers_2_and_5
/* 00009E50 3C600000 */ lis r3, stageHeap@ha
/* 00009E54 38630000 */ addi r3, r3, stageHeap@l
/* 00009E58 80630000 */ lwz r3, 0(r3)
/* 00009E5C 4BFF62D9 */ bl OSSetCurrentHeap
/* 00009E60 7C7E1B78 */ mr r30, r3
/* 00009E64 4BFF62D1 */ bl u_free_minigame_graphics
/* 00009E68 4BFF62CD */ bl SoundGroupFree
/* 00009E6C 7FC3F378 */ mr r3, r30
/* 00009E70 4BFF62C5 */ bl OSSetCurrentHeap
/* 00009E74 3C600000 */ lis r3, lbl_10000064@ha
/* 00009E78 38630000 */ addi r3, r3, lbl_10000064@l
/* 00009E7C 3BC3003C */ addi r30, r3, 0x3c
/* 00009E80 3BA0000F */ li r29, 0xf
/* 00009E84 3BE0FFFF */ li r31, -1
lbl_00009E88:
/* 00009E88 807E0000 */ lwz r3, 0(r30)
/* 00009E8C 2C03FFFF */ cmpwi r3, -1
/* 00009E90 4182000C */ beq lbl_00009E9C
/* 00009E94 4BFF62A1 */ bl thread_kill
/* 00009E98 93FE0000 */ stw r31, 0(r30)
lbl_00009E9C:
/* 00009E9C 37BDFFFF */ addic. r29, r29, -1
/* 00009EA0 3BDEFFFC */ addi r30, r30, -4
/* 00009EA4 4080FFE4 */ bge lbl_00009E88
/* 00009EA8 8001001C */ lwz r0, 0x1c(r1)
/* 00009EAC 83E10014 */ lwz r31, 0x14(r1)
/* 00009EB0 83C10010 */ lwz r30, 0x10(r1)
/* 00009EB4 7C0803A6 */ mtlr r0
/* 00009EB8 83A1000C */ lwz r29, 0xc(r1)
/* 00009EBC 38210018 */ addi r1, r1, 0x18
/* 00009EC0 4E800020 */ blr 
