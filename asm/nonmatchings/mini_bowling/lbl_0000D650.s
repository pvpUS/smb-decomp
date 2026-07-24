/* 0000D650 9421FFB0 */ stwu r1, -0x50(r1)
/* 0000D654 C0270000 */ lfs f1, 0(r7)
/* 0000D658 C0050000 */ lfs f0, 0(r5)
/* 0000D65C EC010028 */ fsubs f0, f1, f0
/* 0000D660 D0010038 */ stfs f0, 0x38(r1)
/* 0000D664 C0270004 */ lfs f1, 4(r7)
/* 0000D668 C0050004 */ lfs f0, 4(r5)
/* 0000D66C EC010028 */ fsubs f0, f1, f0
/* 0000D670 D001003C */ stfs f0, 0x3c(r1)
/* 0000D674 C0270008 */ lfs f1, 8(r7)
/* 0000D678 C0050008 */ lfs f0, 8(r5)
/* 0000D67C EC010028 */ fsubs f0, f1, f0
/* 0000D680 D0010040 */ stfs f0, 0x40(r1)
/* 0000D684 C0280000 */ lfs f1, 0(r8)
/* 0000D688 C0060000 */ lfs f0, 0(r6)
/* 0000D68C C1210038 */ lfs f9, 0x38(r1)
/* 0000D690 EC010028 */ fsubs f0, f1, f0
/* 0000D694 C101003C */ lfs f8, 0x3c(r1)
/* 0000D698 C0E10040 */ lfs f7, 0x40(r1)
/* 0000D69C D001002C */ stfs f0, 0x2c(r1)
/* 0000D6A0 C0280004 */ lfs f1, 4(r8)
/* 0000D6A4 C0060004 */ lfs f0, 4(r6)
/* 0000D6A8 EC010028 */ fsubs f0, f1, f0
/* 0000D6AC D0010030 */ stfs f0, 0x30(r1)
/* 0000D6B0 C0280008 */ lfs f1, 8(r8)
/* 0000D6B4 C0060008 */ lfs f0, 8(r6)
/* 0000D6B8 EC010028 */ fsubs f0, f1, f0
/* 0000D6BC D0010034 */ stfs f0, 0x34(r1)
/* 0000D6C0 C001002C */ lfs f0, 0x2c(r1)
/* 0000D6C4 C0210030 */ lfs f1, 0x30(r1)
/* 0000D6C8 EC404828 */ fsubs f2, f0, f9
/* 0000D6CC C0010034 */ lfs f0, 0x34(r1)
/* 0000D6D0 EC214028 */ fsubs f1, f1, f8
/* 0000D6D4 EC003828 */ fsubs f0, f0, f7
/* 0000D6D8 D0410044 */ stfs f2, 0x44(r1)
/* 0000D6DC D0210048 */ stfs f1, 0x48(r1)
/* 0000D6E0 D001004C */ stfs f0, 0x4c(r1)
/* 0000D6E4 C0410044 */ lfs f2, 0x44(r1)
/* 0000D6E8 C0210048 */ lfs f1, 0x48(r1)
/* 0000D6EC C001004C */ lfs f0, 0x4c(r1)
/* 0000D6F0 ED4200B2 */ fmuls f10, f2, f2
/* 0000D6F4 ED41507A */ fmadds f10, f1, f1, f10
/* 0000D6F8 ED40503A */ fmadds f10, f0, f0, f10
/* 0000D6FC 3CA00000 */ lis r5, lbl_00014C00@ha
/* 0000D700 C8C50000 */ lfd f6, lbl_00014C00@l(r5)
/* 0000D704 FC0A3040 */ fcmpo cr0, f10, f6
/* 0000D708 408100C8 */ ble lbl_0000D7D0
/* 0000D70C C0A10044 */ lfs f5, 0x44(r1)
/* 0000D710 C0810048 */ lfs f4, 0x48(r1)
/* 0000D714 EC450272 */ fmuls f2, f5, f9
/* 0000D718 C061004C */ lfs f3, 0x4c(r1)
/* 0000D71C EC240232 */ fmuls f1, f4, f8
/* 0000D720 EC0301F2 */ fmuls f0, f3, f7
/* 0000D724 FC401050 */ fneg f2, f2
/* 0000D728 EC220828 */ fsubs f1, f2, f1
/* 0000D72C EC010028 */ fsubs f0, f1, f0
/* 0000D730 FC060040 */ fcmpo cr0, f6, f0
/* 0000D734 4C401382 */ cror 2, 0, 2
/* 0000D738 40820074 */ bne lbl_0000D7AC
/* 0000D73C FC005040 */ fcmpo cr0, f0, f10
/* 0000D740 4C401382 */ cror 2, 0, 2
/* 0000D744 40820068 */ bne lbl_0000D7AC
/* 0000D748 EC005024 */ fdivs f0, f0, f10
/* 0000D74C EC450032 */ fmuls f2, f5, f0
/* 0000D750 EC240032 */ fmuls f1, f4, f0
/* 0000D754 EC030032 */ fmuls f0, f3, f0
/* 0000D758 EC49102A */ fadds f2, f9, f2
/* 0000D75C EC28082A */ fadds f1, f8, f1
/* 0000D760 EC07002A */ fadds f0, f7, f0
/* 0000D764 D0410020 */ stfs f2, 0x20(r1)
/* 0000D768 D0210024 */ stfs f1, 0x24(r1)
/* 0000D76C D0010028 */ stfs f0, 0x28(r1)
/* 0000D770 C0410020 */ lfs f2, 0x20(r1)
/* 0000D774 C0210024 */ lfs f1, 0x24(r1)
/* 0000D778 C0010028 */ lfs f0, 0x28(r1)
/* 0000D77C EC4200B2 */ fmuls f2, f2, f2
/* 0000D780 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D784 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D788 D0430000 */ stfs f2, 0(r3)
/* 0000D78C C041002C */ lfs f2, 0x2c(r1)
/* 0000D790 C0210030 */ lfs f1, 0x30(r1)
/* 0000D794 C0010034 */ lfs f0, 0x34(r1)
/* 0000D798 EC4200B2 */ fmuls f2, f2, f2
/* 0000D79C EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7A0 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7A4 D0440000 */ stfs f2, 0(r4)
/* 0000D7A8 48000048 */ b lbl_0000D7F0
lbl_0000D7AC:
/* 0000D7AC C041002C */ lfs f2, 0x2c(r1)
/* 0000D7B0 C0210030 */ lfs f1, 0x30(r1)
/* 0000D7B4 C0010034 */ lfs f0, 0x34(r1)
/* 0000D7B8 EC4200B2 */ fmuls f2, f2, f2
/* 0000D7BC EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7C0 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7C4 D0430000 */ stfs f2, 0(r3)
/* 0000D7C8 D0440000 */ stfs f2, 0(r4)
/* 0000D7CC 48000024 */ b lbl_0000D7F0
lbl_0000D7D0:
/* 0000D7D0 C041002C */ lfs f2, 0x2c(r1)
/* 0000D7D4 C0210030 */ lfs f1, 0x30(r1)
/* 0000D7D8 C0010034 */ lfs f0, 0x34(r1)
/* 0000D7DC EC4200B2 */ fmuls f2, f2, f2
/* 0000D7E0 EC41107A */ fmadds f2, f1, f1, f2
/* 0000D7E4 EC40103A */ fmadds f2, f0, f0, f2
/* 0000D7E8 D0430000 */ stfs f2, 0(r3)
/* 0000D7EC D0440000 */ stfs f2, 0(r4)
lbl_0000D7F0:
/* 0000D7F0 38210050 */ addi r1, r1, 0x50
/* 0000D7F4 4E800020 */ blr 
