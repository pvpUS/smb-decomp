/* 0000CB3C 7C0802A6 */ mflr r0
/* 0000CB40 3CA00000 */ lis r5, lbl_00013C48@ha
/* 0000CB44 90010004 */ stw r0, 4(r1)
/* 0000CB48 3C800000 */ lis r4, lbl_10000028@ha
/* 0000CB4C 9421FF50 */ stwu r1, -0xb0(r1)
/* 0000CB50 DBE100A8 */ stfd f31, 0xa8(r1)
/* 0000CB54 BE410070 */ stmw r18, 0x70(r1)
/* 0000CB58 7C741B78 */ mr r20, r3
/* 0000CB5C 3AE50000 */ addi r23, r5, lbl_00013C48@l
/* 0000CB60 3A640000 */ addi r19, r4, lbl_10000028@l
/* 0000CB64 80030048 */ lwz r0, 0x48(r3)
/* 0000CB68 3C600000 */ lis r3, ballInfo@ha
/* 0000CB6C 38630000 */ addi r3, r3, ballInfo@l
/* 0000CB70 1C0001A4 */ mulli r0, r0, 0x1a4
/* 0000CB74 7C630214 */ add r3, r3, r0
/* 0000CB78 82C30144 */ lwz r22, 0x144(r3)
/* 0000CB7C 4BFF3601 */ bl reset_text_draw_settings
/* 0000CB80 3C600020 */ lis r3, 0x20
/* 0000CB84 4BFF35F9 */ bl func_80071B50
/* 0000CB88 A8960022 */ lha r4, 0x22(r22)
/* 0000CB8C A0730004 */ lhz r3, 4(r19)
/* 0000CB90 7C041800 */ cmpw r4, r3
/* 0000CB94 41800010 */ blt lbl_0000CBA4
/* 0000CB98 3924FFFB */ addi r9, r4, -5
/* 0000CB9C 3943FFFF */ addi r10, r3, -1
/* 0000CBA0 4800000C */ b lbl_0000CBAC
lbl_0000CBA4:
/* 0000CBA4 3924FFFC */ addi r9, r4, -4
/* 0000CBA8 39440000 */ addi r10, r4, 0
lbl_0000CBAC:
/* 0000CBAC 7D200735 */ extsh. r0, r9
/* 0000CBB0 40800008 */ bge lbl_0000CBB8
/* 0000CBB4 39200000 */ li r9, 0
lbl_0000CBB8:
/* 0000CBB8 7D200734 */ extsh r0, r9
/* 0000CBBC C3F40008 */ lfs f31, 8(r20)
/* 0000CBC0 54001838 */ slwi r0, r0, 3
/* 0000CBC4 3D000100 */ lis r8, 0x100
/* 0000CBC8 3CE00000 */ lis r7, lbl_00015CA8@ha
/* 0000CBCC 3CC08889 */ lis r6, 0x8889
/* 0000CBD0 3CA01062 */ lis r5, 0x1062
/* 0000CBD4 3C800000 */ lis r4, lbl_00015CB8@ha
/* 0000CBD8 3C606666 */ lis r3, 0x6666
/* 0000CBDC 3AA90000 */ addi r21, r9, 0
/* 0000CBE0 7ED60214 */ add r22, r22, r0
/* 0000CBE4 3B08FFFF */ addi r24, r8, -1
/* 0000CBE8 3B470000 */ addi r26, r7, lbl_00015CA8@l
/* 0000CBEC 3B668889 */ addi r27, r6, -30583
/* 0000CBF0 3BA54DD3 */ addi r29, r5, 0x4dd3
/* 0000CBF4 3BC40000 */ addi r30, r4, lbl_00015CB8@l
/* 0000CBF8 3BE36667 */ addi r31, r3, 0x6667
/* 0000CBFC 7D530734 */ extsh r19, r10
/* 0000CC00 3F20FFFF */ lis r25, 0xffff
/* 0000CC04 3F804330 */ lis r28, 0x4330
/* 0000CC08 480001F8 */ b lbl_0000CE00
lbl_0000CC0C:
/* 0000CC0C C0170008 */ lfs f0, 8(r23)
/* 0000CC10 38C00000 */ li r6, 0
/* 0000CC14 38A0FFFF */ li r5, -1
/* 0000CC18 D001001C */ stfs f0, 0x1c(r1)
/* 0000CC1C 38800005 */ li r4, 5
/* 0000CC20 38000717 */ li r0, 0x717
/* 0000CC24 C0170008 */ lfs f0, 8(r23)
/* 0000CC28 3861000C */ addi r3, r1, 0xc
/* 0000CC2C D0010020 */ stfs f0, 0x20(r1)
/* 0000CC30 C0170018 */ lfs f0, 0x18(r23)
/* 0000CC34 D0010028 */ stfs f0, 0x28(r1)
/* 0000CC38 D0010024 */ stfs f0, 0x24(r1)
/* 0000CC3C C0170008 */ lfs f0, 8(r23)
/* 0000CC40 D0010030 */ stfs f0, 0x30(r1)
/* 0000CC44 D001002C */ stfs f0, 0x2c(r1)
/* 0000CC48 90C10034 */ stw r6, 0x34(r1)
/* 0000CC4C 90A1003C */ stw r5, 0x3c(r1)
/* 0000CC50 90810040 */ stw r4, 0x40(r1)
/* 0000CC54 C0170008 */ lfs f0, 8(r23)
/* 0000CC58 D0010038 */ stfs f0, 0x38(r1)
/* 0000CC5C 93010044 */ stw r24, 0x44(r1)
/* 0000CC60 90C10048 */ stw r6, 0x48(r1)
/* 0000CC64 93210044 */ stw r25, 0x44(r1)
/* 0000CC68 9001000C */ stw r0, 0xc(r1)
/* 0000CC6C C0140004 */ lfs f0, 4(r20)
/* 0000CC70 D0010010 */ stfs f0, 0x10(r1)
/* 0000CC74 D3E10014 */ stfs f31, 0x14(r1)
/* 0000CC78 C014004C */ lfs f0, 0x4c(r20)
/* 0000CC7C D0010018 */ stfs f0, 0x18(r1)
/* 0000CC80 4BFF34FD */ bl nlSprPut
/* 0000CC84 C034004C */ lfs f1, 0x4c(r20)
/* 0000CC88 C01700EC */ lfs f0, 0xec(r23)
/* 0000CC8C EC210028 */ fsubs f1, f1, f0
/* 0000CC90 4BFF34ED */ bl func_80071B1C
/* 0000CC94 7EA30734 */ extsh r3, r21
/* 0000CC98 38030001 */ addi r0, r3, 1
/* 0000CC9C 7C120734 */ extsh r18, r0
/* 0000CCA0 2C120009 */ cmpwi r18, 9
/* 0000CCA4 41810024 */ bgt lbl_0000CCC8
/* 0000CCA8 38600048 */ li r3, 0x48
/* 0000CCAC 4BFF34D1 */ bl set_text_font
/* 0000CCB0 C03700E4 */ lfs f1, 0xe4(r23)
/* 0000CCB4 C0140004 */ lfs f0, 4(r20)
/* 0000CCB8 EC41F82A */ fadds f2, f1, f31
/* 0000CCBC EC21002A */ fadds f1, f1, f0
/* 0000CCC0 4BFF34BD */ bl set_text_pos
/* 0000CCC4 48000024 */ b lbl_0000CCE8
lbl_0000CCC8:
/* 0000CCC8 3860004B */ li r3, 0x4b
/* 0000CCCC 4BFF34B1 */ bl set_text_font
/* 0000CCD0 C01700E4 */ lfs f0, 0xe4(r23)
/* 0000CCD4 C07700E8 */ lfs f3, 0xe8(r23)
/* 0000CCD8 C0340004 */ lfs f1, 4(r20)
/* 0000CCDC EC40F82A */ fadds f2, f0, f31
/* 0000CCE0 EC23082A */ fadds f1, f3, f1
/* 0000CCE4 4BFF3499 */ bl set_text_pos
lbl_0000CCE8:
/* 0000CCE8 387A0000 */ addi r3, r26, 0
/* 0000CCEC 4CC63182 */ crclr 6
/* 0000CCF0 38920000 */ addi r4, r18, 0
/* 0000CCF4 4BFF3489 */ bl sprite_printf
/* 0000CCF8 38600045 */ li r3, 0x45
/* 0000CCFC 4BFF3481 */ bl set_text_font
/* 0000CD00 C017001C */ lfs f0, 0x1c(r23)
/* 0000CD04 C07700F0 */ lfs f3, 0xf0(r23)
/* 0000CD08 C0340004 */ lfs f1, 4(r20)
/* 0000CD0C EC40F82A */ fadds f2, f0, f31
/* 0000CD10 EC23082A */ fadds f1, f3, f1
/* 0000CD14 4BFF3469 */ bl set_text_pos
/* 0000CD18 80160028 */ lwz r0, 0x28(r22)
/* 0000CD1C 3C600000 */ lis r3, lbl_00013C70@ha
/* 0000CD20 C8630000 */ lfd f3, lbl_00013C70@l(r3)
/* 0000CD24 4CC63182 */ crclr 6
/* 0000CD28 7C9B0096 */ mulhw r4, r27, r0
/* 0000CD2C C036002C */ lfs f1, 0x2c(r22)
/* 0000CD30 C09700F4 */ lfs f4, 0xf4(r23)
/* 0000CD34 C0170030 */ lfs f0, 0x30(r23)
/* 0000CD38 7C840214 */ add r4, r4, r0
/* 0000CD3C 7C832E70 */ srawi r3, r4, 5
/* 0000CD40 54650FFE */ srwi r5, r3, 0x1f
/* 0000CD44 7CA32A14 */ add r5, r3, r5
/* 0000CD48 7C7B2896 */ mulhw r3, r27, r5
/* 0000CD4C 7C632A14 */ add r3, r3, r5
/* 0000CD50 7C672E70 */ srawi r7, r3, 5
/* 0000CD54 7C662E70 */ srawi r6, r3, 5
/* 0000CD58 7C832E70 */ srawi r3, r4, 5
/* 0000CD5C 54640FFE */ srwi r4, r3, 0x1f
/* 0000CD60 7C632214 */ add r3, r3, r4
/* 0000CD64 1C63003C */ mulli r3, r3, 0x3c
/* 0000CD68 7C030050 */ subf r0, r3, r0
/* 0000CD6C 6C008000 */ xoris r0, r0, 0x8000
/* 0000CD70 9001006C */ stw r0, 0x6c(r1)
/* 0000CD74 54C00FFE */ srwi r0, r6, 0x1f
/* 0000CD78 7C060214 */ add r0, r6, r0
/* 0000CD7C 93810068 */ stw r28, 0x68(r1)
/* 0000CD80 1C00003C */ mulli r0, r0, 0x3c
/* 0000CD84 C8410068 */ lfd f2, 0x68(r1)
/* 0000CD88 54E30FFE */ srwi r3, r7, 0x1f
/* 0000CD8C EC421828 */ fsubs f2, f2, f3
/* 0000CD90 7C871A14 */ add r4, r7, r3
/* 0000CD94 7CA02850 */ subf r5, r0, r5
/* 0000CD98 387E0000 */ addi r3, r30, 0
/* 0000CD9C EC22082A */ fadds f1, f2, f1
/* 0000CDA0 EC240072 */ fmuls f1, f4, f1
/* 0000CDA4 EC010024 */ fdivs f0, f1, f0
/* 0000CDA8 FC00001E */ fctiwz f0, f0
/* 0000CDAC D8010060 */ stfd f0, 0x60(r1)
/* 0000CDB0 81010064 */ lwz r8, 0x64(r1)
/* 0000CDB4 7C1D4096 */ mulhw r0, r29, r8
/* 0000CDB8 7C073670 */ srawi r7, r0, 6
/* 0000CDBC 7C003670 */ srawi r0, r0, 6
/* 0000CDC0 54060FFE */ srwi r6, r0, 0x1f
/* 0000CDC4 7C003214 */ add r0, r0, r6
/* 0000CDC8 1C0003E8 */ mulli r0, r0, 0x3e8
/* 0000CDCC 7D004050 */ subf r8, r0, r8
/* 0000CDD0 7C1F4096 */ mulhw r0, r31, r8
/* 0000CDD4 54E60FFE */ srwi r6, r7, 0x1f
/* 0000CDD8 7CC73214 */ add r6, r7, r6
/* 0000CDDC 7C001670 */ srawi r0, r0, 2
/* 0000CDE0 7CA53214 */ add r5, r5, r6
/* 0000CDE4 54060FFE */ srwi r6, r0, 0x1f
/* 0000CDE8 7CC03214 */ add r6, r0, r6
/* 0000CDEC 4BFF3391 */ bl sprite_printf
/* 0000CDF0 C0170034 */ lfs f0, 0x34(r23)
/* 0000CDF4 3AD60008 */ addi r22, r22, 8
/* 0000CDF8 3AB50001 */ addi r21, r21, 1
/* 0000CDFC EFFF002A */ fadds f31, f31, f0
lbl_0000CE00:
/* 0000CE00 7EA00734 */ extsh r0, r21
/* 0000CE04 7C009800 */ cmpw r0, r19
/* 0000CE08 4081FE04 */ ble lbl_0000CC0C
/* 0000CE0C BA410070 */ lmw r18, 0x70(r1)
/* 0000CE10 800100B4 */ lwz r0, 0xb4(r1)
/* 0000CE14 CBE100A8 */ lfd f31, 0xa8(r1)
/* 0000CE18 382100B0 */ addi r1, r1, 0xb0
/* 0000CE1C 7C0803A6 */ mtlr r0
/* 0000CE20 4E800020 */ blr 
