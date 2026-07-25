/* 000074DC 7C0802A6 */ mflr r0
/* 000074E0 38600018 */ li r3, 0x18
/* 000074E4 90010004 */ stw r0, 4(r1)
/* 000074E8 38800000 */ li r4, 0
/* 000074EC 9421FFF8 */ stwu r1, -8(r1)
/* 000074F0 4BFF8C75 */ bl effect_replace_type_funcs
/* 000074F4 38600019 */ li r3, 0x19
/* 000074F8 38800000 */ li r4, 0
/* 000074FC 4BFF8C69 */ bl effect_replace_type_funcs
/* 00007500 3860001A */ li r3, 0x1a
/* 00007504 38800000 */ li r4, 0
/* 00007508 4BFF8C5D */ bl effect_replace_type_funcs
/* 0000750C 3860001C */ li r3, 0x1c
/* 00007510 38800000 */ li r4, 0
/* 00007514 4BFF8C51 */ bl effect_replace_type_funcs
/* 00007518 3860001D */ li r3, 0x1d
/* 0000751C 38800000 */ li r4, 0
/* 00007520 4BFF8C45 */ bl effect_replace_type_funcs
/* 00007524 3860001E */ li r3, 0x1e
/* 00007528 38800000 */ li r4, 0
/* 0000752C 4BFF8C39 */ bl effect_replace_type_funcs
/* 00007530 3860001F */ li r3, 0x1f
/* 00007534 38800000 */ li r4, 0
/* 00007538 4BFF8C2D */ bl effect_replace_type_funcs
/* 0000753C 3860002A */ li r3, 0x2a
/* 00007540 38800000 */ li r4, 0
/* 00007544 4BFF8C21 */ bl effect_replace_type_funcs
/* 00007548 3860002B */ li r3, 0x2b
/* 0000754C 38800000 */ li r4, 0
/* 00007550 4BFF8C15 */ bl effect_replace_type_funcs
/* 00007554 8001000C */ lwz r0, 0xc(r1)
/* 00007558 38210008 */ addi r1, r1, 8
/* 0000755C 7C0803A6 */ mtlr r0
/* 00007560 4E800020 */ blr 
lbl_00007564:
/* 00007564 7C0802A6 */ mflr r0
/* 00007568 3C800000 */ lis r4, commonGma@ha
/* 0000756C 90010004 */ stw r0, 4(r1)
/* 00007570 38000000 */ li r0, 0
/* 00007574 9421FFE8 */ stwu r1, -0x18(r1)
/* 00007578 93E10014 */ stw r31, 0x14(r1)
/* 0000757C 3BE30000 */ addi r31, r3, 0
/* 00007580 80A40000 */ lwz r5, commonGma@l(r4)
/* 00007584 3C800000 */ lis r4, lbl_0001C108@ha
/* 00007588 38640000 */ addi r3, r4, lbl_0001C108@l
/* 0000758C 80A50008 */ lwz r5, 8(r5)
/* 00007590 80850098 */ lwz r4, 0x98(r5)
/* 00007594 909F0030 */ stw r4, 0x30(r31)
/* 00007598 B01F000A */ sth r0, 0xa(r31)
/* 0000759C C0030000 */ lfs f0, 0(r3)
/* 000075A0 D01F0024 */ stfs f0, 0x24(r31)
/* 000075A4 4BFF8BC1 */ bl rand
/* 000075A8 5460047E */ clrlwi r0, r3, 0x11
/* 000075AC B01F004C */ sth r0, 0x4c(r31)
/* 000075B0 4BFF8BB5 */ bl rand
/* 000075B4 5460047E */ clrlwi r0, r3, 0x11
/* 000075B8 B01F004E */ sth r0, 0x4e(r31)
/* 000075BC 4BFF8BA9 */ bl rand
/* 000075C0 5460047E */ clrlwi r0, r3, 0x11
/* 000075C4 B01F0050 */ sth r0, 0x50(r31)
/* 000075C8 4BFF8B9D */ bl rand
/* 000075CC 5463053E */ clrlwi r3, r3, 0x14
/* 000075D0 3803F800 */ addi r0, r3, -2048
/* 000075D4 B01F0052 */ sth r0, 0x52(r31)
/* 000075D8 4BFF8B8D */ bl rand
/* 000075DC 5463053E */ clrlwi r3, r3, 0x14
/* 000075E0 3803F800 */ addi r0, r3, -2048
/* 000075E4 B01F0054 */ sth r0, 0x54(r31)
/* 000075E8 4BFF8B7D */ bl rand
/* 000075EC 5463053E */ clrlwi r3, r3, 0x14
/* 000075F0 3803F800 */ addi r0, r3, -2048
/* 000075F4 B01F0056 */ sth r0, 0x56(r31)
/* 000075F8 8001001C */ lwz r0, 0x1c(r1)
/* 000075FC 83E10014 */ lwz r31, 0x14(r1)
/* 00007600 38210018 */ addi r1, r1, 0x18
/* 00007604 7C0803A6 */ mtlr r0
/* 00007608 4E800020 */ blr 
lbl_0000760C:
/* 0000760C 7C0802A6 */ mflr r0
/* 00007610 90010004 */ stw r0, 4(r1)
/* 00007614 9421FFF8 */ stwu r1, -8(r1)
/* 00007618 A803000A */ lha r0, 0xa(r3)
/* 0000761C 2C000002 */ cmpwi r0, 2
/* 00007620 4080000C */ bge lbl_0000762C
/* 00007624 4800001D */ bl lbl_00007640
/* 00007628 48000008 */ b lbl_00007630
lbl_0000762C:
/* 0000762C 480004A9 */ bl lbl_00007AD4
lbl_00007630:
/* 00007630 8001000C */ lwz r0, 0xc(r1)
/* 00007634 38210008 */ addi r1, r1, 8
/* 00007638 7C0803A6 */ mtlr r0
/* 0000763C 4E800020 */ blr 
