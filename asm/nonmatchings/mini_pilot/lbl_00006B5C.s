/* 00006B5C 7C0802A6 */ mflr r0
/* 00006B60 3CA00000 */ lis r5, currStageId@ha
/* 00006B64 90010004 */ stw r0, 4(r1)
/* 00006B68 9421FFF8 */ stwu r1, -8(r1)
/* 00006B6C A8050000 */ lha r0, currStageId@l(r5)
/* 00006B70 2C000097 */ cmpwi r0, 0x97
/* 00006B74 4082000C */ bne lbl_00006B80
/* 00006B78 4BFF95D5 */ bl stcoli_sub35
/* 00006B7C 48000008 */ b lbl_00006B84
lbl_00006B80:
/* 00006B80 4BFF95CD */ bl collide_ball_with_stage
lbl_00006B84:
/* 00006B84 8001000C */ lwz r0, 0xc(r1)
/* 00006B88 38210008 */ addi r1, r1, 8
/* 00006B8C 7C0803A6 */ mtlr r0
/* 00006B90 4E800020 */ blr 
