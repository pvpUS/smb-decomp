/* 0000F174 7C0802A6 */ mflr r0
/* 0000F178 90010004 */ stw r0, 4(r1)
/* 0000F17C 9421FF78 */ stwu r1, -0x88(r1)
/* 0000F180 BF610074 */ stmw r27, 0x74(r1)
/* 0000F184 7C7C1B78 */ mr r28, r3
/* 0000F188 80030048 */ lwz r0, 0x48(r3)
/* 0000F18C 3C600000 */ lis r3, modeCtrl@ha
/* 0000F190 38630000 */ addi r3, r3, modeCtrl@l
/* 0000F194 1C8001A4 */ mulli r4, r0, 0x1a4
/* 0000F198 80030030 */ lwz r0, 0x30(r3)
/* 0000F19C 3C600000 */ lis r3, ballInfo@ha
/* 0000F1A0 38630000 */ addi r3, r3, ballInfo@l
/* 0000F1A4 7C632214 */ add r3, r3, r4
/* 0000F1A8 3C800000 */ lis r4, lbl_00013C48@ha
/* 0000F1AC 80A30144 */ lwz r5, 0x144(r3)
/* 0000F1B0 2C000001 */ cmpwi r0, 1
/* 0000F1B4 3BE40000 */ addi r31, r4, lbl_00013C48@l
/* 0000F1B8 408200A8 */ bne lbl_0000F260
/* 0000F1BC C83F0210 */ lfd f1, 0x210(r31)
/* 0000F1C0 3C600100 */ lis r3, 0x100
/* 0000F1C4 C01C0040 */ lfs f0, 0x40(r28)
/* 0000F1C8 38A3FFFF */ addi r5, r3, -1
/* 0000F1CC 39000000 */ li r8, 0
/* 0000F1D0 FC010032 */ fmul f0, f1, f0
/* 0000F1D4 38E0FFFF */ li r7, -1
/* 0000F1D8 38C00005 */ li r6, 5
/* 0000F1DC 3880000A */ li r4, 0xa
/* 0000F1E0 38000730 */ li r0, 0x730
/* 0000F1E4 FC000018 */ frsp f0, f0
/* 0000F1E8 3861000C */ addi r3, r1, 0xc
/* 0000F1EC D001001C */ stfs f0, 0x1c(r1)
/* 0000F1F0 C83F0210 */ lfd f1, 0x210(r31)
/* 0000F1F4 C01C0044 */ lfs f0, 0x44(r28)
/* 0000F1F8 FC010032 */ fmul f0, f1, f0
/* 0000F1FC FC000018 */ frsp f0, f0
/* 0000F200 D0010020 */ stfs f0, 0x20(r1)
/* 0000F204 C01F0018 */ lfs f0, 0x18(r31)
/* 0000F208 D0010028 */ stfs f0, 0x28(r1)
/* 0000F20C D0010024 */ stfs f0, 0x24(r1)
/* 0000F210 C01F0008 */ lfs f0, 8(r31)
/* 0000F214 D0010030 */ stfs f0, 0x30(r1)
/* 0000F218 D001002C */ stfs f0, 0x2c(r1)
/* 0000F21C 91010034 */ stw r8, 0x34(r1)
/* 0000F220 90E1003C */ stw r7, 0x3c(r1)
/* 0000F224 90C10040 */ stw r6, 0x40(r1)
/* 0000F228 C01C006C */ lfs f0, 0x6c(r28)
/* 0000F22C D0010038 */ stfs f0, 0x38(r1)
/* 0000F230 90A10044 */ stw r5, 0x44(r1)
/* 0000F234 91010048 */ stw r8, 0x48(r1)
/* 0000F238 90810040 */ stw r4, 0x40(r1)
/* 0000F23C 9001000C */ stw r0, 0xc(r1)
/* 0000F240 C01F0000 */ lfs f0, 0(r31)
/* 0000F244 D0010010 */ stfs f0, 0x10(r1)
/* 0000F248 C01C0008 */ lfs f0, 8(r28)
/* 0000F24C D0010014 */ stfs f0, 0x14(r1)
/* 0000F250 C01C004C */ lfs f0, 0x4c(r28)
/* 0000F254 D0010018 */ stfs f0, 0x18(r1)
/* 0000F258 4BFF0F25 */ bl nlSprPut
/* 0000F25C 48000164 */ b lbl_0000F3C0
lbl_0000F260:
/* 0000F260 A8650022 */ lha r3, 0x22(r5)
/* 0000F264 3803FFFF */ addi r0, r3, -1
/* 0000F268 54031838 */ slwi r3, r0, 3
/* 0000F26C 3BA30028 */ addi r29, r3, 0x28
/* 0000F270 7FA5EA14 */ add r29, r5, r29
/* 0000F274 4BFF0F09 */ bl reset_text_draw_settings
/* 0000F278 3C600020 */ lis r3, 0x20
/* 0000F27C 4BFF0F01 */ bl func_80071B50
/* 0000F280 38600045 */ li r3, 0x45
/* 0000F284 4BFF0EF9 */ bl set_text_font
/* 0000F288 3C608889 */ lis r3, 0x8889
/* 0000F28C 80DD0000 */ lwz r6, 0(r29)
/* 0000F290 38A38889 */ addi r5, r3, -30583
/* 0000F294 C09D0004 */ lfs f4, 4(r29)
/* 0000F298 7C053096 */ mulhw r0, r5, r6
/* 0000F29C C03C0004 */ lfs f1, 4(r28)
/* 0000F2A0 C01F0218 */ lfs f0, 0x218(r31)
/* 0000F2A4 C0DF00F4 */ lfs f6, 0xf4(r31)
/* 0000F2A8 EC210028 */ fsubs f1, f1, f0
/* 0000F2AC 7C603214 */ add r3, r0, r6
/* 0000F2B0 C07F0030 */ lfs f3, 0x30(r31)
/* 0000F2B4 7C602E70 */ srawi r0, r3, 5
/* 0000F2B8 C05C0008 */ lfs f2, 8(r28)
/* 0000F2BC 54040FFE */ srwi r4, r0, 0x1f
/* 0000F2C0 7FA02214 */ add r29, r0, r4
/* 0000F2C4 7C05E896 */ mulhw r0, r5, r29
/* 0000F2C8 7C00EA14 */ add r0, r0, r29
/* 0000F2CC 7C052E70 */ srawi r5, r0, 5
/* 0000F2D0 7C042E70 */ srawi r4, r0, 5
/* 0000F2D4 7C602E70 */ srawi r0, r3, 5
/* 0000F2D8 54030FFE */ srwi r3, r0, 0x1f
/* 0000F2DC 7C001A14 */ add r0, r0, r3
/* 0000F2E0 1C00003C */ mulli r0, r0, 0x3c
/* 0000F2E4 7C003050 */ subf r0, r0, r6
/* 0000F2E8 6C008000 */ xoris r0, r0, 0x8000
/* 0000F2EC 9001006C */ stw r0, 0x6c(r1)
/* 0000F2F0 3C004330 */ lis r0, 0x4330
/* 0000F2F4 3C600000 */ lis r3, lbl_00013C70@ha
/* 0000F2F8 90010068 */ stw r0, 0x68(r1)
/* 0000F2FC 54800FFE */ srwi r0, r4, 0x1f
/* 0000F300 C8A30000 */ lfd f5, lbl_00013C70@l(r3)
/* 0000F304 7C040214 */ add r0, r4, r0
/* 0000F308 C8010068 */ lfd f0, 0x68(r1)
/* 0000F30C 1C80003C */ mulli r4, r0, 0x3c
/* 0000F310 EC002828 */ fsubs f0, f0, f5
/* 0000F314 3C601062 */ lis r3, 0x1062
/* 0000F318 EC00202A */ fadds f0, f0, f4
/* 0000F31C 54A60FFE */ srwi r6, r5, 0x1f
/* 0000F320 38034DD3 */ addi r0, r3, 0x4dd3
/* 0000F324 7FA4E850 */ subf r29, r4, r29
/* 0000F328 EC060032 */ fmuls f0, f6, f0
/* 0000F32C 7FC53214 */ add r30, r5, r6
/* 0000F330 EC001824 */ fdivs f0, f0, f3
/* 0000F334 FC00001E */ fctiwz f0, f0
/* 0000F338 D8010060 */ stfd f0, 0x60(r1)
/* 0000F33C 83610064 */ lwz r27, 0x64(r1)
/* 0000F340 7C00D896 */ mulhw r0, r0, r27
/* 0000F344 7C043670 */ srawi r4, r0, 6
/* 0000F348 7C003670 */ srawi r0, r0, 6
/* 0000F34C 54030FFE */ srwi r3, r0, 0x1f
/* 0000F350 7C001A14 */ add r0, r0, r3
/* 0000F354 1C0003E8 */ mulli r0, r0, 0x3e8
/* 0000F358 54830FFE */ srwi r3, r4, 0x1f
/* 0000F35C 7C641A14 */ add r3, r4, r3
/* 0000F360 7FBD1A14 */ add r29, r29, r3
/* 0000F364 7F60D850 */ subf r27, r0, r27
/* 0000F368 4BFF0E15 */ bl set_text_pos
/* 0000F36C 3C600000 */ lis r3, lbl_00015D58@ha
/* 0000F370 4CC63182 */ crclr 6
/* 0000F374 38630000 */ addi r3, r3, lbl_00015D58@l
/* 0000F378 4BFF0E05 */ bl sprite_printf
/* 0000F37C C05F021C */ lfs f2, 0x21c(r31)
/* 0000F380 C01C0008 */ lfs f0, 8(r28)
/* 0000F384 C03C0004 */ lfs f1, 4(r28)
/* 0000F388 EC42002A */ fadds f2, f2, f0
/* 0000F38C 4BFF0DF1 */ bl set_text_pos
/* 0000F390 3C606666 */ lis r3, 0x6666
/* 0000F394 4CC63182 */ crclr 6
/* 0000F398 38036667 */ addi r0, r3, 0x6667
/* 0000F39C 7C00D896 */ mulhw r0, r0, r27
/* 0000F3A0 7C001670 */ srawi r0, r0, 2
/* 0000F3A4 3C600000 */ lis r3, lbl_00015CB8@ha
/* 0000F3A8 54060FFE */ srwi r6, r0, 0x1f
/* 0000F3AC 38630000 */ addi r3, r3, lbl_00015CB8@l
/* 0000F3B0 389E0000 */ addi r4, r30, 0
/* 0000F3B4 38BD0000 */ addi r5, r29, 0
/* 0000F3B8 7CC03214 */ add r6, r0, r6
/* 0000F3BC 4BFF0DC1 */ bl sprite_printf
lbl_0000F3C0:
/* 0000F3C0 BB610074 */ lmw r27, 0x74(r1)
/* 0000F3C4 8001008C */ lwz r0, 0x8c(r1)
/* 0000F3C8 38210088 */ addi r1, r1, 0x88
/* 0000F3CC 7C0803A6 */ mtlr r0
/* 0000F3D0 4E800020 */ blr 
