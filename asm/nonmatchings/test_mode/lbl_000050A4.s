/* 000050A4 7C0802A6 */ mflr r0
/* 000050A8 3C600000 */ lis r3, stageHeap@ha
/* 000050AC 90010004 */ stw r0, 4(r1)
/* 000050B0 38630000 */ addi r3, r3, stageHeap@l
/* 000050B4 3CA00000 */ lis r5, lbl_0000FE78@ha
/* 000050B8 9421FFE8 */ stwu r1, -0x18(r1)
/* 000050BC 3C800000 */ lis r4, lbl_10000000@ha
/* 000050C0 93E10014 */ stw r31, 0x14(r1)
/* 000050C4 3BE40000 */ addi r31, r4, lbl_10000000@l
/* 000050C8 93C10010 */ stw r30, 0x10(r1)
/* 000050CC 3BC50000 */ addi r30, r5, lbl_0000FE78@l
/* 000050D0 93A1000C */ stw r29, 0xc(r1)
/* 000050D4 80630000 */ lwz r3, 0(r3)
/* 000050D8 4BFFB085 */ bl OSSetCurrentHeap
/* 000050DC 3C800000 */ lis r4, lbl_0001323C@ha
/* 000050E0 38040000 */ addi r0, r4, lbl_0001323C@l
/* 000050E4 3BA30000 */ addi r29, r3, 0
/* 000050E8 7C030378 */ mr r3, r0
/* 000050EC 4BFFB071 */ bl load_tpl
/* 000050F0 907F015C */ stw r3, 0x15c(r31)
/* 000050F4 3C600000 */ lis r3, lbl_0001324C@ha
/* 000050F8 38630000 */ addi r3, r3, lbl_0001324C@l
/* 000050FC 809F015C */ lwz r4, 0x15c(r31)
/* 00005100 4BFFB05D */ bl load_model
/* 00005104 907F0160 */ stw r3, 0x160(r31)
/* 00005108 807F0160 */ lwz r3, 0x160(r31)
/* 0000510C 4BFFB051 */ bl avdisp_get_eff_vtxinfo
/* 00005110 907F0168 */ stw r3, 0x168(r31)
/* 00005114 807F0160 */ lwz r3, 0x160(r31)
/* 00005118 4BFFB045 */ bl avdisp_get_eff_vertices
/* 0000511C 907F0164 */ stw r3, 0x164(r31)
/* 00005120 3C600000 */ lis r3, __OSCurrHeap@ha
/* 00005124 38630000 */ addi r3, r3, __OSCurrHeap@l
/* 00005128 809F0168 */ lwz r4, 0x168(r31)
/* 0000512C 80630000 */ lwz r3, 0(r3)
/* 00005130 80040000 */ lwz r0, 0(r4)
/* 00005134 1C80000C */ mulli r4, r0, 0xc
/* 00005138 3804001F */ addi r0, r4, 0x1f
/* 0000513C 54040034 */ rlwinm r4, r0, 0, 0, 0x1a
/* 00005140 4BFFB01D */ bl OSAllocFromHeap
/* 00005144 907F016C */ stw r3, 0x16c(r31)
/* 00005148 3860000F */ li r3, 0xf
/* 0000514C 4BFFB011 */ bl event_start
/* 00005150 38600002 */ li r3, 2
/* 00005154 4BFFB009 */ bl camera_set_state_all
/* 00005158 3CA00000 */ lis r5, lbl_0000502C@ha
/* 0000515C 3C800000 */ lis r4, submodeFinishFunc@ha
/* 00005160 38050000 */ addi r0, r5, lbl_0000502C@l
/* 00005164 90040000 */ stw r0, submodeFinishFunc@l(r4)
/* 00005168 3C600000 */ lis r3, gameSubmodeRequest@ha
/* 0000516C 3800007B */ li r0, 0x7b
/* 00005170 B0030000 */ sth r0, gameSubmodeRequest@l(r3)
/* 00005174 C03E012C */ lfs f1, 0x12c(r30)
/* 00005178 FC400890 */ fmr f2, f1
/* 0000517C FC600890 */ fmr f3, f1
/* 00005180 4BFFAFDD */ bl avdisp_set_ambient
/* 00005184 38000000 */ li r0, 0
/* 00005188 901F0170 */ stw r0, 0x170(r31)
/* 0000518C 7FA3EB78 */ mr r3, r29
/* 00005190 901F0174 */ stw r0, 0x174(r31)
/* 00005194 901F0178 */ stw r0, 0x178(r31)
/* 00005198 901F017C */ stw r0, 0x17c(r31)
/* 0000519C 901F0180 */ stw r0, 0x180(r31)
/* 000051A0 901F0184 */ stw r0, 0x184(r31)
/* 000051A4 4BFFAFB9 */ bl OSSetCurrentHeap
/* 000051A8 8001001C */ lwz r0, 0x1c(r1)
/* 000051AC 83E10014 */ lwz r31, 0x14(r1)
/* 000051B0 83C10010 */ lwz r30, 0x10(r1)
/* 000051B4 7C0803A6 */ mtlr r0
/* 000051B8 83A1000C */ lwz r29, 0xc(r1)
/* 000051BC 38210018 */ addi r1, r1, 0x18
/* 000051C0 4E800020 */ blr 
