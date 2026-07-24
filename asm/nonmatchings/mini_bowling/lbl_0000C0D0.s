/* 0000C0D0 1C04000C */ mulli r0, r4, 0xc
/* 0000C0D4 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000C0D8 C0030124 */ lfs f0, 0x124(r3)
/* 0000C0DC 7CE30214 */ add r7, r3, r0
/* 0000C0E0 C0270004 */ lfs f1, 4(r7)
/* 0000C0E4 3D000000 */ lis r8, lbl_00014800@ha
/* 0000C0E8 39080000 */ addi r8, r8, lbl_00014800@l
/* 0000C0EC EC010028 */ fsubs f0, f1, f0
/* 0000C0F0 D0010018 */ stfs f0, 0x18(r1)
/* 0000C0F4 C0270008 */ lfs f1, 8(r7)
/* 0000C0F8 C0030128 */ lfs f0, 0x128(r3)
/* 0000C0FC EC010028 */ fsubs f0, f1, f0
/* 0000C100 D001001C */ stfs f0, 0x1c(r1)
/* 0000C104 C027000C */ lfs f1, 0xc(r7)
/* 0000C108 C003012C */ lfs f0, 0x12c(r3)
/* 0000C10C EC010028 */ fsubs f0, f1, f0
/* 0000C110 D0010020 */ stfs f0, 0x20(r1)
/* 0000C114 C0E1001C */ lfs f7, 0x1c(r1)
/* 0000C118 C0650008 */ lfs f3, 8(r5)
/* 0000C11C C0C10020 */ lfs f6, 0x20(r1)
/* 0000C120 C0A50000 */ lfs f5, 0(r5)
/* 0000C124 C1010018 */ lfs f8, 0x18(r1)
/* 0000C128 C0850004 */ lfs f4, 4(r5)
/* 0000C12C EC4700F2 */ fmuls f2, f7, f3
/* 0000C130 EC260172 */ fmuls f1, f6, f5
/* 0000C134 EC080132 */ fmuls f0, f8, f4
/* 0000C138 EC46113C */ fnmsubs f2, f6, f4, f2
/* 0000C13C D0410024 */ stfs f2, 0x24(r1)
/* 0000C140 EC2808FC */ fnmsubs f1, f8, f3, f1
/* 0000C144 D0210028 */ stfs f1, 0x28(r1)
/* 0000C148 EC07017C */ fnmsubs f0, f7, f5, f0
/* 0000C14C D001002C */ stfs f0, 0x2c(r1)
/* 0000C150 1C040014 */ mulli r0, r4, 0x14
/* 0000C154 806803A8 */ lwz r3, 0x3a8(r8)
/* 0000C158 C84804D0 */ lfd f2, 0x4d0(r8)
/* 0000C15C 7C630214 */ add r3, r3, r0
/* 0000C160 C86804C8 */ lfd f3, 0x4c8(r8)
/* 0000C164 C0230010 */ lfs f1, 0x10(r3)
/* 0000C168 C0080388 */ lfs f0, 0x388(r8)
/* 0000C16C FC420824 */ fdiv f2, f2, f1
/* 0000C170 C0210024 */ lfs f1, 0x24(r1)
/* 0000C174 FC43102A */ fadd f2, f3, f2
/* 0000C178 FC401018 */ frsp f2, f2
/* 0000C17C EC0000B2 */ fmuls f0, f0, f2
/* 0000C180 EC010032 */ fmuls f0, f1, f0
/* 0000C184 D0010024 */ stfs f0, 0x24(r1)
/* 0000C188 C008038C */ lfs f0, 0x38c(r8)
/* 0000C18C C0210028 */ lfs f1, 0x28(r1)
/* 0000C190 EC0000B2 */ fmuls f0, f0, f2
/* 0000C194 EC010032 */ fmuls f0, f1, f0
/* 0000C198 D0010028 */ stfs f0, 0x28(r1)
/* 0000C19C C0080390 */ lfs f0, 0x390(r8)
/* 0000C1A0 C021002C */ lfs f1, 0x2c(r1)
/* 0000C1A4 EC0000B2 */ fmuls f0, f0, f2
/* 0000C1A8 EC010032 */ fmuls f0, f1, f0
/* 0000C1AC D001002C */ stfs f0, 0x2c(r1)
/* 0000C1B0 80610024 */ lwz r3, 0x24(r1)
/* 0000C1B4 80010028 */ lwz r0, 0x28(r1)
/* 0000C1B8 90660000 */ stw r3, 0(r6)
/* 0000C1BC 90060004 */ stw r0, 4(r6)
/* 0000C1C0 8001002C */ lwz r0, 0x2c(r1)
/* 0000C1C4 90060008 */ stw r0, 8(r6)
/* 0000C1C8 38210030 */ addi r1, r1, 0x30
/* 0000C1CC 4E800020 */ blr 
