/* 0000215C 7C0802A6 */ mflr r0
/* 00002160 3C600000 */ lis r3, lbl_0000FE78@ha
/* 00002164 90010004 */ stw r0, 4(r1)
/* 00002168 9421FF98 */ stwu r1, -0x68(r1)
/* 0000216C 93E10064 */ stw r31, 0x64(r1)
/* 00002170 3BE30000 */ addi r31, r3, lbl_0000FE78@l
/* 00002174 38610010 */ addi r3, r1, 0x10
/* 00002178 93C10060 */ stw r30, 0x60(r1)
/* 0000217C C03F0064 */ lfs f1, 0x64(r31)
/* 00002180 C05F0068 */ lfs f2, 0x68(r31)
/* 00002184 C07F006C */ lfs f3, 0x6c(r31)
/* 00002188 C09F0070 */ lfs f4, 0x70(r31)
/* 0000218C 4BFFDFD1 */ bl C_MTXPerspective
/* 00002190 38610010 */ addi r3, r1, 0x10
/* 00002194 38800000 */ li r4, 0
/* 00002198 4BFFDFC5 */ bl GXSetProjection
/* 0000219C 380000FF */ li r0, 0xff
/* 000021A0 98010050 */ stb r0, 0x50(r1)
/* 000021A4 3C600000 */ lis r3, lbl_10000040@ha
/* 000021A8 3BC30000 */ addi r30, r3, lbl_10000040@l
/* 000021AC 98010051 */ stb r0, 0x51(r1)
/* 000021B0 3881000C */ addi r4, r1, 0xc
/* 000021B4 38600004 */ li r3, 4
/* 000021B8 98010052 */ stb r0, 0x52(r1)
/* 000021BC 801E0004 */ lwz r0, 4(r30)
/* 000021C0 98010053 */ stb r0, 0x53(r1)
/* 000021C4 80010050 */ lwz r0, 0x50(r1)
/* 000021C8 9001000C */ stw r0, 0xc(r1)
/* 000021CC 4BFFDF91 */ bl GXSetChanMatColor
/* 000021D0 38000000 */ li r0, 0
/* 000021D4 98010050 */ stb r0, 0x50(r1)
/* 000021D8 38810008 */ addi r4, r1, 8
/* 000021DC 38600004 */ li r3, 4
/* 000021E0 98010051 */ stb r0, 0x51(r1)
/* 000021E4 98010052 */ stb r0, 0x52(r1)
/* 000021E8 98010053 */ stb r0, 0x53(r1)
/* 000021EC 80010050 */ lwz r0, 0x50(r1)
/* 000021F0 90010008 */ stw r0, 8(r1)
/* 000021F4 4BFFDF69 */ bl GXSetChanAmbColor
/* 000021F8 38600004 */ li r3, 4
/* 000021FC 38800000 */ li r4, 0
/* 00002200 38A00000 */ li r5, 0
/* 00002204 38C00000 */ li r6, 0
/* 00002208 38E00000 */ li r7, 0
/* 0000220C 39000002 */ li r8, 2
/* 00002210 39200001 */ li r9, 1
/* 00002214 4BFFDF49 */ bl GXSetChanCtrl
/* 00002218 38600001 */ li r3, 1
/* 0000221C 4BFFDF41 */ bl GXSetNumChans
/* 00002220 4BFFDF3D */ bl GXInvalidateTexAll
/* 00002224 387E0008 */ addi r3, r30, 8
/* 00002228 38800000 */ li r4, 0
/* 0000222C 4BFFDF31 */ bl GXLoadTexObj_cached
/* 00002230 38600000 */ li r3, 0
/* 00002234 38800000 */ li r4, 0
/* 00002238 38A00000 */ li r5, 0
/* 0000223C 38C0001E */ li r6, 0x1e
/* 00002240 38E00000 */ li r7, 0
/* 00002244 3900007D */ li r8, 0x7d
/* 00002248 4BFFDF15 */ bl GXSetTexCoordGen2
/* 0000224C 4BFFDF11 */ bl mathutil_mtxA_from_identity
/* 00002250 3C600000 */ lis r3, mathutilData@ha
/* 00002254 C01F0074 */ lfs f0, 0x74(r31)
/* 00002258 39030000 */ addi r8, r3, mathutilData@l
/* 0000225C 80A80000 */ lwz r5, 0(r8)
/* 00002260 3C800000 */ lis r4, currRenderMode@ha
/* 00002264 38C40000 */ addi r6, r4, currRenderMode@l
/* 00002268 D0050000 */ stfs f0, 0(r5)
/* 0000226C 3C600000 */ lis r3, lbl_0000FEC8@ha
/* 00002270 3C004330 */ lis r0, 0x4330
/* 00002274 C01F0078 */ lfs f0, 0x78(r31)
/* 00002278 3880001E */ li r4, 0x1e
/* 0000227C 80E80000 */ lwz r7, 0(r8)
/* 00002280 38A00000 */ li r5, 0
/* 00002284 D0070008 */ stfs f0, 8(r7)
/* 00002288 C01F007C */ lfs f0, 0x7c(r31)
/* 0000228C 80E80000 */ lwz r7, 0(r8)
/* 00002290 D0070014 */ stfs f0, 0x14(r7)
/* 00002294 80C60000 */ lwz r6, 0(r6)
/* 00002298 C8230000 */ lfd f1, lbl_0000FEC8@l(r3)
/* 0000229C A0660006 */ lhz r3, 6(r6)
/* 000022A0 C05F0078 */ lfs f2, 0x78(r31)
/* 000022A4 9061005C */ stw r3, 0x5c(r1)
/* 000022A8 80680000 */ lwz r3, 0(r8)
/* 000022AC 90010058 */ stw r0, 0x58(r1)
/* 000022B0 C8010058 */ lfd f0, 0x58(r1)
/* 000022B4 EC000828 */ fsubs f0, f0, f1
/* 000022B8 EC020024 */ fdivs f0, f2, f0
/* 000022BC EC020028 */ fsubs f0, f2, f0
/* 000022C0 D0030018 */ stfs f0, 0x18(r3)
/* 000022C4 80680000 */ lwz r3, 0(r8)
/* 000022C8 4BFFDE95 */ bl GXLoadTexMtxImm
/* 000022CC 38600000 */ li r3, 0
/* 000022D0 38800000 */ li r4, 0
/* 000022D4 38A00000 */ li r5, 0
/* 000022D8 38C00004 */ li r6, 4
/* 000022DC 4BFFDE81 */ bl GXSetTevOrder_cached
/* 000022E0 38600000 */ li r3, 0
/* 000022E4 3880000F */ li r4, 0xf
/* 000022E8 38A0000A */ li r5, 0xa
/* 000022EC 38C00008 */ li r6, 8
/* 000022F0 38E0000F */ li r7, 0xf
/* 000022F4 4BFFDE69 */ bl GXSetTevColorIn_cached
/* 000022F8 38600000 */ li r3, 0
/* 000022FC 38800000 */ li r4, 0
/* 00002300 38A00000 */ li r5, 0
/* 00002304 38C00000 */ li r6, 0
/* 00002308 38E00001 */ li r7, 1
/* 0000230C 39000000 */ li r8, 0
/* 00002310 4BFFDE4D */ bl GXSetTevColorOp_cached
/* 00002314 38600000 */ li r3, 0
/* 00002318 38800007 */ li r4, 7
/* 0000231C 38A00007 */ li r5, 7
/* 00002320 38C00007 */ li r6, 7
/* 00002324 38E00005 */ li r7, 5
/* 00002328 4BFFDE35 */ bl GXSetTevAlphaIn_cached
/* 0000232C 38600000 */ li r3, 0
/* 00002330 38800000 */ li r4, 0
/* 00002334 38A00000 */ li r5, 0
/* 00002338 38C00000 */ li r6, 0
/* 0000233C 38E00001 */ li r7, 1
/* 00002340 39000000 */ li r8, 0
/* 00002344 4BFFDE19 */ bl GXSetTevAlphaOp_cached
/* 00002348 38600000 */ li r3, 0
/* 0000234C 4BFFDE11 */ bl GXSetTevDirect
/* 00002350 38600001 */ li r3, 1
/* 00002354 4BFFDE09 */ bl GXSetNumTevStages_cached
/* 00002358 38600001 */ li r3, 1
/* 0000235C 4BFFDE01 */ bl GXSetNumTexGens
/* 00002360 38600000 */ li r3, 0
/* 00002364 4BFFDDF9 */ bl GXSetNumIndStages
/* 00002368 38600001 */ li r3, 1
/* 0000236C 38800004 */ li r4, 4
/* 00002370 38A00005 */ li r5, 5
/* 00002374 38C00000 */ li r6, 0
/* 00002378 4BFFDDE5 */ bl GXSetBlendMode_cached
/* 0000237C 3C600000 */ lis r3, gxCache@ha
/* 00002380 38630000 */ addi r3, r3, gxCache@l
/* 00002384 80630000 */ lwz r3, 0(r3)
/* 00002388 88030008 */ lbz r0, 8(r3)
/* 0000238C 28000000 */ cmplwi r0, 0
/* 00002390 4082001C */ bne lbl_000023AC
/* 00002394 80030004 */ lwz r0, 4(r3)
/* 00002398 2C000007 */ cmpwi r0, 7
/* 0000239C 40820010 */ bne lbl_000023AC
/* 000023A0 88030000 */ lbz r0, 0(r3)
/* 000023A4 28000001 */ cmplwi r0, 1
/* 000023A8 41820040 */ beq lbl_000023E8
lbl_000023AC:
/* 000023AC 38600001 */ li r3, 1
/* 000023B0 38800007 */ li r4, 7
/* 000023B4 38A00000 */ li r5, 0
/* 000023B8 4BFFDDA5 */ bl GXSetZMode
/* 000023BC 3C600000 */ lis r3, gxCache@ha
/* 000023C0 38A30000 */ addi r5, r3, gxCache@l
/* 000023C4 80650000 */ lwz r3, 0(r5)
/* 000023C8 38000001 */ li r0, 1
/* 000023CC 38800007 */ li r4, 7
/* 000023D0 98030000 */ stb r0, 0(r3)
/* 000023D4 38000000 */ li r0, 0
/* 000023D8 80650000 */ lwz r3, 0(r5)
/* 000023DC 90830004 */ stw r4, 4(r3)
/* 000023E0 80650000 */ lwz r3, 0(r5)
/* 000023E4 98030008 */ stb r0, 8(r3)
lbl_000023E8:
/* 000023E8 4BFFDD75 */ bl fog_gx_set
/* 000023EC 38600200 */ li r3, 0x200
/* 000023F0 4BFFDD6D */ bl gxutil_set_vtx_attrs
/* 000023F4 38600001 */ li r3, 1
/* 000023F8 38800009 */ li r4, 9
/* 000023FC 38A00001 */ li r5, 1
/* 00002400 38C00004 */ li r6, 4
/* 00002404 38E00000 */ li r7, 0
/* 00002408 4BFFDD55 */ bl GXSetVtxAttrFmt
/* 0000240C 4BFFDD51 */ bl mathutil_mtxA_from_identity
/* 00002410 3C600000 */ lis r3, mathutilData@ha
/* 00002414 38630000 */ addi r3, r3, mathutilData@l
/* 00002418 80630000 */ lwz r3, 0(r3)
/* 0000241C 38800000 */ li r4, 0
/* 00002420 4BFFDD3D */ bl GXLoadPosMtxImm
/* 00002424 38600080 */ li r3, 0x80
/* 00002428 38800001 */ li r4, 1
/* 0000242C 38A00004 */ li r5, 4
/* 00002430 4BFFDD2D */ bl GXBegin
/* 00002434 C09F0080 */ lfs f4, 0x80(r31)
/* 00002438 3C80CC01 */ lis r4, 0xcc01
/* 0000243C 3C600000 */ lis r3, gxCache@ha
/* 00002440 C07F0084 */ lfs f3, 0x84(r31)
/* 00002444 D0848000 */ stfs f4, -0x8000(r4)
/* 00002448 38630000 */ addi r3, r3, gxCache@l
/* 0000244C C05F0088 */ lfs f2, 0x88(r31)
/* 00002450 D0648000 */ stfs f3, -0x8000(r4)
/* 00002454 80630000 */ lwz r3, 0(r3)
/* 00002458 D0448000 */ stfs f2, -0x8000(r4)
/* 0000245C C03F008C */ lfs f1, 0x8c(r31)
/* 00002460 88030008 */ lbz r0, 8(r3)
/* 00002464 D0248000 */ stfs f1, -0x8000(r4)
/* 00002468 C01F0090 */ lfs f0, 0x90(r31)
/* 0000246C 28000001 */ cmplwi r0, 1
/* 00002470 D0648000 */ stfs f3, -0x8000(r4)
/* 00002474 D0448000 */ stfs f2, -0x8000(r4)
/* 00002478 D0248000 */ stfs f1, -0x8000(r4)
/* 0000247C D0048000 */ stfs f0, -0x8000(r4)
/* 00002480 D0448000 */ stfs f2, -0x8000(r4)
/* 00002484 D0848000 */ stfs f4, -0x8000(r4)
/* 00002488 D0048000 */ stfs f0, -0x8000(r4)
/* 0000248C D0448000 */ stfs f2, -0x8000(r4)
/* 00002490 4082001C */ bne lbl_000024AC
/* 00002494 80030004 */ lwz r0, 4(r3)
/* 00002498 2C000001 */ cmpwi r0, 1
/* 0000249C 40820010 */ bne lbl_000024AC
/* 000024A0 88030000 */ lbz r0, 0(r3)
/* 000024A4 28000001 */ cmplwi r0, 1
/* 000024A8 41820038 */ beq lbl_000024E0
lbl_000024AC:
/* 000024AC 38600001 */ li r3, 1
/* 000024B0 38800001 */ li r4, 1
/* 000024B4 38A00001 */ li r5, 1
/* 000024B8 4BFFDCA5 */ bl GXSetZMode
/* 000024BC 3C600000 */ lis r3, gxCache@ha
/* 000024C0 38830000 */ addi r4, r3, gxCache@l
/* 000024C4 80640000 */ lwz r3, 0(r4)
/* 000024C8 38000001 */ li r0, 1
/* 000024CC 98030000 */ stb r0, 0(r3)
/* 000024D0 80640000 */ lwz r3, 0(r4)
/* 000024D4 90030004 */ stw r0, 4(r3)
/* 000024D8 80640000 */ lwz r3, 0(r4)
/* 000024DC 98030008 */ stb r0, 8(r3)
lbl_000024E0:
/* 000024E0 4BFFDC7D */ bl reset_camera_perspective
/* 000024E4 8001006C */ lwz r0, 0x6c(r1)
/* 000024E8 83E10064 */ lwz r31, 0x64(r1)
/* 000024EC 83C10060 */ lwz r30, 0x60(r1)
/* 000024F0 7C0803A6 */ mtlr r0
/* 000024F4 38210068 */ addi r1, r1, 0x68
/* 000024F8 4E800020 */ blr 
lbl_000024FC:
/* 000024FC 7C0802A6 */ mflr r0
/* 00002500 90010004 */ stw r0, 4(r1)
/* 00002504 9421FFF8 */ stwu r1, -8(r1)
/* 00002508 48006E31 */ bl lbl_00009338
/* 0000250C 4BFFDC51 */ bl event_finish_all
/* 00002510 3860000F */ li r3, 0xf
/* 00002514 4BFFDC49 */ bl event_start
/* 00002518 38600002 */ li r3, 2
/* 0000251C 4BFFDC41 */ bl camera_set_state_all
/* 00002520 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002524 3800006A */ li r0, 0x6a
/* 00002528 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 0000252C 8001000C */ lwz r0, 0xc(r1)
/* 00002530 38210008 */ addi r1, r1, 8
/* 00002534 7C0803A6 */ mtlr r0
/* 00002538 4E800020 */ blr 
lbl_0000253C:
/* 0000253C 7C0802A6 */ mflr r0
/* 00002540 90010004 */ stw r0, 4(r1)
/* 00002544 9421FFF8 */ stwu r1, -8(r1)
/* 00002548 48007019 */ bl lbl_00009560
/* 0000254C 8001000C */ lwz r0, 0xc(r1)
/* 00002550 38210008 */ addi r1, r1, 8
/* 00002554 7C0803A6 */ mtlr r0
/* 00002558 4E800020 */ blr 
lbl_0000255C:
/* 0000255C 7C0802A6 */ mflr r0
/* 00002560 90010004 */ stw r0, 4(r1)
/* 00002564 9421FFF8 */ stwu r1, -8(r1)
/* 00002568 48008DFD */ bl lbl_0000B364
/* 0000256C 38600002 */ li r3, 2
/* 00002570 4BFFDBED */ bl camera_set_state_all
/* 00002574 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002578 3800006C */ li r0, 0x6c
/* 0000257C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002580 8001000C */ lwz r0, 0xc(r1)
/* 00002584 38210008 */ addi r1, r1, 8
/* 00002588 7C0803A6 */ mtlr r0
/* 0000258C 4E800020 */ blr 
lbl_00002590:
/* 00002590 7C0802A6 */ mflr r0
/* 00002594 90010004 */ stw r0, 4(r1)
/* 00002598 9421FFF8 */ stwu r1, -8(r1)
/* 0000259C 48008F05 */ bl lbl_0000B4A0
/* 000025A0 8001000C */ lwz r0, 0xc(r1)
/* 000025A4 38210008 */ addi r1, r1, 8
/* 000025A8 7C0803A6 */ mtlr r0
/* 000025AC 4E800020 */ blr 
lbl_000025B0:
/* 000025B0 7C0802A6 */ mflr r0
/* 000025B4 90010004 */ stw r0, 4(r1)
/* 000025B8 9421FFF8 */ stwu r1, -8(r1)
/* 000025BC 480098FD */ bl lbl_0000BEB8
/* 000025C0 4BFFDB9D */ bl event_finish_all
/* 000025C4 4BFFDB99 */ bl func_80044920
/* 000025C8 3C600000 */ lis r3, loadingStageIdRequest@ha
/* 000025CC 38630000 */ addi r3, r3, loadingStageIdRequest@l
/* 000025D0 A8630000 */ lha r3, 0(r3)
/* 000025D4 4BFFDB89 */ bl load_stage
/* 000025D8 38600001 */ li r3, 1
/* 000025DC 4BFFDB81 */ bl event_start
/* 000025E0 38600002 */ li r3, 2
/* 000025E4 4BFFDB79 */ bl event_start
/* 000025E8 38600003 */ li r3, 3
/* 000025EC 4BFFDB71 */ bl event_start
/* 000025F0 38600004 */ li r3, 4
/* 000025F4 4BFFDB69 */ bl event_start
/* 000025F8 38600009 */ li r3, 9
/* 000025FC 4BFFDB61 */ bl event_start
/* 00002600 38600005 */ li r3, 5
/* 00002604 4BFFDB59 */ bl event_start
/* 00002608 38600007 */ li r3, 7
/* 0000260C 4BFFDB51 */ bl event_start
/* 00002610 3860000F */ li r3, 0xf
/* 00002614 4BFFDB49 */ bl event_start
/* 00002618 38600010 */ li r3, 0x10
/* 0000261C 4BFFDB41 */ bl event_start
/* 00002620 38600012 */ li r3, 0x12
/* 00002624 4BFFDB39 */ bl event_start
/* 00002628 3860000D */ li r3, 0xd
/* 0000262C 4BFFDB31 */ bl event_start
/* 00002630 38600014 */ li r3, 0x14
/* 00002634 4BFFDB29 */ bl event_start
/* 00002638 38600013 */ li r3, 0x13
/* 0000263C 4BFFDB21 */ bl event_start
/* 00002640 38600002 */ li r3, 2
/* 00002644 4BFFDB19 */ bl camera_set_state_all
/* 00002648 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000264C 3800006E */ li r0, 0x6e
/* 00002650 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002654 8001000C */ lwz r0, 0xc(r1)
/* 00002658 38210008 */ addi r1, r1, 8
/* 0000265C 7C0803A6 */ mtlr r0
/* 00002660 4E800020 */ blr 
lbl_00002664:
/* 00002664 7C0802A6 */ mflr r0
/* 00002668 90010004 */ stw r0, 4(r1)
/* 0000266C 9421FFF8 */ stwu r1, -8(r1)
/* 00002670 48009979 */ bl lbl_0000BFE8
/* 00002674 8001000C */ lwz r0, 0xc(r1)
/* 00002678 38210008 */ addi r1, r1, 8
/* 0000267C 7C0803A6 */ mtlr r0
/* 00002680 4E800020 */ blr 
lbl_00002684:
/* 00002684 7C0802A6 */ mflr r0
/* 00002688 3C600000 */ lis r3, lbl_10000000@ha
/* 0000268C 90010004 */ stw r0, 4(r1)
/* 00002690 9421FFE8 */ stwu r1, -0x18(r1)
/* 00002694 93E10014 */ stw r31, 0x14(r1)
/* 00002698 3BE00000 */ li r31, 0
/* 0000269C 93C10010 */ stw r30, 0x10(r1)
/* 000026A0 3BC30000 */ addi r30, r3, lbl_10000000@l
/* 000026A4 93A1000C */ stw r29, 0xc(r1)
/* 000026A8 3BBE0078 */ addi r29, r30, 0x78
/* 000026AC 93810008 */ stw r28, 8(r1)
/* 000026B0 3B9E0070 */ addi r28, r30, 0x70
/* 000026B4 93FE006C */ stw r31, 0x6c(r30)
/* 000026B8 93FE0070 */ stw r31, 0x70(r30)
/* 000026BC 807E0078 */ lwz r3, 0x78(r30)
/* 000026C0 28030000 */ cmplwi r3, 0
/* 000026C4 4182000C */ beq lbl_000026D0
/* 000026C8 4BFFDA95 */ bl bitmap_free_tpl
/* 000026CC 93FD0000 */ stw r31, 0(r29)
lbl_000026D0:
/* 000026D0 3BDE0074 */ addi r30, r30, 0x74
/* 000026D4 809E0000 */ lwz r4, 0(r30)
/* 000026D8 28040000 */ cmplwi r4, 0
/* 000026DC 4182001C */ beq lbl_000026F8
/* 000026E0 3C600000 */ lis r3, __OSCurrHeap@ha
/* 000026E4 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 000026E8 80630000 */ lwz r3, 0(r3)
/* 000026EC 4BFFDA71 */ bl OSFreeToHeap
/* 000026F0 38000000 */ li r0, 0
/* 000026F4 901E0000 */ stw r0, 0(r30)
lbl_000026F8:
/* 000026F8 809C0000 */ lwz r4, 0(r28)
/* 000026FC 3C600000 */ lis r3, lbl_00012330@ha
/* 00002700 38030000 */ addi r0, r3, lbl_00012330@l
/* 00002704 1C64000C */ mulli r3, r4, 0xc
/* 00002708 7C801A14 */ add r4, r0, r3
/* 0000270C 80A40004 */ lwz r5, 4(r4)
/* 00002710 7FC3F378 */ mr r3, r30
/* 00002714 80C40008 */ lwz r6, 8(r4)
/* 00002718 7FA4EB78 */ mr r4, r29
/* 0000271C 4BFFDA41 */ bl nlObjModelListLoad
/* 00002720 4BFFDA3D */ bl event_finish_all
/* 00002724 3860000F */ li r3, 0xf
/* 00002728 4BFFDA35 */ bl event_start
/* 0000272C 38600002 */ li r3, 2
/* 00002730 4BFFDA2D */ bl camera_set_state_all
/* 00002734 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 00002738 38000070 */ li r0, 0x70
/* 0000273C B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00002740 8001001C */ lwz r0, 0x1c(r1)
/* 00002744 83E10014 */ lwz r31, 0x14(r1)
/* 00002748 83C10010 */ lwz r30, 0x10(r1)
/* 0000274C 7C0803A6 */ mtlr r0
/* 00002750 83A1000C */ lwz r29, 0xc(r1)
/* 00002754 83810008 */ lwz r28, 8(r1)
/* 00002758 38210018 */ addi r1, r1, 0x18
/* 0000275C 4E800020 */ blr 
