/* 00003DE0 7C0802A6 */ mflr r0
/* 00003DE4 3CA00000 */ lis r5, lbl_0001BF80@ha
/* 00003DE8 90010004 */ stw r0, 4(r1)
/* 00003DEC 9421FF80 */ stwu r1, -0x80(r1)
/* 00003DF0 DBE10078 */ stfd f31, 0x78(r1)
/* 00003DF4 BF410060 */ stmw r26, 0x60(r1)
/* 00003DF8 7C7C1B78 */ mr r28, r3
/* 00003DFC 3BC50000 */ addi r30, r5, lbl_0001BF80@l
/* 00003E00 A8030000 */ lha r0, 0(r3)
/* 00003E04 3C600000 */ lis r3, lbl_10017664@ha
/* 00003E08 1C8001B4 */ mulli r4, r0, 0x1b4
/* 00003E0C 38030000 */ addi r0, r3, lbl_10017664@l
/* 00003E10 7C602214 */ add r3, r0, r4
/* 00003E14 80030084 */ lwz r0, 0x84(r3)
/* 00003E18 3BA30068 */ addi r29, r3, 0x68
/* 00003E1C 3C600000 */ lis r3, cameraInfo@ha
/* 00003E20 541A0738 */ rlwinm r26, r0, 0, 0x1c, 0x1c
/* 00003E24 3BE30000 */ addi r31, r3, cameraInfo@l
/* 00003E28 4BFFC33D */ bl mathutil_mtxA_from_mtxB
/* 00003E2C 38610024 */ addi r3, r1, 0x24
/* 00003E30 4BFFC335 */ bl mathutil_mtxA_rigid_inv_tf_tl
/* 00003E34 3C600000 */ lis r3, userWork@ha
/* 00003E38 38630000 */ addi r3, r3, userWork@l
/* 00003E3C 80630000 */ lwz r3, 0(r3)
/* 00003E40 38630090 */ addi r3, r3, 0x90
/* 00003E44 4BFFC321 */ bl mathutil_mtxA_from_mtx
/* 00003E48 38610018 */ addi r3, r1, 0x18
/* 00003E4C 4BFFC319 */ bl mathutil_mtxA_rigid_inv_tf_tl
/* 00003E50 C0210024 */ lfs f1, 0x24(r1)
/* 00003E54 387C0028 */ addi r3, r28, 0x28
/* 00003E58 C0010018 */ lfs f0, 0x18(r1)
/* 00003E5C 38810054 */ addi r4, r1, 0x54
/* 00003E60 C0610028 */ lfs f3, 0x28(r1)
/* 00003E64 EC810028 */ fsubs f4, f1, f0
/* 00003E68 C041001C */ lfs f2, 0x1c(r1)
/* 00003E6C C021002C */ lfs f1, 0x2c(r1)
/* 00003E70 38A10018 */ addi r5, r1, 0x18
/* 00003E74 C0010020 */ lfs f0, 0x20(r1)
/* 00003E78 EC431028 */ fsubs f2, f3, f2
/* 00003E7C D081000C */ stfs f4, 0xc(r1)
/* 00003E80 EC010028 */ fsubs f0, f1, f0
/* 00003E84 81010024 */ lwz r8, 0x24(r1)
/* 00003E88 80E10028 */ lwz r7, 0x28(r1)
/* 00003E8C D0410010 */ stfs f2, 0x10(r1)
/* 00003E90 38C10048 */ addi r6, r1, 0x48
/* 00003E94 8001002C */ lwz r0, 0x2c(r1)
/* 00003E98 D0010014 */ stfs f0, 0x14(r1)
/* 00003E9C 815C001C */ lwz r10, 0x1c(r28)
/* 00003EA0 813C0020 */ lwz r9, 0x20(r28)
/* 00003EA4 91410054 */ stw r10, 0x54(r1)
/* 00003EA8 91210058 */ stw r9, 0x58(r1)
/* 00003EAC 813C0024 */ lwz r9, 0x24(r28)
/* 00003EB0 91010048 */ stw r8, 0x48(r1)
/* 00003EB4 90E1004C */ stw r7, 0x4c(r1)
/* 00003EB8 9121005C */ stw r9, 0x5c(r1)
/* 00003EBC 90010050 */ stw r0, 0x50(r1)
/* 00003EC0 C03C0034 */ lfs f1, 0x34(r28)
/* 00003EC4 C05E0060 */ lfs f2, 0x60(r30)
/* 00003EC8 4BFFC29D */ bl func_8006AAEC
/* 00003ECC 28030000 */ cmplwi r3, 0
/* 00003ED0 4182042C */ beq lbl_000042FC
/* 00003ED4 2C1A0000 */ cmpwi r26, 0
/* 00003ED8 41820010 */ beq lbl_00003EE8
/* 00003EDC A81D000C */ lha r0, 0xc(r29)
/* 00003EE0 2C000000 */ cmpwi r0, 0
/* 00003EE4 418201A4 */ beq lbl_00004088
lbl_00003EE8:
/* 00003EE8 C05C001C */ lfs f2, 0x1c(r28)
/* 00003EEC 3BA1003C */ addi r29, r1, 0x3c
/* 00003EF0 C0010024 */ lfs f0, 0x24(r1)
/* 00003EF4 C0210028 */ lfs f1, 0x28(r1)
/* 00003EF8 EC420028 */ fsubs f2, f2, f0
/* 00003EFC C001002C */ lfs f0, 0x2c(r1)
/* 00003F00 D041003C */ stfs f2, 0x3c(r1)
/* 00003F04 C05C0020 */ lfs f2, 0x20(r28)
/* 00003F08 EC220828 */ fsubs f1, f2, f1
/* 00003F0C D0210040 */ stfs f1, 0x40(r1)
/* 00003F10 C03C0024 */ lfs f1, 0x24(r28)
/* 00003F14 EC010028 */ fsubs f0, f1, f0
/* 00003F18 D0010044 */ stfs f0, 0x44(r1)
/* 00003F1C C03E0060 */ lfs f1, 0x60(r30)
/* 00003F20 C01C0034 */ lfs f0, 0x34(r28)
/* 00003F24 EFE1002A */ fadds f31, f1, f0
/* 00003F28 C021003C */ lfs f1, 0x3c(r1)
/* 00003F2C C0410040 */ lfs f2, 0x40(r1)
/* 00003F30 C0010044 */ lfs f0, 0x44(r1)
/* 00003F34 EC210072 */ fmuls f1, f1, f1
/* 00003F38 EC2208BA */ fmadds f1, f2, f2, f1
/* 00003F3C EC20083A */ fmadds f1, f0, f0, f1
/* 00003F40 4BFFC225 */ bl mathutil_sqrt
/* 00003F44 FC01F840 */ fcmpo cr0, f1, f31
/* 00003F48 408003B4 */ bge lbl_000042FC
/* 00003F4C 8001003C */ lwz r0, 0x3c(r1)
/* 00003F50 38610030 */ addi r3, r1, 0x30
/* 00003F54 80A10040 */ lwz r5, 0x40(r1)
/* 00003F58 FC20F890 */ fmr f1, f31
/* 00003F5C 90010030 */ stw r0, 0x30(r1)
/* 00003F60 80010044 */ lwz r0, 0x44(r1)
/* 00003F64 7C641B78 */ mr r4, r3
/* 00003F68 90A10034 */ stw r5, 0x34(r1)
/* 00003F6C 90010038 */ stw r0, 0x38(r1)
/* 00003F70 4BFFC1F5 */ bl mathutil_vec_set_len
/* 00003F74 C0410030 */ lfs f2, 0x30(r1)
/* 00003F78 7FA3EB78 */ mr r3, r29
/* 00003F7C C0010024 */ lfs f0, 0x24(r1)
/* 00003F80 C0210028 */ lfs f1, 0x28(r1)
/* 00003F84 EC42002A */ fadds f2, f2, f0
/* 00003F88 C001002C */ lfs f0, 0x2c(r1)
/* 00003F8C D0410030 */ stfs f2, 0x30(r1)
/* 00003F90 C0410034 */ lfs f2, 0x34(r1)
/* 00003F94 EC22082A */ fadds f1, f2, f1
/* 00003F98 D0210034 */ stfs f1, 0x34(r1)
/* 00003F9C C0210038 */ lfs f1, 0x38(r1)
/* 00003FA0 EC01002A */ fadds f0, f1, f0
/* 00003FA4 D0010038 */ stfs f0, 0x38(r1)
/* 00003FA8 C0210030 */ lfs f1, 0x30(r1)
/* 00003FAC C01C001C */ lfs f0, 0x1c(r28)
/* 00003FB0 C05C0058 */ lfs f2, 0x58(r28)
/* 00003FB4 EC010028 */ fsubs f0, f1, f0
/* 00003FB8 EC02002A */ fadds f0, f2, f0
/* 00003FBC D01C0058 */ stfs f0, 0x58(r28)
/* 00003FC0 C0210034 */ lfs f1, 0x34(r1)
/* 00003FC4 C01C0020 */ lfs f0, 0x20(r28)
/* 00003FC8 C05C005C */ lfs f2, 0x5c(r28)
/* 00003FCC EC010028 */ fsubs f0, f1, f0
/* 00003FD0 EC02002A */ fadds f0, f2, f0
/* 00003FD4 D01C005C */ stfs f0, 0x5c(r28)
/* 00003FD8 C0210038 */ lfs f1, 0x38(r1)
/* 00003FDC C01C0024 */ lfs f0, 0x24(r28)
/* 00003FE0 C05C0060 */ lfs f2, 0x60(r28)
/* 00003FE4 EC010028 */ fsubs f0, f1, f0
/* 00003FE8 EC02002A */ fadds f0, f2, f0
/* 00003FEC D01C0060 */ stfs f0, 0x60(r28)
/* 00003FF0 C0010030 */ lfs f0, 0x30(r1)
/* 00003FF4 D01C001C */ stfs f0, 0x1c(r28)
/* 00003FF8 C0010034 */ lfs f0, 0x34(r1)
/* 00003FFC D01C0020 */ stfs f0, 0x20(r28)
/* 00004000 C0010038 */ lfs f0, 0x38(r1)
/* 00004004 D01C0024 */ stfs f0, 0x24(r28)
/* 00004008 4BFFC15D */ bl mathutil_vec_normalize_len
/* 0000400C 387C0064 */ addi r3, r28, 0x64
/* 00004010 C0A1003C */ lfs f5, 0x3c(r1)
/* 00004014 C0430000 */ lfs f2, 0(r3)
/* 00004018 C0810040 */ lfs f4, 0x40(r1)
/* 0000401C C0230004 */ lfs f1, 4(r3)
/* 00004020 C0610044 */ lfs f3, 0x44(r1)
/* 00004024 C0030008 */ lfs f0, 8(r3)
/* 00004028 EC4500B2 */ fmuls f2, f5, f2
/* 0000402C EC44107A */ fmadds f2, f4, f1, f2
/* 00004030 EC43103A */ fmadds f2, f3, f0, f2
/* 00004034 C01E0008 */ lfs f0, 8(r30)
/* 00004038 FC020040 */ fcmpo cr0, f2, f0
/* 0000403C 408002C0 */ bge lbl_000042FC
/* 00004040 C03E0098 */ lfs f1, 0x98(r30)
/* 00004044 C001003C */ lfs f0, 0x3c(r1)
/* 00004048 EC620072 */ fmuls f3, f2, f1
/* 0000404C C03C0064 */ lfs f1, 0x64(r28)
/* 00004050 EC0000F2 */ fmuls f0, f0, f3
/* 00004054 EC01002A */ fadds f0, f1, f0
/* 00004058 D01C0064 */ stfs f0, 0x64(r28)
/* 0000405C C0010040 */ lfs f0, 0x40(r1)
/* 00004060 C03C0068 */ lfs f1, 0x68(r28)
/* 00004064 EC0000F2 */ fmuls f0, f0, f3
/* 00004068 EC01002A */ fadds f0, f1, f0
/* 0000406C D01C0068 */ stfs f0, 0x68(r28)
/* 00004070 C0010044 */ lfs f0, 0x44(r1)
/* 00004074 C03C006C */ lfs f1, 0x6c(r28)
/* 00004078 EC0000F2 */ fmuls f0, f0, f3
/* 0000407C EC01002A */ fadds f0, f1, f0
/* 00004080 D01C006C */ stfs f0, 0x6c(r28)
/* 00004084 48000278 */ b lbl_000042FC
lbl_00004088:
/* 00004088 C0210054 */ lfs f1, 0x54(r1)
/* 0000408C 3861003C */ addi r3, r1, 0x3c
/* 00004090 C01C001C */ lfs f0, 0x1c(r28)
/* 00004094 C05C0058 */ lfs f2, 0x58(r28)
/* 00004098 EC010028 */ fsubs f0, f1, f0
/* 0000409C EC02002A */ fadds f0, f2, f0
/* 000040A0 D01C0058 */ stfs f0, 0x58(r28)
/* 000040A4 C0210058 */ lfs f1, 0x58(r1)
/* 000040A8 C01C0020 */ lfs f0, 0x20(r28)
/* 000040AC C05C005C */ lfs f2, 0x5c(r28)
/* 000040B0 EC010028 */ fsubs f0, f1, f0
/* 000040B4 EC02002A */ fadds f0, f2, f0
/* 000040B8 D01C005C */ stfs f0, 0x5c(r28)
/* 000040BC C021005C */ lfs f1, 0x5c(r1)
/* 000040C0 C01C0024 */ lfs f0, 0x24(r28)
/* 000040C4 C05C0060 */ lfs f2, 0x60(r28)
/* 000040C8 EC010028 */ fsubs f0, f1, f0
/* 000040CC EC02002A */ fadds f0, f2, f0
/* 000040D0 D01C0060 */ stfs f0, 0x60(r28)
/* 000040D4 80810054 */ lwz r4, 0x54(r1)
/* 000040D8 80010058 */ lwz r0, 0x58(r1)
/* 000040DC 909C001C */ stw r4, 0x1c(r28)
/* 000040E0 901C0020 */ stw r0, 0x20(r28)
/* 000040E4 8001005C */ lwz r0, 0x5c(r1)
/* 000040E8 901C0024 */ stw r0, 0x24(r28)
/* 000040EC 80010048 */ lwz r0, 0x48(r1)
/* 000040F0 8081004C */ lwz r4, 0x4c(r1)
/* 000040F4 90010024 */ stw r0, 0x24(r1)
/* 000040F8 80010050 */ lwz r0, 0x50(r1)
/* 000040FC 90810028 */ stw r4, 0x28(r1)
/* 00004100 C0210054 */ lfs f1, 0x54(r1)
/* 00004104 9001002C */ stw r0, 0x2c(r1)
/* 00004108 C0610058 */ lfs f3, 0x58(r1)
/* 0000410C C0010024 */ lfs f0, 0x24(r1)
/* 00004110 C0410028 */ lfs f2, 0x28(r1)
/* 00004114 EC810028 */ fsubs f4, f1, f0
/* 00004118 C021005C */ lfs f1, 0x5c(r1)
/* 0000411C C001002C */ lfs f0, 0x2c(r1)
/* 00004120 EC431028 */ fsubs f2, f3, f2
/* 00004124 D081003C */ stfs f4, 0x3c(r1)
/* 00004128 EC010028 */ fsubs f0, f1, f0
/* 0000412C D0410040 */ stfs f2, 0x40(r1)
/* 00004130 D0010044 */ stfs f0, 0x44(r1)
/* 00004134 4BFFC031 */ bl mathutil_vec_normalize_len
/* 00004138 C021000C */ lfs f1, 0xc(r1)
/* 0000413C 3B410030 */ addi r26, r1, 0x30
/* 00004140 C01C0064 */ lfs f0, 0x64(r28)
/* 00004144 3B61003C */ addi r27, r1, 0x3c
/* 00004148 C0410010 */ lfs f2, 0x10(r1)
/* 0000414C EC010028 */ fsubs f0, f1, f0
/* 00004150 C0210014 */ lfs f1, 0x14(r1)
/* 00004154 D0010030 */ stfs f0, 0x30(r1)
/* 00004158 C01C0064 */ lfs f0, 0x64(r28)
/* 0000415C EC020028 */ fsubs f0, f2, f0
/* 00004160 D0010034 */ stfs f0, 0x34(r1)
/* 00004164 C01C0064 */ lfs f0, 0x64(r28)
/* 00004168 EC010028 */ fsubs f0, f1, f0
/* 0000416C D0010038 */ stfs f0, 0x38(r1)
/* 00004170 C0A1003C */ lfs f5, 0x3c(r1)
/* 00004174 C0410030 */ lfs f2, 0x30(r1)
/* 00004178 C0810040 */ lfs f4, 0x40(r1)
/* 0000417C C0210034 */ lfs f1, 0x34(r1)
/* 00004180 C0610044 */ lfs f3, 0x44(r1)
/* 00004184 C0010038 */ lfs f0, 0x38(r1)
/* 00004188 ECA500B2 */ fmuls f5, f5, f2
/* 0000418C ECA4287A */ fmadds f5, f4, f1, f5
/* 00004190 ECA3283A */ fmadds f5, f3, f0, f5
/* 00004194 C01E00E4 */ lfs f0, 0xe4(r30)
/* 00004198 C041003C */ lfs f2, 0x3c(r1)
/* 0000419C C0210040 */ lfs f1, 0x40(r1)
/* 000041A0 EC600172 */ fmuls f3, f0, f5
/* 000041A4 C0010044 */ lfs f0, 0x44(r1)
/* 000041A8 EC4300B2 */ fmuls f2, f3, f2
/* 000041AC EC230072 */ fmuls f1, f3, f1
/* 000041B0 EC030032 */ fmuls f0, f3, f0
/* 000041B4 D0410030 */ stfs f2, 0x30(r1)
/* 000041B8 D0210034 */ stfs f1, 0x34(r1)
/* 000041BC D0010038 */ stfs f0, 0x38(r1)
/* 000041C0 4BFFBFA5 */ bl mathutil_mtxA_from_mtxB
/* 000041C4 387A0000 */ addi r3, r26, 0
/* 000041C8 389A0000 */ addi r4, r26, 0
/* 000041CC 4BFFBF99 */ bl mathutil_mtxA_tf_vec
/* 000041D0 38BA0000 */ addi r5, r26, 0
/* 000041D4 38600000 */ li r3, 0
/* 000041D8 3880003C */ li r4, 0x3c
/* 000041DC 4BFFBF89 */ bl shake_camera
/* 000041E0 C03E008C */ lfs f1, 0x8c(r30)
/* 000041E4 7F63DB78 */ mr r3, r27
/* 000041E8 C0010030 */ lfs f0, 0x30(r1)
/* 000041EC 389C0064 */ addi r4, r28, 0x64
/* 000041F0 C05F00A0 */ lfs f2, 0xa0(r31)
/* 000041F4 EC010032 */ fmuls f0, f1, f0
/* 000041F8 38A1000C */ addi r5, r1, 0xc
/* 000041FC EC02002A */ fadds f0, f2, f0
/* 00004200 D01F00A0 */ stfs f0, 0xa0(r31)
/* 00004204 C03E008C */ lfs f1, 0x8c(r30)
/* 00004208 C0010034 */ lfs f0, 0x34(r1)
/* 0000420C C05F00A4 */ lfs f2, 0xa4(r31)
/* 00004210 EC010032 */ fmuls f0, f1, f0
/* 00004214 EC02002A */ fadds f0, f2, f0
/* 00004218 D01F00A4 */ stfs f0, 0xa4(r31)
/* 0000421C C03E008C */ lfs f1, 0x8c(r30)
/* 00004220 C0010038 */ lfs f0, 0x38(r1)
/* 00004224 C05F00A8 */ lfs f2, 0xa8(r31)
/* 00004228 EC010032 */ fmuls f0, f1, f0
/* 0000422C EC02002A */ fadds f0, f2, f0
/* 00004230 D01F00A8 */ stfs f0, 0xa8(r31)
/* 00004234 C03E000C */ lfs f1, 0xc(r30)
/* 00004238 C05E008C */ lfs f2, 0x8c(r30)
/* 0000423C 4BFFBF29 */ bl func_8006AD3C
/* 00004240 80810024 */ lwz r4, 0x24(r1)
/* 00004244 38000008 */ li r0, 8
/* 00004248 80610028 */ lwz r3, 0x28(r1)
/* 0000424C 909F0000 */ stw r4, 0(r31)
/* 00004250 907F0004 */ stw r3, 4(r31)
/* 00004254 8061002C */ lwz r3, 0x2c(r1)
/* 00004258 907F0008 */ stw r3, 8(r31)
/* 0000425C 8081000C */ lwz r4, 0xc(r1)
/* 00004260 80610010 */ lwz r3, 0x10(r1)
/* 00004264 909F0094 */ stw r4, 0x94(r31)
/* 00004268 907F0098 */ stw r3, 0x98(r31)
/* 0000426C 80610014 */ lwz r3, 0x14(r1)
/* 00004270 907F009C */ stw r3, 0x9c(r31)
/* 00004274 B01D000C */ sth r0, 0xc(r29)
/* 00004278 A81D0012 */ lha r0, 0x12(r29)
/* 0000427C 2C000000 */ cmpwi r0, 0
/* 00004280 4081000C */ ble lbl_0000428C
/* 00004284 386000FF */ li r3, 0xff
/* 00004288 48000030 */ b lbl_000042B8
lbl_0000428C:
/* 0000428C 801D0000 */ lwz r0, 0(r29)
/* 00004290 3C800000 */ lis r4, playerCharacterSelection@ha
/* 00004294 3C600000 */ lis r3, lbl_0001C9D8@ha
/* 00004298 5405103A */ slwi r5, r0, 2
/* 0000429C 38040000 */ addi r0, r4, playerCharacterSelection@l
/* 000042A0 7C802A14 */ add r4, r0, r5
/* 000042A4 80840000 */ lwz r4, 0(r4)
/* 000042A8 38030000 */ addi r0, r3, lbl_0001C9D8@l
/* 000042AC 5483083C */ slwi r3, r4, 1
/* 000042B0 7C601A14 */ add r3, r0, r3
/* 000042B4 A8630000 */ lha r3, 0(r3)
lbl_000042B8:
/* 000042B8 A81D0014 */ lha r0, 0x14(r29)
/* 000042BC 2C000000 */ cmpwi r0, 0
/* 000042C0 40810008 */ ble lbl_000042C8
/* 000042C4 6063D800 */ ori r3, r3, 0xd800
lbl_000042C8:
/* 000042C8 801D0000 */ lwz r0, 0(r29)
/* 000042CC 3CA00000 */ lis r5, playerCharacterSelection@ha
/* 000042D0 3C800000 */ lis r4, lbl_802F1DFC@ha
/* 000042D4 5406103A */ slwi r6, r0, 2
/* 000042D8 38050000 */ addi r0, r5, playerCharacterSelection@l
/* 000042DC 7CA03214 */ add r5, r0, r6
/* 000042E0 80050000 */ lwz r0, 0(r5)
/* 000042E4 38A40000 */ addi r5, r4, lbl_802F1DFC@l
/* 000042E8 3C800000 */ lis r4, u_somePlayerId@ha
/* 000042EC 90050000 */ stw r0, 0(r5)
/* 000042F0 801D0000 */ lwz r0, 0(r29)
/* 000042F4 90040000 */ stw r0, u_somePlayerId@l(r4)
/* 000042F8 4BFFBE6D */ bl u_play_sound_0
lbl_000042FC:
/* 000042FC BB410060 */ lmw r26, 0x60(r1)
/* 00004300 80010084 */ lwz r0, 0x84(r1)
/* 00004304 CBE10078 */ lfd f31, 0x78(r1)
/* 00004308 38210080 */ addi r1, r1, 0x80
/* 0000430C 7C0803A6 */ mtlr r0
/* 00004310 4E800020 */ blr 
