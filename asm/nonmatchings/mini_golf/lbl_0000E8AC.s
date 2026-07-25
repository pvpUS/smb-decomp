/* 0000E8AC 7C0802A6 */ mflr r0
/* 0000E8B0 3C800000 */ lis r4, lbl_00026378@ha
/* 0000E8B4 90010004 */ stw r0, 4(r1)
/* 0000E8B8 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000E8BC 93E10014 */ stw r31, 0x14(r1)
/* 0000E8C0 3BE40000 */ addi r31, r4, lbl_00026378@l
/* 0000E8C4 93C10010 */ stw r30, 0x10(r1)
/* 0000E8C8 3BC30000 */ addi r30, r3, 0
/* 0000E8CC 4BFF1905 */ bl camera_clear
/* 0000E8D0 3800000A */ li r0, 0xa
/* 0000E8D4 981E001F */ stb r0, 0x1f(r30)
/* 0000E8D8 3C600000 */ lis r3, stageBoundSphere@ha
/* 0000E8DC 38830000 */ addi r4, r3, stageBoundSphere@l
/* 0000E8E0 C03F00E4 */ lfs f1, 0xe4(r31)
/* 0000E8E4 3860C000 */ li r3, -16384
/* 0000E8E8 C0040000 */ lfs f0, 0(r4)
/* 0000E8EC 38000000 */ li r0, 0
/* 0000E8F0 EC010032 */ fmuls f0, f1, f0
/* 0000E8F4 D01E000C */ stfs f0, 0xc(r30)
/* 0000E8F8 C03F00E4 */ lfs f1, 0xe4(r31)
/* 0000E8FC C0040004 */ lfs f0, 4(r4)
/* 0000E900 EC010032 */ fmuls f0, f1, f0
/* 0000E904 D01E0010 */ stfs f0, 0x10(r30)
/* 0000E908 C03F00E4 */ lfs f1, 0xe4(r31)
/* 0000E90C C0040008 */ lfs f0, 8(r4)
/* 0000E910 EC010032 */ fmuls f0, f1, f0
/* 0000E914 D01E0014 */ stfs f0, 0x14(r30)
/* 0000E918 C03F00E4 */ lfs f1, 0xe4(r31)
/* 0000E91C C0040000 */ lfs f0, 0(r4)
/* 0000E920 EC010032 */ fmuls f0, f1, f0
/* 0000E924 D01E0000 */ stfs f0, 0(r30)
/* 0000E928 C03F00E4 */ lfs f1, 0xe4(r31)
/* 0000E92C C0040008 */ lfs f0, 8(r4)
/* 0000E930 EC010032 */ fmuls f0, f1, f0
/* 0000E934 D01E0008 */ stfs f0, 8(r30)
/* 0000E938 C01F00E8 */ lfs f0, 0xe8(r31)
/* 0000E93C D01E0004 */ stfs f0, 4(r30)
/* 0000E940 B07E0018 */ sth r3, 0x18(r30)
/* 0000E944 B01E001A */ sth r0, 0x1a(r30)
/* 0000E948 B01E001C */ sth r0, 0x1c(r30)
/* 0000E94C C024000C */ lfs f1, 0xc(r4)
/* 0000E950 C01F00B0 */ lfs f0, 0xb0(r31)
/* 0000E954 C85F0058 */ lfd f2, 0x58(r31)
/* 0000E958 EC210032 */ fmuls f1, f1, f0
/* 0000E95C C81F00F0 */ lfd f0, 0xf0(r31)
/* 0000E960 FC22082A */ fadd f1, f2, f1
/* 0000E964 FC210024 */ fdiv f1, f1, f0
/* 0000E968 FC200818 */ frsp f1, f1
/* 0000E96C 4BFF1865 */ bl mathutil_atan
/* 0000E970 7C600734 */ extsh r0, r3
/* 0000E974 5400083C */ slwi r0, r0, 1
/* 0000E978 7C000734 */ extsh r0, r0
/* 0000E97C B01E0030 */ sth r0, 0x30(r30)
/* 0000E980 8001001C */ lwz r0, 0x1c(r1)
/* 0000E984 83E10014 */ lwz r31, 0x14(r1)
/* 0000E988 83C10010 */ lwz r30, 0x10(r1)
/* 0000E98C 38210018 */ addi r1, r1, 0x18
/* 0000E990 7C0803A6 */ mtlr r0
/* 0000E994 4E800020 */ blr 
