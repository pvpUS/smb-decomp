/* 00007BE0 7C0802A6 */ mflr r0
/* 00007BE4 3C600000 */ lis r3, stageHeap@ha
/* 00007BE8 90010004 */ stw r0, 4(r1)
/* 00007BEC 38630000 */ addi r3, r3, stageHeap@l
/* 00007BF0 3C800000 */ lis r4, lbl_10000000@ha
/* 00007BF4 9421FFE0 */ stwu r1, -0x20(r1)
/* 00007BF8 BF61000C */ stmw r27, 0xc(r1)
/* 00007BFC 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 00007C00 80630000 */ lwz r3, 0(r3)
/* 00007C04 4BFF8559 */ bl OSSetCurrentHeap
/* 00007C08 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007C0C 7C7E1B78 */ mr r30, r3
/* 00007C10 80040000 */ lwz r0, 0(r4)
/* 00007C14 28000000 */ cmplwi r0, 0
/* 00007C18 40820010 */ bne lbl_00007C28
/* 00007C1C 80040004 */ lwz r0, 4(r4)
/* 00007C20 28000000 */ cmplwi r0, 0
/* 00007C24 4182001C */ beq lbl_00007C40
lbl_00007C28:
/* 00007C28 3C600000 */ lis r3, gfxBufferInfo@ha
/* 00007C2C 38630000 */ addi r3, r3, gfxBufferInfo@l
/* 00007C30 80630000 */ lwz r3, 0(r3)
/* 00007C34 80630000 */ lwz r3, 0(r3)
/* 00007C38 4BFF8525 */ bl VISetNextFrameBuffer
/* 00007C3C 4BFF8521 */ bl VIWaitForRetrace
lbl_00007C40:
/* 00007C40 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C44 80630000 */ lwz r3, 0(r3)
/* 00007C48 28030000 */ cmplwi r3, 0
/* 00007C4C 41820014 */ beq lbl_00007C60
/* 00007C50 4BFF850D */ bl free_tpl
/* 00007C54 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C58 38000000 */ li r0, 0
/* 00007C5C 90030000 */ stw r0, 0(r3)
lbl_00007C60:
/* 00007C60 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C64 80630004 */ lwz r3, 4(r3)
/* 00007C68 28030000 */ cmplwi r3, 0
/* 00007C6C 41820014 */ beq lbl_00007C80
/* 00007C70 4BFF84ED */ bl free_gma
/* 00007C74 807F0D5C */ lwz r3, 0xd5c(r31)
/* 00007C78 38000000 */ li r0, 0
/* 00007C7C 90030004 */ stw r0, 4(r3)
lbl_00007C80:
/* 00007C80 3B600000 */ li r27, 0
/* 00007C84 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007C88 577C103A */ slwi r28, r27, 2
/* 00007C8C 3BA30000 */ addi r29, r3, __OSCurrHeap@l
/* 00007C90 4800001C */ b lbl_00007CAC
lbl_00007C94:
/* 00007C94 8084001C */ lwz r4, 0x1c(r4)
/* 00007C98 807D0000 */ lwz r3, 0(r29)
/* 00007C9C 7C84E02E */ lwzx r4, r4, r28
/* 00007CA0 4BFF84BD */ bl OSFreeToHeap
/* 00007CA4 3B9C0004 */ addi r28, r28, 4
/* 00007CA8 3B7B0001 */ addi r27, r27, 1
lbl_00007CAC:
/* 00007CAC 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CB0 80040008 */ lwz r0, 8(r4)
/* 00007CB4 7C1B0000 */ cmpw r27, r0
/* 00007CB8 4180FFDC */ blt lbl_00007C94
/* 00007CBC 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00007CC0 80840014 */ lwz r4, 0x14(r4)
/* 00007CC4 3BA30000 */ addi r29, r3, __OSCurrHeap@l
/* 00007CC8 807D0000 */ lwz r3, 0(r29)
/* 00007CCC 4BFF8491 */ bl OSFreeToHeap
/* 00007CD0 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CD4 807D0000 */ lwz r3, 0(r29)
/* 00007CD8 80840018 */ lwz r4, 0x18(r4)
/* 00007CDC 4BFF8481 */ bl OSFreeToHeap
/* 00007CE0 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CE4 807D0000 */ lwz r3, 0(r29)
/* 00007CE8 8084001C */ lwz r4, 0x1c(r4)
/* 00007CEC 4BFF8471 */ bl OSFreeToHeap
/* 00007CF0 807D0000 */ lwz r3, 0(r29)
/* 00007CF4 809F0D5C */ lwz r4, 0xd5c(r31)
/* 00007CF8 4BFF8465 */ bl OSFreeToHeap
/* 00007CFC 38000000 */ li r0, 0
/* 00007D00 901F0D5C */ stw r0, 0xd5c(r31)
/* 00007D04 7FC3F378 */ mr r3, r30
/* 00007D08 4BFF8455 */ bl OSSetCurrentHeap
/* 00007D0C BB61000C */ lmw r27, 0xc(r1)
/* 00007D10 80010024 */ lwz r0, 0x24(r1)
/* 00007D14 38210020 */ addi r1, r1, 0x20
/* 00007D18 7C0803A6 */ mtlr r0
/* 00007D1C 4E800020 */ blr 
