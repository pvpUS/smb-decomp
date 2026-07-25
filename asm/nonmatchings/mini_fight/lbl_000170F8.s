/* 000170F8 7C0802A6 */ mflr r0
/* 000170FC 3C800000 */ lis r4, lbl_10018920@ha
/* 00017100 90010004 */ stw r0, 4(r1)
/* 00017104 3C600000 */ lis r3, lbl_0001C628@ha
/* 00017108 9421FFC8 */ stwu r1, -0x38(r1)
/* 0001710C DBE10030 */ stfd f31, 0x30(r1)
/* 00017110 DBC10028 */ stfd f30, 0x28(r1)
/* 00017114 93E10024 */ stw r31, 0x24(r1)
/* 00017118 3BE30000 */ addi r31, r3, lbl_0001C628@l
/* 0001711C 93C10020 */ stw r30, 0x20(r1)
/* 00017120 3BC40000 */ addi r30, r4, lbl_10018920@l
/* 00017124 93A1001C */ stw r29, 0x1c(r1)
/* 00017128 93810018 */ stw r28, 0x18(r1)
/* 0001712C 4BFE9039 */ bl reset_text_draw_settings
/* 00017130 38600009 */ li r3, 9
/* 00017134 4BFE9031 */ bl set_text_font
/* 00017138 3B9E02F8 */ addi r28, r30, 0x2f8
/* 0001713C 3BA00000 */ li r29, 0
lbl_00017140:
/* 00017140 C05C0000 */ lfs f2, 0(r28)
/* 00017144 C01F0078 */ lfs f0, 0x78(r31)
/* 00017148 FC020040 */ fcmpo cr0, f2, f0
/* 0001714C 4081004C */ ble lbl_00017198
/* 00017150 C07C0004 */ lfs f3, 4(r28)
/* 00017154 C03F00F4 */ lfs f1, 0xf4(r31)
/* 00017158 EFE2182A */ fadds f31, f2, f3
/* 0001715C C01F00F8 */ lfs f0, 0xf8(r31)
/* 00017160 EFC21828 */ fsubs f30, f2, f3
/* 00017164 C07F00D4 */ lfs f3, 0xd4(r31)
/* 00017168 C05F00D8 */ lfs f2, 0xd8(r31)
/* 0001716C EC2107F2 */ fmuls f1, f1, f31
/* 00017170 EC0007B2 */ fmuls f0, f0, f30
/* 00017174 EC230828 */ fsubs f1, f3, f1
/* 00017178 EC420028 */ fsubs f2, f2, f0
/* 0001717C 4BFE8FE9 */ bl set_text_pos
/* 00017180 C01F00FC */ lfs f0, 0xfc(r31)
/* 00017184 EC2007F2 */ fmuls f1, f0, f31
/* 00017188 EC4007B2 */ fmuls f2, f0, f30
/* 0001718C 4BFE8FD9 */ bl set_text_scale
/* 00017190 387D0030 */ addi r3, r29, 0x30
/* 00017194 4BFE8FD1 */ bl sprite_putc
lbl_00017198:
/* 00017198 3BBD0001 */ addi r29, r29, 1
/* 0001719C 2C1D0004 */ cmpwi r29, 4
/* 000171A0 3B9C000C */ addi r28, r28, 0xc
/* 000171A4 4180FF9C */ blt lbl_00017140
/* 000171A8 4BFE8FBD */ bl reset_text_draw_settings
/* 000171AC 38600009 */ li r3, 9
/* 000171B0 4BFE8FB5 */ bl set_text_font
/* 000171B4 3BBE032C */ addi r29, r30, 0x32c
/* 000171B8 C01F0078 */ lfs f0, 0x78(r31)
/* 000171BC C03E032C */ lfs f1, 0x32c(r30)
/* 000171C0 FC010040 */ fcmpo cr0, f1, f0
/* 000171C4 40810044 */ ble lbl_00017208
/* 000171C8 C01F00C8 */ lfs f0, 0xc8(r31)
/* 000171CC C07F0100 */ lfs f3, 0x100(r31)
/* 000171D0 C45E0328 */ lfsu f2, 0x328(r30)
/* 000171D4 EC000072 */ fmuls f0, f0, f1
/* 000171D8 C03F00D8 */ lfs f1, 0xd8(r31)
/* 000171DC EC6300B2 */ fmuls f3, f3, f2
/* 000171E0 C09F00D4 */ lfs f4, 0xd4(r31)
/* 000171E4 EC410028 */ fsubs f2, f1, f0
/* 000171E8 EC241828 */ fsubs f1, f4, f3
/* 000171EC 4BFE8F79 */ bl set_text_pos
/* 000171F0 C03E0000 */ lfs f1, 0(r30)
/* 000171F4 C05D0000 */ lfs f2, 0(r29)
/* 000171F8 4BFE8F6D */ bl set_text_scale
/* 000171FC 3C600000 */ lis r3, lbl_0001D9CC@ha
/* 00017200 38630000 */ addi r3, r3, lbl_0001D9CC@l
/* 00017204 4BFE8F61 */ bl sprite_puts
lbl_00017208:
/* 00017208 8001003C */ lwz r0, 0x3c(r1)
/* 0001720C CBE10030 */ lfd f31, 0x30(r1)
/* 00017210 CBC10028 */ lfd f30, 0x28(r1)
/* 00017214 7C0803A6 */ mtlr r0
/* 00017218 83E10024 */ lwz r31, 0x24(r1)
/* 0001721C 83C10020 */ lwz r30, 0x20(r1)
/* 00017220 83A1001C */ lwz r29, 0x1c(r1)
/* 00017224 83810018 */ lwz r28, 0x18(r1)
/* 00017228 38210038 */ addi r1, r1, 0x38
/* 0001722C 4E800020 */ blr 
