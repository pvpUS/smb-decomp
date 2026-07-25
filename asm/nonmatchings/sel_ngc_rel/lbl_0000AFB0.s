/* 0000AFB0 7C0802A6 */ mflr r0
/* 0000AFB4 90010004 */ stw r0, 4(r1)
/* 0000AFB8 9421FFC8 */ stwu r1, -0x38(r1)
/* 0000AFBC 93E10034 */ stw r31, 0x34(r1)
/* 0000AFC0 7C7F1B78 */ mr r31, r3
/* 0000AFC4 93C10030 */ stw r30, 0x30(r1)
/* 0000AFC8 4BFFF8A9 */ bl lbl_0000A870
/* 0000AFCC 4BFF51BD */ bl reset_text_draw_settings
/* 0000AFD0 887F0001 */ lbz r3, 1(r31)
/* 0000AFD4 4BFF51B5 */ bl set_text_font
/* 0000AFD8 807F0074 */ lwz r3, 0x74(r31)
/* 0000AFDC 4BFF51AD */ bl func_80071B50
/* 0000AFE0 809F0048 */ lwz r4, 0x48(r31)
/* 0000AFE4 3C600000 */ lis r3, lbl_00012970@ha
/* 0000AFE8 38030000 */ addi r0, r3, lbl_00012970@l
/* 0000AFEC 5483103A */ slwi r3, r4, 2
/* 0000AFF0 7C601A14 */ add r3, r0, r3
/* 0000AFF4 80830000 */ lwz r4, 0(r3)
/* 0000AFF8 387F008C */ addi r3, r31, 0x8c
/* 0000AFFC 4BFF518D */ bl strcpy
/* 0000B000 83DF0038 */ lwz r30, 0x38(r31)
/* 0000B004 38000000 */ li r0, 0
/* 0000B008 387F0000 */ addi r3, r31, 0
/* 0000B00C 901F0038 */ stw r0, 0x38(r31)
/* 0000B010 389F0058 */ addi r4, r31, 0x58
/* 0000B014 38BF005C */ addi r5, r31, 0x5c
/* 0000B018 38DF0060 */ addi r6, r31, 0x60
/* 0000B01C 38FF0064 */ addi r7, r31, 0x64
/* 0000B020 4BFF5169 */ bl calc_sprite_bounds
/* 0000B024 3C600020 */ lis r3, 0x20
/* 0000B028 93DF0038 */ stw r30, 0x38(r31)
/* 0000B02C 38632000 */ addi r3, r3, 0x2000
/* 0000B030 4BFF5159 */ bl set_text_mul_color
/* 0000B034 80DF0058 */ lwz r6, 0x58(r31)
/* 0000B038 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000B03C 809F005C */ lwz r4, 0x5c(r31)
/* 0000B040 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B044 38C60003 */ addi r6, r6, 3
/* 0000B048 38040003 */ addi r0, r4, 3
/* 0000B04C C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000B050 6CC48000 */ xoris r4, r6, 0x8000
/* 0000B054 C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B058 6C008000 */ xoris r0, r0, 0x8000
/* 0000B05C 9081002C */ stw r4, 0x2c(r1)
/* 0000B060 3FC04330 */ lis r30, 0x4330
/* 0000B064 90010024 */ stw r0, 0x24(r1)
/* 0000B068 93C10028 */ stw r30, 0x28(r1)
/* 0000B06C 93C10020 */ stw r30, 0x20(r1)
/* 0000B070 C8210028 */ lfd f1, 0x28(r1)
/* 0000B074 C8010020 */ lfd f0, 0x20(r1)
/* 0000B078 EC211828 */ fsubs f1, f1, f3
/* 0000B07C EC401028 */ fsubs f2, f0, f2
/* 0000B080 4BFF5109 */ bl set_text_pos
/* 0000B084 387F008C */ addi r3, r31, 0x8c
/* 0000B088 4BFF5101 */ bl sprite_puts
/* 0000B08C 3C600100 */ lis r3, 0x100
/* 0000B090 3863FF00 */ addi r3, r3, -256
/* 0000B094 4BFF50F5 */ bl set_text_mul_color
/* 0000B098 809F0058 */ lwz r4, 0x58(r31)
/* 0000B09C 3CA00000 */ lis r5, lbl_00011D00@ha
/* 0000B0A0 801F005C */ lwz r0, 0x5c(r31)
/* 0000B0A4 3C600000 */ lis r3, lbl_00011D00@ha
/* 0000B0A8 6C848000 */ xoris r4, r4, 0x8000
/* 0000B0AC 6C008000 */ xoris r0, r0, 0x8000
/* 0000B0B0 9081001C */ stw r4, 0x1c(r1)
/* 0000B0B4 C8650000 */ lfd f3, lbl_00011D00@l(r5)
/* 0000B0B8 90010014 */ stw r0, 0x14(r1)
/* 0000B0BC C8430000 */ lfd f2, lbl_00011D00@l(r3)
/* 0000B0C0 93C10018 */ stw r30, 0x18(r1)
/* 0000B0C4 93C10010 */ stw r30, 0x10(r1)
/* 0000B0C8 C8210018 */ lfd f1, 0x18(r1)
/* 0000B0CC C8010010 */ lfd f0, 0x10(r1)
/* 0000B0D0 EC211828 */ fsubs f1, f1, f3
/* 0000B0D4 EC401028 */ fsubs f2, f0, f2
/* 0000B0D8 4BFF50B1 */ bl set_text_pos
/* 0000B0DC 387F008C */ addi r3, r31, 0x8c
/* 0000B0E0 4BFF50A9 */ bl sprite_puts
/* 0000B0E4 8001003C */ lwz r0, 0x3c(r1)
/* 0000B0E8 83E10034 */ lwz r31, 0x34(r1)
/* 0000B0EC 83C10030 */ lwz r30, 0x30(r1)
/* 0000B0F0 7C0803A6 */ mtlr r0
/* 0000B0F4 38210038 */ addi r1, r1, 0x38
/* 0000B0F8 4E800020 */ blr 
