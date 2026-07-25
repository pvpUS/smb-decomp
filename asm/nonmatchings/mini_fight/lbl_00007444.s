/* 00007444 7C0802A6 */ mflr r0
/* 00007448 3C600000 */ lis r3, lbl_0001CB40@ha
/* 0000744C 90010004 */ stw r0, 4(r1)
/* 00007450 9421FFF0 */ stwu r1, -0x10(r1)
/* 00007454 93E1000C */ stw r31, 0xc(r1)
/* 00007458 3BE30000 */ addi r31, r3, lbl_0001CB40@l
/* 0000745C 389F0000 */ addi r4, r31, 0
/* 00007460 38600018 */ li r3, 0x18
/* 00007464 4BFF8D01 */ bl effect_replace_type_funcs
/* 00007468 38600019 */ li r3, 0x19
/* 0000746C 389F0010 */ addi r4, r31, 0x10
/* 00007470 4BFF8CF5 */ bl effect_replace_type_funcs
/* 00007474 3860001A */ li r3, 0x1a
/* 00007478 389F0020 */ addi r4, r31, 0x20
/* 0000747C 4BFF8CE9 */ bl effect_replace_type_funcs
/* 00007480 3860001C */ li r3, 0x1c
/* 00007484 389F0030 */ addi r4, r31, 0x30
/* 00007488 4BFF8CDD */ bl effect_replace_type_funcs
/* 0000748C 3860001D */ li r3, 0x1d
/* 00007490 389F0040 */ addi r4, r31, 0x40
/* 00007494 4BFF8CD1 */ bl effect_replace_type_funcs
/* 00007498 3860001E */ li r3, 0x1e
/* 0000749C 389F0050 */ addi r4, r31, 0x50
/* 000074A0 4BFF8CC5 */ bl effect_replace_type_funcs
/* 000074A4 3860001F */ li r3, 0x1f
/* 000074A8 389F0060 */ addi r4, r31, 0x60
/* 000074AC 4BFF8CB9 */ bl effect_replace_type_funcs
/* 000074B0 3860002A */ li r3, 0x2a
/* 000074B4 389F0070 */ addi r4, r31, 0x70
/* 000074B8 4BFF8CAD */ bl effect_replace_type_funcs
/* 000074BC 3860002B */ li r3, 0x2b
/* 000074C0 389F0080 */ addi r4, r31, 0x80
/* 000074C4 4BFF8CA1 */ bl effect_replace_type_funcs
/* 000074C8 80010014 */ lwz r0, 0x14(r1)
/* 000074CC 83E1000C */ lwz r31, 0xc(r1)
/* 000074D0 38210010 */ addi r1, r1, 0x10
/* 000074D4 7C0803A6 */ mtlr r0
/* 000074D8 4E800020 */ blr 
