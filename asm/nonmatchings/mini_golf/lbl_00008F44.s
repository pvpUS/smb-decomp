/* 00008F44 7C0802A6 */ mflr r0
/* 00008F48 3C600000 */ lis r3, lbl_00026AB0@ha
/* 00008F4C 90010004 */ stw r0, 4(r1)
/* 00008F50 9421FFF0 */ stwu r1, -0x10(r1)
/* 00008F54 93E1000C */ stw r31, 0xc(r1)
/* 00008F58 93C10008 */ stw r30, 8(r1)
/* 00008F5C 3BC30000 */ addi r30, r3, lbl_00026AB0@l
/* 00008F60 4BFF7271 */ bl event_finish_all
/* 00008F64 3C600000 */ lis r3, lbl_1000003A@ha
/* 00008F68 3BE30000 */ addi r31, r3, lbl_1000003A@l
/* 00008F6C A81F0000 */ lha r0, 0(r31)
/* 00008F70 5400083C */ slwi r0, r0, 1
/* 00008F74 7C7E0214 */ add r3, r30, r0
/* 00008F78 A8630014 */ lha r3, 0x14(r3)
/* 00008F7C 4BFF7255 */ bl load_stage
/* 00008F80 A81F0000 */ lha r0, 0(r31)
/* 00008F84 2C000011 */ cmpwi r0, 0x11
/* 00008F88 40800018 */ bge lbl_00008FA0
/* 00008F8C 5400083C */ slwi r0, r0, 1
/* 00008F90 7C7E0214 */ add r3, r30, r0
/* 00008F94 A8630016 */ lha r3, 0x16(r3)
/* 00008F98 4BFF7239 */ bl preload_stage_files
/* 00008F9C 4800000C */ b lbl_00008FA8
lbl_00008FA0:
/* 00008FA0 A87E0036 */ lha r3, 0x36(r30)
/* 00008FA4 4BFF722D */ bl preload_stage_files
lbl_00008FA8:
/* 00008FA8 38600001 */ li r3, 1
/* 00008FAC 4BFF7225 */ bl event_start
/* 00008FB0 38600002 */ li r3, 2
/* 00008FB4 4BFF721D */ bl event_start
/* 00008FB8 38600003 */ li r3, 3
/* 00008FBC 4BFF7215 */ bl event_start
/* 00008FC0 38600004 */ li r3, 4
/* 00008FC4 4BFF720D */ bl event_start
/* 00008FC8 38600009 */ li r3, 9
/* 00008FCC 4BFF7205 */ bl event_start
/* 00008FD0 38600007 */ li r3, 7
/* 00008FD4 4BFF71FD */ bl event_start
/* 00008FD8 3860000F */ li r3, 0xf
/* 00008FDC 4BFF71F5 */ bl event_start
/* 00008FE0 38600010 */ li r3, 0x10
/* 00008FE4 4BFF71ED */ bl event_start
/* 00008FE8 38600012 */ li r3, 0x12
/* 00008FEC 4BFF71E5 */ bl event_start
/* 00008FF0 3860000D */ li r3, 0xd
/* 00008FF4 4BFF71DD */ bl event_start
/* 00008FF8 38600013 */ li r3, 0x13
/* 00008FFC 4BFF71D5 */ bl event_start
/* 00009000 3860000B */ li r3, 0xb
/* 00009004 4BFF71CD */ bl event_start
/* 00009008 3C600000 */ lis r3, g_poolInfo@ha
/* 0000900C 38830000 */ addi r4, r3, g_poolInfo@l
/* 00009010 3C600000 */ lis r3, worldInfo@ha
/* 00009014 80C4000C */ lwz r6, 0xc(r4)
/* 00009018 38030000 */ addi r0, r3, worldInfo@l
/* 0000901C 7C050378 */ mr r5, r0
/* 00009020 38E00000 */ li r7, 0
/* 00009024 38600001 */ li r3, 1
/* 00009028 48000020 */ b lbl_00009048
lbl_0000902C:
/* 0000902C 88060000 */ lbz r0, 0(r6)
/* 00009030 2C000002 */ cmpwi r0, 2
/* 00009034 40820008 */ bne lbl_0000903C
/* 00009038 98650008 */ stb r3, 8(r5)
lbl_0000903C:
/* 0000903C 38E70001 */ addi r7, r7, 1
/* 00009040 38A50040 */ addi r5, r5, 0x40
/* 00009044 38C60001 */ addi r6, r6, 1
lbl_00009048:
/* 00009048 80040008 */ lwz r0, 8(r4)
/* 0000904C 7C070000 */ cmpw r7, r0
/* 00009050 4180FFDC */ blt lbl_0000902C
/* 00009054 38600040 */ li r3, 0x40
/* 00009058 4BFF7179 */ bl camera_set_state_all
/* 0000905C 386000B1 */ li r3, 0xb1
/* 00009060 4BFF7171 */ bl set_text_font
/* 00009064 80010014 */ lwz r0, 0x14(r1)
/* 00009068 83E1000C */ lwz r31, 0xc(r1)
/* 0000906C 83C10008 */ lwz r30, 8(r1)
/* 00009070 7C0803A6 */ mtlr r0
/* 00009074 38210010 */ addi r1, r1, 0x10
/* 00009078 4E800020 */ blr 
