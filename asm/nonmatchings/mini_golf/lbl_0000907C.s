/* 0000907C 7C0802A6 */ mflr r0
/* 00009080 3C600000 */ lis r3, lbl_000260F0@ha
/* 00009084 90010004 */ stw r0, 4(r1)
/* 00009088 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000908C 93E1000C */ stw r31, 0xc(r1)
/* 00009090 3BE30000 */ addi r31, r3, lbl_000260F0@l
/* 00009094 93C10008 */ stw r30, 8(r1)
/* 00009098 4BFF7139 */ bl event_finish_all
/* 0000909C 4BFF7135 */ bl free_all_bitmap_groups_except_com
/* 000090A0 4BFF7131 */ bl u_free_minigame_graphics
/* 000090A4 4BFF712D */ bl SoundGroupFree
/* 000090A8 3C600000 */ lis r3, lbl_00026AC4@ha
/* 000090AC 38630000 */ addi r3, r3, lbl_00026AC4@l
/* 000090B0 A8630022 */ lha r3, 0x22(r3)
/* 000090B4 4BFF711D */ bl load_stage
/* 000090B8 3860000F */ li r3, 0xf
/* 000090BC 4BFF7115 */ bl event_start
/* 000090C0 38600012 */ li r3, 0x12
/* 000090C4 4BFF710D */ bl event_start
/* 000090C8 38600013 */ li r3, 0x13
/* 000090CC 4BFF7105 */ bl event_start
/* 000090D0 3860000D */ li r3, 0xd
/* 000090D4 4BFF70FD */ bl event_start
/* 000090D8 38600010 */ li r3, 0x10
/* 000090DC 4BFF70F5 */ bl event_start
/* 000090E0 3C600000 */ lis r3, g_poolInfo@ha
/* 000090E4 38630000 */ addi r3, r3, g_poolInfo@l
/* 000090E8 38A3000C */ addi r5, r3, 0xc
/* 000090EC 8083000C */ lwz r4, 0xc(r3)
/* 000090F0 38000002 */ li r0, 2
/* 000090F4 3C600000 */ lis r3, modeCtrl@ha
/* 000090F8 98040000 */ stb r0, 0(r4)
/* 000090FC 38000000 */ li r0, 0
/* 00009100 38630000 */ addi r3, r3, modeCtrl@l
/* 00009104 80850000 */ lwz r4, 0(r5)
/* 00009108 3BC00000 */ li r30, 0
/* 0000910C 98040001 */ stb r0, 1(r4)
/* 00009110 80850000 */ lwz r4, 0(r5)
/* 00009114 98040002 */ stb r0, 2(r4)
/* 00009118 80850000 */ lwz r4, 0(r5)
/* 0000911C 98040003 */ stb r0, 3(r4)
/* 00009120 9003002C */ stw r0, 0x2c(r3)
lbl_00009124:
/* 00009124 C03F0000 */ lfs f1, 0(r31)
/* 00009128 7FC3F378 */ mr r3, r30
/* 0000912C FC400890 */ fmr f2, f1
/* 00009130 FC600890 */ fmr f3, f1
/* 00009134 FC800890 */ fmr f4, f1
/* 00009138 4BFF7099 */ bl setup_camera_viewport
/* 0000913C 3BDE0001 */ addi r30, r30, 1
/* 00009140 2C1E0004 */ cmpwi r30, 4
/* 00009144 4180FFE0 */ blt lbl_00009124
/* 00009148 C03F0000 */ lfs f1, 0(r31)
/* 0000914C 38600000 */ li r3, 0
/* 00009150 C07F0004 */ lfs f3, 4(r31)
/* 00009154 FC400890 */ fmr f2, f1
/* 00009158 FC801890 */ fmr f4, f3
/* 0000915C 4BFF7075 */ bl setup_camera_viewport
/* 00009160 80010014 */ lwz r0, 0x14(r1)
/* 00009164 83E1000C */ lwz r31, 0xc(r1)
/* 00009168 83C10008 */ lwz r30, 8(r1)
/* 0000916C 7C0803A6 */ mtlr r0
/* 00009170 38210010 */ addi r1, r1, 0x10
/* 00009174 4E800020 */ blr 
