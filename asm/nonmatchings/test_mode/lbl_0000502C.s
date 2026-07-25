/* 0000502C 7C0802A6 */ mflr r0
/* 00005030 3C600000 */ lis r3, stageHeap@ha
/* 00005034 90010004 */ stw r0, 4(r1)
/* 00005038 38630000 */ addi r3, r3, stageHeap@l
/* 0000503C 3C800000 */ lis r4, lbl_10000000@ha
/* 00005040 9421FFF0 */ stwu r1, -0x10(r1)
/* 00005044 93E1000C */ stw r31, 0xc(r1)
/* 00005048 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 0000504C 93C10008 */ stw r30, 8(r1)
/* 00005050 80630000 */ lwz r3, 0(r3)
/* 00005054 4BFFB109 */ bl OSSetCurrentHeap
/* 00005058 7C601B78 */ mr r0, r3
/* 0000505C 807F0160 */ lwz r3, 0x160(r31)
/* 00005060 7C1E0378 */ mr r30, r0
/* 00005064 4BFFB0F9 */ bl free_model
/* 00005068 807F015C */ lwz r3, 0x15c(r31)
/* 0000506C 4BFFB0F1 */ bl free_tpl
/* 00005070 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005074 809F016C */ lwz r4, 0x16c(r31)
/* 00005078 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 0000507C 80630000 */ lwz r3, 0(r3)
/* 00005080 4BFFB0DD */ bl OSFreeToHeap
/* 00005084 7FC3F378 */ mr r3, r30
/* 00005088 4BFFB0D5 */ bl OSSetCurrentHeap
/* 0000508C 80010014 */ lwz r0, 0x14(r1)
/* 00005090 83E1000C */ lwz r31, 0xc(r1)
/* 00005094 83C10008 */ lwz r30, 8(r1)
/* 00005098 7C0803A6 */ mtlr r0
/* 0000509C 38210010 */ addi r1, r1, 0x10
/* 000050A0 4E800020 */ blr 
lbl_000050A4:
/* 000050A4 7C0802A6 */ mflr r0
/* 000050A8 3C600000 */ lis r3, stageHeap@ha
/* 000050AC 90010004 */ stw r0, 4(r1)
/* 000050B0 38630000 */ addi r3, r3, stageHeap@l
/* 000050B4 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 000050B8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000050BC 3C800000 */ lis r4, lbl_10000000@ha
/* 000050C0 93E10014 */ stw r31, 0x14(r1)
/* 000050C4 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000050C8 93C10010 */ stw r30, 0x10(r1)
/* 000050CC 3BC50000 */ addi r30, r5, lbl_0000FE78@l
/* 000050D0 93A1000C */ stw r29, 0xc(r1)
/* 000050D4 80630000 */ lwz r3, 0(r3)
/* 000050D8 4BFFB085 */ bl OSSetCurrentHeap
/* 000050DC 3C800000 */ lis r4, lbl_0001323C@ha
/* 000050E0 38040000 */ addi r0, r4, lbl_0001323C@l
/* 000050E4 3BA30000 */ addi r29, r3, 0
/* 000050E8 7C030378 */ mr r3, r0
/* 000050EC 4BFFB071 */ bl load_tpl
/* 000050F0 907F015C */ stw r3, 0x15c(r31)
/* 000050F4 3C600000 */ lis r3, lbl_0001324C@ha
/* 000050F8 38630000 */ addi r3, r3, lbl_0001324C@l
/* 000050FC 809F015C */ lwz r4, 0x15c(r31)
/* 00005100 4BFFB05D */ bl load_model
/* 00005104 907F0160 */ stw r3, 0x160(r31)
/* 00005108 807F0160 */ lwz r3, 0x160(r31)
/* 0000510C 4BFFB051 */ bl avdisp_get_eff_vtxinfo
/* 00005110 907F0168 */ stw r3, 0x168(r31)
/* 00005114 807F0160 */ lwz r3, 0x160(r31)
/* 00005118 4BFFB045 */ bl avdisp_get_eff_vertices
/* 0000511C 907F0164 */ stw r3, 0x164(r31)
/* 00005120 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005124 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00005128 809F0168 */ lwz r4, 0x168(r31)
/* 0000512C 80630000 */ lwz r3, 0(r3)
/* 00005130 80040000 */ lwz r0, 0(r4)
/* 00005134 1C80000C */ mulli r4, r0, 0xc
/* 00005138 3804001F */ addi r0, r4, 0x1f
/* 0000513C 54040034 */ rlwinm r4, r0, 0, 0, 0x1a
/* 00005140 4BFFB01D */ bl OSAllocFromHeap
/* 00005144 907F016C */ stw r3, 0x16c(r31)
/* 00005148 3860000F */ li r3, 0xf
/* 0000514C 4BFFB011 */ bl event_start
/* 00005150 38600002 */ li r3, 2
/* 00005154 4BFFB009 */ bl camera_set_state_all
/* 00005158 3CA00000 */ lis r5, lbl_0000502C@ha
/* 0000515C 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00005160 38050000 */ addi r0, r5, lbl_0000502C@l
/* 00005164 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00005168 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000516C 3800007B */ li r0, 0x7b
/* 00005170 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005174 C03E012C */ lfs f1, 0x12c(r30)
/* 00005178 FC400890 */ fmr f2, f1
/* 0000517C FC600890 */ fmr f3, f1
/* 00005180 4BFFAFDD */ bl avdisp_set_ambient
/* 00005184 38000000 */ li r0, 0
/* 00005188 901F0170 */ stw r0, 0x170(r31)
/* 0000518C 7FA3EB78 */ mr r3, r29
/* 00005190 901F0174 */ stw r0, 0x174(r31)
/* 00005194 901F0178 */ stw r0, 0x178(r31)
/* 00005198 901F017C */ stw r0, 0x17c(r31)
/* 0000519C 901F0180 */ stw r0, 0x180(r31)
/* 000051A0 901F0184 */ stw r0, 0x184(r31)
/* 000051A4 4BFFAFB9 */ bl OSSetCurrentHeap
/* 000051A8 8001001C */ lwz r0, 0x1c(r1)
/* 000051AC 83E10014 */ lwz r31, 0x14(r1)
/* 000051B0 83C10010 */ lwz r30, 0x10(r1)
/* 000051B4 7C0803A6 */ mtlr r0
/* 000051B8 83A1000C */ lwz r29, 0xc(r1)
/* 000051BC 38210018 */ addi r1, r1, 0x18
/* 000051C0 4E800020 */ blr 
lbl_000051C4:
/* 000051C4 7C0802A6 */ mflr r0
/* 000051C8 3C800000 */ lis r4, lbl_10000000@ha
/* 000051CC 90010004 */ stw r0, 4(r1)
/* 000051D0 3C600000 */ lis r3, lbl_000102B0@ha
/* 000051D4 9421FFE0 */ stwu r1, -0x20(r1)
/* 000051D8 BF61000C */ stmw r27, 0xc(r1)
/* 000051DC 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 000051E0 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 000051E4 38600002 */ li r3, 2
/* 000051E8 38800002 */ li r4, 2
/* 000051EC 4BFFAF71 */ bl window_set_cursor_pos
/* 000051F0 387F2FA8 */ addi r3, r31, 0x2fa8
/* 000051F4 4CC63182 */ crclr 6
/* 000051F8 4BFFAF65 */ bl window_printf_2
/* 000051FC 38600004 */ li r3, 4
/* 00005200 38800005 */ li r4, 5
/* 00005204 4BFFAF59 */ bl window_set_cursor_pos
/* 00005208 3C600000 */ lis r3, controllerInfo@ha
/* 0000520C 38630000 */ addi r3, r3, controllerInfo@l
/* 00005210 A0830030 */ lhz r4, 0x30(r3)
/* 00005214 54800739 */ rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 00005218 41820010 */ beq lbl_00005228
/* 0000521C 807E0170 */ lwz r3, 0x170(r30)
/* 00005220 38030004 */ addi r0, r3, 4
/* 00005224 901E0170 */ stw r0, 0x170(r30)
lbl_00005228:
/* 00005228 5480077B */ rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 0000522C 41820010 */ beq lbl_0000523C
/* 00005230 807E0170 */ lwz r3, 0x170(r30)
/* 00005234 38030001 */ addi r0, r3, 1
/* 00005238 901E0170 */ stw r0, 0x170(r30)
lbl_0000523C:
/* 0000523C 3C606666 */ lis r3, 0x6666
/* 00005240 809E0170 */ lwz r4, 0x170(r30)
/* 00005244 38036667 */ addi r0, r3, 0x6667
/* 00005248 7C002096 */ mulhw r0, r0, r4
/* 0000524C 7C000E70 */ srawi r0, r0, 1
/* 00005250 54030FFE */ srwi r3, r0, 0x1f
/* 00005254 7C001A14 */ add r0, r0, r3
/* 00005258 1C000005 */ mulli r0, r0, 5
/* 0000525C 7C002050 */ subf r0, r0, r4
/* 00005260 3C600000 */ lis r3, controllerInfo@ha
/* 00005264 901E0170 */ stw r0, 0x170(r30)
/* 00005268 38630000 */ addi r3, r3, controllerInfo@l
/* 0000526C A0030018 */ lhz r0, 0x18(r3)
/* 00005270 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 00005274 41820084 */ beq lbl_000052F8
/* 00005278 809E0170 */ lwz r4, 0x170(r30)
/* 0000527C 5480103A */ slwi r0, r4, 2
/* 00005280 7C7E0214 */ add r3, r30, r0
/* 00005284 80030174 */ lwz r0, 0x174(r3)
/* 00005288 2C040002 */ cmpwi r4, 2
/* 0000528C 68000001 */ xori r0, r0, 1
/* 00005290 90030174 */ stw r0, 0x174(r3)
/* 00005294 41820038 */ beq lbl_000052CC
/* 00005298 40800014 */ bge lbl_000052AC
/* 0000529C 2C040000 */ cmpwi r4, 0
/* 000052A0 41820058 */ beq lbl_000052F8
/* 000052A4 40800018 */ bge lbl_000052BC
/* 000052A8 48000050 */ b lbl_000052F8
lbl_000052AC:
/* 000052AC 2C040004 */ cmpwi r4, 4
/* 000052B0 4182003C */ beq lbl_000052EC
/* 000052B4 40800044 */ bge lbl_000052F8
/* 000052B8 48000024 */ b lbl_000052DC
lbl_000052BC:
/* 000052BC 807E0160 */ lwz r3, 0x160(r30)
/* 000052C0 38800008 */ li r4, 8
/* 000052C4 4BFFAE99 */ bl set_shape_flags_in_model
/* 000052C8 48000030 */ b lbl_000052F8
lbl_000052CC:
/* 000052CC 807E0160 */ lwz r3, 0x160(r30)
/* 000052D0 38800001 */ li r4, 1
/* 000052D4 4BFFAE89 */ bl set_shape_flags_in_model
/* 000052D8 48000020 */ b lbl_000052F8
lbl_000052DC:
/* 000052DC 807E0160 */ lwz r3, 0x160(r30)
/* 000052E0 38800002 */ li r4, 2
/* 000052E4 4BFFAE79 */ bl set_shape_flags_in_model
/* 000052E8 48000010 */ b lbl_000052F8
lbl_000052EC:
/* 000052EC 807E0160 */ lwz r3, 0x160(r30)
/* 000052F0 38800004 */ li r4, 4
/* 000052F4 4BFFAE69 */ bl set_shape_flags_in_model
lbl_000052F8:
/* 000052F8 3B600000 */ li r27, 0
/* 000052FC 5760103A */ slwi r0, r27, 2
/* 00005300 7FBE0214 */ add r29, r30, r0
/* 00005304 577C083C */ slwi r28, r27, 1
/* 00005308 3BBD0174 */ addi r29, r29, 0x174
lbl_0000530C:
/* 0000530C 801E0170 */ lwz r0, 0x170(r30)
/* 00005310 7C1B0000 */ cmpw r27, r0
/* 00005314 40820018 */ bne lbl_0000532C
/* 00005318 38600002 */ li r3, 2
/* 0000531C 4BFFAE41 */ bl window_set_text_color
/* 00005320 387F2FC0 */ addi r3, r31, 0x2fc0
/* 00005324 4BFFAE39 */ bl u_debug_print
/* 00005328 48000014 */ b lbl_0000533C
lbl_0000532C:
/* 0000532C 38600000 */ li r3, 0
/* 00005330 4BFFAE2D */ bl window_set_text_color
/* 00005334 387F2FC4 */ addi r3, r31, 0x2fc4
/* 00005338 4BFFAE25 */ bl u_debug_print
lbl_0000533C:
/* 0000533C 801D0000 */ lwz r0, 0(r29)
/* 00005340 7C1C0214 */ add r0, r28, r0
/* 00005344 5400103A */ slwi r0, r0, 2
/* 00005348 7C7F0214 */ add r3, r31, r0
/* 0000534C 80632F64 */ lwz r3, 0x2f64(r3)
/* 00005350 4BFFAE0D */ bl u_debug_print
/* 00005354 387F0140 */ addi r3, r31, 0x140
/* 00005358 4BFFAE05 */ bl u_debug_print
/* 0000535C 3B7B0001 */ addi r27, r27, 1
/* 00005360 281B0005 */ cmplwi r27, 5
/* 00005364 3BBD0004 */ addi r29, r29, 4
/* 00005368 3B9C0002 */ addi r28, r28, 2
/* 0000536C 4180FFA0 */ blt lbl_0000530C
/* 00005370 BB61000C */ lmw r27, 0xc(r1)
/* 00005374 80010024 */ lwz r0, 0x24(r1)
/* 00005378 38210020 */ addi r1, r1, 0x20
/* 0000537C 7C0803A6 */ mtlr r0
/* 00005380 4E800020 */ blr 
