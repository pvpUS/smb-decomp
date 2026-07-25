/* 0000ACF4 7C0802A6 */ mflr r0
/* 0000ACF8 90010004 */ stw r0, 4(r1)
/* 0000ACFC 9421FFB8 */ stwu r1, -0x48(r1)
/* 0000AD00 93E10044 */ stw r31, 0x44(r1)
/* 0000AD04 7C7F1B78 */ mr r31, r3
/* 0000AD08 80630144 */ lwz r3, 0x144(r3)
/* 0000AD0C 38630274 */ addi r3, r3, 0x274
/* 0000AD10 4BFF546D */ bl mathutil_mtxA_from_quat
/* 0000AD14 3861000C */ addi r3, r1, 0xc
/* 0000AD18 4BFF5465 */ bl mathutil_mtxA_to_mtx
/* 0000AD1C 387F0004 */ addi r3, r31, 4
/* 0000AD20 4BFF545D */ bl mathutil_mtxA_from_mtxB_translate
/* 0000AD24 3861000C */ addi r3, r1, 0xc
/* 0000AD28 4BFF5455 */ bl mathutil_mtxA_mult_right
/* 0000AD2C C03F0074 */ lfs f1, 0x74(r31)
/* 0000AD30 4BFF544D */ bl mathutil_mtxA_scale_s
/* 0000AD34 3C600000 */ lis r3, mathutilData@ha
/* 0000AD38 38630000 */ addi r3, r3, mathutilData@l
/* 0000AD3C 80630000 */ lwz r3, 0(r3)
/* 0000AD40 38800000 */ li r4, 0
/* 0000AD44 4BFF5439 */ bl gxutil_load_pos_nrm_matrix
/* 0000AD48 3C600000 */ lis r3, minigameGma@ha
/* 0000AD4C 38630000 */ addi r3, r3, minigameGma@l
/* 0000AD50 80630000 */ lwz r3, 0(r3)
/* 0000AD54 80630008 */ lwz r3, 8(r3)
/* 0000AD58 806300A0 */ lwz r3, 0xa0(r3)
/* 0000AD5C 4BFF5421 */ bl avdisp_draw_model_unculled_sort_translucent
/* 0000AD60 8001004C */ lwz r0, 0x4c(r1)
/* 0000AD64 83E10044 */ lwz r31, 0x44(r1)
/* 0000AD68 38210048 */ addi r1, r1, 0x48
/* 0000AD6C 7C0803A6 */ mtlr r0
/* 0000AD70 4E800020 */ blr 
