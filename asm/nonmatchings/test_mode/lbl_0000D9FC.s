/* 0000D9FC 7C0802A6 */ mflr r0
/* 0000DA00 3C600000 */ lis r3, lbl_10003BF8@ha
/* 0000DA04 90010004 */ stw r0, 4(r1)
/* 0000DA08 3C800000 */ lis r4, lbl_000101E0@ha
/* 0000DA0C 9421FFE8 */ stwu r1, -0x18(r1)
/* 0000DA10 93E10014 */ stw r31, 0x14(r1)
/* 0000DA14 3BE30000 */ addi r31, r3, lbl_10003BF8@l
/* 0000DA18 93C10010 */ stw r30, 0x10(r1)
/* 0000DA1C 3BC40000 */ addi r30, r4, lbl_000101E0@l
/* 0000DA20 807F0004 */ lwz r3, 4(r31)
/* 0000DA24 28030000 */ cmplwi r3, 0
/* 0000DA28 41820008 */ beq lbl_0000DA30
/* 0000DA2C 4BFF2731 */ bl ape_destroy
lbl_0000DA30:
/* 0000DA30 807F006C */ lwz r3, 0x6c(r31)
/* 0000DA34 4BFF2729 */ bl u_make_ape
/* 0000DA38 907F0004 */ stw r3, 4(r31)
/* 0000DA3C C01E0000 */ lfs f0, 0(r30)
/* 0000DA40 D01F000C */ stfs f0, 0xc(r31)
/* 0000DA44 4BFF2719 */ bl mathutil_mtxA_from_identity
/* 0000DA48 C01F000C */ lfs f0, 0xc(r31)
/* 0000DA4C FC00001E */ fctiwz f0, f0
/* 0000DA50 D8010008 */ stfd f0, 8(r1)
/* 0000DA54 8061000C */ lwz r3, 0xc(r1)
/* 0000DA58 4BFF2705 */ bl mathutil_mtxA_rotate_y
/* 0000DA5C 807F0004 */ lwz r3, 4(r31)
/* 0000DA60 38630060 */ addi r3, r3, 0x60
/* 0000DA64 4BFF26F9 */ bl mathutil_mtxA_to_quat
/* 0000DA68 801F006C */ lwz r0, 0x6c(r31)
/* 0000DA6C 2C000003 */ cmpwi r0, 3
/* 0000DA70 40820014 */ bne lbl_0000DA84
/* 0000DA74 C01E0004 */ lfs f0, 4(r30)
/* 0000DA78 807F0004 */ lwz r3, 4(r31)
/* 0000DA7C D0030034 */ stfs f0, 0x34(r3)
/* 0000DA80 48000010 */ b lbl_0000DA90
lbl_0000DA84:
/* 0000DA84 C01E0008 */ lfs f0, 8(r30)
/* 0000DA88 807F0004 */ lwz r3, 4(r31)
/* 0000DA8C D0030034 */ stfs f0, 0x34(r3)
lbl_0000DA90:
/* 0000DA90 C01E000C */ lfs f0, 0xc(r30)
/* 0000DA94 38000002 */ li r0, 2
/* 0000DA98 809F0004 */ lwz r4, 4(r31)
/* 0000DA9C 38600000 */ li r3, 0
/* 0000DAA0 7C0903A6 */ mtctr r0
/* 0000DAA4 D0040044 */ stfs f0, 0x44(r4)
/* 0000DAA8 38BF0010 */ addi r5, r31, 0x10
/* 0000DAAC 809F0004 */ lwz r4, 4(r31)
/* 0000DAB0 D0040040 */ stfs f0, 0x40(r4)
/* 0000DAB4 809F0004 */ lwz r4, 4(r31)
/* 0000DAB8 D004003C */ stfs f0, 0x3c(r4)
/* 0000DABC 907F00A8 */ stw r3, 0xa8(r31)
lbl_0000DAC0:
/* 0000DAC0 90650000 */ stw r3, 0(r5)
/* 0000DAC4 90650004 */ stw r3, 4(r5)
/* 0000DAC8 90650008 */ stw r3, 8(r5)
/* 0000DACC 9065000C */ stw r3, 0xc(r5)
/* 0000DAD0 90650010 */ stw r3, 0x10(r5)
/* 0000DAD4 90650014 */ stw r3, 0x14(r5)
/* 0000DAD8 90650018 */ stw r3, 0x18(r5)
/* 0000DADC 9065001C */ stw r3, 0x1c(r5)
/* 0000DAE0 38A50020 */ addi r5, r5, 0x20
/* 0000DAE4 4200FFDC */ bdnz lbl_0000DAC0
/* 0000DAE8 3C600000 */ lis r3, motInfo@ha
/* 0000DAEC 801F006C */ lwz r0, 0x6c(r31)
/* 0000DAF0 38630000 */ addi r3, r3, motInfo@l
/* 0000DAF4 80630000 */ lwz r3, 0(r3)
/* 0000DAF8 54006026 */ slwi r0, r0, 0xc
/* 0000DAFC 7C630214 */ add r3, r3, r0
/* 0000DB00 38032000 */ addi r0, r3, 0x2000
/* 0000DB04 901F00AC */ stw r0, 0xac(r31)
/* 0000DB08 807F00AC */ lwz r3, 0xac(r31)
/* 0000DB0C C0030018 */ lfs f0, 0x18(r3)
/* 0000DB10 D01F0008 */ stfs f0, 8(r31)
/* 0000DB14 8001001C */ lwz r0, 0x1c(r1)
/* 0000DB18 83E10014 */ lwz r31, 0x14(r1)
/* 0000DB1C 83C10010 */ lwz r30, 0x10(r1)
/* 0000DB20 38210018 */ addi r1, r1, 0x18
/* 0000DB24 7C0803A6 */ mtlr r0
/* 0000DB28 4E800020 */ blr 
