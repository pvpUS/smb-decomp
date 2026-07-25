/* 0000DF6C 7C0802A6 */ mflr r0
/* 0000DF70 3CE00000 */ lis r7, lbl_00013C48@ha
/* 0000DF74 90010004 */ stw r0, 4(r1)
/* 0000DF78 3CA00000 */ lis r5, ballInfo@ha
/* 0000DF7C 3C800000 */ lis r4, lbl_10000028@ha
/* 0000DF80 9421FF98 */ stwu r1, -0x68(r1)
/* 0000DF84 39270000 */ addi r9, r7, lbl_00013C48@l
/* 0000DF88 38A50000 */ addi r5, r5, ballInfo@l
/* 0000DF8C A0C40000 */ lhz r6, lbl_10000028@l(r4)
/* 0000DF90 3C800000 */ lis r4, lbl_00015768@ha
/* 0000DF94 80030048 */ lwz r0, 0x48(r3)
/* 0000DF98 38840000 */ addi r4, r4, lbl_00015768@l
/* 0000DF9C 1CC60048 */ mulli r6, r6, 0x48
/* 0000DFA0 1CE001A4 */ mulli r7, r0, 0x1a4
/* 0000DFA4 800901AC */ lwz r0, 0x1ac(r9)
/* 0000DFA8 7C843214 */ add r4, r4, r6
/* 0000DFAC 80C901A8 */ lwz r6, 0x1a8(r9)
/* 0000DFB0 7CE53A14 */ add r7, r5, r7
/* 0000DFB4 8084002C */ lwz r4, 0x2c(r4)
/* 0000DFB8 81070144 */ lwz r8, 0x144(r7)
/* 0000DFBC 3CA00000 */ lis r5, globalAnimTimer@ha
/* 0000DFC0 90C1000C */ stw r6, 0xc(r1)
/* 0000DFC4 90010010 */ stw r0, 0x10(r1)
/* 0000DFC8 A00901B0 */ lhz r0, 0x1b0(r9)
/* 0000DFCC B0010014 */ sth r0, 0x14(r1)
/* 0000DFD0 80050000 */ lwz r0, globalAnimTimer@l(r5)
/* 0000DFD4 54000739 */ rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 0000DFD8 40820134 */ bne lbl_0000E10C
/* 0000DFDC 80080014 */ lwz r0, 0x14(r8)
/* 0000DFE0 540007FF */ clrlwi. r0, r0, 0x1f
/* 0000DFE4 40820128 */ bne lbl_0000E10C
/* 0000DFE8 38A7001C */ addi r5, r7, 0x1c
/* 0000DFEC C0450000 */ lfs f2, 0(r5)
/* 0000DFF0 C0250004 */ lfs f1, 4(r5)
/* 0000DFF4 C0050008 */ lfs f0, 8(r5)
/* 0000DFF8 EC4200B2 */ fmuls f2, f2, f2
/* 0000DFFC EC41107A */ fmadds f2, f1, f1, f2
/* 0000E000 EC40103A */ fmadds f2, f0, f0, f2
/* 0000E004 C00901B4 */ lfs f0, 0x1b4(r9)
/* 0000E008 FC020040 */ fcmpo cr0, f2, f0
/* 0000E00C 41800100 */ blt lbl_0000E10C
/* 0000E010 480000F0 */ b lbl_0000E100
lbl_0000E014:
/* 0000E014 C0040000 */ lfs f0, 0(r4)
/* 0000E018 C02801D4 */ lfs f1, 0x1d4(r8)
/* 0000E01C FC000840 */ fcmpo cr0, f0, f1
/* 0000E020 408000DC */ bge lbl_0000E0FC
/* 0000E024 C0040004 */ lfs f0, 4(r4)
/* 0000E028 FC010040 */ fcmpo cr0, f1, f0
/* 0000E02C 408000D0 */ bge lbl_0000E0FC
/* 0000E030 C0030040 */ lfs f0, 0x40(r3)
/* 0000E034 3CA00100 */ lis r5, 0x100
/* 0000E038 39000000 */ li r8, 0
/* 0000E03C D0010028 */ stfs f0, 0x28(r1)
/* 0000E040 38E0FFFF */ li r7, -1
/* 0000E044 38C00005 */ li r6, 5
/* 0000E048 C0030044 */ lfs f0, 0x44(r3)
/* 0000E04C 3805FFFF */ addi r0, r5, -1
/* 0000E050 D001002C */ stfs f0, 0x2c(r1)
/* 0000E054 C0090018 */ lfs f0, 0x18(r9)
/* 0000E058 D0010034 */ stfs f0, 0x34(r1)
/* 0000E05C D0010030 */ stfs f0, 0x30(r1)
/* 0000E060 C0090008 */ lfs f0, 8(r9)
/* 0000E064 D001003C */ stfs f0, 0x3c(r1)
/* 0000E068 D0010038 */ stfs f0, 0x38(r1)
/* 0000E06C 91010040 */ stw r8, 0x40(r1)
/* 0000E070 90E10048 */ stw r7, 0x48(r1)
/* 0000E074 90C1004C */ stw r6, 0x4c(r1)
/* 0000E078 C003006C */ lfs f0, 0x6c(r3)
/* 0000E07C D0010044 */ stfs f0, 0x44(r1)
/* 0000E080 90010050 */ stw r0, 0x50(r1)
/* 0000E084 91010054 */ stw r8, 0x54(r1)
/* 0000E088 80030074 */ lwz r0, 0x74(r3)
/* 0000E08C 6000000A */ ori r0, r0, 0xa
/* 0000E090 9001004C */ stw r0, 0x4c(r1)
/* 0000E094 80040008 */ lwz r0, 8(r4)
/* 0000E098 540003DF */ rlwinm. r0, r0, 0, 0xf, 0xf
/* 0000E09C 4182001C */ beq lbl_0000E0B8
/* 0000E0A0 80A1004C */ lwz r5, 0x4c(r1)
/* 0000E0A4 38002000 */ li r0, 0x2000
/* 0000E0A8 64A50008 */ oris r5, r5, 8
/* 0000E0AC 90A1004C */ stw r5, 0x4c(r1)
/* 0000E0B0 90010040 */ stw r0, 0x40(r1)
/* 0000E0B4 48000010 */ b lbl_0000E0C4
lbl_0000E0B8:
/* 0000E0B8 3CA00001 */ lis r5, 1
/* 0000E0BC 3805E000 */ addi r0, r5, -8192
/* 0000E0C0 90010040 */ stw r0, 0x40(r1)
lbl_0000E0C4:
/* 0000E0C4 80040008 */ lwz r0, 8(r4)
/* 0000E0C8 3881000A */ addi r4, r1, 0xa
/* 0000E0CC 54000BFC */ rlwinm r0, r0, 1, 0xf, 0x1e
/* 0000E0D0 7C0402AE */ lhax r0, r4, r0
/* 0000E0D4 90010018 */ stw r0, 0x18(r1)
/* 0000E0D8 C0030004 */ lfs f0, 4(r3)
/* 0000E0DC D001001C */ stfs f0, 0x1c(r1)
/* 0000E0E0 C0030008 */ lfs f0, 8(r3)
/* 0000E0E4 D0010020 */ stfs f0, 0x20(r1)
/* 0000E0E8 C003004C */ lfs f0, 0x4c(r3)
/* 0000E0EC 38610018 */ addi r3, r1, 0x18
/* 0000E0F0 D0010024 */ stfs f0, 0x24(r1)
/* 0000E0F4 4BFF2089 */ bl nlSprPut
/* 0000E0F8 48000014 */ b lbl_0000E10C
lbl_0000E0FC:
/* 0000E0FC 3884000C */ addi r4, r4, 0xc
lbl_0000E100:
/* 0000E100 80040008 */ lwz r0, 8(r4)
/* 0000E104 28000000 */ cmplwi r0, 0
/* 0000E108 4082FF0C */ bne lbl_0000E014
lbl_0000E10C:
/* 0000E10C 8001006C */ lwz r0, 0x6c(r1)
/* 0000E110 38210068 */ addi r1, r1, 0x68
/* 0000E114 7C0803A6 */ mtlr r0
/* 0000E118 4E800020 */ blr 
