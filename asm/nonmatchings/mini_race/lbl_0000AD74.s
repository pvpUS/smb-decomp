/* 0000AD74 7C0802A6 */ mflr r0
/* 0000AD78 90010004 */ stw r0, 4(r1)
/* 0000AD7C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000AD80 93E10014 */ stw r31, 0x14(r1)
/* 0000AD84 7C7F1B78 */ mr r31, r3
/* 0000AD88 4BFF53F5 */ bl mathutil_mtxA_from_mtxB
/* 0000AD8C 387F0030 */ addi r3, r31, 0x30
/* 0000AD90 4BFF53ED */ bl mathutil_mtxA_mult_right
/* 0000AD94 C03F0074 */ lfs f1, 0x74(r31)
/* 0000AD98 4BFF53E5 */ bl mathutil_mtxA_scale_s
/* 0000AD9C 3C600000 */ lis r3, mathutilData@ha
/* 0000ADA0 38630000 */ addi r3, r3, mathutilData@l
/* 0000ADA4 80630000 */ lwz r3, 0(r3)
/* 0000ADA8 38800000 */ li r4, 0
/* 0000ADAC 4BFF53D1 */ bl gxutil_load_pos_nrm_matrix
/* 0000ADB0 3C600000 */ lis r3, minigameGma@ha
/* 0000ADB4 38630000 */ addi r3, r3, minigameGma@l
/* 0000ADB8 80630000 */ lwz r3, 0(r3)
/* 0000ADBC 80630008 */ lwz r3, 8(r3)
/* 0000ADC0 806300A8 */ lwz r3, 0xa8(r3)
/* 0000ADC4 4BFF53B9 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000ADC8 8001001C */ lwz r0, 0x1c(r1)
/* 0000ADCC 83E10014 */ lwz r31, 0x14(r1)
/* 0000ADD0 38210018 */ addi r1, r1, 0x18
/* 0000ADD4 7C0803A6 */ mtlr r0
/* 0000ADD8 4E800020 */ blr 
