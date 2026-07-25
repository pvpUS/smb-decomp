/* 0000DDF4 7C0802A6 */ mflr r0
/* 0000DDF8 3C800000 */ lis r4, lbl_00011CB0@ha
/* 0000DDFC 90010004 */ stw r0, 4(r1)
/* 0000DE00 38A40000 */ addi r5, r4, lbl_00011CB0@l
/* 0000DE04 3880FFFF */ li r4, -1
/* 0000DE08 9421FF98 */ stwu r1, -0x68(r1)
/* 0000DE0C 38000000 */ li r0, 0
/* 0000DE10 C0050008 */ lfs f0, 8(r5)
/* 0000DE14 D0010024 */ stfs f0, 0x24(r1)
/* 0000DE18 C0050008 */ lfs f0, 8(r5)
/* 0000DE1C D0010028 */ stfs f0, 0x28(r1)
/* 0000DE20 C005000C */ lfs f0, 0xc(r5)
/* 0000DE24 D001002C */ stfs f0, 0x2c(r1)
/* 0000DE28 C005000C */ lfs f0, 0xc(r5)
/* 0000DE2C D0010030 */ stfs f0, 0x30(r1)
/* 0000DE30 C003006C */ lfs f0, 0x6c(r3)
/* 0000DE34 D0010038 */ stfs f0, 0x38(r1)
/* 0000DE38 9081003C */ stw r4, 0x3c(r1)
/* 0000DE3C 80830074 */ lwz r4, 0x74(r3)
/* 0000DE40 54840036 */ rlwinm r4, r4, 0, 0, 0x1b
/* 0000DE44 6084000A */ ori r4, r4, 0xa
/* 0000DE48 90810040 */ stw r4, 0x40(r1)
/* 0000DE4C C0250010 */ lfs f1, 0x10(r5)
/* 0000DE50 C003006C */ lfs f0, 0x6c(r3)
/* 0000DE54 EC010032 */ fmuls f0, f1, f0
/* 0000DE58 FC00001E */ fctiwz f0, f0
/* 0000DE5C D8010060 */ stfd f0, 0x60(r1)
/* 0000DE60 80810064 */ lwz r4, 0x64(r1)
/* 0000DE64 5484C00E */ slwi r4, r4, 0x18
/* 0000DE68 648400FF */ oris r4, r4, 0xff
/* 0000DE6C 6084FFFF */ ori r4, r4, 0xffff
/* 0000DE70 90810044 */ stw r4, 0x44(r1)
/* 0000DE74 90010048 */ stw r0, 0x48(r1)
/* 0000DE78 A003003C */ lhz r0, 0x3c(r3)
/* 0000DE7C 9001000C */ stw r0, 0xc(r1)
/* 0000DE80 C0030004 */ lfs f0, 4(r3)
/* 0000DE84 D0010010 */ stfs f0, 0x10(r1)
/* 0000DE88 C0030008 */ lfs f0, 8(r3)
/* 0000DE8C D0010014 */ stfs f0, 0x14(r1)
/* 0000DE90 C003004C */ lfs f0, 0x4c(r3)
/* 0000DE94 D0010018 */ stfs f0, 0x18(r1)
/* 0000DE98 C0030040 */ lfs f0, 0x40(r3)
/* 0000DE9C D001001C */ stfs f0, 0x1c(r1)
/* 0000DEA0 C0030044 */ lfs f0, 0x44(r3)
/* 0000DEA4 D0010020 */ stfs f0, 0x20(r1)
/* 0000DEA8 A8030068 */ lha r0, 0x68(r3)
/* 0000DEAC 3861000C */ addi r3, r1, 0xc
/* 0000DEB0 90010034 */ stw r0, 0x34(r1)
/* 0000DEB4 4BFF22D5 */ bl nlSprPut
/* 0000DEB8 8001006C */ lwz r0, 0x6c(r1)
/* 0000DEBC 38210068 */ addi r1, r1, 0x68
/* 0000DEC0 7C0803A6 */ mtlr r0
/* 0000DEC4 4E800020 */ blr 
