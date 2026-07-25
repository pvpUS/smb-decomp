/* 0000E3E8 7C0802A6 */ mflr r0
/* 0000E3EC 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000E3F0 90010004 */ stw r0, 4(r1)
/* 0000E3F4 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000E3F8 93E10044 */ stw r31, 0x44(r1)
/* 0000E3FC 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000E400 3C600000 */ lis r3, lbl_000101E0@ha
/* 0000E404 93C10040 */ stw r30, 0x40(r1)
/* 0000E408 3BC30000 */ addi r30, r3, lbl_000101E0@l
/* 0000E40C 93A1003C */ stw r29, 0x3c(r1)
/* 0000E410 83BF00C0 */ lwz r29, 0xc0(r31)
/* 0000E414 4BFF1D49 */ bl mathutil_mtxA_push
/* 0000E418 4BFF1D45 */ bl mathutil_mtxA_from_identity
/* 0000E41C C03E000C */ lfs f1, 0xc(r30)
/* 0000E420 C05E007C */ lfs f2, 0x7c(r30)
/* 0000E424 C07E0080 */ lfs f3, 0x80(r30)
/* 0000E428 4BFF1D35 */ bl mathutil_mtxA_translate_xyz
/* 0000E42C 801D0000 */ lwz r0, 0(r29)
/* 0000E430 2C000004 */ cmpwi r0, 4
/* 0000E434 40800018 */ bge lbl_0000E44C
/* 0000E438 2C000002 */ cmpwi r0, 2
/* 0000E43C 4080005C */ bge lbl_0000E498
/* 0000E440 2C000000 */ cmpwi r0, 0
/* 0000E444 40800014 */ bge lbl_0000E458
/* 0000E448 480001C0 */ b lbl_0000E608
lbl_0000E44C:
/* 0000E44C 2C000007 */ cmpwi r0, 7
/* 0000E450 41820068 */ beq lbl_0000E4B8
/* 0000E454 408001B4 */ bge lbl_0000E608
lbl_0000E458:
/* 0000E458 3860C000 */ li r3, -16384
/* 0000E45C 4BFF1D01 */ bl mathutil_mtxA_rotate_z
/* 0000E460 3860C000 */ li r3, -16384
/* 0000E464 4BFF1CF9 */ bl mathutil_mtxA_rotate_y
/* 0000E468 C03E0084 */ lfs f1, 0x84(r30)
/* 0000E46C 4BFF1CF1 */ bl mathutil_mtxA_scale_s
/* 0000E470 3C600000 */ lis r3, mathutilData@ha
/* 0000E474 38630000 */ addi r3, r3, mathutilData@l
/* 0000E478 80630000 */ lwz r3, 0(r3)
/* 0000E47C 38800000 */ li r4, 0
/* 0000E480 4BFF1CDD */ bl gxutil_load_pos_nrm_matrix
/* 0000E484 807F0004 */ lwz r3, 4(r31)
/* 0000E488 809D0000 */ lwz r4, 0(r29)
/* 0000E48C 80BD0008 */ lwz r5, 8(r29)
/* 0000E490 4BFF1CCD */ bl func_80086D20
/* 0000E494 48000174 */ b lbl_0000E608
lbl_0000E498:
/* 0000E498 3860000F */ li r3, 0xf
/* 0000E49C 38800014 */ li r4, 0x14
/* 0000E4A0 4BFF1CBD */ bl window_set_cursor_pos
/* 0000E4A4 3C600000 */ lis r3, lbl_00015868@ha
/* 0000E4A8 4CC63182 */ crclr 6
/* 0000E4AC 38630000 */ addi r3, r3, lbl_00015868@l
/* 0000E4B0 4BFF1CAD */ bl window_printf_2
/* 0000E4B4 48000154 */ b lbl_0000E608
lbl_0000E4B8:
/* 0000E4B8 C03E000C */ lfs f1, 0xc(r30)
/* 0000E4BC C05E0088 */ lfs f2, 0x88(r30)
/* 0000E4C0 FC600890 */ fmr f3, f1
/* 0000E4C4 4BFF1C99 */ bl mathutil_mtxA_translate_xyz
/* 0000E4C8 3860C000 */ li r3, -16384
/* 0000E4CC 4BFF1C91 */ bl mathutil_mtxA_rotate_z
/* 0000E4D0 3860C000 */ li r3, -16384
/* 0000E4D4 4BFF1C89 */ bl mathutil_mtxA_rotate_y
/* 0000E4D8 801D0008 */ lwz r0, 8(r29)
/* 0000E4DC 3C600000 */ lis r3, lbl_00010278@ha
/* 0000E4E0 C8230000 */ lfd f1, lbl_00010278@l(r3)
/* 0000E4E4 6C008000 */ xoris r0, r0, 0x8000
/* 0000E4E8 C05E008C */ lfs f2, 0x8c(r30)
/* 0000E4EC 90010034 */ stw r0, 0x34(r1)
/* 0000E4F0 3C004330 */ lis r0, 0x4330
/* 0000E4F4 90010030 */ stw r0, 0x30(r1)
/* 0000E4F8 C8010030 */ lfd f0, 0x30(r1)
/* 0000E4FC EC000828 */ fsubs f0, f0, f1
/* 0000E500 EC020032 */ fmuls f0, f2, f0
/* 0000E504 FC00001E */ fctiwz f0, f0
/* 0000E508 D8010028 */ stfd f0, 0x28(r1)
/* 0000E50C 8001002C */ lwz r0, 0x2c(r1)
/* 0000E510 7C030734 */ extsh r3, r0
/* 0000E514 4BFF1C49 */ bl mathutil_mtxA_rotate_z
/* 0000E518 C03E0084 */ lfs f1, 0x84(r30)
/* 0000E51C 4BFF1C41 */ bl mathutil_mtxA_scale_s
/* 0000E520 3860000F */ li r3, 0xf
/* 0000E524 38800012 */ li r4, 0x12
/* 0000E528 4BFF1C35 */ bl window_set_cursor_pos
/* 0000E52C 3C600000 */ lis r3, lbl_00015890@ha
/* 0000E530 809D0008 */ lwz r4, 8(r29)
/* 0000E534 38630000 */ addi r3, r3, lbl_00015890@l
/* 0000E538 4CC63182 */ crclr 6
/* 0000E53C 4BFF1C21 */ bl window_printf_2
/* 0000E540 80BE005C */ lwz r5, 0x5c(r30)
/* 0000E544 3C600000 */ lis r3, charaGMAs@ha
/* 0000E548 801E0060 */ lwz r0, 0x60(r30)
/* 0000E54C 38830000 */ addi r4, r3, charaGMAs@l
/* 0000E550 90A10008 */ stw r5, 8(r1)
/* 0000E554 9001000C */ stw r0, 0xc(r1)
/* 0000E558 807E0064 */ lwz r3, 0x64(r30)
/* 0000E55C 801E0068 */ lwz r0, 0x68(r30)
/* 0000E560 90610010 */ stw r3, 0x10(r1)
/* 0000E564 90010014 */ stw r0, 0x14(r1)
/* 0000E568 807E006C */ lwz r3, 0x6c(r30)
/* 0000E56C 801E0070 */ lwz r0, 0x70(r30)
/* 0000E570 90610018 */ stw r3, 0x18(r1)
/* 0000E574 9001001C */ stw r0, 0x1c(r1)
/* 0000E578 807E0074 */ lwz r3, 0x74(r30)
/* 0000E57C 801E0078 */ lwz r0, 0x78(r30)
/* 0000E580 90610020 */ stw r3, 0x20(r1)
/* 0000E584 90010024 */ stw r0, 0x24(r1)
/* 0000E588 80BF0004 */ lwz r5, 4(r31)
/* 0000E58C 807F00C0 */ lwz r3, 0xc0(r31)
/* 0000E590 80A50010 */ lwz r5, 0x10(r5)
/* 0000E594 80030010 */ lwz r0, 0x10(r3)
/* 0000E598 54A31838 */ slwi r3, r5, 3
/* 0000E59C 7C641A14 */ add r3, r4, r3
/* 0000E5A0 80630000 */ lwz r3, 0(r3)
/* 0000E5A4 2C000004 */ cmpwi r0, 4
/* 0000E5A8 54BF083C */ slwi r31, r5, 1
/* 0000E5AC 83A30008 */ lwz r29, 8(r3)
/* 0000E5B0 4082001C */ bne lbl_0000E5CC
/* 0000E5B4 C03E000C */ lfs f1, 0xc(r30)
/* 0000E5B8 3BFF0001 */ addi r31, r31, 1
/* 0000E5BC C05E0090 */ lfs f2, 0x90(r30)
/* 0000E5C0 FC600890 */ fmr f3, f1
/* 0000E5C4 4BFF1B99 */ bl mathutil_mtxA_translate_xyz
/* 0000E5C8 48000014 */ b lbl_0000E5DC
lbl_0000E5CC:
/* 0000E5CC C03E000C */ lfs f1, 0xc(r30)
/* 0000E5D0 C05E0094 */ lfs f2, 0x94(r30)
/* 0000E5D4 FC600890 */ fmr f3, f1
/* 0000E5D8 4BFF1B85 */ bl mathutil_mtxA_translate_xyz
lbl_0000E5DC:
/* 0000E5DC 3C600000 */ lis r3, mathutilData@ha
/* 0000E5E0 38630000 */ addi r3, r3, mathutilData@l
/* 0000E5E4 57E0103A */ slwi r0, r31, 2
/* 0000E5E8 80630000 */ lwz r3, 0(r3)
/* 0000E5EC 38810008 */ addi r4, r1, 8
/* 0000E5F0 7FC4002E */ lwzx r30, r4, r0
/* 0000E5F4 38800000 */ li r4, 0
/* 0000E5F8 4BFF1B65 */ bl gxutil_load_pos_nrm_matrix
/* 0000E5FC 57C01838 */ slwi r0, r30, 3
/* 0000E600 7C7D002E */ lwzx r3, r29, r0
/* 0000E604 4BFF1B59 */ bl avdisp_draw_model_unculled_sort_none
lbl_0000E608:
/* 0000E608 4BFF1B55 */ bl mathutil_mtxA_pop
/* 0000E60C 8001004C */ lwz r0, 0x4c(r1)
/* 0000E610 83E10044 */ lwz r31, 0x44(r1)
/* 0000E614 83C10040 */ lwz r30, 0x40(r1)
/* 0000E618 7C0803A6 */ mtlr r0
/* 0000E61C 83A1003C */ lwz r29, 0x3c(r1)
/* 0000E620 38210048 */ addi r1, r1, 0x48
/* 0000E624 4E800020 */ blr 
