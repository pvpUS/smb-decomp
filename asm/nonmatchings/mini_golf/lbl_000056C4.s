/* 000056C4 7C0802A6 */ mflr r0
/* 000056C8 3C600000 */ lis r3, modeCtrl@ha
/* 000056CC 90010004 */ stw r0, 4(r1)
/* 000056D0 38630000 */ addi r3, r3, modeCtrl@l
/* 000056D4 3CC00000 */ lis r6, lbl_10000000@ha
/* 000056D8 9421FD40 */ stwu r1, -0x2c0(r1)
/* 000056DC 3CA00000 */ lis r5, lbl_000260F0@ha
/* 000056E0 3C800000 */ lis r4, lbl_00026AB0@ha
/* 000056E4 DBE102B8 */ stfd f31, 0x2b8(r1)
/* 000056E8 DBC102B0 */ stfd f30, 0x2b0(r1)
/* 000056EC BE61027C */ stmw r19, 0x27c(r1)
/* 000056F0 3BA60000 */ addi r29, r6, lbl_10000000@l
/* 000056F4 3BC50000 */ addi r30, r5, lbl_000260F0@l
/* 000056F8 3BE40000 */ addi r31, r4, lbl_00026AB0@l
/* 000056FC 8063002C */ lwz r3, 0x2c(r3)
/* 00005700 4BFFAAD1 */ bl change_current_camera
/* 00005704 881D00F2 */ lbz r0, 0xf2(r29)
/* 00005708 28000000 */ cmplwi r0, 0
/* 0000570C 4182001C */ beq lbl_00005728
/* 00005710 38600001 */ li r3, 1
/* 00005714 38800023 */ li r4, 0x23
/* 00005718 4BFFAAB9 */ bl window_set_cursor_pos
/* 0000571C 387F01D0 */ addi r3, r31, 0x1d0
/* 00005720 4CC63182 */ crclr 6
/* 00005724 4BFFAAAD */ bl window_printf_2
lbl_00005728:
/* 00005728 881D00F3 */ lbz r0, 0xf3(r29)
/* 0000572C 28000000 */ cmplwi r0, 0
/* 00005730 4182001C */ beq lbl_0000574C
/* 00005734 38600001 */ li r3, 1
/* 00005738 38800023 */ li r4, 0x23
/* 0000573C 4BFFAA95 */ bl window_set_cursor_pos
/* 00005740 387F01D8 */ addi r3, r31, 0x1d8
/* 00005744 4CC63182 */ crclr 6
/* 00005748 4BFFAA89 */ bl window_printf_2
lbl_0000574C:
/* 0000574C 807D0000 */ lwz r3, 0(r29)
/* 00005750 28032000 */ cmplwi r3, 0x2000
/* 00005754 4082003C */ bne lbl_00005790
/* 00005758 3C600000 */ lis r3, eventInfo@ha
/* 0000575C 38630000 */ addi r3, r3, eventInfo@l
/* 00005760 880301C8 */ lbz r0, 0x1c8(r3)
/* 00005764 2C000002 */ cmpwi r0, 2
/* 00005768 40820008 */ bne lbl_00005770
/* 0000576C 4BFFAA65 */ bl background_draw
lbl_00005770:
/* 00005770 4BFFAA61 */ bl func_8009CD5C
/* 00005774 3C600000 */ lis r3, eventInfo@ha
/* 00005778 38630000 */ addi r3, r3, eventInfo@l
/* 0000577C 88030138 */ lbz r0, 0x138(r3)
/* 00005780 2C000002 */ cmpwi r0, 2
/* 00005784 40822794 */ bne lbl_00007F18
/* 00005788 4BFFAA49 */ bl effect_draw
/* 0000578C 4800278C */ b lbl_00007F18
lbl_00005790:
/* 00005790 28034000 */ cmplwi r3, 0x4000
/* 00005794 41822784 */ beq lbl_00007F18
/* 00005798 28030100 */ cmplwi r3, 0x100
/* 0000579C 41820028 */ beq lbl_000057C4
/* 000057A0 28038000 */ cmplwi r3, 0x8000
/* 000057A4 41820020 */ beq lbl_000057C4
/* 000057A8 3C03FFFF */ addis r0, r3, 0xffff
/* 000057AC 28000000 */ cmplwi r0, 0
/* 000057B0 41820014 */ beq lbl_000057C4
/* 000057B4 28030200 */ cmplwi r3, 0x200
/* 000057B8 4182000C */ beq lbl_000057C4
/* 000057BC 28030400 */ cmplwi r3, 0x400
/* 000057C0 40820CC4 */ bne lbl_00006484
lbl_000057C4:
/* 000057C4 A01D00F8 */ lhz r0, 0xf8(r29)
/* 000057C8 28000001 */ cmplwi r0, 1
/* 000057CC 4082007C */ bne lbl_00005848
/* 000057D0 C03E0000 */ lfs f1, 0(r30)
/* 000057D4 38600000 */ li r3, 0
/* 000057D8 C07E0004 */ lfs f3, 4(r30)
/* 000057DC FC400890 */ fmr f2, f1
/* 000057E0 FC801890 */ fmr f4, f3
/* 000057E4 4BFFA9ED */ bl setup_camera_viewport
/* 000057E8 C03E0000 */ lfs f1, 0(r30)
/* 000057EC 38600001 */ li r3, 1
/* 000057F0 FC400890 */ fmr f2, f1
/* 000057F4 FC600890 */ fmr f3, f1
/* 000057F8 FC800890 */ fmr f4, f1
/* 000057FC 4BFFA9D5 */ bl setup_camera_viewport
/* 00005800 C03E0000 */ lfs f1, 0(r30)
/* 00005804 38600002 */ li r3, 2
/* 00005808 FC400890 */ fmr f2, f1
/* 0000580C FC600890 */ fmr f3, f1
/* 00005810 FC800890 */ fmr f4, f1
/* 00005814 4BFFA9BD */ bl setup_camera_viewport
/* 00005818 C03E0000 */ lfs f1, 0(r30)
/* 0000581C 38600003 */ li r3, 3
/* 00005820 FC400890 */ fmr f2, f1
/* 00005824 FC600890 */ fmr f3, f1
/* 00005828 FC800890 */ fmr f4, f1
/* 0000582C 4BFFA9A5 */ bl setup_camera_viewport
/* 00005830 3C600000 */ lis r3, cameraInfo@ha
/* 00005834 38630000 */ addi r3, r3, cameraInfo@l
/* 00005838 A8030024 */ lha r0, 0x24(r3)
/* 0000583C 60000080 */ ori r0, r0, 0x80
/* 00005840 B0030024 */ sth r0, 0x24(r3)
/* 00005844 480006B8 */ b lbl_00005EFC
lbl_00005848:
/* 00005848 28000002 */ cmplwi r0, 2
/* 0000584C 40820610 */ bne lbl_00005E5C
/* 00005850 801D0000 */ lwz r0, 0(r29)
/* 00005854 28000400 */ cmplwi r0, 0x400
/* 00005858 418202E4 */ beq lbl_00005B3C
/* 0000585C 3C600000 */ lis r3, debugFlags@ha
/* 00005860 80030000 */ lwz r0, debugFlags@l(r3)
/* 00005864 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00005868 40820010 */ bne lbl_00005878
/* 0000586C A07D00E8 */ lhz r3, 0xe8(r29)
/* 00005870 38030001 */ addi r0, r3, 1
/* 00005874 B01D00E8 */ sth r0, 0xe8(r29)
lbl_00005878:
/* 00005878 A01D00E8 */ lhz r0, 0xe8(r29)
/* 0000587C 2800003C */ cmplwi r0, 0x3c
/* 00005880 40800220 */ bge lbl_00005AA0
/* 00005884 90010274 */ stw r0, 0x274(r1)
/* 00005888 3EC04330 */ lis r22, 0x4330
/* 0000588C 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005890 C03E0000 */ lfs f1, 0(r30)
/* 00005894 9001026C */ stw r0, 0x26c(r1)
/* 00005898 3C600000 */ lis r3, lbl_000261E8@ha
/* 0000589C C8A40000 */ lfd f5, lbl_000261E8@l(r4)
/* 000058A0 92C10270 */ stw r22, 0x270(r1)
/* 000058A4 FC400890 */ fmr f2, f1
/* 000058A8 C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 000058AC 38600000 */ li r3, 0
/* 000058B0 92C10268 */ stw r22, 0x268(r1)
/* 000058B4 C8810270 */ lfd f4, 0x270(r1)
/* 000058B8 C8010268 */ lfd f0, 0x268(r1)
/* 000058BC ECA42828 */ fsubs f5, f4, f5
/* 000058C0 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 000058C4 EC001828 */ fsubs f0, f0, f3
/* 000058C8 C09E0108 */ lfs f4, 0x108(r30)
/* 000058CC C0FE0004 */ lfs f7, 4(r30)
/* 000058D0 EC660172 */ fmuls f3, f6, f5
/* 000058D4 EC060032 */ fmuls f0, f6, f0
/* 000058D8 EC632024 */ fdivs f3, f3, f4
/* 000058DC EC002024 */ fdivs f0, f0, f4
/* 000058E0 EC671828 */ fsubs f3, f7, f3
/* 000058E4 EC870028 */ fsubs f4, f7, f0
/* 000058E8 4BFFA8E9 */ bl setup_camera_viewport
/* 000058EC A01D00E8 */ lhz r0, 0xe8(r29)
/* 000058F0 3CA00000 */ lis r5, lbl_000261E8@ha
/* 000058F4 3C600000 */ lis r3, lbl_000261E8@ha
/* 000058F8 C8850000 */ lfd f4, lbl_000261E8@l(r5)
/* 000058FC 90010264 */ stw r0, 0x264(r1)
/* 00005900 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005904 C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 00005908 9001025C */ stw r0, 0x25c(r1)
/* 0000590C 38600001 */ li r3, 1
/* 00005910 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 00005914 90010254 */ stw r0, 0x254(r1)
/* 00005918 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 0000591C 92C10260 */ stw r22, 0x260(r1)
/* 00005920 C0BE0108 */ lfs f5, 0x108(r30)
/* 00005924 92C10258 */ stw r22, 0x258(r1)
/* 00005928 C8010260 */ lfd f0, 0x260(r1)
/* 0000592C C8410258 */ lfd f2, 0x258(r1)
/* 00005930 EC802028 */ fsubs f4, f0, f4
/* 00005934 92C10250 */ stw r22, 0x250(r1)
/* 00005938 EC621828 */ fsubs f3, f2, f3
/* 0000593C C0FE0004 */ lfs f7, 4(r30)
/* 00005940 C8010250 */ lfd f0, 0x250(r1)
/* 00005944 EC000828 */ fsubs f0, f0, f1
/* 00005948 C05E0000 */ lfs f2, 0(r30)
/* 0000594C EC860132 */ fmuls f4, f6, f4
/* 00005950 EC2600F2 */ fmuls f1, f6, f3
/* 00005954 EC060032 */ fmuls f0, f6, f0
/* 00005958 EC842824 */ fdivs f4, f4, f5
/* 0000595C EC612824 */ fdivs f3, f1, f5
/* 00005960 EC002824 */ fdivs f0, f0, f5
/* 00005964 EC272028 */ fsubs f1, f7, f4
/* 00005968 EC671828 */ fsubs f3, f7, f3
/* 0000596C EC870028 */ fsubs f4, f7, f0
/* 00005970 4BFFA861 */ bl setup_camera_viewport
/* 00005974 A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005978 3CA00000 */ lis r5, lbl_000261E8@ha
/* 0000597C 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005980 C8850000 */ lfd f4, lbl_000261E8@l(r5)
/* 00005984 9001024C */ stw r0, 0x24c(r1)
/* 00005988 3C800000 */ lis r4, lbl_000261E8@ha
/* 0000598C C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 00005990 90010244 */ stw r0, 0x244(r1)
/* 00005994 38600002 */ li r3, 2
/* 00005998 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 0000599C 9001023C */ stw r0, 0x23c(r1)
/* 000059A0 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 000059A4 92C10248 */ stw r22, 0x248(r1)
/* 000059A8 C0BE0108 */ lfs f5, 0x108(r30)
/* 000059AC 92C10240 */ stw r22, 0x240(r1)
/* 000059B0 C8010248 */ lfd f0, 0x248(r1)
/* 000059B4 C8410240 */ lfd f2, 0x240(r1)
/* 000059B8 92C10238 */ stw r22, 0x238(r1)
/* 000059BC EC802028 */ fsubs f4, f0, f4
/* 000059C0 EC421828 */ fsubs f2, f2, f3
/* 000059C4 C0FE0004 */ lfs f7, 4(r30)
/* 000059C8 C8010238 */ lfd f0, 0x238(r1)
/* 000059CC EC660132 */ fmuls f3, f6, f4
/* 000059D0 EC000828 */ fsubs f0, f0, f1
/* 000059D4 EC4600B2 */ fmuls f2, f6, f2
/* 000059D8 C03E0000 */ lfs f1, 0(r30)
/* 000059DC EC832824 */ fdivs f4, f3, f5
/* 000059E0 EC622824 */ fdivs f3, f2, f5
/* 000059E4 EC060032 */ fmuls f0, f6, f0
/* 000059E8 EC472028 */ fsubs f2, f7, f4
/* 000059EC EC671828 */ fsubs f3, f7, f3
/* 000059F0 EC002824 */ fdivs f0, f0, f5
/* 000059F4 EC870028 */ fsubs f4, f7, f0
/* 000059F8 4BFFA7D9 */ bl setup_camera_viewport
/* 000059FC A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005A00 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005A04 C8640000 */ lfd f3, lbl_000261E8@l(r4)
/* 00005A08 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005A0C 90010234 */ stw r0, 0x234(r1)
/* 00005A10 C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 00005A14 3CA00000 */ lis r5, lbl_000261E8@ha
/* 00005A18 92C10230 */ stw r22, 0x230(r1)
/* 00005A1C 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005A20 C0FE00E8 */ lfs f7, 0xe8(r30)
/* 00005A24 C8410230 */ lfd f2, 0x230(r1)
/* 00005A28 38600003 */ li r3, 3
/* 00005A2C 9001022C */ stw r0, 0x22c(r1)
/* 00005A30 EC621828 */ fsubs f3, f2, f3
/* 00005A34 C0DE0108 */ lfs f6, 0x108(r30)
/* 00005A38 92C10228 */ stw r22, 0x228(r1)
/* 00005A3C C11E0004 */ lfs f8, 4(r30)
/* 00005A40 EC8700F2 */ fmuls f4, f7, f3
/* 00005A44 90010224 */ stw r0, 0x224(r1)
/* 00005A48 C8010228 */ lfd f0, 0x228(r1)
/* 00005A4C EC843024 */ fdivs f4, f4, f6
/* 00005A50 9001021C */ stw r0, 0x21c(r1)
/* 00005A54 92C10220 */ stw r22, 0x220(r1)
/* 00005A58 92C10218 */ stw r22, 0x218(r1)
/* 00005A5C EC400828 */ fsubs f2, f0, f1
/* 00005A60 C8250000 */ lfd f1, lbl_000261E8@l(r5)
/* 00005A64 C8010220 */ lfd f0, 0x220(r1)
/* 00005A68 EC6700B2 */ fmuls f3, f7, f2
/* 00005A6C EC400828 */ fsubs f2, f0, f1
/* 00005A70 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 00005A74 C8010218 */ lfd f0, 0x218(r1)
/* 00005A78 ECA33024 */ fdivs f5, f3, f6
/* 00005A7C EC000828 */ fsubs f0, f0, f1
/* 00005A80 EC4700B2 */ fmuls f2, f7, f2
/* 00005A84 EC282028 */ fsubs f1, f8, f4
/* 00005A88 EC070032 */ fmuls f0, f7, f0
/* 00005A8C EC623024 */ fdivs f3, f2, f6
/* 00005A90 EC803024 */ fdivs f4, f0, f6
/* 00005A94 EC482828 */ fsubs f2, f8, f5
/* 00005A98 4BFFA739 */ bl setup_camera_viewport
/* 00005A9C 48000064 */ b lbl_00005B00
lbl_00005AA0:
/* 00005AA0 C03E0000 */ lfs f1, 0(r30)
/* 00005AA4 38600000 */ li r3, 0
/* 00005AA8 C07E00E8 */ lfs f3, 0xe8(r30)
/* 00005AAC FC400890 */ fmr f2, f1
/* 00005AB0 FC801890 */ fmr f4, f3
/* 00005AB4 4BFFA71D */ bl setup_camera_viewport
/* 00005AB8 C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005ABC 38600001 */ li r3, 1
/* 00005AC0 C05E0000 */ lfs f2, 0(r30)
/* 00005AC4 FC600890 */ fmr f3, f1
/* 00005AC8 FC800890 */ fmr f4, f1
/* 00005ACC 4BFFA705 */ bl setup_camera_viewport
/* 00005AD0 C05E00E8 */ lfs f2, 0xe8(r30)
/* 00005AD4 38600002 */ li r3, 2
/* 00005AD8 C03E0000 */ lfs f1, 0(r30)
/* 00005ADC FC601090 */ fmr f3, f2
/* 00005AE0 FC801090 */ fmr f4, f2
/* 00005AE4 4BFFA6ED */ bl setup_camera_viewport
/* 00005AE8 C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005AEC 38600003 */ li r3, 3
/* 00005AF0 FC400890 */ fmr f2, f1
/* 00005AF4 FC600890 */ fmr f3, f1
/* 00005AF8 FC800890 */ fmr f4, f1
/* 00005AFC 4BFFA6D5 */ bl setup_camera_viewport
lbl_00005B00:
/* 00005B00 3C600000 */ lis r3, cameraInfo@ha
/* 00005B04 38630000 */ addi r3, r3, cameraInfo@l
/* 00005B08 A8030024 */ lha r0, 0x24(r3)
/* 00005B0C 60000080 */ ori r0, r0, 0x80
/* 00005B10 B0030024 */ sth r0, 0x24(r3)
/* 00005B14 A80302A8 */ lha r0, 0x2a8(r3)
/* 00005B18 60000080 */ ori r0, r0, 0x80
/* 00005B1C B00302A8 */ sth r0, 0x2a8(r3)
/* 00005B20 A803052C */ lha r0, 0x52c(r3)
/* 00005B24 60000080 */ ori r0, r0, 0x80
/* 00005B28 B003052C */ sth r0, 0x52c(r3)
/* 00005B2C A80307B0 */ lha r0, 0x7b0(r3)
/* 00005B30 60000080 */ ori r0, r0, 0x80
/* 00005B34 B00307B0 */ sth r0, 0x7b0(r3)
/* 00005B38 480003C4 */ b lbl_00005EFC
lbl_00005B3C:
/* 00005B3C 801D00C8 */ lwz r0, 0xc8(r29)
/* 00005B40 2C0000B4 */ cmpwi r0, 0xb4
/* 00005B44 4081002C */ ble lbl_00005B70
/* 00005B48 2C0000F0 */ cmpwi r0, 0xf0
/* 00005B4C 40800024 */ bge lbl_00005B70
/* 00005B50 3C600000 */ lis r3, debugFlags@ha
/* 00005B54 80030000 */ lwz r0, debugFlags@l(r3)
/* 00005B58 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00005B5C 40820014 */ bne lbl_00005B70
/* 00005B60 A07D00E8 */ lhz r3, 0xe8(r29)
/* 00005B64 3803FFFF */ addi r0, r3, -1
/* 00005B68 B01D00E8 */ sth r0, 0xe8(r29)
/* 00005B6C 48000028 */ b lbl_00005B94
lbl_00005B70:
/* 00005B70 801D00C8 */ lwz r0, 0xc8(r29)
/* 00005B74 2C0000B4 */ cmpwi r0, 0xb4
/* 00005B78 4181001C */ bgt lbl_00005B94
/* 00005B7C 3C600000 */ lis r3, debugFlags@ha
/* 00005B80 80030000 */ lwz r0, debugFlags@l(r3)
/* 00005B84 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 00005B88 4082000C */ bne lbl_00005B94
/* 00005B8C 38000000 */ li r0, 0
/* 00005B90 B01D00E8 */ sth r0, 0xe8(r29)
lbl_00005B94:
/* 00005B94 801D00C8 */ lwz r0, 0xc8(r29)
/* 00005B98 2C0000F0 */ cmpwi r0, 0xf0
/* 00005B9C 40800224 */ bge lbl_00005DC0
/* 00005BA0 A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005BA4 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005BA8 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005BAC C03E0000 */ lfs f1, 0(r30)
/* 00005BB0 9001021C */ stw r0, 0x21c(r1)
/* 00005BB4 3EC04330 */ lis r22, 0x4330
/* 00005BB8 C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 00005BBC 90010224 */ stw r0, 0x224(r1)
/* 00005BC0 FC400890 */ fmr f2, f1
/* 00005BC4 C8A40000 */ lfd f5, lbl_000261E8@l(r4)
/* 00005BC8 38600000 */ li r3, 0
/* 00005BCC 92C10218 */ stw r22, 0x218(r1)
/* 00005BD0 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 00005BD4 92C10220 */ stw r22, 0x220(r1)
/* 00005BD8 C8810218 */ lfd f4, 0x218(r1)
/* 00005BDC C8010220 */ lfd f0, 0x220(r1)
/* 00005BE0 ECA42828 */ fsubs f5, f4, f5
/* 00005BE4 C09E0108 */ lfs f4, 0x108(r30)
/* 00005BE8 EC001828 */ fsubs f0, f0, f3
/* 00005BEC C0FE0004 */ lfs f7, 4(r30)
/* 00005BF0 EC660172 */ fmuls f3, f6, f5
/* 00005BF4 EC060032 */ fmuls f0, f6, f0
/* 00005BF8 EC632024 */ fdivs f3, f3, f4
/* 00005BFC EC002024 */ fdivs f0, f0, f4
/* 00005C00 EC671828 */ fsubs f3, f7, f3
/* 00005C04 EC870028 */ fsubs f4, f7, f0
/* 00005C08 4BFFA5C9 */ bl setup_camera_viewport
/* 00005C0C A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005C10 3CA00000 */ lis r5, lbl_000261E8@ha
/* 00005C14 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005C18 C8850000 */ lfd f4, lbl_000261E8@l(r5)
/* 00005C1C 9001022C */ stw r0, 0x22c(r1)
/* 00005C20 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005C24 C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 00005C28 90010234 */ stw r0, 0x234(r1)
/* 00005C2C 38600001 */ li r3, 1
/* 00005C30 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 00005C34 9001023C */ stw r0, 0x23c(r1)
/* 00005C38 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 00005C3C 92C10228 */ stw r22, 0x228(r1)
/* 00005C40 C0BE0108 */ lfs f5, 0x108(r30)
/* 00005C44 92C10230 */ stw r22, 0x230(r1)
/* 00005C48 C8010228 */ lfd f0, 0x228(r1)
/* 00005C4C C8410230 */ lfd f2, 0x230(r1)
/* 00005C50 EC802028 */ fsubs f4, f0, f4
/* 00005C54 92C10238 */ stw r22, 0x238(r1)
/* 00005C58 EC621828 */ fsubs f3, f2, f3
/* 00005C5C C0FE0004 */ lfs f7, 4(r30)
/* 00005C60 C8010238 */ lfd f0, 0x238(r1)
/* 00005C64 EC000828 */ fsubs f0, f0, f1
/* 00005C68 C05E0000 */ lfs f2, 0(r30)
/* 00005C6C EC860132 */ fmuls f4, f6, f4
/* 00005C70 EC2600F2 */ fmuls f1, f6, f3
/* 00005C74 EC060032 */ fmuls f0, f6, f0
/* 00005C78 EC842824 */ fdivs f4, f4, f5
/* 00005C7C EC612824 */ fdivs f3, f1, f5
/* 00005C80 EC002824 */ fdivs f0, f0, f5
/* 00005C84 EC272028 */ fsubs f1, f7, f4
/* 00005C88 EC671828 */ fsubs f3, f7, f3
/* 00005C8C EC870028 */ fsubs f4, f7, f0
/* 00005C90 4BFFA541 */ bl setup_camera_viewport
/* 00005C94 A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005C98 3CA00000 */ lis r5, lbl_000261E8@ha
/* 00005C9C 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005CA0 C8850000 */ lfd f4, lbl_000261E8@l(r5)
/* 00005CA4 90010244 */ stw r0, 0x244(r1)
/* 00005CA8 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005CAC C8630000 */ lfd f3, lbl_000261E8@l(r3)
/* 00005CB0 9001024C */ stw r0, 0x24c(r1)
/* 00005CB4 38600002 */ li r3, 2
/* 00005CB8 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 00005CBC 90010254 */ stw r0, 0x254(r1)
/* 00005CC0 C0DE00E8 */ lfs f6, 0xe8(r30)
/* 00005CC4 92C10240 */ stw r22, 0x240(r1)
/* 00005CC8 C0BE0108 */ lfs f5, 0x108(r30)
/* 00005CCC 92C10248 */ stw r22, 0x248(r1)
/* 00005CD0 C8010240 */ lfd f0, 0x240(r1)
/* 00005CD4 C8410248 */ lfd f2, 0x248(r1)
/* 00005CD8 92C10250 */ stw r22, 0x250(r1)
/* 00005CDC EC802028 */ fsubs f4, f0, f4
/* 00005CE0 EC421828 */ fsubs f2, f2, f3
/* 00005CE4 C0FE0004 */ lfs f7, 4(r30)
/* 00005CE8 C8010250 */ lfd f0, 0x250(r1)
/* 00005CEC EC660132 */ fmuls f3, f6, f4
/* 00005CF0 EC000828 */ fsubs f0, f0, f1
/* 00005CF4 EC4600B2 */ fmuls f2, f6, f2
/* 00005CF8 C03E0000 */ lfs f1, 0(r30)
/* 00005CFC EC832824 */ fdivs f4, f3, f5
/* 00005D00 EC622824 */ fdivs f3, f2, f5
/* 00005D04 EC060032 */ fmuls f0, f6, f0
/* 00005D08 EC472028 */ fsubs f2, f7, f4
/* 00005D0C EC671828 */ fsubs f3, f7, f3
/* 00005D10 EC002824 */ fdivs f0, f0, f5
/* 00005D14 EC870028 */ fsubs f4, f7, f0
/* 00005D18 4BFFA4B9 */ bl setup_camera_viewport
/* 00005D1C A01D00E8 */ lhz r0, 0xe8(r29)
/* 00005D20 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005D24 C8640000 */ lfd f3, lbl_000261E8@l(r4)
/* 00005D28 3C600000 */ lis r3, lbl_000261E8@ha
/* 00005D2C 9001025C */ stw r0, 0x25c(r1)
/* 00005D30 C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 00005D34 3CA00000 */ lis r5, lbl_000261E8@ha
/* 00005D38 92C10258 */ stw r22, 0x258(r1)
/* 00005D3C 3C800000 */ lis r4, lbl_000261E8@ha
/* 00005D40 C0FE00E8 */ lfs f7, 0xe8(r30)
/* 00005D44 C8410258 */ lfd f2, 0x258(r1)
/* 00005D48 38600003 */ li r3, 3
/* 00005D4C 90010264 */ stw r0, 0x264(r1)
/* 00005D50 EC621828 */ fsubs f3, f2, f3
/* 00005D54 C0DE0108 */ lfs f6, 0x108(r30)
/* 00005D58 92C10260 */ stw r22, 0x260(r1)
/* 00005D5C C11E0004 */ lfs f8, 4(r30)
/* 00005D60 EC8700F2 */ fmuls f4, f7, f3
/* 00005D64 9001026C */ stw r0, 0x26c(r1)
/* 00005D68 C8010260 */ lfd f0, 0x260(r1)
/* 00005D6C EC843024 */ fdivs f4, f4, f6
/* 00005D70 90010274 */ stw r0, 0x274(r1)
/* 00005D74 92C10268 */ stw r22, 0x268(r1)
/* 00005D78 92C10270 */ stw r22, 0x270(r1)
/* 00005D7C EC400828 */ fsubs f2, f0, f1
/* 00005D80 C8250000 */ lfd f1, lbl_000261E8@l(r5)
/* 00005D84 C8010268 */ lfd f0, 0x268(r1)
/* 00005D88 EC6700B2 */ fmuls f3, f7, f2
/* 00005D8C EC400828 */ fsubs f2, f0, f1
/* 00005D90 C8240000 */ lfd f1, lbl_000261E8@l(r4)
/* 00005D94 C8010270 */ lfd f0, 0x270(r1)
/* 00005D98 ECA33024 */ fdivs f5, f3, f6
/* 00005D9C EC000828 */ fsubs f0, f0, f1
/* 00005DA0 EC4700B2 */ fmuls f2, f7, f2
/* 00005DA4 EC282028 */ fsubs f1, f8, f4
/* 00005DA8 EC070032 */ fmuls f0, f7, f0
/* 00005DAC EC623024 */ fdivs f3, f2, f6
/* 00005DB0 EC803024 */ fdivs f4, f0, f6
/* 00005DB4 EC482828 */ fsubs f2, f8, f5
/* 00005DB8 4BFFA419 */ bl setup_camera_viewport
/* 00005DBC 48000064 */ b lbl_00005E20
lbl_00005DC0:
/* 00005DC0 C03E0000 */ lfs f1, 0(r30)
/* 00005DC4 38600000 */ li r3, 0
/* 00005DC8 C07E00E8 */ lfs f3, 0xe8(r30)
/* 00005DCC FC400890 */ fmr f2, f1
/* 00005DD0 FC801890 */ fmr f4, f3
/* 00005DD4 4BFFA3FD */ bl setup_camera_viewport
/* 00005DD8 C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005DDC 38600001 */ li r3, 1
/* 00005DE0 C05E0000 */ lfs f2, 0(r30)
/* 00005DE4 FC600890 */ fmr f3, f1
/* 00005DE8 FC800890 */ fmr f4, f1
/* 00005DEC 4BFFA3E5 */ bl setup_camera_viewport
/* 00005DF0 C05E00E8 */ lfs f2, 0xe8(r30)
/* 00005DF4 38600002 */ li r3, 2
/* 00005DF8 C03E0000 */ lfs f1, 0(r30)
/* 00005DFC FC601090 */ fmr f3, f2
/* 00005E00 FC801090 */ fmr f4, f2
/* 00005E04 4BFFA3CD */ bl setup_camera_viewport
/* 00005E08 C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005E0C 38600003 */ li r3, 3
/* 00005E10 FC400890 */ fmr f2, f1
/* 00005E14 FC600890 */ fmr f3, f1
/* 00005E18 FC800890 */ fmr f4, f1
/* 00005E1C 4BFFA3B5 */ bl setup_camera_viewport
lbl_00005E20:
/* 00005E20 3C600000 */ lis r3, cameraInfo@ha
/* 00005E24 38630000 */ addi r3, r3, cameraInfo@l
/* 00005E28 A8030024 */ lha r0, 0x24(r3)
/* 00005E2C 60000080 */ ori r0, r0, 0x80
/* 00005E30 B0030024 */ sth r0, 0x24(r3)
/* 00005E34 A80302A8 */ lha r0, 0x2a8(r3)
/* 00005E38 60000080 */ ori r0, r0, 0x80
/* 00005E3C B00302A8 */ sth r0, 0x2a8(r3)
/* 00005E40 A803052C */ lha r0, 0x52c(r3)
/* 00005E44 60000080 */ ori r0, r0, 0x80
/* 00005E48 B003052C */ sth r0, 0x52c(r3)
/* 00005E4C A80307B0 */ lha r0, 0x7b0(r3)
/* 00005E50 60000080 */ ori r0, r0, 0x80
/* 00005E54 B00307B0 */ sth r0, 0x7b0(r3)
/* 00005E58 480000A4 */ b lbl_00005EFC
lbl_00005E5C:
/* 00005E5C 28000003 */ cmplwi r0, 3
/* 00005E60 4082009C */ bne lbl_00005EFC
/* 00005E64 C03E0000 */ lfs f1, 0(r30)
/* 00005E68 38600000 */ li r3, 0
/* 00005E6C C07E00E8 */ lfs f3, 0xe8(r30)
/* 00005E70 FC400890 */ fmr f2, f1
/* 00005E74 FC801890 */ fmr f4, f3
/* 00005E78 4BFFA359 */ bl setup_camera_viewport
/* 00005E7C C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005E80 38600001 */ li r3, 1
/* 00005E84 C05E0000 */ lfs f2, 0(r30)
/* 00005E88 FC600890 */ fmr f3, f1
/* 00005E8C FC800890 */ fmr f4, f1
/* 00005E90 4BFFA341 */ bl setup_camera_viewport
/* 00005E94 C05E00E8 */ lfs f2, 0xe8(r30)
/* 00005E98 38600002 */ li r3, 2
/* 00005E9C C03E0000 */ lfs f1, 0(r30)
/* 00005EA0 FC601090 */ fmr f3, f2
/* 00005EA4 FC801090 */ fmr f4, f2
/* 00005EA8 4BFFA329 */ bl setup_camera_viewport
/* 00005EAC C03E00E8 */ lfs f1, 0xe8(r30)
/* 00005EB0 38600003 */ li r3, 3
/* 00005EB4 FC400890 */ fmr f2, f1
/* 00005EB8 FC600890 */ fmr f3, f1
/* 00005EBC FC800890 */ fmr f4, f1
/* 00005EC0 4BFFA311 */ bl setup_camera_viewport
/* 00005EC4 3C600000 */ lis r3, cameraInfo@ha
/* 00005EC8 38630000 */ addi r3, r3, cameraInfo@l
/* 00005ECC A8030024 */ lha r0, 0x24(r3)
/* 00005ED0 60000080 */ ori r0, r0, 0x80
/* 00005ED4 B0030024 */ sth r0, 0x24(r3)
/* 00005ED8 A80302A8 */ lha r0, 0x2a8(r3)
/* 00005EDC 60000080 */ ori r0, r0, 0x80
/* 00005EE0 B00302A8 */ sth r0, 0x2a8(r3)
/* 00005EE4 A803052C */ lha r0, 0x52c(r3)
/* 00005EE8 60000080 */ ori r0, r0, 0x80
/* 00005EEC B003052C */ sth r0, 0x52c(r3)
/* 00005EF0 A80307B0 */ lha r0, 0x7b0(r3)
/* 00005EF4 60000080 */ ori r0, r0, 0x80
/* 00005EF8 B00307B0 */ sth r0, 0x7b0(r3)
lbl_00005EFC:
/* 00005EFC 38600000 */ li r3, 0
/* 00005F00 4BFFA2D1 */ bl change_current_camera
/* 00005F04 3C600000 */ lis r3, modeCtrl@ha
/* 00005F08 C09E0000 */ lfs f4, 0(r30)
/* 00005F0C 3AC30000 */ addi r22, r3, modeCtrl@l
/* 00005F10 8016002C */ lwz r0, 0x2c(r22)
/* 00005F14 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00005F18 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00005F1C 80630000 */ lwz r3, 0(r3)
/* 00005F20 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00005F24 80630010 */ lwz r3, 0x10(r3)
/* 00005F28 3C800000 */ lis r4, ballInfo@ha
/* 00005F2C 3AE40000 */ addi r23, r4, ballInfo@l
/* 00005F30 C0430008 */ lfs f2, 8(r3)
/* 00005F34 7C970214 */ add r4, r23, r0
/* 00005F38 C0030000 */ lfs f0, 0(r3)
/* 00005F3C C064000C */ lfs f3, 0xc(r4)
/* 00005F40 C0240004 */ lfs f1, 4(r4)
/* 00005F44 EC431028 */ fsubs f2, f3, f2
/* 00005F48 EC210028 */ fsubs f1, f1, f0
/* 00005F4C EC210072 */ fmuls f1, f1, f1
/* 00005F50 EC24093A */ fmadds f1, f4, f4, f1
/* 00005F54 EC2208BA */ fmadds f1, f2, f2, f1
/* 00005F58 4BFFA279 */ bl mathutil_sqrt
/* 00005F5C C81E00A0 */ lfd f0, 0xa0(r30)
/* 00005F60 FC010040 */ fcmpo cr0, f1, f0
/* 00005F64 4C401382 */ cror 2, 0, 2
/* 00005F68 408200CC */ bne lbl_00006034
/* 00005F6C 881D00EE */ lbz r0, 0xee(r29)
/* 00005F70 28000000 */ cmplwi r0, 0
/* 00005F74 408200C0 */ bne lbl_00006034
/* 00005F78 3C600000 */ lis r3, cameraInfo@ha
/* 00005F7C 38630000 */ addi r3, r3, cameraInfo@l
/* 00005F80 38630144 */ addi r3, r3, 0x144
/* 00005F84 4BFFA24D */ bl mathutil_mtxA_from_mtx
/* 00005F88 8016002C */ lwz r0, 0x2c(r22)
/* 00005F8C C81E0110 */ lfd f0, 0x110(r30)
/* 00005F90 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00005F94 7C770214 */ add r3, r23, r0
/* 00005F98 806300FC */ lwz r3, 0xfc(r3)
/* 00005F9C C0430034 */ lfs f2, 0x34(r3)
/* 00005FA0 C0230030 */ lfs f1, 0x30(r3)
/* 00005FA4 FC420028 */ fsub f2, f2, f0
/* 00005FA8 C0630038 */ lfs f3, 0x38(r3)
/* 00005FAC FC401018 */ frsp f2, f2
/* 00005FB0 4BFFA221 */ bl mathutil_mtxA_translate_xyz
/* 00005FB4 8016002C */ lwz r0, 0x2c(r22)
/* 00005FB8 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00005FBC 7C770214 */ add r3, r23, r0
/* 00005FC0 A8630092 */ lha r3, 0x92(r3)
/* 00005FC4 3863C000 */ addi r3, r3, -16384
/* 00005FC8 4BFFA209 */ bl mathutil_mtxA_rotate_y
/* 00005FCC 8016002C */ lwz r0, 0x2c(r22)
/* 00005FD0 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00005FD4 7C770214 */ add r3, r23, r0
/* 00005FD8 806300FC */ lwz r3, 0xfc(r3)
/* 00005FDC 80630000 */ lwz r3, 0(r3)
/* 00005FE0 3C630001 */ addis r3, r3, 1
/* 00005FE4 3863A4F8 */ addi r3, r3, -23304
/* 00005FE8 4BFFA1E9 */ bl mathutil_mtxA_mult_right
/* 00005FEC C03E0118 */ lfs f1, 0x118(r30)
/* 00005FF0 4BFFA1E1 */ bl mathutil_mtxA_scale_s
/* 00005FF4 387D0100 */ addi r3, r29, 0x100
/* 00005FF8 4BFFA1D9 */ bl mathutil_mtxA_mult_right
/* 00005FFC 3C600000 */ lis r3, mathutilData@ha
/* 00006000 3A630000 */ addi r19, r3, mathutilData@l
/* 00006004 80730000 */ lwz r3, 0(r19)
/* 00006008 38800000 */ li r4, 0
/* 0000600C 4BFFA1C5 */ bl GXLoadPosMtxImm
/* 00006010 80730000 */ lwz r3, 0(r19)
/* 00006014 38800000 */ li r4, 0
/* 00006018 4BFFA1B9 */ bl GXLoadNrmMtxImm
/* 0000601C 3C600000 */ lis r3, minigameGma@ha
/* 00006020 38630000 */ addi r3, r3, minigameGma@l
/* 00006024 80630000 */ lwz r3, 0(r3)
/* 00006028 80630008 */ lwz r3, 8(r3)
/* 0000602C 80630000 */ lwz r3, 0(r3)
/* 00006030 4BFFA1A1 */ bl avdisp_draw_model_unculled_sort_none
lbl_00006034:
/* 00006034 A01D00F8 */ lhz r0, 0xf8(r29)
/* 00006038 28000001 */ cmplwi r0, 1
/* 0000603C 418203AC */ beq lbl_000063E8
/* 00006040 38600001 */ li r3, 1
/* 00006044 4BFFA18D */ bl change_current_camera
/* 00006048 3C600000 */ lis r3, modeCtrl@ha
/* 0000604C C09E0000 */ lfs f4, 0(r30)
/* 00006050 3AC30000 */ addi r22, r3, modeCtrl@l
/* 00006054 8016002C */ lwz r0, 0x2c(r22)
/* 00006058 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 0000605C 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00006060 80630000 */ lwz r3, 0(r3)
/* 00006064 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006068 80630010 */ lwz r3, 0x10(r3)
/* 0000606C 3C800000 */ lis r4, ballInfo@ha
/* 00006070 3AE40000 */ addi r23, r4, ballInfo@l
/* 00006074 C0430008 */ lfs f2, 8(r3)
/* 00006078 7C970214 */ add r4, r23, r0
/* 0000607C C0030000 */ lfs f0, 0(r3)
/* 00006080 C064000C */ lfs f3, 0xc(r4)
/* 00006084 C0240004 */ lfs f1, 4(r4)
/* 00006088 EC431028 */ fsubs f2, f3, f2
/* 0000608C EC210028 */ fsubs f1, f1, f0
/* 00006090 EC210072 */ fmuls f1, f1, f1
/* 00006094 EC24093A */ fmadds f1, f4, f4, f1
/* 00006098 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000609C 4BFFA135 */ bl mathutil_sqrt
/* 000060A0 C81E00A0 */ lfd f0, 0xa0(r30)
/* 000060A4 FC010040 */ fcmpo cr0, f1, f0
/* 000060A8 4C401382 */ cror 2, 0, 2
/* 000060AC 408200CC */ bne lbl_00006178
/* 000060B0 881D00EE */ lbz r0, 0xee(r29)
/* 000060B4 28000000 */ cmplwi r0, 0
/* 000060B8 408200C0 */ bne lbl_00006178
/* 000060BC 3C600000 */ lis r3, cameraInfo@ha
/* 000060C0 38630000 */ addi r3, r3, cameraInfo@l
/* 000060C4 386303C8 */ addi r3, r3, 0x3c8
/* 000060C8 4BFFA109 */ bl mathutil_mtxA_from_mtx
/* 000060CC 8016002C */ lwz r0, 0x2c(r22)
/* 000060D0 C81E0110 */ lfd f0, 0x110(r30)
/* 000060D4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 000060D8 7C770214 */ add r3, r23, r0
/* 000060DC 806300FC */ lwz r3, 0xfc(r3)
/* 000060E0 C0430034 */ lfs f2, 0x34(r3)
/* 000060E4 C0230030 */ lfs f1, 0x30(r3)
/* 000060E8 FC420028 */ fsub f2, f2, f0
/* 000060EC C0630038 */ lfs f3, 0x38(r3)
/* 000060F0 FC401018 */ frsp f2, f2
/* 000060F4 4BFFA0DD */ bl mathutil_mtxA_translate_xyz
/* 000060F8 8016002C */ lwz r0, 0x2c(r22)
/* 000060FC 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006100 7C770214 */ add r3, r23, r0
/* 00006104 A8630092 */ lha r3, 0x92(r3)
/* 00006108 3863C000 */ addi r3, r3, -16384
/* 0000610C 4BFFA0C5 */ bl mathutil_mtxA_rotate_y
/* 00006110 8016002C */ lwz r0, 0x2c(r22)
/* 00006114 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006118 7C770214 */ add r3, r23, r0
/* 0000611C 806300FC */ lwz r3, 0xfc(r3)
/* 00006120 80630000 */ lwz r3, 0(r3)
/* 00006124 3C630001 */ addis r3, r3, 1
/* 00006128 3863A4F8 */ addi r3, r3, -23304
/* 0000612C 4BFFA0A5 */ bl mathutil_mtxA_mult_right
/* 00006130 C03E0118 */ lfs f1, 0x118(r30)
/* 00006134 4BFFA09D */ bl mathutil_mtxA_scale_s
/* 00006138 387D0100 */ addi r3, r29, 0x100
/* 0000613C 4BFFA095 */ bl mathutil_mtxA_mult_right
/* 00006140 3C600000 */ lis r3, mathutilData@ha
/* 00006144 3A630000 */ addi r19, r3, mathutilData@l
/* 00006148 80730000 */ lwz r3, 0(r19)
/* 0000614C 38800000 */ li r4, 0
/* 00006150 4BFFA081 */ bl GXLoadPosMtxImm
/* 00006154 80730000 */ lwz r3, 0(r19)
/* 00006158 38800000 */ li r4, 0
/* 0000615C 4BFFA075 */ bl GXLoadNrmMtxImm
/* 00006160 3C600000 */ lis r3, minigameGma@ha
/* 00006164 38630000 */ addi r3, r3, minigameGma@l
/* 00006168 80630000 */ lwz r3, 0(r3)
/* 0000616C 80630008 */ lwz r3, 8(r3)
/* 00006170 80630000 */ lwz r3, 0(r3)
/* 00006174 4BFFA05D */ bl avdisp_draw_model_unculled_sort_none
lbl_00006178:
/* 00006178 38600002 */ li r3, 2
/* 0000617C 4BFFA055 */ bl change_current_camera
/* 00006180 3C600000 */ lis r3, modeCtrl@ha
/* 00006184 C09E0000 */ lfs f4, 0(r30)
/* 00006188 3AC30000 */ addi r22, r3, modeCtrl@l
/* 0000618C 8016002C */ lwz r0, 0x2c(r22)
/* 00006190 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 00006194 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 00006198 80630000 */ lwz r3, 0(r3)
/* 0000619C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 000061A0 80630010 */ lwz r3, 0x10(r3)
/* 000061A4 3C800000 */ lis r4, ballInfo@ha
/* 000061A8 3AE40000 */ addi r23, r4, ballInfo@l
/* 000061AC C0430008 */ lfs f2, 8(r3)
/* 000061B0 7C970214 */ add r4, r23, r0
/* 000061B4 C0030000 */ lfs f0, 0(r3)
/* 000061B8 C064000C */ lfs f3, 0xc(r4)
/* 000061BC C0240004 */ lfs f1, 4(r4)
/* 000061C0 EC431028 */ fsubs f2, f3, f2
/* 000061C4 EC210028 */ fsubs f1, f1, f0
/* 000061C8 EC210072 */ fmuls f1, f1, f1
/* 000061CC EC24093A */ fmadds f1, f4, f4, f1
/* 000061D0 EC2208BA */ fmadds f1, f2, f2, f1
/* 000061D4 4BFF9FFD */ bl mathutil_sqrt
/* 000061D8 C81E00A0 */ lfd f0, 0xa0(r30)
/* 000061DC FC010040 */ fcmpo cr0, f1, f0
/* 000061E0 4C401382 */ cror 2, 0, 2
/* 000061E4 408200CC */ bne lbl_000062B0
/* 000061E8 881D00EE */ lbz r0, 0xee(r29)
/* 000061EC 28000000 */ cmplwi r0, 0
/* 000061F0 408200C0 */ bne lbl_000062B0
/* 000061F4 3C600000 */ lis r3, cameraInfo@ha
/* 000061F8 38630000 */ addi r3, r3, cameraInfo@l
/* 000061FC 3863064C */ addi r3, r3, 0x64c
/* 00006200 4BFF9FD1 */ bl mathutil_mtxA_from_mtx
/* 00006204 8016002C */ lwz r0, 0x2c(r22)
/* 00006208 C81E0110 */ lfd f0, 0x110(r30)
/* 0000620C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006210 7C770214 */ add r3, r23, r0
/* 00006214 806300FC */ lwz r3, 0xfc(r3)
/* 00006218 C0430034 */ lfs f2, 0x34(r3)
/* 0000621C C0230030 */ lfs f1, 0x30(r3)
/* 00006220 FC420028 */ fsub f2, f2, f0
/* 00006224 C0630038 */ lfs f3, 0x38(r3)
/* 00006228 FC401018 */ frsp f2, f2
/* 0000622C 4BFF9FA5 */ bl mathutil_mtxA_translate_xyz
/* 00006230 8016002C */ lwz r0, 0x2c(r22)
/* 00006234 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006238 7C770214 */ add r3, r23, r0
/* 0000623C A8630092 */ lha r3, 0x92(r3)
/* 00006240 3863C000 */ addi r3, r3, -16384
/* 00006244 4BFF9F8D */ bl mathutil_mtxA_rotate_y
/* 00006248 8016002C */ lwz r0, 0x2c(r22)
/* 0000624C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006250 7C770214 */ add r3, r23, r0
/* 00006254 806300FC */ lwz r3, 0xfc(r3)
/* 00006258 80630000 */ lwz r3, 0(r3)
/* 0000625C 3C630001 */ addis r3, r3, 1
/* 00006260 3863A4F8 */ addi r3, r3, -23304
/* 00006264 4BFF9F6D */ bl mathutil_mtxA_mult_right
/* 00006268 C03E0118 */ lfs f1, 0x118(r30)
/* 0000626C 4BFF9F65 */ bl mathutil_mtxA_scale_s
/* 00006270 387D0100 */ addi r3, r29, 0x100
/* 00006274 4BFF9F5D */ bl mathutil_mtxA_mult_right
/* 00006278 3C600000 */ lis r3, mathutilData@ha
/* 0000627C 3A630000 */ addi r19, r3, mathutilData@l
/* 00006280 80730000 */ lwz r3, 0(r19)
/* 00006284 38800000 */ li r4, 0
/* 00006288 4BFF9F49 */ bl GXLoadPosMtxImm
/* 0000628C 80730000 */ lwz r3, 0(r19)
/* 00006290 38800000 */ li r4, 0
/* 00006294 4BFF9F3D */ bl GXLoadNrmMtxImm
/* 00006298 3C600000 */ lis r3, minigameGma@ha
/* 0000629C 38630000 */ addi r3, r3, minigameGma@l
/* 000062A0 80630000 */ lwz r3, 0(r3)
/* 000062A4 80630008 */ lwz r3, 8(r3)
/* 000062A8 80630000 */ lwz r3, 0(r3)
/* 000062AC 4BFF9F25 */ bl avdisp_draw_model_unculled_sort_none
lbl_000062B0:
/* 000062B0 38600003 */ li r3, 3
/* 000062B4 4BFF9F1D */ bl change_current_camera
/* 000062B8 3C600000 */ lis r3, modeCtrl@ha
/* 000062BC C09E0000 */ lfs f4, 0(r30)
/* 000062C0 3AC30000 */ addi r22, r3, modeCtrl@l
/* 000062C4 8016002C */ lwz r0, 0x2c(r22)
/* 000062C8 3C600000 */ lis r3, decodedStageLzPtr@ha
/* 000062CC 38630000 */ addi r3, r3, decodedStageLzPtr@l
/* 000062D0 80630000 */ lwz r3, 0(r3)
/* 000062D4 1C0001A4 */ mulli r0, r0, 0x1a4
/* 000062D8 80630010 */ lwz r3, 0x10(r3)
/* 000062DC 3C800000 */ lis r4, ballInfo@ha
/* 000062E0 3AE40000 */ addi r23, r4, ballInfo@l
/* 000062E4 C0430008 */ lfs f2, 8(r3)
/* 000062E8 7C970214 */ add r4, r23, r0
/* 000062EC C0030000 */ lfs f0, 0(r3)
/* 000062F0 C064000C */ lfs f3, 0xc(r4)
/* 000062F4 C0240004 */ lfs f1, 4(r4)
/* 000062F8 EC431028 */ fsubs f2, f3, f2
/* 000062FC EC210028 */ fsubs f1, f1, f0
/* 00006300 EC210072 */ fmuls f1, f1, f1
/* 00006304 EC24093A */ fmadds f1, f4, f4, f1
/* 00006308 EC2208BA */ fmadds f1, f2, f2, f1
/* 0000630C 4BFF9EC5 */ bl mathutil_sqrt
/* 00006310 C81E00A0 */ lfd f0, 0xa0(r30)
/* 00006314 FC010040 */ fcmpo cr0, f1, f0
/* 00006318 4C401382 */ cror 2, 0, 2
/* 0000631C 408200CC */ bne lbl_000063E8
/* 00006320 881D00EE */ lbz r0, 0xee(r29)
/* 00006324 28000000 */ cmplwi r0, 0
/* 00006328 408200C0 */ bne lbl_000063E8
/* 0000632C 3C600000 */ lis r3, cameraInfo@ha
/* 00006330 38630000 */ addi r3, r3, cameraInfo@l
/* 00006334 386308D0 */ addi r3, r3, 0x8d0
/* 00006338 4BFF9E99 */ bl mathutil_mtxA_from_mtx
/* 0000633C 8016002C */ lwz r0, 0x2c(r22)
/* 00006340 C81E0110 */ lfd f0, 0x110(r30)
/* 00006344 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006348 7C770214 */ add r3, r23, r0
/* 0000634C 806300FC */ lwz r3, 0xfc(r3)
/* 00006350 C0430034 */ lfs f2, 0x34(r3)
/* 00006354 C0230030 */ lfs f1, 0x30(r3)
/* 00006358 FC420028 */ fsub f2, f2, f0
/* 0000635C C0630038 */ lfs f3, 0x38(r3)
/* 00006360 FC401018 */ frsp f2, f2
/* 00006364 4BFF9E6D */ bl mathutil_mtxA_translate_xyz
/* 00006368 8016002C */ lwz r0, 0x2c(r22)
/* 0000636C 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006370 7C770214 */ add r3, r23, r0
/* 00006374 A8630092 */ lha r3, 0x92(r3)
/* 00006378 3863C000 */ addi r3, r3, -16384
/* 0000637C 4BFF9E55 */ bl mathutil_mtxA_rotate_y
/* 00006380 8016002C */ lwz r0, 0x2c(r22)
/* 00006384 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006388 7C770214 */ add r3, r23, r0
/* 0000638C 806300FC */ lwz r3, 0xfc(r3)
/* 00006390 80630000 */ lwz r3, 0(r3)
/* 00006394 3C630001 */ addis r3, r3, 1
/* 00006398 3863A4F8 */ addi r3, r3, -23304
/* 0000639C 4BFF9E35 */ bl mathutil_mtxA_mult_right
/* 000063A0 C03E0118 */ lfs f1, 0x118(r30)
/* 000063A4 4BFF9E2D */ bl mathutil_mtxA_scale_s
/* 000063A8 387D0100 */ addi r3, r29, 0x100
/* 000063AC 4BFF9E25 */ bl mathutil_mtxA_mult_right
/* 000063B0 3C600000 */ lis r3, mathutilData@ha
/* 000063B4 3A630000 */ addi r19, r3, mathutilData@l
/* 000063B8 80730000 */ lwz r3, 0(r19)
/* 000063BC 38800000 */ li r4, 0
/* 000063C0 4BFF9E11 */ bl GXLoadPosMtxImm
/* 000063C4 80730000 */ lwz r3, 0(r19)
/* 000063C8 38800000 */ li r4, 0
/* 000063CC 4BFF9E05 */ bl GXLoadNrmMtxImm
/* 000063D0 3C600000 */ lis r3, minigameGma@ha
/* 000063D4 38630000 */ addi r3, r3, minigameGma@l
/* 000063D8 80630000 */ lwz r3, 0(r3)
/* 000063DC 80630008 */ lwz r3, 8(r3)
/* 000063E0 80630000 */ lwz r3, 0(r3)
/* 000063E4 4BFF9DED */ bl avdisp_draw_model_unculled_sort_none
lbl_000063E8:
/* 000063E8 48003869 */ bl lbl_00009C50
/* 000063EC 38600000 */ li r3, 0
/* 000063F0 4BFF9DE1 */ bl change_current_camera
/* 000063F4 4BFF9DDD */ bl default_camera_env
/* 000063F8 4BFF9DD9 */ bl reset_text_draw_settings
/* 000063FC 38600009 */ li r3, 9
/* 00006400 4BFF9DD1 */ bl set_text_font
/* 00006404 C03E011C */ lfs f1, 0x11c(r30)
/* 00006408 FC400890 */ fmr f2, f1
/* 0000640C 4BFF9DC5 */ bl set_text_scale
/* 00006410 3C600001 */ lis r3, 1
/* 00006414 3863FFFF */ addi r3, r3, -1
/* 00006418 4BFF9DB9 */ bl set_text_mul_color
/* 0000641C A01D00F8 */ lhz r0, 0xf8(r29)
/* 00006420 28000002 */ cmplwi r0, 2
/* 00006424 4082001C */ bne lbl_00006440
/* 00006428 801D0000 */ lwz r0, 0(r29)
/* 0000642C 28000400 */ cmplwi r0, 0x400
/* 00006430 40820010 */ bne lbl_00006440
/* 00006434 801D00C8 */ lwz r0, 0xc8(r29)
/* 00006438 2C0000F0 */ cmpwi r0, 0xf0
/* 0000643C 40811ADC */ ble lbl_00007F18
lbl_00006440:
/* 00006440 C03E0120 */ lfs f1, 0x120(r30)
/* 00006444 C05E0124 */ lfs f2, 0x124(r30)
/* 00006448 4BFF9D89 */ bl set_text_pos
/* 0000644C 3C600000 */ lis r3, globalAnimTimer@ha
/* 00006450 38830000 */ addi r4, r3, globalAnimTimer@l
/* 00006454 3C608889 */ lis r3, 0x8889
/* 00006458 80840000 */ lwz r4, 0(r4)
/* 0000645C 38038889 */ addi r0, r3, -30583
/* 00006460 7C002016 */ mulhwu r0, r0, r4
/* 00006464 5400D97E */ srwi r0, r0, 5
/* 00006468 1C00003C */ mulli r0, r0, 0x3c
/* 0000646C 7C002050 */ subf r0, r0, r4
/* 00006470 2800001E */ cmplwi r0, 0x1e
/* 00006474 40811AA4 */ ble lbl_00007F18
/* 00006478 387F01E0 */ addi r3, r31, 0x1e0
/* 0000647C 4BFF9D55 */ bl sprite_puts
/* 00006480 48001A98 */ b lbl_00007F18
lbl_00006484:
/* 00006484 3C600000 */ lis r3, modeCtrl@ha
/* 00006488 38630000 */ addi r3, r3, modeCtrl@l
/* 0000648C 8003002C */ lwz r0, 0x2c(r3)
/* 00006490 3C600000 */ lis r3, cameraInfo@ha
/* 00006494 38630000 */ addi r3, r3, cameraInfo@l
/* 00006498 1C000284 */ mulli r0, r0, 0x284
/* 0000649C 7C630214 */ add r3, r3, r0
/* 000064A0 8803001F */ lbz r0, 0x1f(r3)
/* 000064A4 2C00000B */ cmpwi r0, 0xb
/* 000064A8 40820428 */ bne lbl_000068D0
/* 000064AC 801D00D0 */ lwz r0, 0xd0(r29)
/* 000064B0 2C0002D0 */ cmpwi r0, 0x2d0
/* 000064B4 408101F8 */ ble lbl_000066AC
/* 000064B8 20000384 */ subfic r0, r0, 0x384
/* 000064BC C03E012C */ lfs f1, 0x12c(r30)
/* 000064C0 6C008000 */ xoris r0, r0, 0x8000
/* 000064C4 C09E0128 */ lfs f4, 0x128(r30)
/* 000064C8 9001021C */ stw r0, 0x21c(r1)
/* 000064CC 3E604330 */ lis r19, 0x4330
/* 000064D0 3C600000 */ lis r3, lbl_000261F0@ha
/* 000064D4 C01E0130 */ lfs f0, 0x130(r30)
/* 000064D8 92610218 */ stw r19, 0x218(r1)
/* 000064DC C8630000 */ lfd f3, lbl_000261F0@l(r3)
/* 000064E0 C8410218 */ lfd f2, 0x218(r1)
/* 000064E4 EC421828 */ fsubs f2, f2, f3
/* 000064E8 EC220824 */ fdivs f1, f2, f1
/* 000064EC EC240072 */ fmuls f1, f4, f1
/* 000064F0 EC010028 */ fsubs f0, f1, f0
/* 000064F4 FC00001E */ fctiwz f0, f0
/* 000064F8 D8010220 */ stfd f0, 0x220(r1)
/* 000064FC 80610224 */ lwz r3, 0x224(r1)
/* 00006500 4BFF9CD1 */ bl mathutil_sin
/* 00006504 801D00D0 */ lwz r0, 0xd0(r29)
/* 00006508 3CA00000 */ lis r5, lbl_000261F0@ha
/* 0000650C 3C600000 */ lis r3, lbl_000261F0@ha
/* 00006510 C8C50000 */ lfd f6, lbl_000261F0@l(r5)
/* 00006514 20800384 */ subfic r4, r0, 0x384
/* 00006518 20000384 */ subfic r0, r0, 0x384
/* 0000651C C8830000 */ lfd f4, lbl_000261F0@l(r3)
/* 00006520 6C848000 */ xoris r4, r4, 0x8000
/* 00006524 C05E0134 */ lfs f2, 0x134(r30)
/* 00006528 6C008000 */ xoris r0, r0, 0x8000
/* 0000652C 9081022C */ stw r4, 0x22c(r1)
/* 00006530 C0FE0004 */ lfs f7, 4(r30)
/* 00006534 90010234 */ stw r0, 0x234(r1)
/* 00006538 C81E00F0 */ lfd f0, 0xf0(r30)
/* 0000653C 92610228 */ stw r19, 0x228(r1)
/* 00006540 92610230 */ stw r19, 0x230(r1)
/* 00006544 C8A10228 */ lfd f5, 0x228(r1)
/* 00006548 C8610230 */ lfd f3, 0x230(r1)
/* 0000654C ECA53028 */ fsubs f5, f5, f6
/* 00006550 EC632028 */ fsubs f3, f3, f4
/* 00006554 EC6500F2 */ fmuls f3, f5, f3
/* 00006558 EC431024 */ fdivs f2, f3, f2
/* 0000655C EC47102A */ fadds f2, f7, f2
/* 00006560 EC211024 */ fdivs f1, f1, f2
/* 00006564 FFE0082A */ fadd f31, f0, f1
/* 00006568 FFE0F818 */ frsp f31, f31
/* 0000656C 4BFF9C65 */ bl reset_text_draw_settings
/* 00006570 38600009 */ li r3, 9
/* 00006574 4BFF9C5D */ bl set_text_font
/* 00006578 FC20F890 */ fmr f1, f31
/* 0000657C FC40F890 */ fmr f2, f31
/* 00006580 4BFF9C51 */ bl set_text_scale
/* 00006584 3E600100 */ lis r19, 0x100
/* 00006588 3873FFFF */ addi r3, r19, -1
/* 0000658C 4BFF9C45 */ bl set_text_mul_color
/* 00006590 C03E0140 */ lfs f1, 0x140(r30)
/* 00006594 C01E0148 */ lfs f0, 0x148(r30)
/* 00006598 EC4107F2 */ fmuls f2, f1, f31
/* 0000659C C07E013C */ lfs f3, 0x13c(r30)
/* 000065A0 EC0007F2 */ fmuls f0, f0, f31
/* 000065A4 C03E0144 */ lfs f1, 0x144(r30)
/* 000065A8 C09E0138 */ lfs f4, 0x138(r30)
/* 000065AC EC6300B2 */ fmuls f3, f3, f2
/* 000065B0 EC410028 */ fsubs f2, f1, f0
/* 000065B4 EC241828 */ fsubs f1, f4, f3
/* 000065B8 4BFF9C19 */ bl set_text_pos
/* 000065BC 387F01E8 */ addi r3, r31, 0x1e8
/* 000065C0 4BFF9C11 */ bl sprite_puts
/* 000065C4 A87D003A */ lha r3, 0x3a(r29)
/* 000065C8 38A30001 */ addi r5, r3, 1
/* 000065CC 2C05000A */ cmpwi r5, 0xa
/* 000065D0 4180004C */ blt lbl_0000661C
/* 000065D4 4CC63182 */ crclr 6
/* 000065D8 38610114 */ addi r3, r1, 0x114
/* 000065DC 389F01F0 */ addi r4, r31, 0x1f0
/* 000065E0 4BFF9BF1 */ bl sprintf
/* 000065E4 3873FF00 */ addi r3, r19, -256
/* 000065E8 4BFF9BE9 */ bl set_text_mul_color
/* 000065EC C03E0140 */ lfs f1, 0x140(r30)
/* 000065F0 C01E0148 */ lfs f0, 0x148(r30)
/* 000065F4 EC2107F2 */ fmuls f1, f1, f31
/* 000065F8 C07E0138 */ lfs f3, 0x138(r30)
/* 000065FC EC0007F2 */ fmuls f0, f0, f31
/* 00006600 C05E0144 */ lfs f2, 0x144(r30)
/* 00006604 EC23082A */ fadds f1, f3, f1
/* 00006608 EC420028 */ fsubs f2, f2, f0
/* 0000660C 4BFF9BC5 */ bl set_text_pos
/* 00006610 38610114 */ addi r3, r1, 0x114
/* 00006614 4BFF9BBD */ bl sprite_puts
/* 00006618 48000050 */ b lbl_00006668
lbl_0000661C:
/* 0000661C 4CC63182 */ crclr 6
/* 00006620 38610114 */ addi r3, r1, 0x114
/* 00006624 389F01F0 */ addi r4, r31, 0x1f0
/* 00006628 4BFF9BA9 */ bl sprintf
/* 0000662C 3873FF00 */ addi r3, r19, -256
/* 00006630 4BFF9BA1 */ bl set_text_mul_color
/* 00006634 C03E0140 */ lfs f1, 0x140(r30)
/* 00006638 C01E0148 */ lfs f0, 0x148(r30)
/* 0000663C EC4107F2 */ fmuls f2, f1, f31
/* 00006640 C07E00D4 */ lfs f3, 0xd4(r30)
/* 00006644 EC0007F2 */ fmuls f0, f0, f31
/* 00006648 C03E0144 */ lfs f1, 0x144(r30)
/* 0000664C C09E0138 */ lfs f4, 0x138(r30)
/* 00006650 EC6300B2 */ fmuls f3, f3, f2
/* 00006654 EC410028 */ fsubs f2, f1, f0
/* 00006658 EC24182A */ fadds f1, f4, f3
/* 0000665C 4BFF9B75 */ bl set_text_pos
/* 00006660 38610114 */ addi r3, r1, 0x114
/* 00006664 4BFF9B6D */ bl sprite_puts
lbl_00006668:
/* 00006668 3C600100 */ lis r3, 0x100
/* 0000666C 3863FFFF */ addi r3, r3, -1
/* 00006670 4BFF9B61 */ bl set_text_mul_color
/* 00006674 C03E0140 */ lfs f1, 0x140(r30)
/* 00006678 C01E014C */ lfs f0, 0x14c(r30)
/* 0000667C EC4107F2 */ fmuls f2, f1, f31
/* 00006680 C07E00D4 */ lfs f3, 0xd4(r30)
/* 00006684 EC0007F2 */ fmuls f0, f0, f31
/* 00006688 C03E0144 */ lfs f1, 0x144(r30)
/* 0000668C C09E0138 */ lfs f4, 0x138(r30)
/* 00006690 EC6300B2 */ fmuls f3, f3, f2
/* 00006694 EC41002A */ fadds f2, f1, f0
/* 00006698 EC241828 */ fsubs f1, f4, f3
/* 0000669C 4BFF9B35 */ bl set_text_pos
/* 000066A0 387F01F4 */ addi r3, r31, 0x1f4
/* 000066A4 4BFF9B2D */ bl sprite_puts
/* 000066A8 48000228 */ b lbl_000068D0
lbl_000066AC:
/* 000066AC 2C000258 */ cmpwi r0, 0x258
/* 000066B0 40810130 */ ble lbl_000067E0
/* 000066B4 200002D0 */ subfic r0, r0, 0x2d0
/* 000066B8 C81E0150 */ lfd f0, 0x150(r30)
/* 000066BC 6C008000 */ xoris r0, r0, 0x8000
/* 000066C0 C87E00F0 */ lfd f3, 0xf0(r30)
/* 000066C4 9001021C */ stw r0, 0x21c(r1)
/* 000066C8 3C004330 */ lis r0, 0x4330
/* 000066CC 3C600000 */ lis r3, lbl_000261F0@ha
/* 000066D0 90010218 */ stw r0, 0x218(r1)
/* 000066D4 C8430000 */ lfd f2, lbl_000261F0@l(r3)
/* 000066D8 C8210218 */ lfd f1, 0x218(r1)
/* 000066DC FC211028 */ fsub f1, f1, f2
/* 000066E0 FC010024 */ fdiv f0, f1, f0
/* 000066E4 FC03002A */ fadd f0, f3, f0
/* 000066E8 FFE30024 */ fdiv f31, f3, f0
/* 000066EC FFE0F818 */ frsp f31, f31
/* 000066F0 4BFF9AE1 */ bl reset_text_draw_settings
/* 000066F4 38600009 */ li r3, 9
/* 000066F8 4BFF9AD9 */ bl set_text_font
/* 000066FC FC20F890 */ fmr f1, f31
/* 00006700 FC40F890 */ fmr f2, f31
/* 00006704 4BFF9ACD */ bl set_text_scale
/* 00006708 3E600100 */ lis r19, 0x100
/* 0000670C 3873FFFF */ addi r3, r19, -1
/* 00006710 4BFF9AC1 */ bl set_text_mul_color
/* 00006714 EFDF07F2 */ fmuls f30, f31, f31
/* 00006718 C03E0158 */ lfs f1, 0x158(r30)
/* 0000671C C01E015C */ lfs f0, 0x15c(r30)
/* 00006720 EC2107F2 */ fmuls f1, f1, f31
/* 00006724 EC4007B2 */ fmuls f2, f0, f30
/* 00006728 4BFF9AA9 */ bl set_text_pos
/* 0000672C 387F01E8 */ addi r3, r31, 0x1e8
/* 00006730 4BFF9AA1 */ bl sprite_puts
/* 00006734 A87D003A */ lha r3, 0x3a(r29)
/* 00006738 38A30001 */ addi r5, r3, 1
/* 0000673C 2C05000A */ cmpwi r5, 0xa
/* 00006740 4180003C */ blt lbl_0000677C
/* 00006744 4CC63182 */ crclr 6
/* 00006748 38610114 */ addi r3, r1, 0x114
/* 0000674C 389F01F0 */ addi r4, r31, 0x1f0
/* 00006750 4BFF9A81 */ bl sprintf
/* 00006754 3873FF00 */ addi r3, r19, -256
/* 00006758 4BFF9A79 */ bl set_text_mul_color
/* 0000675C C03E0160 */ lfs f1, 0x160(r30)
/* 00006760 C01E015C */ lfs f0, 0x15c(r30)
/* 00006764 EC2107F2 */ fmuls f1, f1, f31
/* 00006768 EC4007B2 */ fmuls f2, f0, f30
/* 0000676C 4BFF9A65 */ bl set_text_pos
/* 00006770 38610114 */ addi r3, r1, 0x114
/* 00006774 4BFF9A5D */ bl sprite_puts
/* 00006778 48000038 */ b lbl_000067B0
lbl_0000677C:
/* 0000677C 4CC63182 */ crclr 6
/* 00006780 38610114 */ addi r3, r1, 0x114
/* 00006784 389F01F0 */ addi r4, r31, 0x1f0
/* 00006788 4BFF9A49 */ bl sprintf
/* 0000678C 3873FF00 */ addi r3, r19, -256
/* 00006790 4BFF9A41 */ bl set_text_mul_color
/* 00006794 C03E0164 */ lfs f1, 0x164(r30)
/* 00006798 C01E015C */ lfs f0, 0x15c(r30)
/* 0000679C EC2107F2 */ fmuls f1, f1, f31
/* 000067A0 EC4007B2 */ fmuls f2, f0, f30
/* 000067A4 4BFF9A2D */ bl set_text_pos
/* 000067A8 38610114 */ addi r3, r1, 0x114
/* 000067AC 4BFF9A25 */ bl sprite_puts
lbl_000067B0:
/* 000067B0 3C600100 */ lis r3, 0x100
/* 000067B4 3863FFFF */ addi r3, r3, -1
/* 000067B8 4BFF9A19 */ bl set_text_mul_color
/* 000067BC EC1F07F2 */ fmuls f0, f31, f31
/* 000067C0 C03E0168 */ lfs f1, 0x168(r30)
/* 000067C4 C05E016C */ lfs f2, 0x16c(r30)
/* 000067C8 EC2107F2 */ fmuls f1, f1, f31
/* 000067CC EC420032 */ fmuls f2, f2, f0
/* 000067D0 4BFF9A01 */ bl set_text_pos
/* 000067D4 387F01F4 */ addi r3, r31, 0x1f4
/* 000067D8 4BFF99F9 */ bl sprite_puts
/* 000067DC 480000F4 */ b lbl_000068D0
lbl_000067E0:
/* 000067E0 C3FE00E8 */ lfs f31, 0xe8(r30)
/* 000067E4 4BFF99ED */ bl reset_text_draw_settings
/* 000067E8 38600009 */ li r3, 9
/* 000067EC 4BFF99E5 */ bl set_text_font
/* 000067F0 FC20F890 */ fmr f1, f31
/* 000067F4 FC40F890 */ fmr f2, f31
/* 000067F8 4BFF99D9 */ bl set_text_scale
/* 000067FC 3E600100 */ lis r19, 0x100
/* 00006800 3873FFFF */ addi r3, r19, -1
/* 00006804 4BFF99CD */ bl set_text_mul_color
/* 00006808 EFDF07F2 */ fmuls f30, f31, f31
/* 0000680C C03E0158 */ lfs f1, 0x158(r30)
/* 00006810 C01E015C */ lfs f0, 0x15c(r30)
/* 00006814 EC2107F2 */ fmuls f1, f1, f31
/* 00006818 EC4007B2 */ fmuls f2, f0, f30
/* 0000681C 4BFF99B5 */ bl set_text_pos
/* 00006820 387F01E8 */ addi r3, r31, 0x1e8
/* 00006824 4BFF99AD */ bl sprite_puts
/* 00006828 A87D003A */ lha r3, 0x3a(r29)
/* 0000682C 38A30001 */ addi r5, r3, 1
/* 00006830 2C05000A */ cmpwi r5, 0xa
/* 00006834 4180003C */ blt lbl_00006870
/* 00006838 4CC63182 */ crclr 6
/* 0000683C 38610114 */ addi r3, r1, 0x114
/* 00006840 389F01F0 */ addi r4, r31, 0x1f0
/* 00006844 4BFF998D */ bl sprintf
/* 00006848 3873FF00 */ addi r3, r19, -256
/* 0000684C 4BFF9985 */ bl set_text_mul_color
/* 00006850 C03E0160 */ lfs f1, 0x160(r30)
/* 00006854 C01E015C */ lfs f0, 0x15c(r30)
/* 00006858 EC2107F2 */ fmuls f1, f1, f31
/* 0000685C EC4007B2 */ fmuls f2, f0, f30
/* 00006860 4BFF9971 */ bl set_text_pos
/* 00006864 38610114 */ addi r3, r1, 0x114
/* 00006868 4BFF9969 */ bl sprite_puts
/* 0000686C 48000038 */ b lbl_000068A4
lbl_00006870:
/* 00006870 4CC63182 */ crclr 6
/* 00006874 38610114 */ addi r3, r1, 0x114
/* 00006878 389F01F0 */ addi r4, r31, 0x1f0
/* 0000687C 4BFF9955 */ bl sprintf
/* 00006880 3873FF00 */ addi r3, r19, -256
/* 00006884 4BFF994D */ bl set_text_mul_color
/* 00006888 C03E0164 */ lfs f1, 0x164(r30)
/* 0000688C C01E015C */ lfs f0, 0x15c(r30)
/* 00006890 EC2107F2 */ fmuls f1, f1, f31
/* 00006894 EC4007B2 */ fmuls f2, f0, f30
/* 00006898 4BFF9939 */ bl set_text_pos
/* 0000689C 38610114 */ addi r3, r1, 0x114
/* 000068A0 4BFF9931 */ bl sprite_puts
lbl_000068A4:
/* 000068A4 3C600100 */ lis r3, 0x100
/* 000068A8 3863FFFF */ addi r3, r3, -1
/* 000068AC 4BFF9925 */ bl set_text_mul_color
/* 000068B0 EC1F07F2 */ fmuls f0, f31, f31
/* 000068B4 C03E0168 */ lfs f1, 0x168(r30)
/* 000068B8 C05E016C */ lfs f2, 0x16c(r30)
/* 000068BC EC2107F2 */ fmuls f1, f1, f31
/* 000068C0 EC420032 */ fmuls f2, f2, f0
/* 000068C4 4BFF990D */ bl set_text_pos
/* 000068C8 387F01F4 */ addi r3, r31, 0x1f4
/* 000068CC 4BFF9905 */ bl sprite_puts
lbl_000068D0:
/* 000068D0 801D0000 */ lwz r0, 0(r29)
/* 000068D4 28001000 */ cmplwi r0, 0x1000
/* 000068D8 4082012C */ bne lbl_00006A04
/* 000068DC 801D00DC */ lwz r0, 0xdc(r29)
/* 000068E0 2800003C */ cmplwi r0, 0x3c
/* 000068E4 40810120 */ ble lbl_00006A04
/* 000068E8 801D00E0 */ lwz r0, 0xe0(r29)
/* 000068EC 2800003C */ cmplwi r0, 0x3c
/* 000068F0 40800114 */ bge lbl_00006A04
/* 000068F4 3C600000 */ lis r3, eventInfo@ha
/* 000068F8 38630000 */ addi r3, r3, eventInfo@l
/* 000068FC 880301C8 */ lbz r0, 0x1c8(r3)
/* 00006900 2C000002 */ cmpwi r0, 2
/* 00006904 40820008 */ bne lbl_0000690C
/* 00006908 4BFF98C9 */ bl background_draw
lbl_0000690C:
/* 0000690C 4BFF98C5 */ bl stage_draw
/* 00006910 3CA00000 */ lis r5, modeCtrl@ha
/* 00006914 3C800000 */ lis r4, cameraInfo@ha
/* 00006918 3C600000 */ lis r3, mathutilData@ha
/* 0000691C 3CC00000 */ lis r6, decodedStageGmaPtr@ha
/* 00006920 3AA50000 */ addi r21, r5, modeCtrl@l
/* 00006924 3A840000 */ addi r20, r4, cameraInfo@l
/* 00006928 3A630000 */ addi r19, r3, mathutilData@l
/* 0000692C 3AC60000 */ addi r22, r6, decodedStageGmaPtr@l
/* 00006930 3B200000 */ li r25, 0
/* 00006934 480000B4 */ b lbl_000069E8
lbl_00006938:
/* 00006938 5725063E */ clrlwi r5, r25, 0x18
/* 0000693C 4CC63182 */ crclr 6
/* 00006940 38610014 */ addi r3, r1, 0x14
/* 00006944 389F01FC */ addi r4, r31, 0x1fc
/* 00006948 38A50001 */ addi r5, r5, 1
/* 0000694C 4BFF9885 */ bl sprintf
/* 00006950 80760000 */ lwz r3, 0(r22)
/* 00006954 28030000 */ cmplwi r3, 0
/* 00006958 4082000C */ bne lbl_00006964
/* 0000695C 38000000 */ li r0, 0
/* 00006960 48000040 */ b lbl_000069A0
lbl_00006964:
/* 00006964 83030008 */ lwz r24, 8(r3)
/* 00006968 82E30000 */ lwz r23, 0(r3)
/* 0000696C 48000028 */ b lbl_00006994
lbl_00006970:
/* 00006970 80780004 */ lwz r3, 4(r24)
/* 00006974 38810014 */ addi r4, r1, 0x14
/* 00006978 4BFF9859 */ bl strcmp
/* 0000697C 2C030000 */ cmpwi r3, 0
/* 00006980 4082000C */ bne lbl_0000698C
/* 00006984 80180000 */ lwz r0, 0(r24)
/* 00006988 48000018 */ b lbl_000069A0
lbl_0000698C:
/* 0000698C 3AF7FFFF */ addi r23, r23, -1
/* 00006990 3B180008 */ addi r24, r24, 8
lbl_00006994:
/* 00006994 2C170000 */ cmpwi r23, 0
/* 00006998 4181FFD8 */ bgt lbl_00006970
/* 0000699C 38000000 */ li r0, 0
lbl_000069A0:
/* 000069A0 7C170378 */ mr r23, r0
/* 000069A4 38000000 */ li r0, 0
/* 000069A8 7C170040 */ cmplw r23, r0
/* 000069AC 41820038 */ beq lbl_000069E4
/* 000069B0 8015002C */ lwz r0, 0x2c(r21)
/* 000069B4 1C000284 */ mulli r0, r0, 0x284
/* 000069B8 7C740214 */ add r3, r20, r0
/* 000069BC 38630144 */ addi r3, r3, 0x144
/* 000069C0 4BFF9811 */ bl mathutil_mtxA_from_mtx
/* 000069C4 80730000 */ lwz r3, 0(r19)
/* 000069C8 38800000 */ li r4, 0
/* 000069CC 4BFF9805 */ bl GXLoadPosMtxImm
/* 000069D0 80730000 */ lwz r3, 0(r19)
/* 000069D4 38800000 */ li r4, 0
/* 000069D8 4BFF97F9 */ bl GXLoadNrmMtxImm
/* 000069DC 7EE3BB78 */ mr r3, r23
/* 000069E0 4BFF97F1 */ bl avdisp_draw_model_unculled_sort_all
lbl_000069E4:
/* 000069E4 3B390001 */ addi r25, r25, 1
lbl_000069E8:
/* 000069E8 5720063E */ clrlwi r0, r25, 0x18
/* 000069EC 28000014 */ cmplwi r0, 0x14
/* 000069F0 4180FF48 */ blt lbl_00006938
/* 000069F4 4BFF97DD */ bl ord_tbl_draw_nodes
/* 000069F8 38600001 */ li r3, 1
/* 000069FC 4800A46D */ bl lbl_00010E68
/* 00006A00 48001518 */ b lbl_00007F18
lbl_00006A04:
/* 00006A04 38600000 */ li r3, 0
/* 00006A08 4800A461 */ bl lbl_00010E68
/* 00006A0C 807D0000 */ lwz r3, 0(r29)
/* 00006A10 3C03FFFE */ addis r0, r3, 0xfffe
/* 00006A14 28000000 */ cmplwi r0, 0
/* 00006A18 41820010 */ beq lbl_00006A28
/* 00006A1C 3C03FFFC */ addis r0, r3, 0xfffc
/* 00006A20 28000000 */ cmplwi r0, 0
/* 00006A24 4082000C */ bne lbl_00006A30
lbl_00006A28:
/* 00006A28 48003229 */ bl lbl_00009C50
/* 00006A2C 480014EC */ b lbl_00007F18
lbl_00006A30:
/* 00006A30 28030008 */ cmplwi r3, 8
/* 00006A34 40820158 */ bne lbl_00006B8C
/* 00006A38 C83E0050 */ lfd f1, 0x50(r30)
/* 00006A3C C01D004C */ lfs f0, 0x4c(r29)
/* 00006A40 FC010000 */ fcmpu cr0, f1, f0
/* 00006A44 40820148 */ bne lbl_00006B8C
/* 00006A48 801D00C8 */ lwz r0, 0xc8(r29)
/* 00006A4C 2C000000 */ cmpwi r0, 0
/* 00006A50 4181013C */ bgt lbl_00006B8C
/* 00006A54 801D00C4 */ lwz r0, 0xc4(r29)
/* 00006A58 2C000000 */ cmpwi r0, 0
/* 00006A5C 41810130 */ bgt lbl_00006B8C
/* 00006A60 881D00F6 */ lbz r0, 0xf6(r29)
/* 00006A64 28000000 */ cmplwi r0, 0
/* 00006A68 40820088 */ bne lbl_00006AF0
/* 00006A6C 3C600000 */ lis r3, modeCtrl@ha
/* 00006A70 38630000 */ addi r3, r3, modeCtrl@l
/* 00006A74 80A3002C */ lwz r5, 0x2c(r3)
/* 00006A78 3C600000 */ lis r3, playerControllerIDs@ha
/* 00006A7C 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00006A80 54A4103A */ slwi r4, r5, 2
/* 00006A84 7C602214 */ add r3, r0, r4
/* 00006A88 80030000 */ lwz r0, 0(r3)
/* 00006A8C 3CC00000 */ lis r6, controllerInfo@ha
/* 00006A90 38660000 */ addi r3, r6, controllerInfo@l
/* 00006A94 1C00003C */ mulli r0, r0, 0x3c
/* 00006A98 7C630214 */ add r3, r3, r0
/* 00006A9C A0030018 */ lhz r0, 0x18(r3)
/* 00006AA0 54000529 */ rlwinm. r0, r0, 0, 0x14, 0x14
/* 00006AA4 4182004C */ beq lbl_00006AF0
/* 00006AA8 1C050284 */ mulli r0, r5, 0x284
/* 00006AAC 3C600000 */ lis r3, cameraInfo@ha
/* 00006AB0 38630000 */ addi r3, r3, cameraInfo@l
/* 00006AB4 7C630214 */ add r3, r3, r0
/* 00006AB8 8803001F */ lbz r0, 0x1f(r3)
/* 00006ABC 2C00000C */ cmpwi r0, 0xc
/* 00006AC0 41820030 */ beq lbl_00006AF0
/* 00006AC4 3C600000 */ lis r3, debugFlags@ha
/* 00006AC8 80030000 */ lwz r0, debugFlags@l(r3)
/* 00006ACC 7000000A */ andi. r0, r0, 0xa
/* 00006AD0 40820020 */ bne lbl_00006AF0
/* 00006AD4 386000CE */ li r3, 0xce
/* 00006AD8 4BFF96F9 */ bl u_play_sound_0
/* 00006ADC 38000001 */ li r0, 1
/* 00006AE0 981D00F6 */ stb r0, 0xf6(r29)
/* 00006AE4 38600001 */ li r3, 1
/* 00006AE8 4800A381 */ bl lbl_00010E68
/* 00006AEC 4800008C */ b lbl_00006B78
lbl_00006AF0:
/* 00006AF0 881D00F6 */ lbz r0, 0xf6(r29)
/* 00006AF4 28000000 */ cmplwi r0, 0
/* 00006AF8 41820080 */ beq lbl_00006B78
/* 00006AFC 3C600000 */ lis r3, modeCtrl@ha
/* 00006B00 38630000 */ addi r3, r3, modeCtrl@l
/* 00006B04 8003002C */ lwz r0, 0x2c(r3)
/* 00006B08 3C600000 */ lis r3, playerControllerIDs@ha
/* 00006B0C 3CA00000 */ lis r5, controllerInfo@ha
/* 00006B10 5404103A */ slwi r4, r0, 2
/* 00006B14 38030000 */ addi r0, r3, playerControllerIDs@l
/* 00006B18 7C602214 */ add r3, r0, r4
/* 00006B1C 80030000 */ lwz r0, 0(r3)
/* 00006B20 38650000 */ addi r3, r5, controllerInfo@l
/* 00006B24 1C00003C */ mulli r0, r0, 0x3c
/* 00006B28 7C630214 */ add r3, r3, r0
/* 00006B2C A0630018 */ lhz r3, 0x18(r3)
/* 00006B30 546005EF */ rlwinm. r0, r3, 0, 0x17, 0x17
/* 00006B34 4082001C */ bne lbl_00006B50
/* 00006B38 546005AD */ rlwinm. r0, r3, 0, 0x16, 0x16
/* 00006B3C 40820014 */ bne lbl_00006B50
/* 00006B40 5460056B */ rlwinm. r0, r3, 0, 0x15, 0x15
/* 00006B44 4082000C */ bne lbl_00006B50
/* 00006B48 54600529 */ rlwinm. r0, r3, 0, 0x14, 0x14
/* 00006B4C 4182002C */ beq lbl_00006B78
lbl_00006B50:
/* 00006B50 3C600000 */ lis r3, debugFlags@ha
/* 00006B54 80030000 */ lwz r0, debugFlags@l(r3)
/* 00006B58 7000000A */ andi. r0, r0, 0xa
/* 00006B5C 4082001C */ bne lbl_00006B78
/* 00006B60 386000CE */ li r3, 0xce
/* 00006B64 4BFF966D */ bl u_play_sound_0
/* 00006B68 38600000 */ li r3, 0
/* 00006B6C 4800A2FD */ bl lbl_00010E68
/* 00006B70 38000000 */ li r0, 0
/* 00006B74 981D00F6 */ stb r0, 0xf6(r29)
lbl_00006B78:
/* 00006B78 881D00F6 */ lbz r0, 0xf6(r29)
/* 00006B7C 28000000 */ cmplwi r0, 0
/* 00006B80 4182000C */ beq lbl_00006B8C
/* 00006B84 38600001 */ li r3, 1
/* 00006B88 4800A2E1 */ bl lbl_00010E68
lbl_00006B8C:
/* 00006B8C C03D004C */ lfs f1, 0x4c(r29)
/* 00006B90 C81E0050 */ lfd f0, 0x50(r30)
/* 00006B94 FC010040 */ fcmpo cr0, f1, f0
/* 00006B98 4C401382 */ cror 2, 0, 2
/* 00006B9C 408200D0 */ bne lbl_00006C6C
/* 00006BA0 881D00EE */ lbz r0, 0xee(r29)
/* 00006BA4 28000000 */ cmplwi r0, 0
/* 00006BA8 408200C4 */ bne lbl_00006C6C
/* 00006BAC 4BFF9625 */ bl mathutil_mtxA_from_mtxB
/* 00006BB0 3C600000 */ lis r3, modeCtrl@ha
/* 00006BB4 C81E0110 */ lfd f0, 0x110(r30)
/* 00006BB8 3A630000 */ addi r19, r3, modeCtrl@l
/* 00006BBC 8013002C */ lwz r0, 0x2c(r19)
/* 00006BC0 3C600000 */ lis r3, ballInfo@ha
/* 00006BC4 3A830000 */ addi r20, r3, ballInfo@l
/* 00006BC8 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006BCC 7C740214 */ add r3, r20, r0
/* 00006BD0 806300FC */ lwz r3, 0xfc(r3)
/* 00006BD4 C0430034 */ lfs f2, 0x34(r3)
/* 00006BD8 C0230030 */ lfs f1, 0x30(r3)
/* 00006BDC FC420028 */ fsub f2, f2, f0
/* 00006BE0 C0630038 */ lfs f3, 0x38(r3)
/* 00006BE4 FC401018 */ frsp f2, f2
/* 00006BE8 4BFF95E9 */ bl mathutil_mtxA_translate_xyz
/* 00006BEC 8013002C */ lwz r0, 0x2c(r19)
/* 00006BF0 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006BF4 7C740214 */ add r3, r20, r0
/* 00006BF8 A8630092 */ lha r3, 0x92(r3)
/* 00006BFC 3863C000 */ addi r3, r3, -16384
/* 00006C00 4BFF95D1 */ bl mathutil_mtxA_rotate_y
/* 00006C04 8013002C */ lwz r0, 0x2c(r19)
/* 00006C08 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00006C0C 7C740214 */ add r3, r20, r0
/* 00006C10 806300FC */ lwz r3, 0xfc(r3)
/* 00006C14 80630000 */ lwz r3, 0(r3)
/* 00006C18 3C630001 */ addis r3, r3, 1
/* 00006C1C 3863A4F8 */ addi r3, r3, -23304
/* 00006C20 4BFF95B1 */ bl mathutil_mtxA_mult_right
/* 00006C24 C03E0118 */ lfs f1, 0x118(r30)
/* 00006C28 4BFF95A9 */ bl mathutil_mtxA_scale_s
/* 00006C2C 387D0100 */ addi r3, r29, 0x100
/* 00006C30 4BFF95A1 */ bl mathutil_mtxA_mult_right
/* 00006C34 3C600000 */ lis r3, mathutilData@ha
/* 00006C38 3A630000 */ addi r19, r3, mathutilData@l
/* 00006C3C 80730000 */ lwz r3, 0(r19)
/* 00006C40 38800000 */ li r4, 0
/* 00006C44 4BFF958D */ bl GXLoadPosMtxImm
/* 00006C48 80730000 */ lwz r3, 0(r19)
/* 00006C4C 38800000 */ li r4, 0
/* 00006C50 4BFF9581 */ bl GXLoadNrmMtxImm
/* 00006C54 3C600000 */ lis r3, minigameGma@ha
/* 00006C58 38630000 */ addi r3, r3, minigameGma@l
/* 00006C5C 80630000 */ lwz r3, 0(r3)
/* 00006C60 80630008 */ lwz r3, 8(r3)
/* 00006C64 80630000 */ lwz r3, 0(r3)
/* 00006C68 4BFF9569 */ bl avdisp_draw_model_unculled_sort_none
lbl_00006C6C:
/* 00006C6C 3C600000 */ lis r3, modeCtrl@ha
/* 00006C70 38630000 */ addi r3, r3, modeCtrl@l
/* 00006C74 8003002C */ lwz r0, 0x2c(r3)
/* 00006C78 3C600000 */ lis r3, cameraInfo@ha
/* 00006C7C 38630000 */ addi r3, r3, cameraInfo@l
/* 00006C80 1C000284 */ mulli r0, r0, 0x284
/* 00006C84 7C630214 */ add r3, r3, r0
/* 00006C88 8803001F */ lbz r0, 0x1f(r3)
/* 00006C8C 7C000774 */ extsb r0, r0
/* 00006C90 2C000002 */ cmpwi r0, 2
/* 00006C94 41820024 */ beq lbl_00006CB8
/* 00006C98 2C000005 */ cmpwi r0, 5
/* 00006C9C 4182001C */ beq lbl_00006CB8
/* 00006CA0 2C000003 */ cmpwi r0, 3
/* 00006CA4 41820014 */ beq lbl_00006CB8
/* 00006CA8 2C000004 */ cmpwi r0, 4
/* 00006CAC 4182000C */ beq lbl_00006CB8
/* 00006CB0 2C00000B */ cmpwi r0, 0xb
/* 00006CB4 4082033C */ bne lbl_00006FF0
lbl_00006CB8:
/* 00006CB8 3C600000 */ lis r3, modeCtrl@ha
/* 00006CBC C03D005C */ lfs f1, 0x5c(r29)
/* 00006CC0 38A30000 */ addi r5, r3, modeCtrl@l
/* 00006CC4 8005002C */ lwz r0, 0x2c(r5)
/* 00006CC8 3C600000 */ lis r3, cameraInfo@ha
/* 00006CCC 38830000 */ addi r4, r3, cameraInfo@l
/* 00006CD0 1C000284 */ mulli r0, r0, 0x284
/* 00006CD4 7C640214 */ add r3, r4, r0
/* 00006CD8 C0030000 */ lfs f0, 0(r3)
/* 00006CDC EC010028 */ fsubs f0, f1, f0
/* 00006CE0 D0010008 */ stfs f0, 8(r1)
/* 00006CE4 8005002C */ lwz r0, 0x2c(r5)
/* 00006CE8 C03D0064 */ lfs f1, 0x64(r29)
/* 00006CEC 1C000284 */ mulli r0, r0, 0x284
/* 00006CF0 7C640214 */ add r3, r4, r0
/* 00006CF4 C0030008 */ lfs f0, 8(r3)
/* 00006CF8 EC010028 */ fsubs f0, f1, f0
/* 00006CFC D0010010 */ stfs f0, 0x10(r1)
/* 00006D00 C0210008 */ lfs f1, 8(r1)
/* 00006D04 C01E0170 */ lfs f0, 0x170(r30)
/* 00006D08 EC010032 */ fmuls f0, f1, f0
/* 00006D0C D0010008 */ stfs f0, 8(r1)
/* 00006D10 C0210010 */ lfs f1, 0x10(r1)
/* 00006D14 C01E0170 */ lfs f0, 0x170(r30)
/* 00006D18 EC010032 */ fmuls f0, f1, f0
/* 00006D1C D0010010 */ stfs f0, 0x10(r1)
/* 00006D20 4BFF94B1 */ bl mathutil_mtxA_from_mtxB
/* 00006D24 387D005C */ addi r3, r29, 0x5c
/* 00006D28 4BFF94A9 */ bl mathutil_mtxA_translate
/* 00006D2C C0210008 */ lfs f1, 8(r1)
/* 00006D30 C0410010 */ lfs f2, 0x10(r1)
/* 00006D34 4BFF949D */ bl mathutil_atan2
/* 00006D38 7C630734 */ extsh r3, r3
/* 00006D3C 4BFF9495 */ bl mathutil_mtxA_rotate_y
/* 00006D40 A81D003A */ lha r0, 0x3a(r29)
/* 00006D44 2C000000 */ cmpwi r0, 0
/* 00006D48 41820014 */ beq lbl_00006D5C
/* 00006D4C 2C000002 */ cmpwi r0, 2
/* 00006D50 4182000C */ beq lbl_00006D5C
/* 00006D54 2C00000F */ cmpwi r0, 0xf
/* 00006D58 4082000C */ bne lbl_00006D64
lbl_00006D5C:
/* 00006D5C C03E0174 */ lfs f1, 0x174(r30)
/* 00006D60 4BFF9471 */ bl mathutil_mtxA_scale_s
lbl_00006D64:
/* 00006D64 A81D003A */ lha r0, 0x3a(r29)
/* 00006D68 2C000008 */ cmpwi r0, 8
/* 00006D6C 41820014 */ beq lbl_00006D80
/* 00006D70 2C000009 */ cmpwi r0, 9
/* 00006D74 4182000C */ beq lbl_00006D80
/* 00006D78 2C00000A */ cmpwi r0, 0xa
/* 00006D7C 4082000C */ bne lbl_00006D88
lbl_00006D80:
/* 00006D80 C03E00E8 */ lfs f1, 0xe8(r30)
/* 00006D84 4BFF944D */ bl mathutil_mtxA_scale_s
lbl_00006D88:
/* 00006D88 3C600000 */ lis r3, modeCtrl@ha
/* 00006D8C 38630000 */ addi r3, r3, modeCtrl@l
/* 00006D90 8083002C */ lwz r4, 0x2c(r3)
/* 00006D94 3C600000 */ lis r3, ballInfo@ha
/* 00006D98 38030000 */ addi r0, r3, ballInfo@l
/* 00006D9C 1C6401A4 */ mulli r3, r4, 0x1a4
/* 00006DA0 7C601A14 */ add r3, r0, r3
/* 00006DA4 38630004 */ addi r3, r3, 4
/* 00006DA8 48002DC1 */ bl lbl_00009B68
/* 00006DAC C81E0048 */ lfd f0, 0x48(r30)
/* 00006DB0 FC010040 */ fcmpo cr0, f1, f0
/* 00006DB4 4081023C */ ble lbl_00006FF0
/* 00006DB8 3C600000 */ lis r3, mathutilData@ha
/* 00006DBC 3A630000 */ addi r19, r3, mathutilData@l
/* 00006DC0 80730000 */ lwz r3, 0(r19)
/* 00006DC4 38800000 */ li r4, 0
/* 00006DC8 4BFF9409 */ bl GXLoadPosMtxImm
/* 00006DCC 80730000 */ lwz r3, 0(r19)
/* 00006DD0 38800000 */ li r4, 0
/* 00006DD4 4BFF93FD */ bl GXLoadNrmMtxImm
/* 00006DD8 A81D003A */ lha r0, 0x3a(r29)
/* 00006DDC 28000011 */ cmplwi r0, 0x11
/* 00006DE0 41810210 */ bgt lbl_00006FF0
/* 00006DE4 3C600000 */ lis r3, lbl_00026D08@ha
/* 00006DE8 38630000 */ addi r3, r3, lbl_00026D08@l
/* 00006DEC 5400103A */ slwi r0, r0, 2
/* 00006DF0 7C03002E */ lwzx r0, r3, r0
/* 00006DF4 7C0903A6 */ mtctr r0
/* 00006DF8 4E800420 */ bctr 
lbl_00006DFC:
/* 00006DFC 3C600000 */ lis r3, minigameGma@ha
/* 00006E00 38630000 */ addi r3, r3, minigameGma@l
/* 00006E04 80630000 */ lwz r3, 0(r3)
/* 00006E08 80630008 */ lwz r3, 8(r3)
/* 00006E0C 80630050 */ lwz r3, 0x50(r3)
/* 00006E10 4BFF93C1 */ bl avdisp_draw_model_unculled_sort_none
/* 00006E14 480001DC */ b lbl_00006FF0
lbl_00006E18:
/* 00006E18 3C600000 */ lis r3, minigameGma@ha
/* 00006E1C 38630000 */ addi r3, r3, minigameGma@l
/* 00006E20 80630000 */ lwz r3, 0(r3)
/* 00006E24 80630008 */ lwz r3, 8(r3)
/* 00006E28 80630058 */ lwz r3, 0x58(r3)
/* 00006E2C 4BFF93A5 */ bl avdisp_draw_model_unculled_sort_none
/* 00006E30 480001C0 */ b lbl_00006FF0
lbl_00006E34:
/* 00006E34 3C600000 */ lis r3, minigameGma@ha
/* 00006E38 38630000 */ addi r3, r3, minigameGma@l
/* 00006E3C 80630000 */ lwz r3, 0(r3)
/* 00006E40 80630008 */ lwz r3, 8(r3)
/* 00006E44 80630060 */ lwz r3, 0x60(r3)
/* 00006E48 4BFF9389 */ bl avdisp_draw_model_unculled_sort_none
/* 00006E4C 480001A4 */ b lbl_00006FF0
lbl_00006E50:
/* 00006E50 3C600000 */ lis r3, minigameGma@ha
/* 00006E54 38630000 */ addi r3, r3, minigameGma@l
/* 00006E58 80630000 */ lwz r3, 0(r3)
/* 00006E5C 80630008 */ lwz r3, 8(r3)
/* 00006E60 80630068 */ lwz r3, 0x68(r3)
/* 00006E64 4BFF936D */ bl avdisp_draw_model_unculled_sort_none
/* 00006E68 48000188 */ b lbl_00006FF0
lbl_00006E6C:
/* 00006E6C 3C600000 */ lis r3, minigameGma@ha
/* 00006E70 38630000 */ addi r3, r3, minigameGma@l
/* 00006E74 80630000 */ lwz r3, 0(r3)
/* 00006E78 80630008 */ lwz r3, 8(r3)
/* 00006E7C 80630070 */ lwz r3, 0x70(r3)
/* 00006E80 4BFF9351 */ bl avdisp_draw_model_unculled_sort_none
/* 00006E84 4800016C */ b lbl_00006FF0
lbl_00006E88:
/* 00006E88 3C600000 */ lis r3, minigameGma@ha
/* 00006E8C 38630000 */ addi r3, r3, minigameGma@l
/* 00006E90 80630000 */ lwz r3, 0(r3)
/* 00006E94 80630008 */ lwz r3, 8(r3)
/* 00006E98 80630078 */ lwz r3, 0x78(r3)
/* 00006E9C 4BFF9335 */ bl avdisp_draw_model_unculled_sort_none
/* 00006EA0 48000150 */ b lbl_00006FF0
lbl_00006EA4:
/* 00006EA4 3C600000 */ lis r3, minigameGma@ha
/* 00006EA8 38630000 */ addi r3, r3, minigameGma@l
/* 00006EAC 80630000 */ lwz r3, 0(r3)
/* 00006EB0 80630008 */ lwz r3, 8(r3)
/* 00006EB4 80630080 */ lwz r3, 0x80(r3)
/* 00006EB8 4BFF9319 */ bl avdisp_draw_model_unculled_sort_none
/* 00006EBC 48000134 */ b lbl_00006FF0
lbl_00006EC0:
/* 00006EC0 3C600000 */ lis r3, minigameGma@ha
/* 00006EC4 38630000 */ addi r3, r3, minigameGma@l
/* 00006EC8 80630000 */ lwz r3, 0(r3)
/* 00006ECC 80630008 */ lwz r3, 8(r3)
/* 00006ED0 80630088 */ lwz r3, 0x88(r3)
/* 00006ED4 4BFF92FD */ bl avdisp_draw_model_unculled_sort_none
/* 00006ED8 48000118 */ b lbl_00006FF0
lbl_00006EDC:
/* 00006EDC 3C600000 */ lis r3, minigameGma@ha
/* 00006EE0 38630000 */ addi r3, r3, minigameGma@l
/* 00006EE4 80630000 */ lwz r3, 0(r3)
/* 00006EE8 80630008 */ lwz r3, 8(r3)
/* 00006EEC 80630090 */ lwz r3, 0x90(r3)
/* 00006EF0 4BFF92E1 */ bl avdisp_draw_model_unculled_sort_none
/* 00006EF4 480000FC */ b lbl_00006FF0
lbl_00006EF8:
/* 00006EF8 3C600000 */ lis r3, minigameGma@ha
/* 00006EFC 38630000 */ addi r3, r3, minigameGma@l
/* 00006F00 80630000 */ lwz r3, 0(r3)
/* 00006F04 80630008 */ lwz r3, 8(r3)
/* 00006F08 80630098 */ lwz r3, 0x98(r3)
/* 00006F0C 4BFF92C5 */ bl avdisp_draw_model_unculled_sort_none
/* 00006F10 480000E0 */ b lbl_00006FF0
lbl_00006F14:
/* 00006F14 3C600000 */ lis r3, minigameGma@ha
/* 00006F18 38630000 */ addi r3, r3, minigameGma@l
/* 00006F1C 80630000 */ lwz r3, 0(r3)
/* 00006F20 80630008 */ lwz r3, 8(r3)
/* 00006F24 806300A0 */ lwz r3, 0xa0(r3)
/* 00006F28 4BFF92A9 */ bl avdisp_draw_model_unculled_sort_none
/* 00006F2C 480000C4 */ b lbl_00006FF0
lbl_00006F30:
/* 00006F30 3C600000 */ lis r3, minigameGma@ha
/* 00006F34 38630000 */ addi r3, r3, minigameGma@l
/* 00006F38 80630000 */ lwz r3, 0(r3)
/* 00006F3C 80630008 */ lwz r3, 8(r3)
/* 00006F40 806300A8 */ lwz r3, 0xa8(r3)
/* 00006F44 4BFF928D */ bl avdisp_draw_model_unculled_sort_none
/* 00006F48 480000A8 */ b lbl_00006FF0
lbl_00006F4C:
/* 00006F4C 3C600000 */ lis r3, minigameGma@ha
/* 00006F50 38630000 */ addi r3, r3, minigameGma@l
/* 00006F54 80630000 */ lwz r3, 0(r3)
/* 00006F58 80630008 */ lwz r3, 8(r3)
/* 00006F5C 806300B0 */ lwz r3, 0xb0(r3)
/* 00006F60 4BFF9271 */ bl avdisp_draw_model_unculled_sort_none
/* 00006F64 4800008C */ b lbl_00006FF0
lbl_00006F68:
/* 00006F68 3C600000 */ lis r3, minigameGma@ha
/* 00006F6C 38630000 */ addi r3, r3, minigameGma@l
/* 00006F70 80630000 */ lwz r3, 0(r3)
/* 00006F74 80630008 */ lwz r3, 8(r3)
/* 00006F78 806300B8 */ lwz r3, 0xb8(r3)
/* 00006F7C 4BFF9255 */ bl avdisp_draw_model_unculled_sort_none
/* 00006F80 48000070 */ b lbl_00006FF0
lbl_00006F84:
/* 00006F84 3C600000 */ lis r3, minigameGma@ha
/* 00006F88 38630000 */ addi r3, r3, minigameGma@l
/* 00006F8C 80630000 */ lwz r3, 0(r3)
/* 00006F90 80630008 */ lwz r3, 8(r3)
/* 00006F94 806300C0 */ lwz r3, 0xc0(r3)
/* 00006F98 4BFF9239 */ bl avdisp_draw_model_unculled_sort_none
/* 00006F9C 48000054 */ b lbl_00006FF0
lbl_00006FA0:
/* 00006FA0 3C600000 */ lis r3, minigameGma@ha
/* 00006FA4 38630000 */ addi r3, r3, minigameGma@l
/* 00006FA8 80630000 */ lwz r3, 0(r3)
/* 00006FAC 80630008 */ lwz r3, 8(r3)
/* 00006FB0 806300C8 */ lwz r3, 0xc8(r3)
/* 00006FB4 4BFF921D */ bl avdisp_draw_model_unculled_sort_none
/* 00006FB8 48000038 */ b lbl_00006FF0
lbl_00006FBC:
/* 00006FBC 3C600000 */ lis r3, minigameGma@ha
/* 00006FC0 38630000 */ addi r3, r3, minigameGma@l
/* 00006FC4 80630000 */ lwz r3, 0(r3)
/* 00006FC8 80630008 */ lwz r3, 8(r3)
/* 00006FCC 806300D0 */ lwz r3, 0xd0(r3)
/* 00006FD0 4BFF9201 */ bl avdisp_draw_model_unculled_sort_none
/* 00006FD4 4800001C */ b lbl_00006FF0
lbl_00006FD8:
/* 00006FD8 3C600000 */ lis r3, minigameGma@ha
/* 00006FDC 38630000 */ addi r3, r3, minigameGma@l
/* 00006FE0 80630000 */ lwz r3, 0(r3)
/* 00006FE4 80630008 */ lwz r3, 8(r3)
/* 00006FE8 806300D8 */ lwz r3, 0xd8(r3)
/* 00006FEC 4BFF91E5 */ bl avdisp_draw_model_unculled_sort_none
lbl_00006FF0:
/* 00006FF0 3C600000 */ lis r3, modeCtrl@ha
/* 00006FF4 3A830000 */ addi r20, r3, modeCtrl@l
/* 00006FF8 8074002C */ lwz r3, 0x2c(r20)
/* 00006FFC 3C800000 */ lis r4, cameraInfo@ha
/* 00007000 38840000 */ addi r4, r4, cameraInfo@l
/* 00007004 1C030284 */ mulli r0, r3, 0x284
/* 00007008 7C840214 */ add r4, r4, r0
/* 0000700C 8804001F */ lbz r0, 0x1f(r4)
/* 00007010 2C000002 */ cmpwi r0, 2
/* 00007014 40820444 */ bne lbl_00007458
/* 00007018 881D00EB */ lbz r0, 0xeb(r29)
/* 0000701C 28000000 */ cmplwi r0, 0
/* 00007020 40820438 */ bne lbl_00007458
/* 00007024 881D00EE */ lbz r0, 0xee(r29)
/* 00007028 28000000 */ cmplwi r0, 0
/* 0000702C 4082042C */ bne lbl_00007458
/* 00007030 801D0000 */ lwz r0, 0(r29)
/* 00007034 28000008 */ cmplwi r0, 8
/* 00007038 40820420 */ bne lbl_00007458
/* 0000703C 4BFF9195 */ bl reset_light_group
/* 00007040 4BFF9191 */ bl mathutil_mtxA_from_mtxB
/* 00007044 8014002C */ lwz r0, 0x2c(r20)
/* 00007048 3C600000 */ lis r3, ballInfo@ha
/* 0000704C 3A630000 */ addi r19, r3, ballInfo@l
/* 00007050 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00007054 7C730214 */ add r3, r19, r0
/* 00007058 38630004 */ addi r3, r3, 4
/* 0000705C 4BFF9175 */ bl mathutil_mtxA_translate
/* 00007060 8014002C */ lwz r0, 0x2c(r20)
/* 00007064 1C0001A4 */ mulli r0, r0, 0x1a4
/* 00007068 7C730214 */ add r3, r19, r0
/* 0000706C A8630092 */ lha r3, 0x92(r3)
/* 00007070 4BFF9161 */ bl mathutil_mtxA_rotate_y
/* 00007074 4801CD51 */ bl lbl_00023DC4
/* 00007078 7C600774 */ extsb r0, r3
/* 0000707C 2C000003 */ cmpwi r0, 3
/* 00007080 408200DC */ bne lbl_0000715C
/* 00007084 3C600000 */ lis r3, globalAnimTimer@ha
/* 00007088 C03E0000 */ lfs f1, 0(r30)
/* 0000708C 3AA30000 */ addi r21, r3, globalAnimTimer@l
/* 00007090 C0BE017C */ lfs f5, 0x17c(r30)
/* 00007094 3C608889 */ lis r3, 0x8889
/* 00007098 80950000 */ lwz r4, 0(r21)
/* 0000709C 3A838889 */ addi r20, r3, -30583
/* 000070A0 C01E0180 */ lfs f0, 0x180(r30)
/* 000070A4 7C142016 */ mulhwu r0, r20, r4
/* 000070A8 C0DE0178 */ lfs f6, 0x178(r30)
/* 000070AC FC400890 */ fmr f2, f1
/* 000070B0 5400E13E */ srwi r0, r0, 4
/* 000070B4 1C00001E */ mulli r0, r0, 0x1e
/* 000070B8 7C002050 */ subf r0, r0, r4
/* 000070BC 9001021C */ stw r0, 0x21c(r1)
/* 000070C0 3E604330 */ lis r19, 0x4330
/* 000070C4 3C600000 */ lis r3, lbl_000261E8@ha
/* 000070C8 92610218 */ stw r19, 0x218(r1)
/* 000070CC C8830000 */ lfd f4, lbl_000261E8@l(r3)
/* 000070D0 C8610218 */ lfd f3, 0x218(r1)
/* 000070D4 EC632028 */ fsubs f3, f3, f4
/* 000070D8 EC6500F2 */ fmuls f3, f5, f3
/* 000070DC EC030024 */ fdivs f0, f3, f0
/* 000070E0 EC660028 */ fsubs f3, f6, f0
/* 000070E4 4BFF90ED */ bl mathutil_mtxA_translate_xyz
/* 000070E8 C03E0004 */ lfs f1, 4(r30)
/* 000070EC C05E0000 */ lfs f2, 0(r30)
/* 000070F0 FC800890 */ fmr f4, f1
/* 000070F4 FC601090 */ fmr f3, f2
/* 000070F8 4BFF90D9 */ bl avdisp_set_post_mult_color
/* 000070FC 80950000 */ lwz r4, 0(r21)
/* 00007100 3C600000 */ lis r3, lbl_000261E8@ha
/* 00007104 C8430000 */ lfd f2, lbl_000261E8@l(r3)
/* 00007108 7C142016 */ mulhwu r0, r20, r4
/* 0000710C C07E0130 */ lfs f3, 0x130(r30)
/* 00007110 C81E0188 */ lfd f0, 0x188(r30)
/* 00007114 5400E13E */ srwi r0, r0, 4
/* 00007118 1C00001E */ mulli r0, r0, 0x1e
/* 0000711C 7C002050 */ subf r0, r0, r4
/* 00007120 90010224 */ stw r0, 0x224(r1)
/* 00007124 92610220 */ stw r19, 0x220(r1)
/* 00007128 C8210220 */ lfd f1, 0x220(r1)
/* 0000712C EC211028 */ fsubs f1, f1, f2
/* 00007130 EC230072 */ fmuls f1, f3, f1
/* 00007134 FC210024 */ fdiv f1, f1, f0
/* 00007138 4BFF9099 */ bl __cvt_fp2unsigned
/* 0000713C 9061022C */ stw r3, 0x22c(r1)
/* 00007140 3C600000 */ lis r3, lbl_000261E8@ha
/* 00007144 C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 00007148 92610228 */ stw r19, 0x228(r1)
/* 0000714C C8010228 */ lfd f0, 0x228(r1)
/* 00007150 EC200828 */ fsubs f1, f0, f1
/* 00007154 4BFF907D */ bl avdisp_set_alpha
/* 00007158 480002B4 */ b lbl_0000740C
lbl_0000715C:
/* 0000715C 4801CC69 */ bl lbl_00023DC4
/* 00007160 7C600774 */ extsb r0, r3
/* 00007164 2C000002 */ cmpwi r0, 2
/* 00007168 408200DC */ bne lbl_00007244
/* 0000716C 3C600000 */ lis r3, globalAnimTimer@ha
/* 00007170 C03E0000 */ lfs f1, 0(r30)
/* 00007174 3AA30000 */ addi r21, r3, globalAnimTimer@l
/* 00007178 C0BE0190 */ lfs f5, 0x190(r30)
/* 0000717C 3C60CCCD */ lis r3, 0xcccd
/* 00007180 80950000 */ lwz r4, 0(r21)
/* 00007184 3A83CCCD */ addi r20, r3, -13107
/* 00007188 C01E0194 */ lfs f0, 0x194(r30)
/* 0000718C 7C142016 */ mulhwu r0, r20, r4
/* 00007190 C0DE0178 */ lfs f6, 0x178(r30)
/* 00007194 FC400890 */ fmr f2, f1
/* 00007198 5400D97E */ srwi r0, r0, 5
/* 0000719C 1C000028 */ mulli r0, r0, 0x28
/* 000071A0 7C002050 */ subf r0, r0, r4
/* 000071A4 9001021C */ stw r0, 0x21c(r1)
/* 000071A8 3E604330 */ lis r19, 0x4330
/* 000071AC 3C600000 */ lis r3, lbl_000261E8@ha
/* 000071B0 92610218 */ stw r19, 0x218(r1)
/* 000071B4 C8830000 */ lfd f4, lbl_000261E8@l(r3)
/* 000071B8 C8610218 */ lfd f3, 0x218(r1)
/* 000071BC EC632028 */ fsubs f3, f3, f4
/* 000071C0 EC6500F2 */ fmuls f3, f5, f3
/* 000071C4 EC030024 */ fdivs f0, f3, f0
/* 000071C8 EC660028 */ fsubs f3, f6, f0
/* 000071CC 4BFF9005 */ bl mathutil_mtxA_translate_xyz
/* 000071D0 C03E0004 */ lfs f1, 4(r30)
/* 000071D4 C05E0198 */ lfs f2, 0x198(r30)
/* 000071D8 FC800890 */ fmr f4, f1
/* 000071DC C07E0000 */ lfs f3, 0(r30)
/* 000071E0 4BFF8FF1 */ bl avdisp_set_post_mult_color
/* 000071E4 80950000 */ lwz r4, 0(r21)
/* 000071E8 3C600000 */ lis r3, lbl_000261E8@ha
/* 000071EC C8430000 */ lfd f2, lbl_000261E8@l(r3)
/* 000071F0 7C142016 */ mulhwu r0, r20, r4
/* 000071F4 C07E0130 */ lfs f3, 0x130(r30)
/* 000071F8 C81E0038 */ lfd f0, 0x38(r30)
/* 000071FC 5400D97E */ srwi r0, r0, 5
/* 00007200 1C000028 */ mulli r0, r0, 0x28
/* 00007204 7C002050 */ subf r0, r0, r4
/* 00007208 90010224 */ stw r0, 0x224(r1)
/* 0000720C 92610220 */ stw r19, 0x220(r1)
/* 00007210 C8210220 */ lfd f1, 0x220(r1)
/* 00007214 EC211028 */ fsubs f1, f1, f2
/* 00007218 EC230072 */ fmuls f1, f3, f1
/* 0000721C FC210024 */ fdiv f1, f1, f0
/* 00007220 4BFF8FB1 */ bl __cvt_fp2unsigned
/* 00007224 9061022C */ stw r3, 0x22c(r1)
/* 00007228 3C600000 */ lis r3, lbl_000261E8@ha
/* 0000722C C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 00007230 92610228 */ stw r19, 0x228(r1)
/* 00007234 C8010228 */ lfd f0, 0x228(r1)
/* 00007238 EC200828 */ fsubs f1, f0, f1
/* 0000723C 4BFF8F95 */ bl avdisp_set_alpha
/* 00007240 480001CC */ b lbl_0000740C
lbl_00007244:
/* 00007244 4801CB81 */ bl lbl_00023DC4
/* 00007248 7C600774 */ extsb r0, r3
/* 0000724C 2C000001 */ cmpwi r0, 1
/* 00007250 408200DC */ bne lbl_0000732C
/* 00007254 3C600000 */ lis r3, globalAnimTimer@ha
/* 00007258 C03E0000 */ lfs f1, 0(r30)
/* 0000725C 3AA30000 */ addi r21, r3, globalAnimTimer@l
/* 00007260 C0BE0174 */ lfs f5, 0x174(r30)
/* 00007264 3C6051EC */ lis r3, 0x51ec
/* 00007268 80950000 */ lwz r4, 0(r21)
/* 0000726C 3A83851F */ addi r20, r3, -31457
/* 00007270 C01E019C */ lfs f0, 0x19c(r30)
/* 00007274 7C142016 */ mulhwu r0, r20, r4
/* 00007278 C0DE0178 */ lfs f6, 0x178(r30)
/* 0000727C FC400890 */ fmr f2, f1
/* 00007280 5400E13E */ srwi r0, r0, 4
/* 00007284 1C000032 */ mulli r0, r0, 0x32
/* 00007288 7C002050 */ subf r0, r0, r4
/* 0000728C 9001021C */ stw r0, 0x21c(r1)
/* 00007290 3E604330 */ lis r19, 0x4330
/* 00007294 3C600000 */ lis r3, lbl_000261E8@ha
/* 00007298 92610218 */ stw r19, 0x218(r1)
/* 0000729C C8830000 */ lfd f4, lbl_000261E8@l(r3)
/* 000072A0 C8610218 */ lfd f3, 0x218(r1)
/* 000072A4 EC632028 */ fsubs f3, f3, f4
/* 000072A8 EC6500F2 */ fmuls f3, f5, f3
/* 000072AC EC030024 */ fdivs f0, f3, f0
/* 000072B0 EC660028 */ fsubs f3, f6, f0
/* 000072B4 4BFF8F1D */ bl mathutil_mtxA_translate_xyz
/* 000072B8 C03E011C */ lfs f1, 0x11c(r30)
/* 000072BC C05E0004 */ lfs f2, 4(r30)
/* 000072C0 FC600890 */ fmr f3, f1
/* 000072C4 FC801090 */ fmr f4, f2
/* 000072C8 4BFF8F09 */ bl avdisp_set_post_mult_color
/* 000072CC 80950000 */ lwz r4, 0(r21)
/* 000072D0 3C600000 */ lis r3, lbl_000261E8@ha
/* 000072D4 C8430000 */ lfd f2, lbl_000261E8@l(r3)
/* 000072D8 7C142016 */ mulhwu r0, r20, r4
/* 000072DC C07E0130 */ lfs f3, 0x130(r30)
/* 000072E0 C81E01A0 */ lfd f0, 0x1a0(r30)
/* 000072E4 5400E13E */ srwi r0, r0, 4
/* 000072E8 1C000032 */ mulli r0, r0, 0x32
/* 000072EC 7C002050 */ subf r0, r0, r4
/* 000072F0 90010224 */ stw r0, 0x224(r1)
/* 000072F4 92610220 */ stw r19, 0x220(r1)
/* 000072F8 C8210220 */ lfd f1, 0x220(r1)
/* 000072FC EC211028 */ fsubs f1, f1, f2
/* 00007300 EC230072 */ fmuls f1, f3, f1
/* 00007304 FC210024 */ fdiv f1, f1, f0
/* 00007308 4BFF8EC9 */ bl __cvt_fp2unsigned
/* 0000730C 9061022C */ stw r3, 0x22c(r1)
/* 00007310 3C600000 */ lis r3, lbl_000261E8@ha
/* 00007314 C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 00007318 92610228 */ stw r19, 0x228(r1)
/* 0000731C C8010228 */ lfd f0, 0x228(r1)
/* 00007320 EC200828 */ fsubs f1, f0, f1
/* 00007324 4BFF8EAD */ bl avdisp_set_alpha
/* 00007328 480000E4 */ b lbl_0000740C
lbl_0000732C:
/* 0000732C 4801CA99 */ bl lbl_00023DC4
/* 00007330 7C600775 */ extsb. r0, r3
/* 00007334 408200D8 */ bne lbl_0000740C
/* 00007338 3C600000 */ lis r3, globalAnimTimer@ha
/* 0000733C C03E0000 */ lfs f1, 0(r30)
/* 00007340 3AA30000 */ addi r21, r3, globalAnimTimer@l
/* 00007344 C0BE011C */ lfs f5, 0x11c(r30)
/* 00007348 3C608889 */ lis r3, 0x8889
/* 0000734C 80950000 */ lwz r4, 0(r21)
/* 00007350 3A838889 */ addi r20, r3, -30583
/* 00007354 C01E0108 */ lfs f0, 0x108(r30)
/* 00007358 7C142016 */ mulhwu r0, r20, r4
/* 0000735C C0DE0178 */ lfs f6, 0x178(r30)
/* 00007360 FC400890 */ fmr f2, f1
/* 00007364 5400D97E */ srwi r0, r0, 5
/* 00007368 1C00003C */ mulli r0, r0, 0x3c
/* 0000736C 7C002050 */ subf r0, r0, r4
/* 00007370 9001021C */ stw r0, 0x21c(r1)
/* 00007374 3E604330 */ lis r19, 0x4330
/* 00007378 3C600000 */ lis r3, lbl_000261E8@ha
/* 0000737C 92610218 */ stw r19, 0x218(r1)
/* 00007380 C8830000 */ lfd f4, lbl_000261E8@l(r3)
/* 00007384 C8610218 */ lfd f3, 0x218(r1)
/* 00007388 EC632028 */ fsubs f3, f3, f4
/* 0000738C EC6500F2 */ fmuls f3, f5, f3
/* 00007390 EC030024 */ fdivs f0, f3, f0
/* 00007394 EC660028 */ fsubs f3, f6, f0
/* 00007398 4BFF8E39 */ bl mathutil_mtxA_translate_xyz
/* 0000739C C03E0174 */ lfs f1, 0x174(r30)
/* 000073A0 C07E0004 */ lfs f3, 4(r30)
/* 000073A4 FC400890 */ fmr f2, f1
/* 000073A8 FC801890 */ fmr f4, f3
/* 000073AC 4BFF8E25 */ bl avdisp_set_post_mult_color
/* 000073B0 80950000 */ lwz r4, 0(r21)
/* 000073B4 3C600000 */ lis r3, lbl_000261E8@ha
/* 000073B8 C8430000 */ lfd f2, lbl_000261E8@l(r3)
/* 000073BC 7C142016 */ mulhwu r0, r20, r4
/* 000073C0 C07E0130 */ lfs f3, 0x130(r30)
/* 000073C4 C81E01A8 */ lfd f0, 0x1a8(r30)
/* 000073C8 5400D97E */ srwi r0, r0, 5
/* 000073CC 1C00003C */ mulli r0, r0, 0x3c
/* 000073D0 7C002050 */ subf r0, r0, r4
/* 000073D4 90010224 */ stw r0, 0x224(r1)
/* 000073D8 92610220 */ stw r19, 0x220(r1)
/* 000073DC C8210220 */ lfd f1, 0x220(r1)
/* 000073E0 EC211028 */ fsubs f1, f1, f2
/* 000073E4 EC230072 */ fmuls f1, f3, f1
/* 000073E8 FC210024 */ fdiv f1, f1, f0
/* 000073EC 4BFF8DE5 */ bl __cvt_fp2unsigned
/* 000073F0 9061022C */ stw r3, 0x22c(r1)
/* 000073F4 3C600000 */ lis r3, lbl_000261E8@ha
/* 000073F8 C8230000 */ lfd f1, lbl_000261E8@l(r3)
/* 000073FC 92610228 */ stw r19, 0x228(r1)
/* 00007400 C8010228 */ lfd f0, 0x228(r1)
/* 00007404 EC200828 */ fsubs f1, f0, f1
/* 00007408 4BFF8DC9 */ bl avdisp_set_alpha
lbl_0000740C:
/* 0000740C 3C600000 */ lis r3, mathutilData@ha
/* 00007410 3A630000 */ addi r19, r3, mathutilData@l
/* 00007414 80730000 */ lwz r3, 0(r19)
/* 00007418 38800000 */ li r4, 0
/* 0000741C 4BFF8DB5 */ bl GXLoadPosMtxImm
/* 00007420 80730000 */ lwz r3, 0(r19)
/* 00007424 38800000 */ li r4, 0
/* 00007428 4BFF8DA9 */ bl GXLoadNrmMtxImm
/* 0000742C 3C600000 */ lis r3, minigameGma@ha
/* 00007430 38630000 */ addi r3, r3, minigameGma@l
/* 00007434 80630000 */ lwz r3, 0(r3)
/* 00007438 80630008 */ lwz r3, 8(r3)
/* 0000743C 806300F0 */ lwz r3, 0xf0(r3)
/* 00007440 4BFF8D91 */ bl avdisp_draw_model_unculled_sort_translucent
/* 00007444 C03E0004 */ lfs f1, 4(r30)
/* 00007448 FC400890 */ fmr f2, f1
/* 0000744C FC600890 */ fmr f3, f1
/* 00007450 FC800890 */ fmr f4, f1
/* 00007454 4BFF8D7D */ bl avdisp_set_post_mult_color
lbl_00007458:
/* 00007458 480027F9 */ bl lbl_00009C50
/* 0000745C 3C600000 */ lis r3, modeCtrl@ha
/* 00007460 38630000 */ addi r3, r3, modeCtrl@l
/* 00007464 8063002C */ lwz r3, 0x2c(r3)
/* 00007468 4BFF8D69 */ bl change_current_camera
/* 0000746C 38600001 */ li r3, 1
/* 00007470 38800003 */ li r4, 3
/* 00007474 38A00001 */ li r5, 1
/* 00007478 4BFF8D59 */ bl avdisp_set_z_mode
/* 0000747C 801D00D0 */ lwz r0, 0xd0(r29)
/* 00007480 2C000000 */ cmpwi r0, 0
/* 00007484 4181003C */ bgt lbl_000074C0
/* 00007488 801D0000 */ lwz r0, 0(r29)
/* 0000748C 28000040 */ cmplwi r0, 0x40
/* 00007490 41820030 */ beq lbl_000074C0
/* 00007494 28000080 */ cmplwi r0, 0x80
/* 00007498 41820028 */ beq lbl_000074C0
/* 0000749C 881D00F6 */ lbz r0, 0xf6(r29)
/* 000074A0 28000000 */ cmplwi r0, 0
/* 000074A4 4082001C */ bne lbl_000074C0
/* 000074A8 48001CD1 */ bl lbl_00009178
/* 000074AC 5460063F */ clrlwi. r0, r3, 0x18
/* 000074B0 40820010 */ bne lbl_000074C0
/* 000074B4 A87D003A */ lha r3, 0x3a(r29)
/* 000074B8 38630001 */ addi r3, r3, 1
/* 000074BC 4800B559 */ bl lbl_00012A14
lbl_000074C0:
/* 000074C0 807D00C4 */ lwz r3, 0xc4(r29)
/* 000074C4 2C030000 */ cmpwi r3, 0
/* 000074C8 40810268 */ ble lbl_00007730
/* 000074CC 801D00D0 */ lwz r0, 0xd0(r29)
/* 000074D0 2C000000 */ cmpwi r0, 0
/* 000074D4 4181025C */ bgt lbl_00007730
/* 000074D8 2C0300B2 */ cmpwi r3, 0xb2
/* 000074DC 40820068 */ bne lbl_00007544
/* 000074E0 3C600000 */ lis r3, modeCtrl@ha
/* 000074E4 38630000 */ addi r3, r3, modeCtrl@l
/* 000074E8 80030024 */ lwz r0, 0x24(r3)
/* 000074EC 2C000001 */ cmpwi r0, 1
/* 000074F0 41820054 */ beq lbl_00007544
/* 000074F4 8003002C */ lwz r0, 0x2c(r3)
/* 000074F8 2C000000 */ cmpwi r0, 0
/* 000074FC 40820010 */ bne lbl_0000750C
/* 00007500 386001EA */ li r3, 0x1ea
/* 00007504 4BFF8CCD */ bl u_play_sound_0
/* 00007508 4800003C */ b lbl_00007544
lbl_0000750C:
/* 0000750C 2C000001 */ cmpwi r0, 1
/* 00007510 40820010 */ bne lbl_00007520
/* 00007514 386001EB */ li r3, 0x1eb
/* 00007518 4BFF8CB9 */ bl u_play_sound_0
/* 0000751C 48000028 */ b lbl_00007544
lbl_00007520:
/* 00007520 2C000002 */ cmpwi r0, 2
/* 00007524 40820010 */ bne lbl_00007534
/* 00007528 386001EC */ li r3, 0x1ec
/* 0000752C 4BFF8CA5 */ bl u_play_sound_0
/* 00007530 48000014 */ b lbl_00007544
lbl_00007534:
/* 00007534 2C000003 */ cmpwi r0, 3
/* 00007538 4082000C */ bne lbl_00007544
/* 0000753C 386001ED */ li r3, 0x1ed
/* 00007540 4BFF8C91 */ bl u_play_sound_0
lbl_00007544:
/* 00007544 801D00C4 */ lwz r0, 0xc4(r29)
/* 00007548 2C000076 */ cmpwi r0, 0x76
/* 0000754C 4082000C */ bne lbl_00007558
/* 00007550 386001F5 */ li r3, 0x1f5
/* 00007554 4BFF8C7D */ bl u_play_sound_0
lbl_00007558:
/* 00007558 807D00C4 */ lwz r3, 0xc4(r29)
/* 0000755C 4800A511 */ bl lbl_00011A6C
/* 00007560 3C600000 */ lis r3, modeCtrl@ha
/* 00007564 A81D003A */ lha r0, 0x3a(r29)
/* 00007568 38630000 */ addi r3, r3, modeCtrl@l
/* 0000756C 8063002C */ lwz r3, 0x2c(r3)
/* 00007570 1C630012 */ mulli r3, r3, 0x12
/* 00007574 7C7F1A14 */ add r3, r31, r3
/* 00007578 7C630214 */ add r3, r3, r0
/* 0000757C 88030048 */ lbz r0, 0x48(r3)
/* 00007580 28000000 */ cmplwi r0, 0
/* 00007584 40820020 */ bne lbl_000075A4
/* 00007588 3C600000 */ lis r3, lbl_802F1BE8@ha
/* 0000758C 80030000 */ lwz r0, lbl_802F1BE8@l(r3)
/* 00007590 2C000000 */ cmpwi r0, 0
/* 00007594 40820010 */ bne lbl_000075A4
/* 00007598 807D00C4 */ lwz r3, 0xc4(r29)
/* 0000759C 4800AA51 */ bl lbl_00011FEC
/* 000075A0 48000190 */ b lbl_00007730
lbl_000075A4:
/* 000075A4 3C600000 */ lis r3, lbl_802F1BE8@ha
/* 000075A8 80030000 */ lwz r0, lbl_802F1BE8@l(r3)
/* 000075AC 2C000001 */ cmpwi r0, 1
/* 000075B0 40820180 */ bne lbl_00007730
/* 000075B4 809D00C4 */ lwz r4, 0xc4(r29)
/* 000075B8 3C600000 */ lis r3, lbl_000261F0@ha
/* 000075BC 3CA04330 */ lis r5, 0x4330
/* 000075C0 C8430000 */ lfd f2, lbl_000261F0@l(r3)
/* 000075C4 6C808000 */ xoris r0, r4, 0x8000
/* 000075C8 9001021C */ stw r0, 0x21c(r1)
/* 000075CC C81E01B0 */ lfd f0, 0x1b0(r30)
/* 000075D0 90A10218 */ stw r5, 0x218(r1)
/* 000075D4 C8210218 */ lfd f1, 0x218(r1)
/* 000075D8 FC211028 */ fsub f1, f1, f2
/* 000075DC FC010040 */ fcmpo cr0, f1, f0
/* 000075E0 40810074 */ ble lbl_00007654
/* 000075E4 200400B4 */ subfic r0, r4, 0xb4
/* 000075E8 C09E01C0 */ lfs f4, 0x1c0(r30)
/* 000075EC 6C008000 */ xoris r0, r0, 0x8000
/* 000075F0 C83E0188 */ lfd f1, 0x188(r30)
/* 000075F4 9001021C */ stw r0, 0x21c(r1)
/* 000075F8 200400B4 */ subfic r0, r4, 0xb4
/* 000075FC 6C008000 */ xoris r0, r0, 0x8000
/* 00007600 C8BE01B8 */ lfd f5, 0x1b8(r30)
/* 00007604 90A10218 */ stw r5, 0x218(r1)
/* 00007608 3C800000 */ lis r4, lbl_000261F0@ha
/* 0000760C 90010224 */ stw r0, 0x224(r1)
/* 00007610 3C600000 */ lis r3, lbl_000261F0@ha
/* 00007614 C8440000 */ lfd f2, lbl_000261F0@l(r4)
/* 00007618 C8010218 */ lfd f0, 0x218(r1)
/* 0000761C 90A10220 */ stw r5, 0x220(r1)
/* 00007620 EC601028 */ fsubs f3, f0, f2
/* 00007624 C8430000 */ lfd f2, lbl_000261F0@l(r3)
/* 00007628 C8010220 */ lfd f0, 0x220(r1)
/* 0000762C EC6400F2 */ fmuls f3, f4, f3
/* 00007630 EC001028 */ fsubs f0, f0, f2
/* 00007634 EC030032 */ fmuls f0, f3, f0
/* 00007638 FC000824 */ fdiv f0, f0, f1
/* 0000763C FC000824 */ fdiv f0, f0, f1
/* 00007640 FC05002A */ fadd f0, f5, f0
/* 00007644 FC00001E */ fctiwz f0, f0
/* 00007648 D8010228 */ stfd f0, 0x228(r1)
/* 0000764C 8061022C */ lwz r3, 0x22c(r1)
/* 00007650 480000A8 */ b lbl_000076F8
lbl_00007654:
/* 00007654 9001021C */ stw r0, 0x21c(r1)
/* 00007658 3C600000 */ lis r3, lbl_000261F0@ha
/* 0000765C C8230000 */ lfd f1, lbl_000261F0@l(r3)
/* 00007660 90A10218 */ stw r5, 0x218(r1)
/* 00007664 C8DE00B0 */ lfd f6, 0xb0(r30)
/* 00007668 C8010218 */ lfd f0, 0x218(r1)
/* 0000766C FC000828 */ fsub f0, f0, f1
/* 00007670 FC003040 */ fcmpo cr0, f0, f6
/* 00007674 4081000C */ ble lbl_00007680
/* 00007678 38600140 */ li r3, 0x140
/* 0000767C 4800007C */ b lbl_000076F8
lbl_00007680:
/* 00007680 2C04003C */ cmpwi r4, 0x3c
/* 00007684 40810070 */ ble lbl_000076F4
/* 00007688 9001021C */ stw r0, 0x21c(r1)
/* 0000768C 3C800000 */ lis r4, lbl_000261F0@ha
/* 00007690 3C600000 */ lis r3, lbl_000261F0@ha
/* 00007694 C8240000 */ lfd f1, lbl_000261F0@l(r4)
/* 00007698 90A10218 */ stw r5, 0x218(r1)
/* 0000769C C8430000 */ lfd f2, lbl_000261F0@l(r3)
/* 000076A0 C8010218 */ lfd f0, 0x218(r1)
/* 000076A4 90010224 */ stw r0, 0x224(r1)
/* 000076A8 FC000828 */ fsub f0, f0, f1
/* 000076AC C09E01C0 */ lfs f4, 0x1c0(r30)
/* 000076B0 90A10220 */ stw r5, 0x220(r1)
/* 000076B4 C83E0188 */ lfd f1, 0x188(r30)
/* 000076B8 FC660028 */ fsub f3, f6, f0
/* 000076BC C8010220 */ lfd f0, 0x220(r1)
/* 000076C0 C8BE01C8 */ lfd f5, 0x1c8(r30)
/* 000076C4 FC001028 */ fsub f0, f0, f2
/* 000076C8 FC601818 */ frsp f3, f3
/* 000076CC FC060028 */ fsub f0, f6, f0
/* 000076D0 EC4400F2 */ fmuls f2, f4, f3
/* 000076D4 FC020032 */ fmul f0, f2, f0
/* 000076D8 FC000824 */ fdiv f0, f0, f1
/* 000076DC FC000824 */ fdiv f0, f0, f1
/* 000076E0 FC05002A */ fadd f0, f5, f0
/* 000076E4 FC00001E */ fctiwz f0, f0
/* 000076E8 D8010228 */ stfd f0, 0x228(r1)
/* 000076EC 8061022C */ lwz r3, 0x22c(r1)
/* 000076F0 48000008 */ b lbl_000076F8
lbl_000076F4:
/* 000076F4 386003C0 */ li r3, 0x3c0
lbl_000076F8:
/* 000076F8 881D00FB */ lbz r0, 0xfb(r29)
/* 000076FC 28000001 */ cmplwi r0, 1
/* 00007700 40820018 */ bne lbl_00007718
/* 00007704 38DF0214 */ addi r6, r31, 0x214
/* 00007708 38800190 */ li r4, 0x190
/* 0000770C 38A0000B */ li r5, 0xb
/* 00007710 4800A69D */ bl lbl_00011DAC
/* 00007714 4800001C */ b lbl_00007730
lbl_00007718:
/* 00007718 28000002 */ cmplwi r0, 2
/* 0000771C 40820014 */ bne lbl_00007730
/* 00007720 38DF0234 */ addi r6, r31, 0x234
/* 00007724 38800190 */ li r4, 0x190
/* 00007728 38A0000E */ li r5, 0xe
/* 0000772C 4800A681 */ bl lbl_00011DAC
lbl_00007730:
/* 00007730 3C600000 */ lis r3, dipSwitches@ha
/* 00007734 80030000 */ lwz r0, dipSwitches@l(r3)
/* 00007738 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 0000773C 40820474 */ bne lbl_00007BB0
/* 00007740 801D0000 */ lwz r0, 0(r29)
/* 00007744 28000040 */ cmplwi r0, 0x40
/* 00007748 41820394 */ beq lbl_00007ADC
/* 0000774C 28000080 */ cmplwi r0, 0x80
/* 00007750 4182038C */ beq lbl_00007ADC
/* 00007754 28000008 */ cmplwi r0, 8
/* 00007758 41820024 */ beq lbl_0000777C
/* 0000775C 28000010 */ cmplwi r0, 0x10
/* 00007760 4182001C */ beq lbl_0000777C
/* 00007764 28000020 */ cmplwi r0, 0x20
/* 00007768 41820014 */ beq lbl_0000777C
/* 0000776C 28000002 */ cmplwi r0, 2
/* 00007770 4182000C */ beq lbl_0000777C
/* 00007774 28000004 */ cmplwi r0, 4
/* 00007778 40820088 */ bne lbl_00007800
lbl_0000777C:
/* 0000777C 3C600000 */ lis r3, modeCtrl@ha
/* 00007780 38630000 */ addi r3, r3, modeCtrl@l
/* 00007784 8083002C */ lwz r4, 0x2c(r3)
/* 00007788 3C600000 */ lis r3, cameraInfo@ha
/* 0000778C 38630000 */ addi r3, r3, cameraInfo@l
/* 00007790 1C040284 */ mulli r0, r4, 0x284
/* 00007794 7C630214 */ add r3, r3, r0
/* 00007798 8803001F */ lbz r0, 0x1f(r3)
/* 0000779C 7C000774 */ extsb r0, r0
/* 000077A0 2C00000C */ cmpwi r0, 0xc
/* 000077A4 4182005C */ beq lbl_00007800
/* 000077A8 2C00000B */ cmpwi r0, 0xb
/* 000077AC 41820054 */ beq lbl_00007800
/* 000077B0 881D00F6 */ lbz r0, 0xf6(r29)
/* 000077B4 28000000 */ cmplwi r0, 0
/* 000077B8 40820048 */ bne lbl_00007800
/* 000077BC 881D00EE */ lbz r0, 0xee(r29)
/* 000077C0 28000000 */ cmplwi r0, 0
/* 000077C4 41820020 */ beq lbl_000077E4
/* 000077C8 1C640012 */ mulli r3, r4, 0x12
/* 000077CC A81D003A */ lha r0, 0x3a(r29)
/* 000077D0 7C7F1A14 */ add r3, r31, r3
/* 000077D4 7C630214 */ add r3, r3, r0
/* 000077D8 88630048 */ lbz r3, 0x48(r3)
/* 000077DC 4800B4A5 */ bl lbl_00012C80
/* 000077E0 48000020 */ b lbl_00007800
lbl_000077E4:
/* 000077E4 1C640012 */ mulli r3, r4, 0x12
/* 000077E8 A81D003A */ lha r0, 0x3a(r29)
/* 000077EC 7C7F1A14 */ add r3, r31, r3
/* 000077F0 7C630214 */ add r3, r3, r0
/* 000077F4 88630048 */ lbz r3, 0x48(r3)
/* 000077F8 38630001 */ addi r3, r3, 1
/* 000077FC 4800B485 */ bl lbl_00012C80
lbl_00007800:
/* 00007800 801D0000 */ lwz r0, 0(r29)
/* 00007804 28000008 */ cmplwi r0, 8
/* 00007808 408200AC */ bne lbl_000078B4
/* 0000780C C83E0050 */ lfd f1, 0x50(r30)
/* 00007810 C01D004C */ lfs f0, 0x4c(r29)
/* 00007814 FC010000 */ fcmpu cr0, f1, f0
/* 00007818 4082009C */ bne lbl_000078B4
/* 0000781C 3C600000 */ lis r3, modeCtrl@ha
/* 00007820 38630000 */ addi r3, r3, modeCtrl@l
/* 00007824 8003002C */ lwz r0, 0x2c(r3)
/* 00007828 3C600000 */ lis r3, cameraInfo@ha
/* 0000782C 38630000 */ addi r3, r3, cameraInfo@l
/* 00007830 1C000284 */ mulli r0, r0, 0x284
/* 00007834 7C630214 */ add r3, r3, r0
/* 00007838 8803001F */ lbz r0, 0x1f(r3)
/* 0000783C 2C00000C */ cmpwi r0, 0xc
/* 00007840 41820074 */ beq lbl_000078B4
/* 00007844 801D00C8 */ lwz r0, 0xc8(r29)
/* 00007848 2C000000 */ cmpwi r0, 0
/* 0000784C 41810028 */ bgt lbl_00007874
/* 00007850 801D00C4 */ lwz r0, 0xc4(r29)
/* 00007854 2C000000 */ cmpwi r0, 0
/* 00007858 4181001C */ bgt lbl_00007874
/* 0000785C 881D00F6 */ lbz r0, 0xf6(r29)
/* 00007860 28000000 */ cmplwi r0, 0
/* 00007864 40820050 */ bne lbl_000078B4
/* 00007868 387D0028 */ addi r3, r29, 0x28
/* 0000786C 4801B879 */ bl lbl_000230E4
/* 00007870 48000044 */ b lbl_000078B4
lbl_00007874:
/* 00007874 881D00EE */ lbz r0, 0xee(r29)
/* 00007878 28000000 */ cmplwi r0, 0
/* 0000787C 40820038 */ bne lbl_000078B4
/* 00007880 801D00C8 */ lwz r0, 0xc8(r29)
/* 00007884 3C600000 */ lis r3, lbl_000261F0@ha
/* 00007888 C8430000 */ lfd f2, lbl_000261F0@l(r3)
/* 0000788C 387D0028 */ addi r3, r29, 0x28
/* 00007890 6C008000 */ xoris r0, r0, 0x8000
/* 00007894 9001021C */ stw r0, 0x21c(r1)
/* 00007898 3C004330 */ lis r0, 0x4330
/* 0000789C C01E01D0 */ lfs f0, 0x1d0(r30)
/* 000078A0 90010218 */ stw r0, 0x218(r1)
/* 000078A4 C8210218 */ lfd f1, 0x218(r1)
/* 000078A8 EC211028 */ fsubs f1, f1, f2
/* 000078AC EC210024 */ fdivs f1, f1, f0
/* 000078B0 4801B49D */ bl lbl_00022D4C
lbl_000078B4:
/* 000078B4 801D0000 */ lwz r0, 0(r29)
/* 000078B8 28000020 */ cmplwi r0, 0x20
/* 000078BC 4082006C */ bne lbl_00007928
/* 000078C0 801D00C8 */ lwz r0, 0xc8(r29)
/* 000078C4 2C000000 */ cmpwi r0, 0
/* 000078C8 41810060 */ bgt lbl_00007928
/* 000078CC 801D00C4 */ lwz r0, 0xc4(r29)
/* 000078D0 2C000000 */ cmpwi r0, 0
/* 000078D4 41810054 */ bgt lbl_00007928
/* 000078D8 C83E00D8 */ lfd f1, 0xd8(r30)
/* 000078DC 3C600000 */ lis r3, lbl_000261F0@ha
/* 000078E0 C01D0040 */ lfs f0, 0x40(r29)
/* 000078E4 A81D0028 */ lha r0, 0x28(r29)
/* 000078E8 FC410032 */ fmul f2, f1, f0
/* 000078EC C81E00E0 */ lfd f0, 0xe0(r30)
/* 000078F0 5400083C */ slwi r0, r0, 1
/* 000078F4 C8230000 */ lfd f1, lbl_000261F0@l(r3)
/* 000078F8 7C1F02AE */ lhax r0, r31, r0
/* 000078FC FC420024 */ fdiv f2, f2, f0
/* 00007900 6C008000 */ xoris r0, r0, 0x8000
/* 00007904 9001021C */ stw r0, 0x21c(r1)
/* 00007908 3C004330 */ lis r0, 0x4330
/* 0000790C 387D0028 */ addi r3, r29, 0x28
/* 00007910 90010218 */ stw r0, 0x218(r1)
/* 00007914 C8010218 */ lfd f0, 0x218(r1)
/* 00007918 FC000828 */ fsub f0, f0, f1
/* 0000791C FC220024 */ fdiv f1, f2, f0
/* 00007920 FC200818 */ frsp f1, f1
/* 00007924 4801ACED */ bl lbl_00022610
lbl_00007928:
/* 00007928 C03D004C */ lfs f1, 0x4c(r29)
/* 0000792C C81E0050 */ lfd f0, 0x50(r30)
/* 00007930 FC010040 */ fcmpo cr0, f1, f0
/* 00007934 4C401382 */ cror 2, 0, 2
/* 00007938 40820090 */ bne lbl_000079C8
/* 0000793C 881D00EE */ lbz r0, 0xee(r29)
/* 00007940 28000000 */ cmplwi r0, 0
/* 00007944 41820084 */ beq lbl_000079C8
/* 00007948 C83E00D8 */ lfd f1, 0xd8(r30)
/* 0000794C 3C804330 */ lis r4, 0x4330
/* 00007950 C01D0040 */ lfs f0, 0x40(r29)
/* 00007954 3CA00000 */ lis r5, lbl_000261F0@ha
/* 00007958 A81D0028 */ lha r0, 0x28(r29)
/* 0000795C FC210032 */ fmul f1, f1, f0
/* 00007960 C81E00E0 */ lfd f0, 0xe0(r30)
/* 00007964 5403083C */ slwi r3, r0, 1
/* 00007968 801D00C8 */ lwz r0, 0xc8(r29)
/* 0000796C 7C7F1AAE */ lhax r3, r31, r3
/* 00007970 FC410024 */ fdiv f2, f1, f0
/* 00007974 6C638000 */ xoris r3, r3, 0x8000
/* 00007978 9061021C */ stw r3, 0x21c(r1)
/* 0000797C 200000B4 */ subfic r0, r0, 0xb4
/* 00007980 6C008000 */ xoris r0, r0, 0x8000
/* 00007984 90810218 */ stw r4, 0x218(r1)
/* 00007988 3C600000 */ lis r3, lbl_000261F0@ha
/* 0000798C C8250000 */ lfd f1, lbl_000261F0@l(r5)
/* 00007990 C8010218 */ lfd f0, 0x218(r1)
/* 00007994 90010224 */ stw r0, 0x224(r1)
/* 00007998 FC200828 */ fsub f1, f0, f1
/* 0000799C C8630000 */ lfd f3, lbl_000261F0@l(r3)
/* 000079A0 90810220 */ stw r4, 0x220(r1)
/* 000079A4 387D0028 */ addi r3, r29, 0x28
/* 000079A8 C01E01D0 */ lfs f0, 0x1d0(r30)
/* 000079AC FC220824 */ fdiv f1, f2, f1
/* 000079B0 C8410220 */ lfd f2, 0x220(r1)
/* 000079B4 EC421828 */ fsubs f2, f2, f3
/* 000079B8 FC200818 */ frsp f1, f1
/* 000079BC EC420024 */ fdivs f2, f2, f0
/* 000079C0 4801AF45 */ bl lbl_00022904
/* 000079C4 480000A4 */ b lbl_00007A68
lbl_000079C8:
/* 000079C8 801D0000 */ lwz r0, 0(r29)
/* 000079CC 28000010 */ cmplwi r0, 0x10
/* 000079D0 41820048 */ beq lbl_00007A18
/* 000079D4 3C600000 */ lis r3, modeCtrl@ha
/* 000079D8 38630000 */ addi r3, r3, modeCtrl@l
/* 000079DC 8003002C */ lwz r0, 0x2c(r3)
/* 000079E0 3C600000 */ lis r3, cameraInfo@ha
/* 000079E4 38630000 */ addi r3, r3, cameraInfo@l
/* 000079E8 1C000284 */ mulli r0, r0, 0x284
/* 000079EC 7C630214 */ add r3, r3, r0
/* 000079F0 8803001F */ lbz r0, 0x1f(r3)
/* 000079F4 7C000774 */ extsb r0, r0
/* 000079F8 2C000003 */ cmpwi r0, 3
/* 000079FC 4182001C */ beq lbl_00007A18
/* 00007A00 2C000004 */ cmpwi r0, 4
/* 00007A04 41820014 */ beq lbl_00007A18
/* 00007A08 2C000006 */ cmpwi r0, 6
/* 00007A0C 4182000C */ beq lbl_00007A18
/* 00007A10 2C000001 */ cmpwi r0, 1
/* 00007A14 40820054 */ bne lbl_00007A68
lbl_00007A18:
/* 00007A18 C83E00D8 */ lfd f1, 0xd8(r30)
/* 00007A1C 3C600000 */ lis r3, lbl_000261F0@ha
/* 00007A20 C01D0040 */ lfs f0, 0x40(r29)
/* 00007A24 A81D0028 */ lha r0, 0x28(r29)
/* 00007A28 FC410032 */ fmul f2, f1, f0
/* 00007A2C C81E00E0 */ lfd f0, 0xe0(r30)
/* 00007A30 5400083C */ slwi r0, r0, 1
/* 00007A34 C8230000 */ lfd f1, lbl_000261F0@l(r3)
/* 00007A38 7C1F02AE */ lhax r0, r31, r0
/* 00007A3C FC420024 */ fdiv f2, f2, f0
/* 00007A40 6C008000 */ xoris r0, r0, 0x8000
/* 00007A44 9001021C */ stw r0, 0x21c(r1)
/* 00007A48 3C004330 */ lis r0, 0x4330
/* 00007A4C 387D0028 */ addi r3, r29, 0x28
/* 00007A50 90010218 */ stw r0, 0x218(r1)
/* 00007A54 C8010218 */ lfd f0, 0x218(r1)
/* 00007A58 FC000828 */ fsub f0, f0, f1
/* 00007A5C FC220024 */ fdiv f1, f2, f0
/* 00007A60 FC200818 */ frsp f1, f1
/* 00007A64 4801ABAD */ bl lbl_00022610
lbl_00007A68:
/* 00007A68 801D0000 */ lwz r0, 0(r29)
/* 00007A6C 28000020 */ cmplwi r0, 0x20
/* 00007A70 41820024 */ beq lbl_00007A94
/* 00007A74 28000008 */ cmplwi r0, 8
/* 00007A78 4182001C */ beq lbl_00007A94
/* 00007A7C 28000010 */ cmplwi r0, 0x10
/* 00007A80 41820014 */ beq lbl_00007A94
/* 00007A84 28000002 */ cmplwi r0, 2
/* 00007A88 4182000C */ beq lbl_00007A94
/* 00007A8C 28000004 */ cmplwi r0, 4
/* 00007A90 40820120 */ bne lbl_00007BB0
lbl_00007A94:
/* 00007A94 3C600000 */ lis r3, modeCtrl@ha
/* 00007A98 38630000 */ addi r3, r3, modeCtrl@l
/* 00007A9C 8003002C */ lwz r0, 0x2c(r3)
/* 00007AA0 3C600000 */ lis r3, cameraInfo@ha
/* 00007AA4 38630000 */ addi r3, r3, cameraInfo@l
/* 00007AA8 1C000284 */ mulli r0, r0, 0x284
/* 00007AAC 7C630214 */ add r3, r3, r0
/* 00007AB0 8803001F */ lbz r0, 0x1f(r3)
/* 00007AB4 7C000774 */ extsb r0, r0
/* 00007AB8 2C00000C */ cmpwi r0, 0xc
/* 00007ABC 418200F4 */ beq lbl_00007BB0
/* 00007AC0 2C00000B */ cmpwi r0, 0xb
/* 00007AC4 418200EC */ beq lbl_00007BB0
/* 00007AC8 881D00F6 */ lbz r0, 0xf6(r29)
/* 00007ACC 28000000 */ cmplwi r0, 0
/* 00007AD0 408200E0 */ bne lbl_00007BB0
/* 00007AD4 4800DA4D */ bl lbl_00015520
/* 00007AD8 480000D8 */ b lbl_00007BB0
lbl_00007ADC:
/* 00007ADC C03E00D4 */ lfs f1, 0xd4(r30)
/* 00007AE0 FC400890 */ fmr f2, f1
/* 00007AE4 4BFF86ED */ bl set_text_scale
/* 00007AE8 C03E0004 */ lfs f1, 4(r30)
/* 00007AEC 4BFF86E5 */ bl set_text_opacity
/* 00007AF0 3C600100 */ lis r3, 0x100
/* 00007AF4 3863FF00 */ addi r3, r3, -256
/* 00007AF8 4BFF86D9 */ bl set_text_mul_color
/* 00007AFC 801D0000 */ lwz r0, 0(r29)
/* 00007B00 28000040 */ cmplwi r0, 0x40
/* 00007B04 408200A0 */ bne lbl_00007BA4
/* 00007B08 3C600000 */ lis r3, modeCtrl@ha
/* 00007B0C A81D003A */ lha r0, 0x3a(r29)
/* 00007B10 38630000 */ addi r3, r3, modeCtrl@l
/* 00007B14 8063002C */ lwz r3, 0x2c(r3)
/* 00007B18 1C630012 */ mulli r3, r3, 0x12
/* 00007B1C 7C7F1A14 */ add r3, r31, r3
/* 00007B20 7C630214 */ add r3, r3, r0
/* 00007B24 88630048 */ lbz r3, 0x48(r3)
/* 00007B28 28030001 */ cmplwi r3, 1
/* 00007B2C 40820014 */ bne lbl_00007B40
/* 00007B30 38600001 */ li r3, 1
/* 00007B34 809D00CC */ lwz r4, 0xcc(r29)
/* 00007B38 4800A87D */ bl lbl_000123B4
/* 00007B3C 48000074 */ b lbl_00007BB0
lbl_00007B40:
/* 00007B40 28030002 */ cmplwi r3, 2
/* 00007B44 40820014 */ bne lbl_00007B58
/* 00007B48 38600002 */ li r3, 2
/* 00007B4C 809D00CC */ lwz r4, 0xcc(r29)
/* 00007B50 4800A865 */ bl lbl_000123B4
/* 00007B54 4800005C */ b lbl_00007BB0
lbl_00007B58:
/* 00007B58 28030003 */ cmplwi r3, 3
/* 00007B5C 40820014 */ bne lbl_00007B70
/* 00007B60 38600003 */ li r3, 3
/* 00007B64 809D00CC */ lwz r4, 0xcc(r29)
/* 00007B68 4800A84D */ bl lbl_000123B4
/* 00007B6C 48000044 */ b lbl_00007BB0
lbl_00007B70:
/* 00007B70 28030004 */ cmplwi r3, 4
/* 00007B74 40820014 */ bne lbl_00007B88
/* 00007B78 38600004 */ li r3, 4
/* 00007B7C 809D00CC */ lwz r4, 0xcc(r29)
/* 00007B80 4800A835 */ bl lbl_000123B4
/* 00007B84 4800002C */ b lbl_00007BB0
lbl_00007B88:
/* 00007B88 28030005 */ cmplwi r3, 5
/* 00007B8C 41800024 */ blt lbl_00007BB0
/* 00007B90 28030009 */ cmplwi r3, 9
/* 00007B94 4181001C */ bgt lbl_00007BB0
/* 00007B98 809D00CC */ lwz r4, 0xcc(r29)
/* 00007B9C 4800A819 */ bl lbl_000123B4
/* 00007BA0 48000010 */ b lbl_00007BB0
lbl_00007BA4:
/* 00007BA4 3860000A */ li r3, 0xa
/* 00007BA8 809D00CC */ lwz r4, 0xcc(r29)
/* 00007BAC 4800A809 */ bl lbl_000123B4
lbl_00007BB0:
/* 00007BB0 801D00D4 */ lwz r0, 0xd4(r29)
/* 00007BB4 28000000 */ cmplwi r0, 0
/* 00007BB8 41820010 */ beq lbl_00007BC8
/* 00007BBC 38600063 */ li r3, 0x63
/* 00007BC0 809D00CC */ lwz r4, 0xcc(r29)
/* 00007BC4 4800A7F1 */ bl lbl_000123B4
lbl_00007BC8:
/* 00007BC8 3C600000 */ lis r3, modeCtrl@ha
/* 00007BCC 3AE30000 */ addi r23, r3, modeCtrl@l
/* 00007BD0 8017002C */ lwz r0, 0x2c(r23)
/* 00007BD4 3C600000 */ lis r3, cameraInfo@ha
/* 00007BD8 3AC30000 */ addi r22, r3, cameraInfo@l
/* 00007BDC 1C000284 */ mulli r0, r0, 0x284
/* 00007BE0 7C760214 */ add r3, r22, r0
/* 00007BE4 8803001F */ lbz r0, 0x1f(r3)
/* 00007BE8 7C000774 */ extsb r0, r0
/* 00007BEC 2C00000B */ cmpwi r0, 0xb
/* 00007BF0 41820328 */ beq lbl_00007F18
/* 00007BF4 2C000007 */ cmpwi r0, 7
/* 00007BF8 41820320 */ beq lbl_00007F18
/* 00007BFC 2C000008 */ cmpwi r0, 8
/* 00007C00 41820318 */ beq lbl_00007F18
/* 00007C04 807D0000 */ lwz r3, 0(r29)
/* 00007C08 28030100 */ cmplwi r3, 0x100
/* 00007C0C 4182030C */ beq lbl_00007F18
/* 00007C10 28038000 */ cmplwi r3, 0x8000
/* 00007C14 41820304 */ beq lbl_00007F18
/* 00007C18 3C03FFFF */ addis r0, r3, 0xffff
/* 00007C1C 28000000 */ cmplwi r0, 0
/* 00007C20 418202F8 */ beq lbl_00007F18
/* 00007C24 28030200 */ cmplwi r3, 0x200
/* 00007C28 418202F0 */ beq lbl_00007F18
/* 00007C2C 28030400 */ cmplwi r3, 0x400
/* 00007C30 418202E8 */ beq lbl_00007F18
/* 00007C34 3C600000 */ lis r3, commonGma@ha
/* 00007C38 3CC00000 */ lis r6, ballInfo@ha
/* 00007C3C 3CA00000 */ lis r5, globalAnimTimer@ha
/* 00007C40 3C800000 */ lis r4, mathutilData@ha
/* 00007C44 3CE00000 */ lis r7, decodedStageLzPtr@ha
/* 00007C48 3A630000 */ addi r19, r3, commonGma@l
/* 00007C4C 3B460000 */ addi r26, r6, ballInfo@l
/* 00007C50 3B650000 */ addi r27, r5, globalAnimTimer@l
/* 00007C54 3B840000 */ addi r28, r4, mathutilData@l
/* 00007C58 3B270000 */ addi r25, r7, decodedStageLzPtr@l
/* 00007C5C 3AA00000 */ li r21, 0
/* 00007C60 3A800000 */ li r20, 0
/* 00007C64 3FA00001 */ lis r29, 1
/* 00007C68 48000294 */ b lbl_00007EFC
lbl_00007C6C:
/* 00007C6C 8017002C */ lwz r0, 0x2c(r23)
/* 00007C70 7C150000 */ cmpw r21, r0
/* 00007C74 41820280 */ beq lbl_00007EF4
/* 00007C78 7C7FAA14 */ add r3, r31, r21
/* 00007C7C 88030040 */ lbz r0, 0x40(r3)
/* 00007C80 28000000 */ cmplwi r0, 0
/* 00007C84 40820270 */ bne lbl_00007EF4
/* 00007C88 80790000 */ lwz r3, 0(r25)
/* 00007C8C 7F1AA214 */ add r24, r26, r20
/* 00007C90 C078000C */ lfs f3, 0xc(r24)
/* 00007C94 80630010 */ lwz r3, 0x10(r3)
/* 00007C98 C0380004 */ lfs f1, 4(r24)
/* 00007C9C C0430008 */ lfs f2, 8(r3)
/* 00007CA0 C0030000 */ lfs f0, 0(r3)
/* 00007CA4 EC631028 */ fsubs f3, f3, f2
/* 00007CA8 C05E0000 */ lfs f2, 0(r30)
/* 00007CAC EC210028 */ fsubs f1, f1, f0
/* 00007CB0 EC210072 */ fmuls f1, f1, f1
/* 00007CB4 EC2208BA */ fmadds f1, f2, f2, f1
/* 00007CB8 EC2308FA */ fmadds f1, f3, f3, f1
/* 00007CBC 4BFF8515 */ bl mathutil_sqrt
/* 00007CC0 C81E00A0 */ lfd f0, 0xa0(r30)
/* 00007CC4 FC010040 */ fcmpo cr0, f1, f0
/* 00007CC8 4081022C */ ble lbl_00007EF4
/* 00007CCC 38600001 */ li r3, 1
/* 00007CD0 38800003 */ li r4, 3
/* 00007CD4 38A00000 */ li r5, 0
/* 00007CD8 4BFF84F9 */ bl avdisp_set_z_mode
/* 00007CDC 38600001 */ li r3, 1
/* 00007CE0 38800003 */ li r4, 3
/* 00007CE4 38A00001 */ li r5, 1
/* 00007CE8 4BFF84E9 */ bl avdisp_set_z_mode
/* 00007CEC 8017002C */ lwz r0, 0x2c(r23)
/* 00007CF0 C078000C */ lfs f3, 0xc(r24)
/* 00007CF4 1C000284 */ mulli r0, r0, 0x284
/* 00007CF8 C0380004 */ lfs f1, 4(r24)
/* 00007CFC C09E0000 */ lfs f4, 0(r30)
/* 00007D00 7C760214 */ add r3, r22, r0
/* 00007D04 C0430008 */ lfs f2, 8(r3)
/* 00007D08 C0030000 */ lfs f0, 0(r3)
/* 00007D0C EC431028 */ fsubs f2, f3, f2
/* 00007D10 EC210028 */ fsubs f1, f1, f0
/* 00007D14 EC210072 */ fmuls f1, f1, f1
/* 00007D18 EC24093A */ fmadds f1, f4, f4, f1
/* 00007D1C EC2208BA */ fmadds f1, f2, f2, f1
/* 00007D20 4BFF84B1 */ bl mathutil_sqrt
/* 00007D24 8017002C */ lwz r0, 0x2c(r23)
/* 00007D28 FFE00890 */ fmr f31, f1
/* 00007D2C 1C000284 */ mulli r0, r0, 0x284
/* 00007D30 7C760214 */ add r3, r22, r0
/* 00007D34 38630144 */ addi r3, r3, 0x144
/* 00007D38 4BFF8499 */ bl mathutil_mtxA_from_mtx
/* 00007D3C C85E01D8 */ lfd f2, 0x1d8(r30)
/* 00007D40 C0180008 */ lfs f0, 8(r24)
/* 00007D44 C0380004 */ lfs f1, 4(r24)
/* 00007D48 FC42002A */ fadd f2, f2, f0
/* 00007D4C C078000C */ lfs f3, 0xc(r24)
/* 00007D50 FC401018 */ frsp f2, f2
/* 00007D54 4BFF847D */ bl mathutil_mtxA_translate_xyz
/* 00007D58 801B0000 */ lwz r0, 0(r27)
/* 00007D5C 5403402E */ slwi r3, r0, 8
/* 00007D60 4BFF8471 */ bl mathutil_mtxA_rotate_y
/* 00007D64 C01E0194 */ lfs f0, 0x194(r30)
/* 00007D68 C83E01E8 */ lfd f1, 0x1e8(r30)
/* 00007D6C EC0007F2 */ fmuls f0, f0, f31
/* 00007D70 C85E01E0 */ lfd f2, 0x1e0(r30)
/* 00007D74 FC010032 */ fmul f0, f1, f0
/* 00007D78 FC220032 */ fmul f1, f2, f0
/* 00007D7C FC200818 */ frsp f1, f1
/* 00007D80 4BFF8451 */ bl mathutil_mtxA_scale_s
/* 00007D84 807C0000 */ lwz r3, 0(r28)
/* 00007D88 38800000 */ li r4, 0
/* 00007D8C 4BFF8445 */ bl GXLoadPosMtxImm
/* 00007D90 807C0000 */ lwz r3, 0(r28)
/* 00007D94 38800000 */ li r4, 0
/* 00007D98 4BFF8439 */ bl GXLoadNrmMtxImm
/* 00007D9C 2C150000 */ cmpwi r21, 0
/* 00007DA0 40820018 */ bne lbl_00007DB8
/* 00007DA4 80730000 */ lwz r3, 0(r19)
/* 00007DA8 80630008 */ lwz r3, 8(r3)
/* 00007DAC 806302A0 */ lwz r3, 0x2a0(r3)
/* 00007DB0 4BFF8421 */ bl avdisp_draw_model_unculled_sort_none
/* 00007DB4 48000054 */ b lbl_00007E08
lbl_00007DB8:
/* 00007DB8 2C150001 */ cmpwi r21, 1
/* 00007DBC 40820018 */ bne lbl_00007DD4
/* 00007DC0 80730000 */ lwz r3, 0(r19)
/* 00007DC4 80630008 */ lwz r3, 8(r3)
/* 00007DC8 806302A8 */ lwz r3, 0x2a8(r3)
/* 00007DCC 4BFF8405 */ bl avdisp_draw_model_unculled_sort_none
/* 00007DD0 48000038 */ b lbl_00007E08
lbl_00007DD4:
/* 00007DD4 2C150002 */ cmpwi r21, 2
/* 00007DD8 40820018 */ bne lbl_00007DF0
/* 00007DDC 80730000 */ lwz r3, 0(r19)
/* 00007DE0 80630008 */ lwz r3, 8(r3)
/* 00007DE4 806302B0 */ lwz r3, 0x2b0(r3)
/* 00007DE8 4BFF83E9 */ bl avdisp_draw_model_unculled_sort_none
/* 00007DEC 4800001C */ b lbl_00007E08
lbl_00007DF0:
/* 00007DF0 2C150003 */ cmpwi r21, 3
/* 00007DF4 40820014 */ bne lbl_00007E08
/* 00007DF8 80730000 */ lwz r3, 0(r19)
/* 00007DFC 80630008 */ lwz r3, 8(r3)
/* 00007E00 806302B8 */ lwz r3, 0x2b8(r3)
/* 00007E04 4BFF83CD */ bl avdisp_draw_model_unculled_sort_none
lbl_00007E08:
/* 00007E08 8017002C */ lwz r0, 0x2c(r23)
/* 00007E0C 1C000284 */ mulli r0, r0, 0x284
/* 00007E10 7C760214 */ add r3, r22, r0
/* 00007E14 38630144 */ addi r3, r3, 0x144
/* 00007E18 4BFF83B9 */ bl mathutil_mtxA_from_mtx
/* 00007E1C 7C7AA214 */ add r3, r26, r20
/* 00007E20 C85E01D8 */ lfd f2, 0x1d8(r30)
/* 00007E24 C0030008 */ lfs f0, 8(r3)
/* 00007E28 C0230004 */ lfs f1, 4(r3)
/* 00007E2C FC42002A */ fadd f2, f2, f0
/* 00007E30 C063000C */ lfs f3, 0xc(r3)
/* 00007E34 FC401018 */ frsp f2, f2
/* 00007E38 4BFF8399 */ bl mathutil_mtxA_translate_xyz
/* 00007E3C 801B0000 */ lwz r0, 0(r27)
/* 00007E40 5403402E */ slwi r3, r0, 8
/* 00007E44 4BFF838D */ bl mathutil_mtxA_rotate_y
/* 00007E48 387D8000 */ addi r3, r29, -32768
/* 00007E4C 4BFF8385 */ bl mathutil_mtxA_rotate_y
/* 00007E50 C01E0194 */ lfs f0, 0x194(r30)
/* 00007E54 C83E01E8 */ lfd f1, 0x1e8(r30)
/* 00007E58 EC0007F2 */ fmuls f0, f0, f31
/* 00007E5C C85E01E0 */ lfd f2, 0x1e0(r30)
/* 00007E60 FC010032 */ fmul f0, f1, f0
/* 00007E64 FC220032 */ fmul f1, f2, f0
/* 00007E68 FC200818 */ frsp f1, f1
/* 00007E6C 4BFF8365 */ bl mathutil_mtxA_scale_s
/* 00007E70 807C0000 */ lwz r3, 0(r28)
/* 00007E74 38800000 */ li r4, 0
/* 00007E78 4BFF8359 */ bl GXLoadPosMtxImm
/* 00007E7C 807C0000 */ lwz r3, 0(r28)
/* 00007E80 38800000 */ li r4, 0
/* 00007E84 4BFF834D */ bl GXLoadNrmMtxImm
/* 00007E88 2C150000 */ cmpwi r21, 0
/* 00007E8C 40820018 */ bne lbl_00007EA4
/* 00007E90 80730000 */ lwz r3, 0(r19)
/* 00007E94 80630008 */ lwz r3, 8(r3)
/* 00007E98 806302A0 */ lwz r3, 0x2a0(r3)
/* 00007E9C 4BFF8335 */ bl avdisp_draw_model_unculled_sort_none
/* 00007EA0 48000054 */ b lbl_00007EF4
lbl_00007EA4:
/* 00007EA4 2C150001 */ cmpwi r21, 1
/* 00007EA8 40820018 */ bne lbl_00007EC0
/* 00007EAC 80730000 */ lwz r3, 0(r19)
/* 00007EB0 80630008 */ lwz r3, 8(r3)
/* 00007EB4 806302A8 */ lwz r3, 0x2a8(r3)
/* 00007EB8 4BFF8319 */ bl avdisp_draw_model_unculled_sort_none
/* 00007EBC 48000038 */ b lbl_00007EF4
lbl_00007EC0:
/* 00007EC0 2C150002 */ cmpwi r21, 2
/* 00007EC4 40820018 */ bne lbl_00007EDC
/* 00007EC8 80730000 */ lwz r3, 0(r19)
/* 00007ECC 80630008 */ lwz r3, 8(r3)
/* 00007ED0 806302B0 */ lwz r3, 0x2b0(r3)
/* 00007ED4 4BFF82FD */ bl avdisp_draw_model_unculled_sort_none
/* 00007ED8 4800001C */ b lbl_00007EF4
lbl_00007EDC:
/* 00007EDC 2C150003 */ cmpwi r21, 3
/* 00007EE0 40820014 */ bne lbl_00007EF4
/* 00007EE4 80730000 */ lwz r3, 0(r19)
/* 00007EE8 80630008 */ lwz r3, 8(r3)
/* 00007EEC 806302B8 */ lwz r3, 0x2b8(r3)
/* 00007EF0 4BFF82E1 */ bl avdisp_draw_model_unculled_sort_none
lbl_00007EF4:
/* 00007EF4 3AB50001 */ addi r21, r21, 1
/* 00007EF8 3A9401A4 */ addi r20, r20, 0x1a4
lbl_00007EFC:
/* 00007EFC 80170024 */ lwz r0, 0x24(r23)
/* 00007F00 7C150000 */ cmpw r21, r0
/* 00007F04 4180FD68 */ blt lbl_00007C6C
/* 00007F08 38600001 */ li r3, 1
/* 00007F0C 38800003 */ li r4, 3
/* 00007F10 38A00001 */ li r5, 1
/* 00007F14 4BFF82BD */ bl avdisp_set_z_mode
lbl_00007F18:
/* 00007F18 BA61027C */ lmw r19, 0x27c(r1)
/* 00007F1C 800102C4 */ lwz r0, 0x2c4(r1)
/* 00007F20 CBE102B8 */ lfd f31, 0x2b8(r1)
/* 00007F24 CBC102B0 */ lfd f30, 0x2b0(r1)
/* 00007F28 7C0803A6 */ mtlr r0
/* 00007F2C 382102C0 */ addi r1, r1, 0x2c0
/* 00007F30 4E800020 */ blr 
