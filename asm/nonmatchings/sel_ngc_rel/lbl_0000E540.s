/* 0000E540 7C0802A6 */ mflr r0
/* 0000E544 90010004 */ stw r0, 4(r1)
/* 0000E548 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E54C 93E10014 */ stw r31, 0x14(r1)
/* 0000E550 93C10010 */ stw r30, 0x10(r1)
/* 0000E554 7C7E1B78 */ mr r30, r3
/* 0000E558 80030048 */ lwz r0, 0x48(r3)
/* 0000E55C 3C600000 */ lis r3, lbl_00011CB0@ha
/* 0000E560 3BE30000 */ addi r31, r3, lbl_00011CB0@l
/* 0000E564 2C000000 */ cmpwi r0, 0
/* 0000E568 418200A0 */ beq lbl_0000E608
/* 0000E56C 4BFF1C1D */ bl reset_text_draw_settings
/* 0000E570 3C600022 */ lis r3, 0x22
/* 0000E574 4BFF1C15 */ bl func_80071B50
/* 0000E578 887E0001 */ lbz r3, 1(r30)
/* 0000E57C 4BFF1C0D */ bl set_text_font
/* 0000E580 C03F0040 */ lfs f1, 0x40(r31)
/* 0000E584 FC400890 */ fmr f2, f1
/* 0000E588 4BFF1C01 */ bl set_text_scale
/* 0000E58C C83F0190 */ lfd f1, 0x190(r31)
/* 0000E590 C01E004C */ lfs f0, 0x4c(r30)
/* 0000E594 FC21002A */ fadd f1, f1, f0
/* 0000E598 FC200818 */ frsp f1, f1
/* 0000E59C 4BFF1BED */ bl func_80071B1C
/* 0000E5A0 C03E0004 */ lfs f1, 4(r30)
/* 0000E5A4 C01F0390 */ lfs f0, 0x390(r31)
/* 0000E5A8 C07F0070 */ lfs f3, 0x70(r31)
/* 0000E5AC EC210028 */ fsubs f1, f1, f0
/* 0000E5B0 C01E0008 */ lfs f0, 8(r30)
/* 0000E5B4 EC43002A */ fadds f2, f3, f0
/* 0000E5B8 EC23082A */ fadds f1, f3, f1
/* 0000E5BC 4BFF1BCD */ bl set_text_pos
/* 0000E5C0 38600000 */ li r3, 0
/* 0000E5C4 4BFF1BC5 */ bl set_text_mul_color
/* 0000E5C8 3C600000 */ lis r3, lbl_00016440@ha
/* 0000E5CC 38630000 */ addi r3, r3, lbl_00016440@l
/* 0000E5D0 4BFF1BB9 */ bl sprite_puts
/* 0000E5D4 C03E004C */ lfs f1, 0x4c(r30)
/* 0000E5D8 4BFF1BB1 */ bl func_80071B1C
/* 0000E5DC C03E0004 */ lfs f1, 4(r30)
/* 0000E5E0 C01F0390 */ lfs f0, 0x390(r31)
/* 0000E5E4 C05E0008 */ lfs f2, 8(r30)
/* 0000E5E8 EC210028 */ fsubs f1, f1, f0
/* 0000E5EC 4BFF1B9D */ bl set_text_pos
/* 0000E5F0 3C600100 */ lis r3, 0x100
/* 0000E5F4 3863FFFF */ addi r3, r3, -1
/* 0000E5F8 4BFF1B91 */ bl set_text_mul_color
/* 0000E5FC 3C600000 */ lis r3, lbl_00016420@ha
/* 0000E600 38630000 */ addi r3, r3, lbl_00016420@l
/* 0000E604 4BFF1B85 */ bl sprite_puts
lbl_0000E608:
/* 0000E608 8001001C */ lwz r0, 0x1c(r1)
/* 0000E60C 83E10014 */ lwz r31, 0x14(r1)
/* 0000E610 83C10010 */ lwz r30, 0x10(r1)
/* 0000E614 7C0803A6 */ mtlr r0
/* 0000E618 38210018 */ addi r1, r1, 0x18
/* 0000E61C 4E800020 */ blr 
