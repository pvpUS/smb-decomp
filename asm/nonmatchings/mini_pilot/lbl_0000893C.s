/* 0000893C 7C0802A6 */ mflr r0
/* 00008940 3C800000 */ lis r4, lbl_0000C360@ha
/* 00008944 90010004 */ stw r0, 4(r1)
/* 00008948 9421FFD0 */ stwu r1, -0x30(r1)
/* 0000894C DBE10028 */ stfd f31, 0x28(r1)
/* 00008950 DBC10020 */ stfd f30, 0x20(r1)
/* 00008954 93E1001C */ stw r31, 0x1c(r1)
/* 00008958 3BE40000 */ addi r31, r4, lbl_0000C360@l
/* 0000895C C3E30004 */ lfs f31, 4(r3)
/* 00008960 C83F00A0 */ lfd f1, 0xa0(r31)
/* 00008964 C3C30008 */ lfs f30, 8(r3)
/* 00008968 C81F00A8 */ lfd f0, 0xa8(r31)
/* 0000896C FFFF082A */ fadd f31, f31, f1
/* 00008970 FFDE002A */ fadd f30, f30, f0
/* 00008974 FFE0F818 */ frsp f31, f31
/* 00008978 FFC0F018 */ frsp f30, f30
/* 0000897C 4BFF77D1 */ bl reset_text_draw_settings
/* 00008980 38600058 */ li r3, 0x58
/* 00008984 4BFF77C9 */ bl set_text_font
/* 00008988 FC20F890 */ fmr f1, f31
/* 0000898C FC40F090 */ fmr f2, f30
/* 00008990 4BFF77BD */ bl set_text_pos
/* 00008994 3C600000 */ lis r3, lbl_10000068@ha
/* 00008998 38630000 */ addi r3, r3, lbl_10000068@l
/* 0000899C C0230000 */ lfs f1, 0(r3)
/* 000089A0 C0430004 */ lfs f2, 4(r3)
/* 000089A4 C0030008 */ lfs f0, 8(r3)
/* 000089A8 EC210072 */ fmuls f1, f1, f1
/* 000089AC EC2208BA */ fmadds f1, f2, f2, f1
/* 000089B0 EC20083A */ fmadds f1, f0, f0, f1
/* 000089B4 4BFF7799 */ bl mathutil_sqrt
/* 000089B8 C81F00B0 */ lfd f0, 0xb0(r31)
/* 000089BC 3C600000 */ lis r3, lbl_0000D324@ha
/* 000089C0 4CC63182 */ crclr 6
/* 000089C4 38630000 */ addi r3, r3, lbl_0000D324@l
/* 000089C8 FC000072 */ fmul f0, f0, f1
/* 000089CC FC00001E */ fctiwz f0, f0
/* 000089D0 D8010010 */ stfd f0, 0x10(r1)
/* 000089D4 80810014 */ lwz r4, 0x14(r1)
/* 000089D8 4BFF7775 */ bl sprite_printf
/* 000089DC 80010034 */ lwz r0, 0x34(r1)
/* 000089E0 CBE10028 */ lfd f31, 0x28(r1)
/* 000089E4 CBC10020 */ lfd f30, 0x20(r1)
/* 000089E8 7C0803A6 */ mtlr r0
/* 000089EC 83E1001C */ lwz r31, 0x1c(r1)
/* 000089F0 38210030 */ addi r1, r1, 0x30
/* 000089F4 4E800020 */ blr 
