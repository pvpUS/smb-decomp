/* 0000AD9C 7C0802A6 */ mflr r0
/* 0000ADA0 90010004 */ stw r0, 4(r1)
/* 0000ADA4 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000ADA8 93E1000C */ stw r31, 0xc(r1)
/* 0000ADAC 4BFF53B9 */ bl u_draw_ball_shadow
/* 0000ADB0 4BFF53B5 */ bl background_light_assign
/* 0000ADB4 3C600000 */ lis r3, eventInfo@ha
/* 0000ADB8 38630000 */ addi r3, r3, eventInfo@l
/* 0000ADBC 880301E0 */ lbz r0, 0x1e0(r3)
/* 0000ADC0 3BE301E0 */ addi r31, r3, 0x1e0
/* 0000ADC4 2C000002 */ cmpwi r0, 2
/* 0000ADC8 4082000C */ bne lbl_0000ADD4
/* 0000ADCC 38600004 */ li r3, 4
/* 0000ADD0 4BFF5395 */ bl rend_efc_draw
lbl_0000ADD4:
/* 0000ADD4 3C600000 */ lis r3, eventInfo@ha
/* 0000ADD8 38630000 */ addi r3, r3, eventInfo@l
/* 0000ADDC 88030018 */ lbz r0, 0x18(r3)
/* 0000ADE0 7C000774 */ extsb r0, r0
/* 0000ADE4 2C000002 */ cmpwi r0, 2
/* 0000ADE8 4182000C */ beq lbl_0000ADF4
/* 0000ADEC 2C000004 */ cmpwi r0, 4
/* 0000ADF0 40820008 */ bne lbl_0000ADF8
lbl_0000ADF4:
/* 0000ADF4 4BFF5371 */ bl stage_draw
lbl_0000ADF8:
/* 0000ADF8 4BFF536D */ bl poly_shadow_draw
/* 0000ADFC 3C600000 */ lis r3, eventInfo@ha
/* 0000AE00 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE04 880301C8 */ lbz r0, 0x1c8(r3)
/* 0000AE08 2C000002 */ cmpwi r0, 2
/* 0000AE0C 40820020 */ bne lbl_0000AE2C
/* 0000AE10 3C600000 */ lis r3, lbl_0001C25C@ha
/* 0000AE14 C0230000 */ lfs f1, lbl_0001C25C@l(r3)
/* 0000AE18 4BFF534D */ bl ord_tbl_set_depth_offset
/* 0000AE1C 4BFF5349 */ bl background_draw
/* 0000AE20 3C600000 */ lis r3, lbl_0001C244@ha
/* 0000AE24 C0230000 */ lfs f1, lbl_0001C244@l(r3)
/* 0000AE28 4BFF533D */ bl ord_tbl_set_depth_offset
lbl_0000AE2C:
/* 0000AE2C 881F0000 */ lbz r0, 0(r31)
/* 0000AE30 2C000002 */ cmpwi r0, 2
/* 0000AE34 4082000C */ bne lbl_0000AE40
/* 0000AE38 38600010 */ li r3, 0x10
/* 0000AE3C 4BFF5329 */ bl rend_efc_draw
lbl_0000AE40:
/* 0000AE40 3C600000 */ lis r3, eventInfo@ha
/* 0000AE44 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE48 88030078 */ lbz r0, 0x78(r3)
/* 0000AE4C 2C000002 */ cmpwi r0, 2
/* 0000AE50 40820008 */ bne lbl_0000AE58
/* 0000AE54 4BFF5311 */ bl item_draw
lbl_0000AE58:
/* 0000AE58 3C600000 */ lis r3, eventInfo@ha
/* 0000AE5C 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE60 88030060 */ lbz r0, 0x60(r3)
/* 0000AE64 2C000002 */ cmpwi r0, 2
/* 0000AE68 40820008 */ bne lbl_0000AE70
/* 0000AE6C 4BFF52F9 */ bl stobj_draw
lbl_0000AE70:
/* 0000AE70 3C600000 */ lis r3, eventInfo@ha
/* 0000AE74 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE78 88030138 */ lbz r0, 0x138(r3)
/* 0000AE7C 2C000002 */ cmpwi r0, 2
/* 0000AE80 40820008 */ bne lbl_0000AE88
/* 0000AE84 4BFF52E1 */ bl effect_draw
lbl_0000AE88:
/* 0000AE88 3C600000 */ lis r3, eventInfo@ha
/* 0000AE8C 38630000 */ addi r3, r3, eventInfo@l
/* 0000AE90 88030048 */ lbz r0, 0x48(r3)
/* 0000AE94 2C000002 */ cmpwi r0, 2
/* 0000AE98 40820008 */ bne lbl_0000AEA0
/* 0000AE9C 4BFF52C9 */ bl ball_draw
lbl_0000AEA0:
/* 0000AEA0 4BFF52C5 */ bl func_8009CD5C
/* 0000AEA4 4BFF52C1 */ bl ord_tbl_draw_nodes
/* 0000AEA8 3C600000 */ lis r3, backgroundInfo@ha
/* 0000AEAC 38630000 */ addi r3, r3, backgroundInfo@l
/* 0000AEB0 80030008 */ lwz r0, 8(r3)
/* 0000AEB4 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000AEB8 4182000C */ beq lbl_0000AEC4
/* 0000AEBC 38600000 */ li r3, 0
/* 0000AEC0 4BFF52A5 */ bl lens_flare_draw
lbl_0000AEC4:
/* 0000AEC4 881F0000 */ lbz r0, 0(r31)
/* 0000AEC8 2C000002 */ cmpwi r0, 2
/* 0000AECC 4082000C */ bne lbl_0000AED8
/* 0000AED0 38600008 */ li r3, 8
/* 0000AED4 4BFF5291 */ bl rend_efc_draw
lbl_0000AED8:
/* 0000AED8 80010014 */ lwz r0, 0x14(r1)
/* 0000AEDC 83E1000C */ lwz r31, 0xc(r1)
/* 0000AEE0 38210010 */ addi r1, r1, 0x10
/* 0000AEE4 7C0803A6 */ mtlr r0
/* 0000AEE8 4E800020 */ blr 
lbl_0000AEEC:
/* 0000AEEC 7C0802A6 */ mflr r0
/* 0000AEF0 3C600000 */ lis r3, lbl_10017520@ha
/* 0000AEF4 90010004 */ stw r0, 4(r1)
/* 0000AEF8 38830000 */ addi r4, r3, lbl_10017520@l
/* 0000AEFC 3C600000 */ lis r3, lbl_801EED98@ha
/* 0000AF00 9421FFF8 */ stwu r1, -8(r1)
/* 0000AF04 38000001 */ li r0, 1
/* 0000AF08 38630000 */ addi r3, r3, lbl_801EED98@l
/* 0000AF0C B0040146 */ sth r0, 0x146(r4)
/* 0000AF10 88030004 */ lbz r0, 4(r3)
/* 0000AF14 7C000774 */ extsb r0, r0
/* 0000AF18 90040890 */ stw r0, 0x890(r4)
/* 0000AF1C 88030006 */ lbz r0, 6(r3)
/* 0000AF20 98040054 */ stb r0, 0x54(r4)
/* 0000AF24 88030007 */ lbz r0, 7(r3)
/* 0000AF28 98040055 */ stb r0, 0x55(r4)
/* 0000AF2C 88030008 */ lbz r0, 8(r3)
/* 0000AF30 98040056 */ stb r0, 0x56(r4)
/* 0000AF34 4BFF5231 */ bl event_finish_all
/* 0000AF38 3860000F */ li r3, 0xf
/* 0000AF3C 4BFF5229 */ bl event_start
/* 0000AF40 38600003 */ li r3, 3
/* 0000AF44 4BFF5221 */ bl event_start
/* 0000AF48 3860003B */ li r3, 0x3b
/* 0000AF4C 4BFF5219 */ bl camera_set_state_all
/* 0000AF50 3C800000 */ lis r4, currentBall@ha
/* 0000AF54 3C600000 */ lis r3, g_poolInfo@ha
/* 0000AF58 38C40000 */ addi r6, r4, currentBall@l
/* 0000AF5C 38A30000 */ addi r5, r3, g_poolInfo@l
/* 0000AF60 81060000 */ lwz r8, 0(r6)
/* 0000AF64 3C600000 */ lis r3, ballInfo@ha
/* 0000AF68 8125000C */ lwz r9, 0xc(r5)
/* 0000AF6C 38030000 */ addi r0, r3, ballInfo@l
/* 0000AF70 7C070378 */ mr r7, r0
/* 0000AF74 39400000 */ li r10, 0
/* 0000AF78 38800018 */ li r4, 0x18
/* 0000AF7C 3860001D */ li r3, 0x1d
/* 0000AF80 48000028 */ b lbl_0000AFA8
lbl_0000AF84:
/* 0000AF84 88090000 */ lbz r0, 0(r9)
/* 0000AF88 2C000002 */ cmpwi r0, 2
/* 0000AF8C 40820010 */ bne lbl_0000AF9C
/* 0000AF90 90E60000 */ stw r7, 0(r6)
/* 0000AF94 98870003 */ stb r4, 3(r7)
/* 0000AF98 98670148 */ stb r3, 0x148(r7)
lbl_0000AF9C:
/* 0000AF9C 394A0001 */ addi r10, r10, 1
/* 0000AFA0 38E701A4 */ addi r7, r7, 0x1a4
/* 0000AFA4 39290001 */ addi r9, r9, 1
lbl_0000AFA8:
/* 0000AFA8 80050008 */ lwz r0, 8(r5)
/* 0000AFAC 7C0A0000 */ cmpw r10, r0
/* 0000AFB0 4180FFD4 */ blt lbl_0000AF84
/* 0000AFB4 3C600000 */ lis r3, currentBall@ha
/* 0000AFB8 91030000 */ stw r8, currentBall@l(r3)
/* 0000AFBC 8001000C */ lwz r0, 0xc(r1)
/* 0000AFC0 38210008 */ addi r1, r1, 8
/* 0000AFC4 7C0803A6 */ mtlr r0
/* 0000AFC8 4E800020 */ blr 
lbl_0000AFCC:
/* 0000AFCC 3C600000 */ lis r3, lbl_10017664@ha
/* 0000AFD0 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000AFD4 38000002 */ li r0, 2
/* 0000AFD8 B0030002 */ sth r0, 2(r3)
/* 0000AFDC 4E800020 */ blr 
lbl_0000AFE0:
/* 0000AFE0 7C0802A6 */ mflr r0
/* 0000AFE4 3C600000 */ lis r3, lbl_10017520@ha
/* 0000AFE8 90010004 */ stw r0, 4(r1)
/* 0000AFEC 38830000 */ addi r4, r3, lbl_10017520@l
/* 0000AFF0 38000003 */ li r0, 3
/* 0000AFF4 9421FFF8 */ stwu r1, -8(r1)
/* 0000AFF8 38600000 */ li r3, 0
/* 0000AFFC B0040146 */ sth r0, 0x146(r4)
/* 0000B000 3800FFFF */ li r0, -1
/* 0000B004 B0640148 */ sth r3, 0x148(r4)
/* 0000B008 B0040884 */ sth r0, 0x884(r4)
/* 0000B00C 9064088C */ stw r3, 0x88c(r4)
/* 0000B010 480028C9 */ bl lbl_0000D8D8
/* 0000B014 480033D1 */ bl lbl_0000E3E4
/* 0000B018 8001000C */ lwz r0, 0xc(r1)
/* 0000B01C 38210008 */ addi r1, r1, 8
/* 0000B020 7C0803A6 */ mtlr r0
/* 0000B024 4E800020 */ blr 
lbl_0000B028:
/* 0000B028 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B02C 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000B030 38000004 */ li r0, 4
/* 0000B034 B0030002 */ sth r0, 2(r3)
/* 0000B038 4E800020 */ blr 
lbl_0000B03C:
/* 0000B03C 7C0802A6 */ mflr r0
/* 0000B040 3C600000 */ lis r3, lbl_10017520@ha
/* 0000B044 90010004 */ stw r0, 4(r1)
/* 0000B048 38000005 */ li r0, 5
/* 0000B04C 9421FF18 */ stwu r1, -0xe8(r1)
/* 0000B050 BEE100C4 */ stmw r23, 0xc4(r1)
/* 0000B054 3BE30000 */ addi r31, r3, lbl_10017520@l
/* 0000B058 3C600000 */ lis r3, modeCtrl@ha
/* 0000B05C B01F0146 */ sth r0, 0x146(r31)
/* 0000B060 38000258 */ li r0, 0x258
/* 0000B064 94030000 */ stwu r0, modeCtrl@l(r3)
/* 0000B068 3800001E */ li r0, 0x1e
/* 0000B06C 90030018 */ stw r0, 0x18(r3)
/* 0000B070 4BFF50F5 */ bl event_finish_all
/* 0000B074 4BFF50F1 */ bl func_80044920
/* 0000B078 3C60AAAB */ lis r3, 0xaaab
/* 0000B07C A89F0148 */ lha r4, 0x148(r31)
/* 0000B080 3803AAAB */ addi r0, r3, -21845
/* 0000B084 7C002016 */ mulhwu r0, r0, r4
/* 0000B088 5400F87E */ srwi r0, r0, 1
/* 0000B08C 1C000003 */ mulli r0, r0, 3
/* 0000B090 7C002050 */ subf r0, r0, r4
/* 0000B094 7C7F0214 */ add r3, r31, r0
/* 0000B098 88830054 */ lbz r4, 0x54(r3)
/* 0000B09C 3C600000 */ lis r3, lbl_0001CC38@ha
/* 0000B0A0 38030000 */ addi r0, r3, lbl_0001CC38@l
/* 0000B0A4 7C830774 */ extsb r3, r4
/* 0000B0A8 5463103A */ slwi r3, r3, 2
/* 0000B0AC 7FC01A14 */ add r30, r0, r3
/* 0000B0B0 A87E0002 */ lha r3, 2(r30)
/* 0000B0B4 3B7F0148 */ addi r27, r31, 0x148
/* 0000B0B8 4BFF50AD */ bl load_stage
/* 0000B0BC 38600001 */ li r3, 1
/* 0000B0C0 4BFF50A5 */ bl event_start
/* 0000B0C4 38600002 */ li r3, 2
/* 0000B0C8 4BFF509D */ bl event_start
/* 0000B0CC 38600003 */ li r3, 3
/* 0000B0D0 4BFF5095 */ bl event_start
/* 0000B0D4 38600004 */ li r3, 4
/* 0000B0D8 4BFF508D */ bl event_start
/* 0000B0DC 38600005 */ li r3, 5
/* 0000B0E0 4BFF5085 */ bl event_start
/* 0000B0E4 38600007 */ li r3, 7
/* 0000B0E8 4BFF507D */ bl event_start
/* 0000B0EC 3860000F */ li r3, 0xf
/* 0000B0F0 4BFF5075 */ bl event_start
/* 0000B0F4 38600010 */ li r3, 0x10
/* 0000B0F8 4BFF506D */ bl event_start
/* 0000B0FC 38600012 */ li r3, 0x12
/* 0000B100 4BFF5065 */ bl event_start
/* 0000B104 3860000D */ li r3, 0xd
/* 0000B108 4BFF505D */ bl event_start
/* 0000B10C 38600014 */ li r3, 0x14
/* 0000B110 4BFF5055 */ bl event_start
/* 0000B114 38600013 */ li r3, 0x13
/* 0000B118 4BFF504D */ bl event_start
/* 0000B11C 38600009 */ li r3, 9
/* 0000B120 4BFF5045 */ bl event_start
/* 0000B124 3860000B */ li r3, 0xb
/* 0000B128 4BFF503D */ bl event_start
/* 0000B12C 3C600000 */ lis r3, currStageId@ha
/* 0000B130 38630000 */ addi r3, r3, currStageId@l
/* 0000B134 A8630000 */ lha r3, 0(r3)
/* 0000B138 4BFF502D */ bl light_init
/* 0000B13C 38600100 */ li r3, 0x100
/* 0000B140 38800000 */ li r4, 0
/* 0000B144 38A0001E */ li r5, 0x1e
/* 0000B148 4BFF501D */ bl start_screen_fade
/* 0000B14C 3C600000 */ lis r3, infoWork@ha
/* 0000B150 84030000 */ lwzu r0, infoWork@l(r3)
/* 0000B154 60000008 */ ori r0, r0, 8
/* 0000B158 90030000 */ stw r0, 0(r3)
/* 0000B15C 4BFF5009 */ bl rend_efc_mirror_enable
/* 0000B160 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B164 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000B168 3C800000 */ lis r4, currentBall@ha
/* 0000B16C 38A40000 */ addi r5, r4, currentBall@l
/* 0000B170 3BA3000C */ addi r29, r3, 0xc
/* 0000B174 80050000 */ lwz r0, 0(r5)
/* 0000B178 3C800000 */ lis r4, ballInfo@ha
/* 0000B17C 80E3000C */ lwz r7, 0xc(r3)
/* 0000B180 38840000 */ addi r4, r4, ballInfo@l
/* 0000B184 38C40000 */ addi r6, r4, 0
/* 0000B188 3B830008 */ addi r28, r3, 8
/* 0000B18C 39000000 */ li r8, 0
/* 0000B190 38800018 */ li r4, 0x18
/* 0000B194 48000024 */ b lbl_0000B1B8
lbl_0000B198:
/* 0000B198 88670000 */ lbz r3, 0(r7)
/* 0000B19C 2C030002 */ cmpwi r3, 2
/* 0000B1A0 4082000C */ bne lbl_0000B1AC
/* 0000B1A4 90C50000 */ stw r6, 0(r5)
/* 0000B1A8 98860003 */ stb r4, 3(r6)
lbl_0000B1AC:
/* 0000B1AC 39080001 */ addi r8, r8, 1
/* 0000B1B0 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B1B4 38E70001 */ addi r7, r7, 1
lbl_0000B1B8:
/* 0000B1B8 807C0000 */ lwz r3, 0(r28)
/* 0000B1BC 7C081800 */ cmpw r8, r3
/* 0000B1C0 4180FFD8 */ blt lbl_0000B198
/* 0000B1C4 3C600000 */ lis r3, currentBall@ha
/* 0000B1C8 38A30000 */ addi r5, r3, currentBall@l
/* 0000B1CC 90050000 */ stw r0, 0(r5)
/* 0000B1D0 3C600000 */ lis r3, ballInfo@ha
/* 0000B1D4 38630000 */ addi r3, r3, ballInfo@l
/* 0000B1D8 80FD0000 */ lwz r7, 0(r29)
/* 0000B1DC 38C30000 */ addi r6, r3, 0
/* 0000B1E0 39000000 */ li r8, 0
/* 0000B1E4 3880001D */ li r4, 0x1d
/* 0000B1E8 48000024 */ b lbl_0000B20C
lbl_0000B1EC:
/* 0000B1EC 88670000 */ lbz r3, 0(r7)
/* 0000B1F0 2C030002 */ cmpwi r3, 2
/* 0000B1F4 4082000C */ bne lbl_0000B200
/* 0000B1F8 90C50000 */ stw r6, 0(r5)
/* 0000B1FC 98860148 */ stb r4, 0x148(r6)
lbl_0000B200:
/* 0000B200 39080001 */ addi r8, r8, 1
/* 0000B204 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B208 38E70001 */ addi r7, r7, 1
lbl_0000B20C:
/* 0000B20C 807C0000 */ lwz r3, 0(r28)
/* 0000B210 7C081800 */ cmpw r8, r3
/* 0000B214 4180FFD8 */ blt lbl_0000B1EC
/* 0000B218 3C600000 */ lis r3, currentBall@ha
/* 0000B21C 38A30000 */ addi r5, r3, currentBall@l
/* 0000B220 90050000 */ stw r0, 0(r5)
/* 0000B224 3C600000 */ lis r3, ballInfo@ha
/* 0000B228 38630000 */ addi r3, r3, ballInfo@l
/* 0000B22C 80FD0000 */ lwz r7, 0(r29)
/* 0000B230 38C30000 */ addi r6, r3, 0
/* 0000B234 39000000 */ li r8, 0
/* 0000B238 48000030 */ b lbl_0000B268
lbl_0000B23C:
/* 0000B23C 88670000 */ lbz r3, 0(r7)
/* 0000B240 2C030002 */ cmpwi r3, 2
/* 0000B244 40820018 */ bne lbl_0000B25C
/* 0000B248 90C50000 */ stw r6, 0(r5)
/* 0000B24C 808600FC */ lwz r4, 0xfc(r6)
/* 0000B250 80640014 */ lwz r3, 0x14(r4)
/* 0000B254 60630020 */ ori r3, r3, 0x20
/* 0000B258 90640014 */ stw r3, 0x14(r4)
lbl_0000B25C:
/* 0000B25C 39080001 */ addi r8, r8, 1
/* 0000B260 38C601A4 */ addi r6, r6, 0x1a4
/* 0000B264 38E70001 */ addi r7, r7, 1
lbl_0000B268:
/* 0000B268 807C0000 */ lwz r3, 0(r28)
/* 0000B26C 7C081800 */ cmpw r8, r3
/* 0000B270 4180FFCC */ blt lbl_0000B23C
/* 0000B274 3C600000 */ lis r3, currentBall@ha
/* 0000B278 3B430000 */ addi r26, r3, currentBall@l
/* 0000B27C 901A0000 */ stw r0, 0(r26)
/* 0000B280 38610008 */ addi r3, r1, 8
/* 0000B284 38800000 */ li r4, 0
/* 0000B288 38A000AC */ li r5, 0xac
/* 0000B28C 4BFF4ED9 */ bl memset
/* 0000B290 3800001E */ li r0, 0x1e
/* 0000B294 B0010010 */ sth r0, 0x10(r1)
/* 0000B298 3C600000 */ lis r3, ballInfo@ha
/* 0000B29C 38030000 */ addi r0, r3, ballInfo@l
/* 0000B2A0 831A0000 */ lwz r24, 0(r26)
/* 0000B2A4 7C190378 */ mr r25, r0
/* 0000B2A8 83BD0000 */ lwz r29, 0(r29)
/* 0000B2AC 3AE00000 */ li r23, 0
/* 0000B2B0 48000034 */ b lbl_0000B2E4
lbl_0000B2B4:
/* 0000B2B4 881D0000 */ lbz r0, 0(r29)
/* 0000B2B8 2C000002 */ cmpwi r0, 2
/* 0000B2BC 4082001C */ bne lbl_0000B2D8
/* 0000B2C0 933A0000 */ stw r25, 0(r26)
/* 0000B2C4 38610008 */ addi r3, r1, 8
/* 0000B2C8 8819002E */ lbz r0, 0x2e(r25)
/* 0000B2CC 7C000774 */ extsb r0, r0
/* 0000B2D0 B001001C */ sth r0, 0x1c(r1)
/* 0000B2D4 4BFF4E91 */ bl spawn_effect
lbl_0000B2D8:
/* 0000B2D8 3AF70001 */ addi r23, r23, 1
/* 0000B2DC 3B3901A4 */ addi r25, r25, 0x1a4
/* 0000B2E0 3BBD0001 */ addi r29, r29, 1
lbl_0000B2E4:
/* 0000B2E4 801C0000 */ lwz r0, 0(r28)
/* 0000B2E8 7C170000 */ cmpw r23, r0
/* 0000B2EC 4180FFC8 */ blt lbl_0000B2B4
/* 0000B2F0 3C600000 */ lis r3, currentBall@ha
/* 0000B2F4 93030000 */ stw r24, currentBall@l(r3)
/* 0000B2F8 48002DCD */ bl lbl_0000E0C4
/* 0000B2FC 4BFF4E69 */ bl reset_camera_viewport
/* 0000B300 3C600000 */ lis r3, currentCamera@ha
/* 0000B304 38830000 */ addi r4, r3, currentCamera@l
/* 0000B308 3C600000 */ lis r3, cameraInfo@ha
/* 0000B30C 80C40000 */ lwz r6, 0(r4)
/* 0000B310 38630000 */ addi r3, r3, cameraInfo@l
/* 0000B314 90640000 */ stw r3, 0(r4)
/* 0000B318 38000006 */ li r0, 6
/* 0000B31C 38A30284 */ addi r5, r3, 0x284
/* 0000B320 9803001F */ stb r0, 0x1f(r3)
/* 0000B324 90A40000 */ stw r5, 0(r4)
/* 0000B328 38A50284 */ addi r5, r5, 0x284
/* 0000B32C 980302A3 */ stb r0, 0x2a3(r3)
/* 0000B330 90A40000 */ stw r5, 0(r4)
/* 0000B334 9805001F */ stb r0, 0x1f(r5)
/* 0000B338 38A50284 */ addi r5, r5, 0x284
/* 0000B33C 90A40000 */ stw r5, 0(r4)
/* 0000B340 9805001F */ stb r0, 0x1f(r5)
/* 0000B344 90C40000 */ stw r6, 0(r4)
/* 0000B348 A87E0000 */ lha r3, 0(r30)
/* 0000B34C 48003B99 */ bl lbl_0000EEE4
/* 0000B350 48003A59 */ bl lbl_0000EDA8
/* 0000B354 48002601 */ bl lbl_0000D954
/* 0000B358 48009FA9 */ bl lbl_00015300
/* 0000B35C 4800C46D */ bl lbl_000177C8
/* 0000B360 38600030 */ li r3, 0x30
/* 0000B364 38800000 */ li r4, 0
/* 0000B368 4BFF4DFD */ bl u_play_music
/* 0000B36C A8BB0000 */ lha r5, 0(r27)
/* 0000B370 3C60AAAB */ lis r3, 0xaaab
/* 0000B374 3803AAAB */ addi r0, r3, -21845
/* 0000B378 38A50001 */ addi r5, r5, 1
/* 0000B37C 7C002816 */ mulhwu r0, r0, r5
/* 0000B380 5400F87E */ srwi r0, r0, 1
/* 0000B384 1C000003 */ mulli r0, r0, 3
/* 0000B388 7C002850 */ subf r0, r0, r5
/* 0000B38C 7C7F0214 */ add r3, r31, r0
/* 0000B390 88030054 */ lbz r0, 0x54(r3)
/* 0000B394 3C800000 */ lis r4, lbl_0001CC38@ha
/* 0000B398 3C600000 */ lis r3, currStageId@ha
/* 0000B39C 7C050774 */ extsb r5, r0
/* 0000B3A0 A8030000 */ lha r0, currStageId@l(r3)
/* 0000B3A4 54A5103A */ slwi r5, r5, 2
/* 0000B3A8 38640000 */ addi r3, r4, lbl_0001CC38@l
/* 0000B3AC 7C632A14 */ add r3, r3, r5
/* 0000B3B0 A8630002 */ lha r3, 2(r3)
/* 0000B3B4 7C030000 */ cmpw r3, r0
/* 0000B3B8 41820008 */ beq lbl_0000B3C0
/* 0000B3BC 4BFF4DA9 */ bl preload_stage_files
lbl_0000B3C0:
/* 0000B3C0 BAE100C4 */ lmw r23, 0xc4(r1)
/* 0000B3C4 800100EC */ lwz r0, 0xec(r1)
/* 0000B3C8 382100E8 */ addi r1, r1, 0xe8
/* 0000B3CC 7C0803A6 */ mtlr r0
/* 0000B3D0 4E800020 */ blr 
lbl_0000B3D4:
/* 0000B3D4 7C0802A6 */ mflr r0
/* 0000B3D8 3C600000 */ lis r3, debugFlags@ha
/* 0000B3DC 90010004 */ stw r0, 4(r1)
/* 0000B3E0 9421FFF0 */ stwu r1, -0x10(r1)
/* 0000B3E4 93E1000C */ stw r31, 0xc(r1)
/* 0000B3E8 93C10008 */ stw r30, 8(r1)
/* 0000B3EC 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000B3F0 3C600000 */ lis r3, lbl_10017520@ha
/* 0000B3F4 3BE30000 */ addi r31, r3, lbl_10017520@l
/* 0000B3F8 7000000A */ andi. r0, r0, 0xa
/* 0000B3FC 408200FC */ bne lbl_0000B4F8
/* 0000B400 3C600000 */ lis r3, modeCtrl@ha
/* 0000B404 38830000 */ addi r4, r3, modeCtrl@l
/* 0000B408 80640000 */ lwz r3, 0(r4)
/* 0000B40C 2C030000 */ cmpwi r3, 0
/* 0000B410 4081000C */ ble lbl_0000B41C
/* 0000B414 3803FFFF */ addi r0, r3, -1
/* 0000B418 90040000 */ stw r0, 0(r4)
lbl_0000B41C:
/* 0000B41C 3C600000 */ lis r3, modeCtrl@ha
/* 0000B420 38630000 */ addi r3, r3, modeCtrl@l
/* 0000B424 3BC30018 */ addi r30, r3, 0x18
/* 0000B428 80630018 */ lwz r3, 0x18(r3)
/* 0000B42C 2C030000 */ cmpwi r3, 0
/* 0000B430 4081000C */ ble lbl_0000B43C
/* 0000B434 3803FFFF */ addi r0, r3, -1
/* 0000B438 901E0000 */ stw r0, 0(r30)
lbl_0000B43C:
/* 0000B43C 3C600000 */ lis r3, modeCtrl@ha
/* 0000B440 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000B444 2C000249 */ cmpwi r0, 0x249
/* 0000B448 40820034 */ bne lbl_0000B47C
/* 0000B44C 480037A9 */ bl lbl_0000EBF4
/* 0000B450 2C030000 */ cmpwi r3, 0
/* 0000B454 4182000C */ beq lbl_0000B460
/* 0000B458 38600184 */ li r3, 0x184
/* 0000B45C 4800001C */ b lbl_0000B478
lbl_0000B460:
/* 0000B460 A89F0148 */ lha r4, 0x148(r31)
/* 0000B464 3C600000 */ lis r3, lbl_0001CC44@ha
/* 0000B468 38030000 */ addi r0, r3, lbl_0001CC44@l
/* 0000B46C 5483103A */ slwi r3, r4, 2
/* 0000B470 7C601A14 */ add r3, r0, r3
/* 0000B474 80630000 */ lwz r3, 0(r3)
lbl_0000B478:
/* 0000B478 4BFF4CED */ bl u_play_sound_0
lbl_0000B47C:
/* 0000B47C 3C600000 */ lis r3, modeCtrl@ha
/* 0000B480 80830000 */ lwz r4, modeCtrl@l(r3)
/* 0000B484 2C040000 */ cmpwi r4, 0
/* 0000B488 41820024 */ beq lbl_0000B4AC
/* 0000B48C 801E0000 */ lwz r0, 0(r30)
/* 0000B490 2C000000 */ cmpwi r0, 0
/* 0000B494 40820064 */ bne lbl_0000B4F8
/* 0000B498 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000B49C 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000B4A0 A0030004 */ lhz r0, 4(r3)
/* 0000B4A4 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000B4A8 41820050 */ beq lbl_0000B4F8
lbl_0000B4AC:
/* 0000B4AC 38000006 */ li r0, 6
/* 0000B4B0 2C040249 */ cmpwi r4, 0x249
/* 0000B4B4 B01F0146 */ sth r0, 0x146(r31)
/* 0000B4B8 40810034 */ ble lbl_0000B4EC
/* 0000B4BC 48003739 */ bl lbl_0000EBF4
/* 0000B4C0 2C030000 */ cmpwi r3, 0
/* 0000B4C4 4182000C */ beq lbl_0000B4D0
/* 0000B4C8 38600184 */ li r3, 0x184
/* 0000B4CC 4800001C */ b lbl_0000B4E8
lbl_0000B4D0:
/* 0000B4D0 A89F0148 */ lha r4, 0x148(r31)
/* 0000B4D4 3C600000 */ lis r3, lbl_0001CC44@ha
/* 0000B4D8 38030000 */ addi r0, r3, lbl_0001CC44@l
/* 0000B4DC 5483103A */ slwi r3, r4, 2
/* 0000B4E0 7C601A14 */ add r3, r0, r3
/* 0000B4E4 80630000 */ lwz r3, 0(r3)
lbl_0000B4E8:
/* 0000B4E8 4BFF4C7D */ bl u_play_sound_0
lbl_0000B4EC:
/* 0000B4EC 3860002E */ li r3, 0x2e
/* 0000B4F0 38800000 */ li r4, 0
/* 0000B4F4 4BFF4C71 */ bl u_play_music
lbl_0000B4F8:
/* 0000B4F8 80010014 */ lwz r0, 0x14(r1)
/* 0000B4FC 83E1000C */ lwz r31, 0xc(r1)
/* 0000B500 83C10008 */ lwz r30, 8(r1)
/* 0000B504 7C0803A6 */ mtlr r0
/* 0000B508 38210010 */ addi r1, r1, 0x10
/* 0000B50C 4E800020 */ blr 
lbl_0000B510:
/* 0000B510 7C0802A6 */ mflr r0
/* 0000B514 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B518 90010004 */ stw r0, 4(r1)
/* 0000B51C 38000007 */ li r0, 7
/* 0000B520 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000B524 93E10014 */ stw r31, 0x14(r1)
/* 0000B528 93C10010 */ stw r30, 0x10(r1)
/* 0000B52C 93A1000C */ stw r29, 0xc(r1)
/* 0000B530 3BA30000 */ addi r29, r3, lbl_10017664@l
/* 0000B534 3C600000 */ lis r3, modeCtrl@ha
/* 0000B538 B01D0002 */ sth r0, 2(r29)
/* 0000B53C 3BC30000 */ addi r30, r3, modeCtrl@l
/* 0000B540 380000B4 */ li r0, 0xb4
/* 0000B544 901E0000 */ stw r0, 0(r30)
/* 0000B548 480018E1 */ bl lbl_0000CE28
/* 0000B54C 3C600000 */ lis r3, currentCamera@ha
/* 0000B550 38830000 */ addi r4, r3, currentCamera@l
/* 0000B554 3C600000 */ lis r3, cameraInfo@ha
/* 0000B558 80040000 */ lwz r0, 0(r4)
/* 0000B55C 38630000 */ addi r3, r3, cameraInfo@l
/* 0000B560 90640000 */ stw r3, 0(r4)
/* 0000B564 3BE00000 */ li r31, 0
/* 0000B568 38A30284 */ addi r5, r3, 0x284
/* 0000B56C 9BE3001F */ stb r31, 0x1f(r3)
/* 0000B570 90A40000 */ stw r5, 0(r4)
/* 0000B574 38A50284 */ addi r5, r5, 0x284
/* 0000B578 9BE302A3 */ stb r31, 0x2a3(r3)
/* 0000B57C 90A40000 */ stw r5, 0(r4)
/* 0000B580 9BE5001F */ stb r31, 0x1f(r5)
/* 0000B584 38A50284 */ addi r5, r5, 0x284
/* 0000B588 90A40000 */ stw r5, 0(r4)
/* 0000B58C 9BE5001F */ stb r31, 0x1f(r5)
/* 0000B590 90040000 */ stw r0, 0(r4)
/* 0000B594 4800270D */ bl lbl_0000DCA0
/* 0000B598 93FD0738 */ stw r31, 0x738(r29)
/* 0000B59C 3C600000 */ lis r3, lbl_10018CFC@ha
/* 0000B5A0 84030000 */ lwzu r0, lbl_10018CFC@l(r3)
/* 0000B5A4 540007B8 */ rlwinm r0, r0, 0, 0x1e, 0x1c
/* 0000B5A8 90030000 */ stw r0, 0(r3)
/* 0000B5AC 4800B5E1 */ bl lbl_00016B8C
/* 0000B5B0 807E0000 */ lwz r3, 0(r30)
/* 0000B5B4 4800ED7D */ bl lbl_0001A330
/* 0000B5B8 8001001C */ lwz r0, 0x1c(r1)
/* 0000B5BC 83E10014 */ lwz r31, 0x14(r1)
/* 0000B5C0 83C10010 */ lwz r30, 0x10(r1)
/* 0000B5C4 7C0803A6 */ mtlr r0
/* 0000B5C8 83A1000C */ lwz r29, 0xc(r1)
/* 0000B5CC 38210018 */ addi r1, r1, 0x18
/* 0000B5D0 4E800020 */ blr 
lbl_0000B5D4:
/* 0000B5D4 7C0802A6 */ mflr r0
/* 0000B5D8 3C600000 */ lis r3, debugFlags@ha
/* 0000B5DC 90010004 */ stw r0, 4(r1)
/* 0000B5E0 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000B5E4 BF210014 */ stmw r25, 0x14(r1)
/* 0000B5E8 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000B5EC 7000000A */ andi. r0, r0, 0xa
/* 0000B5F0 4082011C */ bne lbl_0000B70C
/* 0000B5F4 3C600000 */ lis r3, modeCtrl@ha
/* 0000B5F8 38C30000 */ addi r6, r3, modeCtrl@l
/* 0000B5FC 80A60000 */ lwz r5, 0(r6)
/* 0000B600 3C800000 */ lis r4, lbl_0001C260@ha
/* 0000B604 3C600000 */ lis r3, lbl_0001C270@ha
/* 0000B608 3805FFFF */ addi r0, r5, -1
/* 0000B60C 90060000 */ stw r0, 0(r6)
/* 0000B610 38A40000 */ addi r5, r4, lbl_0001C260@l
/* 0000B614 3C004330 */ lis r0, 0x4330
/* 0000B618 80860000 */ lwz r4, 0(r6)
/* 0000B61C C8230000 */ lfd f1, lbl_0001C270@l(r3)
/* 0000B620 6C838000 */ xoris r3, r4, 0x8000
/* 0000B624 C8450000 */ lfd f2, 0(r5)
/* 0000B628 9061000C */ stw r3, 0xc(r1)
/* 0000B62C 90010008 */ stw r0, 8(r1)
/* 0000B630 C8010008 */ lfd f0, 8(r1)
/* 0000B634 FC000828 */ fsub f0, f0, f1
/* 0000B638 FC020000 */ fcmpu cr0, f2, f0
/* 0000B63C 40820070 */ bne lbl_0000B6AC
/* 0000B640 3C800000 */ lis r4, currentBall@ha
/* 0000B644 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B648 3BA40000 */ addi r29, r4, currentBall@l
/* 0000B64C 3BC30000 */ addi r30, r3, g_poolInfo@l
/* 0000B650 837D0000 */ lwz r27, 0(r29)
/* 0000B654 3C600000 */ lis r3, ballInfo@ha
/* 0000B658 835E000C */ lwz r26, 0xc(r30)
/* 0000B65C 38030000 */ addi r0, r3, ballInfo@l
/* 0000B660 7C1C0378 */ mr r28, r0
/* 0000B664 3B200000 */ li r25, 0
/* 0000B668 3BE0001E */ li r31, 0x1e
/* 0000B66C 4800002C */ b lbl_0000B698
lbl_0000B670:
/* 0000B670 881A0000 */ lbz r0, 0(r26)
/* 0000B674 2C000002 */ cmpwi r0, 2
/* 0000B678 40820014 */ bne lbl_0000B68C
/* 0000B67C 939D0000 */ stw r28, 0(r29)
/* 0000B680 7F83E378 */ mr r3, r28
/* 0000B684 9BFC0148 */ stb r31, 0x148(r28)
/* 0000B688 48002209 */ bl lbl_0000D890
lbl_0000B68C:
/* 0000B68C 3B390001 */ addi r25, r25, 1
/* 0000B690 3B9C01A4 */ addi r28, r28, 0x1a4
/* 0000B694 3B5A0001 */ addi r26, r26, 1
lbl_0000B698:
/* 0000B698 801E0008 */ lwz r0, 8(r30)
/* 0000B69C 7C190000 */ cmpw r25, r0
/* 0000B6A0 4180FFD0 */ blt lbl_0000B670
/* 0000B6A4 3C600000 */ lis r3, currentBall@ha
/* 0000B6A8 93630000 */ stw r27, currentBall@l(r3)
lbl_0000B6AC:
/* 0000B6AC 3C600000 */ lis r3, modeCtrl@ha
/* 0000B6B0 38630000 */ addi r3, r3, modeCtrl@l
/* 0000B6B4 80630000 */ lwz r3, 0(r3)
/* 0000B6B8 3C800000 */ lis r4, lbl_0001C270@ha
/* 0000B6BC C8240000 */ lfd f1, lbl_0001C270@l(r4)
/* 0000B6C0 3C800000 */ lis r4, lbl_0001C268@ha
/* 0000B6C4 6C608000 */ xoris r0, r3, 0x8000
/* 0000B6C8 9001000C */ stw r0, 0xc(r1)
/* 0000B6CC 3C004330 */ lis r0, 0x4330
/* 0000B6D0 C8440000 */ lfd f2, lbl_0001C268@l(r4)
/* 0000B6D4 90010008 */ stw r0, 8(r1)
/* 0000B6D8 C8010008 */ lfd f0, 8(r1)
/* 0000B6DC FC000828 */ fsub f0, f0, f1
/* 0000B6E0 FC020000 */ fcmpu cr0, f2, f0
/* 0000B6E4 40820008 */ bne lbl_0000B6EC
/* 0000B6E8 4800EC79 */ bl lbl_0001A360
lbl_0000B6EC:
/* 0000B6EC 3C600000 */ lis r3, modeCtrl@ha
/* 0000B6F0 80030000 */ lwz r0, modeCtrl@l(r3)
/* 0000B6F4 2C000000 */ cmpwi r0, 0
/* 0000B6F8 40820014 */ bne lbl_0000B70C
/* 0000B6FC 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B700 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000B704 38000008 */ li r0, 8
/* 0000B708 B0030002 */ sth r0, 2(r3)
lbl_0000B70C:
/* 0000B70C BB210014 */ lmw r25, 0x14(r1)
/* 0000B710 80010034 */ lwz r0, 0x34(r1)
/* 0000B714 38210030 */ addi r1, r1, 0x30
/* 0000B718 7C0803A6 */ mtlr r0
/* 0000B71C 4E800020 */ blr 
lbl_0000B720:
/* 0000B720 7C0802A6 */ mflr r0
/* 0000B724 3C600000 */ lis r3, lbl_10017664@ha
/* 0000B728 90010004 */ stw r0, 4(r1)
/* 0000B72C 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000B730 38000009 */ li r0, 9
/* 0000B734 9421FFD8 */ stwu r1, -0x28(r1)
/* 0000B738 3CA00000 */ lis r5, modeCtrl@ha
/* 0000B73C 3C800000 */ lis r4, worldInfo@ha
/* 0000B740 BF010008 */ stmw r24, 8(r1)
/* 0000B744 38C00000 */ li r6, 0
/* 0000B748 B0030002 */ sth r0, 2(r3)
/* 0000B74C 38040000 */ addi r0, r4, worldInfo@l
/* 0000B750 38850000 */ addi r4, r5, modeCtrl@l
/* 0000B754 38A0003C */ li r5, 0x3c
/* 0000B758 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B75C 90A40000 */ stw r5, 0(r4)
/* 0000B760 38630000 */ addi r3, r3, g_poolInfo@l
/* 0000B764 80A3000C */ lwz r5, 0xc(r3)
/* 0000B768 3BC3000C */ addi r30, r3, 0xc
/* 0000B76C 3BA30008 */ addi r29, r3, 8
/* 0000B770 7C040378 */ mr r4, r0
/* 0000B774 38600001 */ li r3, 1
/* 0000B778 48000020 */ b lbl_0000B798
lbl_0000B77C:
/* 0000B77C 88050000 */ lbz r0, 0(r5)
/* 0000B780 2C000002 */ cmpwi r0, 2
/* 0000B784 40820008 */ bne lbl_0000B78C
/* 0000B788 98640008 */ stb r3, 8(r4)
lbl_0000B78C:
/* 0000B78C 38C60001 */ addi r6, r6, 1
/* 0000B790 38840040 */ addi r4, r4, 0x40
/* 0000B794 38A50001 */ addi r5, r5, 1
lbl_0000B798:
/* 0000B798 801D0000 */ lwz r0, 0(r29)
/* 0000B79C 7C060000 */ cmpw r6, r0
/* 0000B7A0 4180FFDC */ blt lbl_0000B77C
/* 0000B7A4 3C600000 */ lis r3, currentBall@ha
/* 0000B7A8 80DE0000 */ lwz r6, 0(r30)
/* 0000B7AC 38830000 */ addi r4, r3, currentBall@l
/* 0000B7B0 3C600000 */ lis r3, ballInfo@ha
/* 0000B7B4 80A40000 */ lwz r5, 0(r4)
/* 0000B7B8 38030000 */ addi r0, r3, ballInfo@l
/* 0000B7BC 7C030378 */ mr r3, r0
/* 0000B7C0 38E00000 */ li r7, 0
/* 0000B7C4 4800002C */ b lbl_0000B7F0
lbl_0000B7C8:
/* 0000B7C8 88060000 */ lbz r0, 0(r6)
/* 0000B7CC 2C000002 */ cmpwi r0, 2
/* 0000B7D0 40820014 */ bne lbl_0000B7E4
/* 0000B7D4 90640000 */ stw r3, 0(r4)
/* 0000B7D8 80030094 */ lwz r0, 0x94(r3)
/* 0000B7DC 64000001 */ oris r0, r0, 1
/* 0000B7E0 90030094 */ stw r0, 0x94(r3)
lbl_0000B7E4:
/* 0000B7E4 38E70001 */ addi r7, r7, 1
/* 0000B7E8 386301A4 */ addi r3, r3, 0x1a4
/* 0000B7EC 38C60001 */ addi r6, r6, 1
lbl_0000B7F0:
/* 0000B7F0 801D0000 */ lwz r0, 0(r29)
/* 0000B7F4 7C070000 */ cmpw r7, r0
/* 0000B7F8 4180FFD0 */ blt lbl_0000B7C8
/* 0000B7FC 3C600000 */ lis r3, currentBall@ha
/* 0000B800 3BE30000 */ addi r31, r3, currentBall@l
/* 0000B804 3C600000 */ lis r3, infoWork@ha
/* 0000B808 90BF0000 */ stw r5, 0(r31)
/* 0000B80C 38830000 */ addi r4, r3, infoWork@l
/* 0000B810 80040000 */ lwz r0, 0(r4)
/* 0000B814 3C600001 */ lis r3, 1
/* 0000B818 3863D8FC */ addi r3, r3, -9988
/* 0000B81C 54000776 */ rlwinm r0, r0, 0, 0x1d, 0x1b
/* 0000B820 90040000 */ stw r0, 0(r4)
/* 0000B824 4BFF4941 */ bl u_play_sound_0
/* 0000B828 38600183 */ li r3, 0x183
/* 0000B82C 4BFF4939 */ bl u_play_sound_0
/* 0000B830 3C600000 */ lis r3, ballInfo@ha
/* 0000B834 839F0000 */ lwz r28, 0(r31)
/* 0000B838 38030000 */ addi r0, r3, ballInfo@l
/* 0000B83C 833E0000 */ lwz r25, 0(r30)
/* 0000B840 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 0000B844 3C600000 */ lis r3, u_somePlayerId@ha
/* 0000B848 7C1A0378 */ mr r26, r0
/* 0000B84C 3B640000 */ addi r27, r4, lbl_802F1DFC@l
/* 0000B850 3BC30000 */ addi r30, r3, u_somePlayerId@l
/* 0000B854 3B000000 */ li r24, 0
/* 0000B858 48000040 */ b lbl_0000B898
lbl_0000B85C:
/* 0000B85C 88190000 */ lbz r0, 0(r25)
/* 0000B860 2C000002 */ cmpwi r0, 2
/* 0000B864 40820028 */ bne lbl_0000B88C
/* 0000B868 935F0000 */ stw r26, 0(r31)
/* 0000B86C 3860001E */ li r3, 0x1e
/* 0000B870 809A00FC */ lwz r4, 0xfc(r26)
/* 0000B874 80040010 */ lwz r0, 0x10(r4)
/* 0000B878 901B0000 */ stw r0, 0(r27)
/* 0000B87C 881A002E */ lbz r0, 0x2e(r26)
/* 0000B880 7C000774 */ extsb r0, r0
/* 0000B884 901E0000 */ stw r0, 0(r30)
/* 0000B888 4BFF48DD */ bl u_play_sound_0
lbl_0000B88C:
/* 0000B88C 3B180001 */ addi r24, r24, 1
/* 0000B890 3B5A01A4 */ addi r26, r26, 0x1a4
/* 0000B894 3B390001 */ addi r25, r25, 1
lbl_0000B898:
/* 0000B898 801D0000 */ lwz r0, 0(r29)
/* 0000B89C 7C180000 */ cmpw r24, r0
/* 0000B8A0 4180FFBC */ blt lbl_0000B85C
/* 0000B8A4 3C600000 */ lis r3, currentBall@ha
/* 0000B8A8 93830000 */ stw r28, currentBall@l(r3)
/* 0000B8AC BB010008 */ lmw r24, 8(r1)
/* 0000B8B0 8001002C */ lwz r0, 0x2c(r1)
/* 0000B8B4 38210028 */ addi r1, r1, 0x28
/* 0000B8B8 7C0803A6 */ mtlr r0
/* 0000B8BC 4E800020 */ blr 
lbl_0000B8C0:
/* 0000B8C0 7C0802A6 */ mflr r0
/* 0000B8C4 3C600000 */ lis r3, debugFlags@ha
/* 0000B8C8 90010004 */ stw r0, 4(r1)
/* 0000B8CC 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000B8D0 BE010010 */ stmw r16, 0x10(r1)
/* 0000B8D4 80030000 */ lwz r0, debugFlags@l(r3)
/* 0000B8D8 3C600000 */ lis r3, lbl_10017520@ha
/* 0000B8DC 3AC30000 */ addi r22, r3, lbl_10017520@l
/* 0000B8E0 7000000A */ andi. r0, r0, 0xa
/* 0000B8E4 40820358 */ bne lbl_0000BC3C
/* 0000B8E8 3C800000 */ lis r4, currentBall@ha
/* 0000B8EC 3C600000 */ lis r3, g_poolInfo@ha
/* 0000B8F0 3AE40000 */ addi r23, r4, currentBall@l
/* 0000B8F4 3B030000 */ addi r24, r3, g_poolInfo@l
/* 0000B8F8 82770000 */ lwz r19, 0(r23)
/* 0000B8FC 3C800000 */ lis r4, ballInfo@ha
/* 0000B900 8258000C */ lwz r18, 0xc(r24)
/* 0000B904 3C600000 */ lis r3, lbl_100188E8@ha
/* 0000B908 38040000 */ addi r0, r4, ballInfo@l
/* 0000B90C 3BA30000 */ addi r29, r3, lbl_100188E8@l
/* 0000B910 3C600000 */ lis r3, worldInfo@ha
/* 0000B914 3C800000 */ lis r4, lbl_0001C24C@ha
/* 0000B918 3CE00000 */ lis r7, controllerInfo@ha
/* 0000B91C 3CC00000 */ lis r6, playerControllerIDs@ha
/* 0000B920 3CA00000 */ lis r5, lbl_0001C268@ha
/* 0000B924 7C140378 */ mr r20, r0
/* 0000B928 3BE30000 */ addi r31, r3, worldInfo@l
/* 0000B92C 3ABD0004 */ addi r21, r29, 4
/* 0000B930 3BC40000 */ addi r30, r4, lbl_0001C24C@l
/* 0000B934 3B270000 */ addi r25, r7, controllerInfo@l
/* 0000B938 3B460000 */ addi r26, r6, playerControllerIDs@l
/* 0000B93C 3B850000 */ addi r28, r5, lbl_0001C268@l
/* 0000B940 3A200000 */ li r17, 0
/* 0000B944 3A000000 */ li r16, 0
/* 0000B948 3F604330 */ lis r27, 0x4330
/* 0000B94C 48000244 */ b lbl_0000BB90
lbl_0000B950:
/* 0000B950 88120000 */ lbz r0, 0(r18)
/* 0000B954 2C000002 */ cmpwi r0, 2
/* 0000B958 40820228 */ bne lbl_0000BB80
/* 0000B95C 92970000 */ stw r20, 0(r23)
/* 0000B960 88140148 */ lbz r0, 0x148(r20)
/* 0000B964 2C000024 */ cmpwi r0, 0x24
/* 0000B968 4182007C */ beq lbl_0000B9E4
/* 0000B96C 40800010 */ bge lbl_0000B97C
/* 0000B970 2C000021 */ cmpwi r0, 0x21
/* 0000B974 41820018 */ beq lbl_0000B98C
/* 0000B978 480001D0 */ b lbl_0000BB48
lbl_0000B97C:
/* 0000B97C 2C000027 */ cmpwi r0, 0x27
/* 0000B980 4182010C */ beq lbl_0000BA8C
/* 0000B984 408001C4 */ bge lbl_0000BB48
/* 0000B988 480000D8 */ b lbl_0000BA60
lbl_0000B98C:
/* 0000B98C 8814002E */ lbz r0, 0x2e(r20)
/* 0000B990 7C000774 */ extsb r0, r0
/* 0000B994 5400103A */ slwi r0, r0, 2
/* 0000B998 7C7A0214 */ add r3, r26, r0
/* 0000B99C 80030000 */ lwz r0, 0(r3)
/* 0000B9A0 1C00003C */ mulli r0, r0, 0x3c
/* 0000B9A4 7C790214 */ add r3, r25, r0
/* 0000B9A8 A0030018 */ lhz r0, 0x18(r3)
/* 0000B9AC 540005EF */ rlwinm. r0, r0, 0, 0x17, 0x17
/* 0000B9B0 40820010 */ bne lbl_0000B9C0
/* 0000B9B4 80140080 */ lwz r0, 0x80(r20)
/* 0000B9B8 2C0000B4 */ cmpwi r0, 0xb4
/* 0000B9BC 4081018C */ ble lbl_0000BB48
lbl_0000B9C0:
/* 0000B9C0 38000022 */ li r0, 0x22
/* 0000B9C4 98140148 */ stb r0, 0x148(r20)
/* 0000B9C8 38800001 */ li r4, 1
/* 0000B9CC 8814002E */ lbz r0, 0x2e(r20)
/* 0000B9D0 7C000774 */ extsb r0, r0
/* 0000B9D4 54003032 */ slwi r0, r0, 6
/* 0000B9D8 7C7F0214 */ add r3, r31, r0
/* 0000B9DC 98830008 */ stb r4, 8(r3)
/* 0000B9E0 48000168 */ b lbl_0000BB48
lbl_0000B9E4:
/* 0000B9E4 A8140124 */ lha r0, 0x124(r20)
/* 0000B9E8 3C600000 */ lis r3, lbl_0001C270@ha
/* 0000B9EC C8430000 */ lfd f2, lbl_0001C270@l(r3)
/* 0000B9F0 6C008000 */ xoris r0, r0, 0x8000
/* 0000B9F4 C81C0000 */ lfd f0, 0(r28)
/* 0000B9F8 9001000C */ stw r0, 0xc(r1)
/* 0000B9FC 93610008 */ stw r27, 8(r1)
/* 0000BA00 C8210008 */ lfd f1, 8(r1)
/* 0000BA04 FC211028 */ fsub f1, f1, f2
/* 0000BA08 FC010040 */ fcmpo cr0, f1, f0
/* 0000BA0C 4081013C */ ble lbl_0000BB48
/* 0000BA10 80140094 */ lwz r0, 0x94(r20)
/* 0000BA14 38740000 */ addi r3, r20, 0
/* 0000BA18 54000566 */ rlwinm r0, r0, 0, 0x15, 0x13
/* 0000BA1C 90140094 */ stw r0, 0x94(r20)
/* 0000BA20 4BFF4745 */ bl unref_func_800393F8
/* 0000BA24 7E83A378 */ mr r3, r20
/* 0000BA28 480045F1 */ bl lbl_00010018
/* 0000BA2C 7E83A378 */ mr r3, r20
/* 0000BA30 48002979 */ bl lbl_0000E3A8
/* 0000BA34 3800001F */ li r0, 0x1f
/* 0000BA38 98140148 */ stb r0, 0x148(r20)
/* 0000BA3C 38A00004 */ li r5, 4
/* 0000BA40 38740000 */ addi r3, r20, 0
/* 0000BA44 8814002E */ lbz r0, 0x2e(r20)
/* 0000BA48 7C000774 */ extsb r0, r0
/* 0000BA4C 54003032 */ slwi r0, r0, 6
/* 0000BA50 7C9F0214 */ add r4, r31, r0
/* 0000BA54 98A40008 */ stb r5, 8(r4)
/* 0000BA58 48001E39 */ bl lbl_0000D890
/* 0000BA5C 480000EC */ b lbl_0000BB48
lbl_0000BA60:
/* 0000BA60 80140094 */ lwz r0, 0x94(r20)
/* 0000BA64 54000253 */ rlwinm. r0, r0, 0, 9, 9
/* 0000BA68 40820024 */ bne lbl_0000BA8C
/* 0000BA6C 38000027 */ li r0, 0x27
/* 0000BA70 98140148 */ stb r0, 0x148(r20)
/* 0000BA74 38800002 */ li r4, 2
/* 0000BA78 8814002E */ lbz r0, 0x2e(r20)
/* 0000BA7C 7C000774 */ extsb r0, r0
/* 0000BA80 54003032 */ slwi r0, r0, 6
/* 0000BA84 7C7F0214 */ add r3, r31, r0
/* 0000BA88 98830008 */ stb r4, 8(r3)
lbl_0000BA8C:
/* 0000BA8C 38740004 */ addi r3, r20, 4
/* 0000BA90 C0A30000 */ lfs f5, 0(r3)
/* 0000BA94 C0550000 */ lfs f2, 0(r21)
/* 0000BA98 C0830004 */ lfs f4, 4(r3)
/* 0000BA9C C0350004 */ lfs f1, 4(r21)
/* 0000BAA0 C0630008 */ lfs f3, 8(r3)
/* 0000BAA4 C0150008 */ lfs f0, 8(r21)
/* 0000BAA8 ECA51028 */ fsubs f5, f5, f2
/* 0000BAAC EC840828 */ fsubs f4, f4, f1
/* 0000BAB0 EC630028 */ fsubs f3, f3, f0
/* 0000BAB4 EC250172 */ fmuls f1, f5, f5
/* 0000BAB8 EC24093A */ fmadds f1, f4, f4, f1
/* 0000BABC EC2308FA */ fmadds f1, f3, f3, f1
/* 0000BAC0 4BFF46A5 */ bl mathutil_sqrt
/* 0000BAC4 C05E0000 */ lfs f2, 0(r30)
/* 0000BAC8 C01D0010 */ lfs f0, 0x10(r29)
/* 0000BACC EC020032 */ fmuls f0, f2, f0
/* 0000BAD0 FC010040 */ fcmpo cr0, f1, f0
/* 0000BAD4 40810010 */ ble lbl_0000BAE4
/* 0000BAD8 80140094 */ lwz r0, 0x94(r20)
/* 0000BADC 60000800 */ ori r0, r0, 0x800
/* 0000BAE0 90140094 */ stw r0, 0x94(r20)
lbl_0000BAE4:
/* 0000BAE4 80140094 */ lwz r0, 0x94(r20)
/* 0000BAE8 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 0000BAEC 4182005C */ beq lbl_0000BB48
/* 0000BAF0 38000023 */ li r0, 0x23
/* 0000BAF4 98140148 */ stb r0, 0x148(r20)
/* 0000BAF8 7E83A378 */ mr r3, r20
/* 0000BAFC 4BFF4669 */ bl unref_func_800393F8
/* 0000BB00 7E83A378 */ mr r3, r20
/* 0000BB04 48004515 */ bl lbl_00010018
/* 0000BB08 8814002E */ lbz r0, 0x2e(r20)
/* 0000BB0C 38800000 */ li r4, 0
/* 0000BB10 38A00004 */ li r5, 4
/* 0000BB14 7C000774 */ extsb r0, r0
/* 0000BB18 1C000018 */ mulli r0, r0, 0x18
/* 0000BB1C 7C760214 */ add r3, r22, r0
/* 0000BB20 B0830152 */ sth r4, 0x152(r3)
/* 0000BB24 7E83A378 */ mr r3, r20
/* 0000BB28 8814002E */ lbz r0, 0x2e(r20)
/* 0000BB2C 7C000774 */ extsb r0, r0
/* 0000BB30 54003032 */ slwi r0, r0, 6
/* 0000BB34 7C9F0214 */ add r4, r31, r0
/* 0000BB38 98A40008 */ stb r5, 8(r4)
/* 0000BB3C 48001EA5 */ bl lbl_0000D9E0
/* 0000BB40 7E83A378 */ mr r3, r20
/* 0000BB44 48001D71 */ bl lbl_0000D8B4
lbl_0000BB48:
/* 0000BB48 80740094 */ lwz r3, 0x94(r20)
/* 0000BB4C 546004E7 */ rlwinm. r0, r3, 0, 0x13, 0x13
/* 0000BB50 4182000C */ beq lbl_0000BB5C
/* 0000BB54 54600524 */ rlwinm r0, r3, 0, 0x14, 0x12
/* 0000BB58 90140094 */ stw r0, 0x94(r20)
lbl_0000BB5C:
/* 0000BB5C 7E83A378 */ mr r3, r20
/* 0000BB60 480020C5 */ bl lbl_0000DC24
/* 0000BB64 7C768214 */ add r3, r22, r16
/* 0000BB68 3883014C */ addi r4, r3, 0x14c
/* 0000BB6C A8630160 */ lha r3, 0x160(r3)
/* 0000BB70 2C030000 */ cmpwi r3, 0
/* 0000BB74 4081000C */ ble lbl_0000BB80
/* 0000BB78 3803FFFF */ addi r0, r3, -1
/* 0000BB7C B0040014 */ sth r0, 0x14(r4)
lbl_0000BB80:
/* 0000BB80 3A310001 */ addi r17, r17, 1
/* 0000BB84 3A100018 */ addi r16, r16, 0x18
/* 0000BB88 3A9401A4 */ addi r20, r20, 0x1a4
/* 0000BB8C 3A520001 */ addi r18, r18, 1
lbl_0000BB90:
/* 0000BB90 80180008 */ lwz r0, 8(r24)
/* 0000BB94 7C110000 */ cmpw r17, r0
/* 0000BB98 4180FDB8 */ blt lbl_0000B950
/* 0000BB9C 3C600000 */ lis r3, currentBall@ha
/* 0000BBA0 92630000 */ stw r19, currentBall@l(r3)
/* 0000BBA4 8016087C */ lwz r0, 0x87c(r22)
/* 0000BBA8 2C000000 */ cmpwi r0, 0
/* 0000BBAC 41820010 */ beq lbl_0000BBBC
/* 0000BBB0 480020F1 */ bl lbl_0000DCA0
/* 0000BBB4 38000000 */ li r0, 0
/* 0000BBB8 9016087C */ stw r0, 0x87c(r22)
lbl_0000BBBC:
/* 0000BBBC 3C600000 */ lis r3, infoWork@ha
/* 0000BBC0 80030000 */ lwz r0, infoWork@l(r3)
/* 0000BBC4 38800000 */ li r4, 0
/* 0000BBC8 540007BD */ rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 0000BBCC 41820008 */ beq lbl_0000BBD4
/* 0000BBD0 38800001 */ li r4, 1
lbl_0000BBD4:
/* 0000BBD4 3C600000 */ lis r3, dipSwitches@ha
/* 0000BBD8 80030000 */ lwz r0, dipSwitches@l(r3)
/* 0000BBDC 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000BBE0 41820034 */ beq lbl_0000BC14
/* 0000BBE4 3C600000 */ lis r3, g_currPlayerButtons@ha
/* 0000BBE8 38630000 */ addi r3, r3, g_currPlayerButtons@l
/* 0000BBEC A0630000 */ lhz r3, 0(r3)
/* 0000BBF0 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 0000BBF4 41820020 */ beq lbl_0000BC14
/* 0000BBF8 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 0000BBFC 41820018 */ beq lbl_0000BC14
/* 0000BC00 3C600000 */ lis r3, infoWork@ha
/* 0000BC04 84030000 */ lwzu r0, infoWork@l(r3)
/* 0000BC08 38800001 */ li r4, 1
/* 0000BC0C 60000008 */ ori r0, r0, 8
/* 0000BC10 90030000 */ stw r0, 0(r3)
lbl_0000BC14:
/* 0000BC14 2C040000 */ cmpwi r4, 0
/* 0000BC18 41820024 */ beq lbl_0000BC3C
/* 0000BC1C A8160886 */ lha r0, 0x886(r22)
/* 0000BC20 2C000001 */ cmpwi r0, 1
/* 0000BC24 40810010 */ ble lbl_0000BC34
/* 0000BC28 38000010 */ li r0, 0x10
/* 0000BC2C B0160146 */ sth r0, 0x146(r22)
/* 0000BC30 4800000C */ b lbl_0000BC3C
lbl_0000BC34:
/* 0000BC34 3800000A */ li r0, 0xa
/* 0000BC38 B0160146 */ sth r0, 0x146(r22)
lbl_0000BC3C:
/* 0000BC3C BA010010 */ lmw r16, 0x10(r1)
/* 0000BC40 80010054 */ lwz r0, 0x54(r1)
/* 0000BC44 38210050 */ addi r1, r1, 0x50
/* 0000BC48 7C0803A6 */ mtlr r0
/* 0000BC4C 4E800020 */ blr 
lbl_0000BC50:
/* 0000BC50 7C0802A6 */ mflr r0
/* 0000BC54 3C600001 */ lis r3, 1
/* 0000BC58 90010004 */ stw r0, 4(r1)
/* 0000BC5C 3863D8FC */ addi r3, r3, -9988
/* 0000BC60 9421FFF8 */ stwu r1, -8(r1)
/* 0000BC64 4BFF4501 */ bl u_play_sound_0
/* 0000BC68 38600183 */ li r3, 0x183
/* 0000BC6C 4BFF44F9 */ bl u_play_sound_0
/* 0000BC70 3C600000 */ lis r3, lbl_10017664@ha
/* 0000BC74 38630000 */ addi r3, r3, lbl_10017664@l
/* 0000BC78 38000013 */ li r0, 0x13
/* 0000BC7C B0030002 */ sth r0, 2(r3)
/* 0000BC80 48000015 */ bl lbl_0000BC94
/* 0000BC84 8001000C */ lwz r0, 0xc(r1)
/* 0000BC88 38210008 */ addi r1, r1, 8
/* 0000BC8C 7C0803A6 */ mtlr r0
/* 0000BC90 4E800020 */ blr 
