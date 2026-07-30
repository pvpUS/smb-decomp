/* 00009BA0 7C0802A6 */ mflr r0
/* 00009BA4 90010004 */ stw r0, 4(r1)
/* 00009BA8 9421FFE0 */ stwu r1, -0x20(r1)
/* 00009BAC DBE10018 */ stfd f31, 0x18(r1)
/* 00009BB0 A8830014 */ lha r4, 0x14(r3)
/* 00009BB4 3C600000 */ lis r3, lbl_10017664@ha
/* 00009BB8 38030000 */ addi r0, r3, lbl_10017664@l
/* 00009BBC 1C640018 */ mulli r3, r4, 0x18
/* 00009BC0 7C601A14 */ add r3, r0, r3
/* 00009BC4 A803000E */ lha r0, 0xe(r3)
/* 00009BC8 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00009BCC 418200C0 */ beq lbl_00009C8C
/* 00009BD0 1C8401A4 */ mulli r4, r4, 0x1a4
/* 00009BD4 3C600000 */ lis r3, ballInfo@ha
/* 00009BD8 38030000 */ addi r0, r3, ballInfo@l
/* 00009BDC 7C602214 */ add r3, r0, r4
/* 00009BE0 C3E30068 */ lfs f31, 0x68(r3)
/* 00009BE4 38630004 */ addi r3, r3, 4
/* 00009BE8 4BFF657D */ bl mathutil_mtxA_from_mtxB_translate
/* 00009BEC 3861000C */ addi r3, r1, 0xc
/* 00009BF0 38A30004 */ addi r5, r3, 4
/* 00009BF4 38830008 */ addi r4, r3, 8
/* 00009BF8 3CC0E000 */ lis r6, 0xe000
/* 00009BFC C046000C */ lfs f2, 0xc(r6)
/* 00009C00 C026001C */ lfs f1, 0x1c(r6)
/* 00009C04 C006002C */ lfs f0, 0x2c(r6)
/* 00009C08 D041000C */ stfs f2, 0xc(r1)
/* 00009C0C D0250000 */ stfs f1, 0(r5)
/* 00009C10 D0040000 */ stfs f0, 0(r4)
/* 00009C14 FC00F850 */ fneg f0, f31
/* 00009C18 C0410014 */ lfs f2, 0x14(r1)
/* 00009C1C FC020040 */ fcmpo cr0, f2, f0
/* 00009C20 4080006C */ bge lbl_00009C8C
/* 00009C24 EC22F82A */ fadds f1, f2, f31
/* 00009C28 C001000C */ lfs f0, 0xc(r1)
/* 00009C2C EC211024 */ fdivs f1, f1, f2
/* 00009C30 EC000072 */ fmuls f0, f0, f1
/* 00009C34 D001000C */ stfs f0, 0xc(r1)
/* 00009C38 C0010010 */ lfs f0, 0x10(r1)
/* 00009C3C EC000072 */ fmuls f0, f0, f1
/* 00009C40 D0010010 */ stfs f0, 0x10(r1)
/* 00009C44 C0010014 */ lfs f0, 0x14(r1)
/* 00009C48 EC00F82A */ fadds f0, f0, f31
/* 00009C4C D0010014 */ stfs f0, 0x14(r1)
/* 00009C50 4BFF6515 */ bl mathutil_mtxA_from_translate
/* 00009C54 3C600000 */ lis r3, lbl_0001C128@ha
/* 00009C58 C0230000 */ lfs f1, lbl_0001C128@l(r3)
/* 00009C5C 4BFF6509 */ bl mathutil_mtxA_scale_s
/* 00009C60 3C600000 */ lis r3, mathutilData@ha
/* 00009C64 38630000 */ addi r3, r3, mathutilData@l
/* 00009C68 80630000 */ lwz r3, 0(r3)
/* 00009C6C 38800000 */ li r4, 0
/* 00009C70 4BFF64F5 */ bl GXLoadPosMtxImm
/* 00009C74 3C600000 */ lis r3, commonGma@ha
/* 00009C78 38630000 */ addi r3, r3, commonGma@l
/* 00009C7C 80630000 */ lwz r3, 0(r3)
/* 00009C80 80630008 */ lwz r3, 8(r3)
/* 00009C84 806302D0 */ lwz r3, 0x2d0(r3)
/* 00009C88 4BFF64DD */ bl avdisp_draw_model_culled_sort_translucent
lbl_00009C8C:
/* 00009C8C 80010024 */ lwz r0, 0x24(r1)
/* 00009C90 CBE10018 */ lfd f31, 0x18(r1)
/* 00009C94 38210020 */ addi r1, r1, 0x20
/* 00009C98 7C0803A6 */ mtlr r0
/* 00009C9C 4E800020 */ blr 
