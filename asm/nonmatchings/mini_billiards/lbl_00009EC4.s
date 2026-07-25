/* 00009EC4 7C0802A6 */ mflr r0
/* 00009EC8 3C600000 */ lis r3, lbl_00020F70@ha
/* 00009ECC 90010004 */ stw r0, 4(r1)
/* 00009ED0 3C800000 */ lis r4, lbl_0001C2B8@ha
/* 00009ED4 38630000 */ addi r3, r3, lbl_00020F70@l
/* 00009ED8 9421FFF0 */ stwu r1, -0x10(r1)
/* 00009EDC 93E1000C */ stw r31, 0xc(r1)
/* 00009EE0 3BE40000 */ addi r31, r4, lbl_0001C2B8@l
/* 00009EE4 4BFF6251 */ bl add_light_to_pool
/* 00009EE8 C03F09A4 */ lfs f1, 0x9a4(r31)
/* 00009EEC C07F0B58 */ lfs f3, 0xb58(r31)
/* 00009EF0 FC400890 */ fmr f2, f1
/* 00009EF4 4BFF6241 */ bl set_bg_ambient
/* 00009EF8 80010014 */ lwz r0, 0x14(r1)
/* 00009EFC 83E1000C */ lwz r31, 0xc(r1)
/* 00009F00 38210010 */ addi r1, r1, 0x10
/* 00009F04 7C0803A6 */ mtlr r0
/* 00009F08 4E800020 */ blr 
