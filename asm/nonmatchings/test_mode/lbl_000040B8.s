/* 000040B8 7C0802A6 */ mflr r0
/* 000040BC 3C600000 */ lis r3, debugFlags@ha
/* 000040C0 90010004 */ stw r0, 4(r1)
/* 000040C4 3C800000 */ lis r4, lbl_0000FE78@ha
/* 000040C8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000040CC 93E10014 */ stw r31, 0x14(r1)
/* 000040D0 3BE40000 */ addi r31, r4, lbl_0000FE78@l
/* 000040D4 93C10010 */ stw r30, 0x10(r1)
/* 000040D8 93A1000C */ stw r29, 0xc(r1)
/* 000040DC 80030000 */ lwz r0, debugFlags@l(r3)
/* 000040E0 3C600000 */ lis r3, lbl_10000000@ha
/* 000040E4 3BA30000 */ addi r29, r3, lbl_10000000@l
/* 000040E8 7000000A */ andi. r0, r0, 0xa
/* 000040EC 408200BC */ bne lbl_000041A8
/* 000040F0 3860000F */ li r3, 0xf
/* 000040F4 4BFFC069 */ bl event_start
/* 000040F8 38600003 */ li r3, 3
/* 000040FC 4BFFC061 */ bl camera_set_state_all
/* 00004100 3C600000 */ lis r3, currentCamera@ha
/* 00004104 C01F0060 */ lfs f0, 0x60(r31)
/* 00004108 38830000 */ addi r4, r3, currentCamera@l
/* 0000410C 80640000 */ lwz r3, 0(r4)
/* 00004110 3BC00000 */ li r30, 0
/* 00004114 D0030000 */ stfs f0, 0(r3)
/* 00004118 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000411C 80640000 */ lwz r3, 0(r4)
/* 00004120 D0030004 */ stfs f0, 4(r3)
/* 00004124 C01F0128 */ lfs f0, 0x128(r31)
/* 00004128 80640000 */ lwz r3, 0(r4)
/* 0000412C D0030008 */ stfs f0, 8(r3)
/* 00004130 C01F0060 */ lfs f0, 0x60(r31)
/* 00004134 80640000 */ lwz r3, 0(r4)
/* 00004138 D003000C */ stfs f0, 0xc(r3)
/* 0000413C C01F0078 */ lfs f0, 0x78(r31)
/* 00004140 80640000 */ lwz r3, 0(r4)
/* 00004144 D0030010 */ stfs f0, 0x10(r3)
/* 00004148 C01F0060 */ lfs f0, 0x60(r31)
/* 0000414C 80640000 */ lwz r3, 0(r4)
/* 00004150 D0030014 */ stfs f0, 0x14(r3)
/* 00004154 93DD0158 */ stw r30, 0x158(r29)
/* 00004158 93DD0154 */ stw r30, 0x154(r29)
/* 0000415C 93DD0150 */ stw r30, 0x150(r29)
/* 00004160 93DD013C */ stw r30, 0x13c(r29)
/* 00004164 4BFFFC31 */ bl lbl_00003D94
/* 00004168 C01F00B8 */ lfs f0, 0xb8(r31)
/* 0000416C 3C600000 */ lis r3, modeCtrl@ha
/* 00004170 3CA00000 */ lis r5, lbl_000040B4@ha
/* 00004174 D01D0140 */ stfs f0, 0x140(r29)
/* 00004178 38630000 */ addi r3, r3, modeCtrl@l
/* 0000417C 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00004180 93C30010 */ stw r30, 0x10(r3)
/* 00004184 38050000 */ addi r0, r5, lbl_000040B4@l
/* 00004188 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000418C 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00004190 38000078 */ li r0, 0x78
/* 00004194 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00004198 C03F012C */ lfs f1, 0x12c(r31)
/* 0000419C FC400890 */ fmr f2, f1
/* 000041A0 FC600890 */ fmr f3, f1
/* 000041A4 4BFFBFB9 */ bl avdisp_set_ambient
lbl_000041A8:
/* 000041A8 8001001C */ lwz r0, 0x1c(r1)
/* 000041AC 83E10014 */ lwz r31, 0x14(r1)
/* 000041B0 83C10010 */ lwz r30, 0x10(r1)
/* 000041B4 7C0803A6 */ mtlr r0
/* 000041B8 83A1000C */ lwz r29, 0xc(r1)
/* 000041BC 38210018 */ addi r1, r1, 0x18
/* 000041C0 4E800020 */ blr 
