/* 00001B78 7C0802A6 */ mflr r0
/* 00001B7C 3C800000 */ lis r4, lbl_10000000@ha
/* 00001B80 90010004 */ stw r0, 4(r1)
/* 00001B84 3C600000 */ lis r3, lbl_000102B0@ha
/* 00001B88 9421FFE8 */ stwu r1, -0x18(r1)
/* 00001B8C 93E10014 */ stw r31, 0x14(r1)
/* 00001B90 3BE30000 */ addi r31, r3, lbl_000102B0@l
/* 00001B94 38600003 */ li r3, 3
/* 00001B98 93C10010 */ stw r30, 0x10(r1)
/* 00001B9C 3BC40000 */ addi r30, r4, lbl_10000000@l
/* 00001BA0 38800003 */ li r4, 3
/* 00001BA4 93A1000C */ stw r29, 0xc(r1)
/* 00001BA8 93810008 */ stw r28, 8(r1)
/* 00001BAC 4BFFE5B1 */ bl window_set_cursor_pos
/* 00001BB0 387F0218 */ addi r3, r31, 0x218
/* 00001BB4 4CC63182 */ crclr 6
/* 00001BB8 4BFFE5A5 */ bl window_printf_2
/* 00001BBC 38600003 */ li r3, 3
/* 00001BC0 38800005 */ li r4, 5
/* 00001BC4 4BFFE599 */ bl window_set_cursor_pos
/* 00001BC8 387F0760 */ addi r3, r31, 0x760
/* 00001BCC 4CC63182 */ crclr 6
/* 00001BD0 4BFFE58D */ bl window_printf_2
/* 00001BD4 3B800000 */ li r28, 0
/* 00001BD8 3C600000 */ lis r3, u_isSoundGroupDataLoaded@ha
/* 00001BDC 5784103A */ slwi r4, r28, 2
/* 00001BE0 38030000 */ addi r0, r3, u_isSoundGroupDataLoaded@l
/* 00001BE4 7FA02214 */ add r29, r0, r4
lbl_00001BE8:
/* 00001BE8 809D0000 */ lwz r4, 0(r29)
/* 00001BEC 387F076C */ addi r3, r31, 0x76c
/* 00001BF0 4CC63182 */ crclr 6
/* 00001BF4 4BFFE569 */ bl window_printf_2
/* 00001BF8 3B9C0001 */ addi r28, r28, 1
/* 00001BFC 2C1C0009 */ cmpwi r28, 9
/* 00001C00 3BBD0004 */ addi r29, r29, 4
/* 00001C04 4180FFE4 */ blt lbl_00001BE8
/* 00001C08 387F0770 */ addi r3, r31, 0x770
/* 00001C0C 4CC63182 */ crclr 6
/* 00001C10 4BFFE54D */ bl window_printf_2
/* 00001C14 3C600000 */ lis r3, g_loadedSoundGroupsCount@ha
/* 00001C18 4CC63182 */ crclr 6
/* 00001C1C 80830000 */ lwz r4, g_loadedSoundGroupsCount@l(r3)
/* 00001C20 387F0774 */ addi r3, r31, 0x774
/* 00001C24 4BFFE539 */ bl window_printf_2
/* 00001C28 3B800000 */ li r28, 0
/* 00001C2C 3C600000 */ lis r3, s_loadedSoundGroupIDs@ha
/* 00001C30 5784103A */ slwi r4, r28, 2
/* 00001C34 38030000 */ addi r0, r3, s_loadedSoundGroupIDs@l
/* 00001C38 7FA02214 */ add r29, r0, r4
lbl_00001C3C:
/* 00001C3C 809D0000 */ lwz r4, 0(r29)
/* 00001C40 387F0780 */ addi r3, r31, 0x780
/* 00001C44 4CC63182 */ crclr 6
/* 00001C48 4BFFE515 */ bl window_printf_2
/* 00001C4C 3B9C0001 */ addi r28, r28, 1
/* 00001C50 2C1C0008 */ cmpwi r28, 8
/* 00001C54 3BBD0004 */ addi r29, r29, 4
/* 00001C58 4180FFE4 */ blt lbl_00001C3C
/* 00001C5C 387F0788 */ addi r3, r31, 0x788
/* 00001C60 4CC63182 */ crclr 6
/* 00001C64 4BFFE4F9 */ bl window_printf_2
/* 00001C68 38600003 */ li r3, 3
/* 00001C6C 38800007 */ li r4, 7
/* 00001C70 4BFFE4ED */ bl window_set_cursor_pos
/* 00001C74 3C600000 */ lis r3, g_soundTotalBytesLoaded@ha
/* 00001C78 4CC63182 */ crclr 6
/* 00001C7C 80830000 */ lwz r4, g_soundTotalBytesLoaded@l(r3)
/* 00001C80 387F078C */ addi r3, r31, 0x78c
/* 00001C84 4BFFE4D9 */ bl window_printf_2
/* 00001C88 3C600000 */ lis r3, g_soundAramTop@ha
/* 00001C8C 4CC63182 */ crclr 6
/* 00001C90 80830000 */ lwz r4, g_soundAramTop@l(r3)
/* 00001C94 387F079C */ addi r3, r31, 0x79c
/* 00001C98 3CA00070 */ lis r5, 0x70
/* 00001C9C 4BFFE4C1 */ bl window_printf_2
/* 00001CA0 38600003 */ li r3, 3
/* 00001CA4 3880000A */ li r4, 0xa
/* 00001CA8 4BFFE4B5 */ bl window_set_cursor_pos
/* 00001CAC 809E0010 */ lwz r4, 0x10(r30)
/* 00001CB0 3C600000 */ lis r3, g_soundGroupDesc@ha
/* 00001CB4 38030000 */ addi r0, r3, g_soundGroupDesc@l
/* 00001CB8 4CC63182 */ crclr 6
/* 00001CBC 1C640014 */ mulli r3, r4, 0x14
/* 00001CC0 7C601A14 */ add r3, r0, r3
/* 00001CC4 80A30000 */ lwz r5, 0(r3)
/* 00001CC8 387F07B4 */ addi r3, r31, 0x7b4
/* 00001CCC 4BFFE491 */ bl window_printf_2
/* 00001CD0 809E0014 */ lwz r4, 0x14(r30)
/* 00001CD4 3C600000 */ lis r3, g_soundDesc@ha
/* 00001CD8 3BA30000 */ addi r29, r3, g_soundDesc@l
/* 00001CDC 4CC63182 */ crclr 6
/* 00001CE0 54802036 */ slwi r0, r4, 4
/* 00001CE4 7C7D0214 */ add r3, r29, r0
/* 00001CE8 80A30004 */ lwz r5, 4(r3)
/* 00001CEC 387F07C4 */ addi r3, r31, 0x7c4
/* 00001CF0 4BFFE46D */ bl window_printf_2
/* 00001CF4 809E0024 */ lwz r4, 0x24(r30)
/* 00001CF8 387F07D4 */ addi r3, r31, 0x7d4
/* 00001CFC 4CC63182 */ crclr 6
/* 00001D00 4BFFE45D */ bl window_printf_2
/* 00001D04 809E002C */ lwz r4, 0x2c(r30)
/* 00001D08 387F07E0 */ addi r3, r31, 0x7e0
/* 00001D0C 4CC63182 */ crclr 6
/* 00001D10 4BFFE44D */ bl window_printf_2
/* 00001D14 809E0034 */ lwz r4, 0x34(r30)
/* 00001D18 387F07EC */ addi r3, r31, 0x7ec
/* 00001D1C 4CC63182 */ crclr 6
/* 00001D20 54802036 */ slwi r0, r4, 4
/* 00001D24 7CBD0214 */ add r5, r29, r0
/* 00001D28 80A53DA4 */ lwz r5, 0x3da4(r5)
/* 00001D2C 4BFFE431 */ bl window_printf_2
/* 00001D30 387F07FC */ addi r3, r31, 0x7fc
/* 00001D34 4CC63182 */ crclr 6
/* 00001D38 4BFFE425 */ bl window_printf_2
/* 00001D3C 387F0804 */ addi r3, r31, 0x804
/* 00001D40 4CC63182 */ crclr 6
/* 00001D44 4BFFE419 */ bl window_printf_2
/* 00001D48 38600005 */ li r3, 5
/* 00001D4C 38800012 */ li r4, 0x12
/* 00001D50 4BFFE40D */ bl window_set_cursor_pos
/* 00001D54 801E000C */ lwz r0, 0xc(r30)
/* 00001D58 2C000004 */ cmpwi r0, 4
/* 00001D5C 41820118 */ beq lbl_00001E74
/* 00001D60 4080001C */ bge lbl_00001D7C
/* 00001D64 2C000002 */ cmpwi r0, 2
/* 00001D68 418200B0 */ beq lbl_00001E18
/* 00001D6C 408000F4 */ bge lbl_00001E60
/* 00001D70 2C000001 */ cmpwi r0, 1
/* 00001D74 40800014 */ bge lbl_00001D88
/* 00001D78 4800018C */ b lbl_00001F04
lbl_00001D7C:
/* 00001D7C 2C000006 */ cmpwi r0, 6
/* 00001D80 41820120 */ beq lbl_00001EA0
/* 00001D84 48000180 */ b lbl_00001F04
lbl_00001D88:
/* 00001D88 889E0018 */ lbz r4, 0x18(r30)
/* 00001D8C 387F0810 */ addi r3, r31, 0x810
/* 00001D90 4CC63182 */ crclr 6
/* 00001D94 7C840774 */ extsb r4, r4
/* 00001D98 4BFFE3C5 */ bl window_printf_2
/* 00001D9C 889E0019 */ lbz r4, 0x19(r30)
/* 00001DA0 387F081C */ addi r3, r31, 0x81c
/* 00001DA4 88BE001A */ lbz r5, 0x1a(r30)
/* 00001DA8 4CC63182 */ crclr 6
/* 00001DAC 7C840774 */ extsb r4, r4
/* 00001DB0 7CA50774 */ extsb r5, r5
/* 00001DB4 4BFFE3A9 */ bl window_printf_2
/* 00001DB8 A09E001C */ lhz r4, 0x1c(r30)
/* 00001DBC 387F082C */ addi r3, r31, 0x82c
/* 00001DC0 4CC63182 */ crclr 6
/* 00001DC4 4BFFE399 */ bl window_printf_2
/* 00001DC8 A09E001E */ lhz r4, 0x1e(r30)
/* 00001DCC 387F0838 */ addi r3, r31, 0x838
/* 00001DD0 4CC63182 */ crclr 6
/* 00001DD4 4BFFE389 */ bl window_printf_2
/* 00001DD8 3C600000 */ lis r3, controllerInfo@ha
/* 00001DDC A0030000 */ lhz r0, controllerInfo@l(r3)
/* 00001DE0 5400056B */ rlwinm. r0, r0, 0, 0x15, 0x15
/* 00001DE4 40820018 */ bne lbl_00001DFC
/* 00001DE8 889E0022 */ lbz r4, 0x22(r30)
/* 00001DEC 387F0844 */ addi r3, r31, 0x844
/* 00001DF0 4CC63182 */ crclr 6
/* 00001DF4 4BFFE369 */ bl window_printf_2
/* 00001DF8 48000014 */ b lbl_00001E0C
lbl_00001DFC:
/* 00001DFC 889E0023 */ lbz r4, 0x23(r30)
/* 00001E00 387F0850 */ addi r3, r31, 0x850
/* 00001E04 4CC63182 */ crclr 6
/* 00001E08 4BFFE355 */ bl window_printf_2
lbl_00001E0C:
/* 00001E0C 387F085C */ addi r3, r31, 0x85c
/* 00001E10 4BFFE34D */ bl u_debug_print
/* 00001E14 480000F0 */ b lbl_00001F04
lbl_00001E18:
/* 00001E18 889E0028 */ lbz r4, 0x28(r30)
/* 00001E1C 387F0880 */ addi r3, r31, 0x880
/* 00001E20 4CC63182 */ crclr 6
/* 00001E24 7C840774 */ extsb r4, r4
/* 00001E28 4BFFE335 */ bl window_printf_2
/* 00001E2C 889E0018 */ lbz r4, 0x18(r30)
/* 00001E30 387F0810 */ addi r3, r31, 0x810
/* 00001E34 4CC63182 */ crclr 6
/* 00001E38 7C840774 */ extsb r4, r4
/* 00001E3C 4BFFE321 */ bl window_printf_2
/* 00001E40 889E0019 */ lbz r4, 0x19(r30)
/* 00001E44 387F081C */ addi r3, r31, 0x81c
/* 00001E48 88BE001A */ lbz r5, 0x1a(r30)
/* 00001E4C 4CC63182 */ crclr 6
/* 00001E50 7C840774 */ extsb r4, r4
/* 00001E54 7CA50774 */ extsb r5, r5
/* 00001E58 4BFFE305 */ bl window_printf_2
/* 00001E5C 480000A8 */ b lbl_00001F04
lbl_00001E60:
/* 00001E60 A09E0030 */ lhz r4, 0x30(r30)
/* 00001E64 387F088C */ addi r3, r31, 0x88c
/* 00001E68 4CC63182 */ crclr 6
/* 00001E6C 4BFFE2F1 */ bl window_printf_2
/* 00001E70 48000094 */ b lbl_00001F04
lbl_00001E74:
/* 00001E74 3C600000 */ lis r3, g_soundMuted@ha
/* 00001E78 80030000 */ lwz r0, g_soundMuted@l(r3)
/* 00001E7C 2C000000 */ cmpwi r0, 0
/* 00001E80 4182000C */ beq lbl_00001E8C
/* 00001E84 389F0898 */ addi r4, r31, 0x898
/* 00001E88 48000008 */ b lbl_00001E90
lbl_00001E8C:
/* 00001E8C 389F08A0 */ addi r4, r31, 0x8a0
lbl_00001E90:
/* 00001E90 4CC63182 */ crclr 6
/* 00001E94 387F08A8 */ addi r3, r31, 0x8a8
/* 00001E98 4BFFE2C5 */ bl window_printf_2
/* 00001E9C 48000068 */ b lbl_00001F04
lbl_00001EA0:
/* 00001EA0 4BFFE2BD */ bl OSGetSoundMode
/* 00001EA4 5460103A */ slwi r0, r3, 2
/* 00001EA8 4CC63182 */ crclr 6
/* 00001EAC 7C7F0214 */ add r3, r31, r0
/* 00001EB0 8083072C */ lwz r4, 0x72c(r3)
/* 00001EB4 387F08B4 */ addi r3, r31, 0x8b4
/* 00001EB8 4BFFE2A5 */ bl window_printf_2
/* 00001EBC 3C600000 */ lis r3, g_soundSEVol@ha
/* 00001EC0 4CC63182 */ crclr 6
/* 00001EC4 88830000 */ lbz r4, g_soundSEVol@l(r3)
/* 00001EC8 387F08C0 */ addi r3, r31, 0x8c0
/* 00001ECC 4BFFE291 */ bl window_printf_2
/* 00001ED0 3C600000 */ lis r3, g_soundBGMVol@ha
/* 00001ED4 4CC63182 */ crclr 6
/* 00001ED8 88830000 */ lbz r4, g_soundBGMVol@l(r3)
/* 00001EDC 387F08D0 */ addi r3, r31, 0x8d0
/* 00001EE0 4BFFE27D */ bl window_printf_2
/* 00001EE4 809E003C */ lwz r4, 0x3c(r30)
/* 00001EE8 38600003 */ li r3, 3
/* 00001EEC 38840012 */ addi r4, r4, 0x12
/* 00001EF0 5484043E */ clrlwi r4, r4, 0x10
/* 00001EF4 4BFFE269 */ bl window_set_cursor_pos
/* 00001EF8 387F0400 */ addi r3, r31, 0x400
/* 00001EFC 4CC63182 */ crclr 6
/* 00001F00 4BFFE25D */ bl window_printf_2
lbl_00001F04:
/* 00001F04 809E000C */ lwz r4, 0xc(r30)
/* 00001F08 38600001 */ li r3, 1
/* 00001F0C 3884000A */ addi r4, r4, 0xa
/* 00001F10 5484043E */ clrlwi r4, r4, 0x10
/* 00001F14 4BFFE249 */ bl window_set_cursor_pos
/* 00001F18 38600001 */ li r3, 1
/* 00001F1C 4BFFE241 */ bl window_set_text_color
/* 00001F20 387F0400 */ addi r3, r31, 0x400
/* 00001F24 4CC63182 */ crclr 6
/* 00001F28 4BFFE235 */ bl window_printf_2
/* 00001F2C 38600000 */ li r3, 0
/* 00001F30 4BFFE22D */ bl window_set_text_color
/* 00001F34 8001001C */ lwz r0, 0x1c(r1)
/* 00001F38 83E10014 */ lwz r31, 0x14(r1)
/* 00001F3C 83C10010 */ lwz r30, 0x10(r1)
/* 00001F40 7C0803A6 */ mtlr r0
/* 00001F44 83A1000C */ lwz r29, 0xc(r1)
/* 00001F48 83810008 */ lwz r28, 8(r1)
/* 00001F4C 38210018 */ addi r1, r1, 0x18
/* 00001F50 4E800020 */ blr 
