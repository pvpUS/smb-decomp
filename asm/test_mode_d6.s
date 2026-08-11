# test_mode data segment 6 -- .data MIDDLE segment: [0x12C34, 0x14810),
# between the hole src/test_mode_26.c fills (0x12C10..0x12C34) and the
# hole src/test_mode_62.c fills (0x14810..0x148A8).  Carries NO .text
# and NO .rodata.  SOURCES order is load-bearing: it must sit AFTER
# src/test_mode_26.c and BEFORE src/test_mode_62.c.  Its .data is only
# 4-ALIGNED (0x12C34 is 4 mod 8) -- the .balign below must stay 4.
# lbl_00014810 survives as a zero-size label at the next hole's start.
.include "macros.inc"
.global lbl_00012F7C
.global lbl_000130A4
.global lbl_000130B4
.global lbl_000130BC
.global lbl_000130C4
.global lbl_00013158
.global lbl_00013178
.global lbl_0001323C
.global lbl_0001324C
.global lbl_000138AC
.global lbl_000138B8
.global lbl_00013920
.global lbl_00013A1C
.global lbl_00014638
.global lbl_0001468C
.global lbl_0001469C
.global lbl_00014714
.global lbl_000147EC
.global lbl_00014810

.section .data
.balign 4
    .4byte 0xFFFFFFFF
    .4byte 0x1C200000
    .4byte 0x2B000000
lbl_00012C40:
    # 0x12C40
    .asciz "HELLO, WORLD"
    .balign 4
lbl_00012C50:
    # 0x12C50
    .4byte 0x48454C4C
    .4byte 0x4F2C2057
    .4byte 0x4F524C44
    .4byte 0x0A181616
    .4byte 0x16190A17
    .4byte 0x20202017
    .4byte 0x0A1A1616
    .4byte 0x161B0000
lbl_00012C70:
    # 0x12C70
    .4byte 0x00000000
    .4byte lbl_00012C40
    .4byte 0x00000001
    .4byte lbl_00012C40
    .4byte 0x00000002
    .4byte lbl_00012C50
    .4byte 0x00000009
    .4byte lbl_00012C40
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012C98:
    # 0x12C98
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789"
    .balign 4
lbl_00012CF8:
    # 0x12CF8
    .asciz "h/OOMOJI a/ABCDEFG HIJKLMN\nOPQRSTU VWXYZ\nk/KOMOJI a/abcdefg hijklmn\nopqrstu vwxyz\n0123456789\np/BOTANN_A/ANNDO/LE/GENZAI/JIBUNN/KOME/BUTTON_+/"
    .balign 4
lbl_00012D88:
    # 0x12D88
    .asciz "p/BOTANN_A/BUTTON_+/"
    .balign 4
lbl_00012DA0:
    # 0x12DA0
    .4byte 0x000000B0
    .4byte lbl_00012C98
    .4byte 0x000000B1
    .4byte lbl_00012CF8
    .4byte 0x000000B2
    .4byte lbl_00012D88
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DC0:
    # 0x12DC0
    .4byte 0x01021008
    .4byte 0x05000000
lbl_00012DC8:
    # 0x12DC8
    .4byte 0x00000015
    .4byte lbl_00012DC0
    .4byte 0x00000016
    .4byte lbl_00012DC0
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012DE0:
    # 0x12DE0
    .asciz "0123456789"
    .balign 4
lbl_00012DEC:
    # 0x12DEC
    .asciz "0123"
    .balign 4
lbl_00012DF4:
    # 0x12DF4
    .4byte 0x30000000
lbl_00012DF8:
    # 0x12DF8
    .asciz "12345"
    .balign 4
lbl_00012E00:
    # 0x12E00
    .4byte 0x0000001B
    .4byte lbl_00012DE0
    .4byte 0x0000001C
    .4byte lbl_00012C40
    .4byte 0x0000001D
    .4byte lbl_00012DEC
    .4byte 0x0000001E
    .4byte lbl_00012DF4
    .4byte 0x0000001F
    .4byte lbl_00012DF8
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E30:
    # 0x12E30
    .asciz "01234567"
    .balign 4
lbl_00012E3C:
    # 0x12E3C
    .4byte 0x00000034
    .4byte lbl_00012DE0
    .4byte 0x00000035
    .4byte lbl_00012DE0
    .4byte 0x00000036
    .4byte lbl_00012DE0
    .4byte 0x00000037
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012E64:
    # 0x12E64
    .asciz "HELLO, WORLD\nABC DEF"
    .balign 4
lbl_00012E7C:
    # 0x12E7C
    .4byte 0x0000005F
    .4byte lbl_00012C40
    .4byte 0x00000060
    .4byte lbl_00012C40
    .4byte 0x00000061
    .4byte lbl_00012C40
    .4byte 0x00000062
    .4byte lbl_00012E64
    .4byte 0x00000063
    .4byte lbl_00012E64
    .4byte 0x00000064
    .4byte lbl_00012C40
    .4byte 0x0000005E
    .4byte lbl_00012DE0
    .4byte 0x00000065
    .4byte lbl_00012DE0
    .4byte 0x00000066
    .4byte lbl_00012DE0
    .4byte 0x0000005D
    .4byte lbl_00012E30
    .4byte 0xFFFFFFFF
    .4byte 0x00000000
lbl_00012ED4:
    # 0x12ED4
    .asciz "COMMON"
    .balign 4
lbl_00012EDC:
    # 0x12EDC
    .asciz "COMMON(JIS)"
lbl_00012EE8:
    # 0x12EE8
    .asciz "COMMON(ICON)"
    .balign 4
lbl_00012EF8:
    # 0x12EF8
    .asciz "RANKING"
lbl_00012F00:
    # 0x12F00
    .asciz "SELECTER"
    .balign 4
lbl_00012F0C:
    # 0x12F0C
    .asciz "MAIN GAME"
    .balign 4
    .4byte lbl_00012C70
    .4byte lbl_00012ED4
    .4byte 0x00000000
    .4byte lbl_00012DA0
    .4byte lbl_00012EDC
    .4byte 0x00000000
    .4byte lbl_00012DC8
    .4byte lbl_00012EE8
    .4byte 0x00000000
    .4byte lbl_00012E00
    .4byte lbl_00012EF8
    .4byte 0x00000003
    .4byte lbl_00012E3C
    .4byte lbl_00012F00
    .4byte 0x00000004
    .4byte lbl_00012E7C
    .4byte lbl_00012F0C
    .4byte 0x00000005
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .asciz "%18s *"
    .balign 4
    .asciz "%18s"
    .balign 4
lbl_00012F7C:
    # 0x12F7C
    .4byte 0x0000001A
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000004
    .4byte 0x00000002
    .4byte 0x00000015
    .4byte 0x40000000
    .4byte 0x41700000
    .4byte 0x3DCCCCCD
    .4byte 0x00000005
    .4byte 0x00000003
    .4byte 0x0000001B
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000016
    .4byte 0x3F800000
    .4byte 0x41000000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000018
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000006
    .4byte 0x00000000
    .4byte 0x00000013
    .4byte 0x40A00000
    .4byte 0x428C0000
    .4byte 0x3D4CCCCD
    .4byte 0x00000007
    .4byte 0x00000000
    .4byte 0x00000017
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000012
    .4byte 0x40000000
    .4byte 0x41200000
    .4byte 0x3D4CCCCD
    .4byte 0x00000000
    .4byte 0x00000000
lbl_0001303C:
    # 0x1303C
    .asciz "High Level"
    .balign 4
lbl_00013048:
    # 0x13048
    .asciz "Middle Level"
    .balign 4
lbl_00013058:
    # 0x13058
    .asciz "Low Level"
    .balign 4
lbl_00013064:
    # 0x13064
    .asciz "More Low Level"
    .balign 4
    .4byte lbl_0001303C
    .4byte lbl_00013048
    .4byte lbl_00013058
    .4byte lbl_00013064
lbl_00013084:
    # 0x13084
    .4byte 0x41504500
lbl_00013088:
    # 0x13088
    .4byte 0x47414C00
lbl_0001308C:
    # 0x1308C
    .4byte 0x4B494400
lbl_00013090:
    # 0x13090
    .4byte 0x474F5200
    .4byte lbl_00013084
    .4byte lbl_00013088
    .4byte lbl_0001308C
    .4byte lbl_00013090
lbl_000130A4:
    # 0x130A4
    .asciz "red(default)"
    .balign 4
lbl_000130B4:
    # 0x130B4
    .asciz "blue"
    .balign 4
lbl_000130BC:
    # 0x130BC
    .asciz "yellow"
    .balign 4
lbl_000130C4:
    # 0x130C4
    .asciz "green"
    .balign 4
    .4byte 0x2A000000
    .asciz "[%3d/%3d] %-25s  %3d/%3d\n"
    .balign 4
    .asciz "[%3d/%3d] %s\n"
    .balign 4
    .asciz "[%3d/  4] %s\n"
    .balign 4
    .asciz "[%3d/%3d] %s LOD\n"
    .balign 4
    .asciz "[%6.2f ] MOTION SPEED\n"
    .balign 4
    .asciz "[%3d/%3d] %-20s  %7.3f  %7.3f%\n"
lbl_00013158:
    # 0x13158
    .4byte _prolog + 0x4644
    .4byte _prolog + 0x4930
    .4byte _prolog + 0x4A1C
    .4byte _prolog + 0x4BD0
    .4byte _prolog + 0x4B50
    .4byte _prolog + 0x4C20
    .4byte _prolog + 0x4CCC
    .4byte _prolog + 0x4DEC
lbl_00013178:
    # 0x13178
    .4byte _prolog + 0x42F8
    .4byte _prolog + 0x4328
    .4byte _prolog + 0x4354
    .4byte _prolog + 0x437C
    .4byte _prolog + 0x4398
    .4byte _prolog + 0x43BC
    .4byte _prolog + 0x43D0
    .4byte _prolog + 0x4420
lbl_00013198:
    # 0x13198
    .asciz "Material Change"
lbl_000131A8:
    # 0x131A8
    .asciz "Material Freeze"
lbl_000131B8:
    # 0x131B8
    .asciz "Blend"
    .balign 4
lbl_000131C0:
    # 0x131C0
    .asciz "Texture Only"
    .balign 4
lbl_000131D0:
    # 0x131D0
    .asciz "Constant"
    .balign 4
lbl_000131DC:
    # 0x131DC
    .asciz "Gouraud"
lbl_000131E4:
    # 0x131E4
    .asciz "Double Side"
lbl_000131F0:
    # 0x131F0
    .asciz "Single Side"
lbl_000131FC:
    # 0x131FC
    .asciz "Fog Disable"
lbl_00013208:
    # 0x13208
    .asciz "Fog Enable"
    .balign 4
    .4byte lbl_00013198
    .4byte lbl_000131A8
    .4byte lbl_000131B8
    .4byte lbl_000131C0
    .4byte lbl_000131D0
    .4byte lbl_000131DC
    .4byte lbl_000131E4
    .4byte lbl_000131F0
    .4byte lbl_000131FC
    .4byte lbl_00013208
lbl_0001323C:
    # 0x1323C
    .asciz "boy_h/boy_h.tpl"
lbl_0001324C:
    # 0x1324C
    .asciz "boy_kao.gcm"
    .asciz "Effective Model Test\n"
    .balign 4
    .4byte 0x2D3E2000
    .4byte 0x20202000
lbl_00013278:
    # 0x13278
    .asciz "Normal"
    .balign 4
lbl_00013280:
    # 0x13280
    .asciz "All Disp"
    .balign 4
lbl_0001328C:
    # 0x1328C
    .asciz "Cat Next"
    .balign 4
lbl_00013298:
    # 0x13298
    .asciz "Cat Prev"
    .balign 4
lbl_000132A4:
    # 0x132A4
    .asciz "Load"
    .balign 4
    .4byte lbl_00013278
    .4byte lbl_00013280
    .4byte lbl_0001328C
    .4byte lbl_00013298
    .4byte lbl_000132A4
lbl_000132C0:
    # 0x132C0
    .asciz "init"
    .balign 4
lbl_000132C8:
    # 0x132C8
    .4byte 0x62670000
lbl_000132CC:
    # 0x132CC
    .asciz "bg_jun"
    .balign 4
lbl_000132D4:
    # 0x132D4
    .asciz "bg_wat"
    .balign 4
lbl_000132DC:
    # 0x132DC
    .asciz "bg_nig"
    .balign 4
lbl_000132E4:
    # 0x132E4
    .asciz "bg_sun"
    .balign 4
lbl_000132EC:
    # 0x132EC
    .asciz "bg_spa"
    .balign 4
lbl_000132F4:
    # 0x132F4
    .asciz "bg_snd"
    .balign 4
lbl_000132FC:
    # 0x132FC
    .asciz "bg_ice"
    .balign 4
lbl_00013304:
    # 0x13304
    .asciz "bg_stm"
    .balign 4
lbl_0001330C:
    # 0x1330C
    .asciz "bg_bns"
    .balign 4
lbl_00013314:
    # 0x13314
    .asciz "st131"
    .balign 4
lbl_0001331C:
    # 0x1331C
    .asciz "st132"
    .balign 4
lbl_00013324:
    # 0x13324
    .asciz "st133"
    .balign 4
lbl_0001332C:
    # 0x1332C
    .asciz "st135"
    .balign 4
lbl_00013334:
    # 0x13334
    .asciz "st136"
    .balign 4
lbl_0001333C:
    # 0x1333C
    .asciz "st137"
    .balign 4
lbl_00013344:
    # 0x13344
    .asciz "st138"
    .balign 4
lbl_0001334C:
    # 0x1334C
    .asciz "st139"
    .balign 4
lbl_00013354:
    # 0x13354
    .asciz "st140"
    .balign 4
lbl_0001335C:
    # 0x1335C
    .asciz "st141"
    .balign 4
lbl_00013364:
    # 0x13364
    .asciz "st142"
    .balign 4
lbl_0001336C:
    # 0x1336C
    .asciz "st143"
    .balign 4
lbl_00013374:
    # 0x13374
    .asciz "st144"
    .balign 4
lbl_0001337C:
    # 0x1337C
    .asciz "st145"
    .balign 4
lbl_00013384:
    # 0x13384
    .asciz "st146"
    .balign 4
lbl_0001338C:
    # 0x1338C
    .asciz "st147"
    .balign 4
lbl_00013394:
    # 0x13394
    .asciz "st148"
    .balign 4
lbl_0001339C:
    # 0x1339C
    .asciz "st149"
    .balign 4
lbl_000133A4:
    # 0x133A4
    .asciz "st150"
    .balign 4
lbl_000133AC:
    # 0x133AC
    .asciz "st151"
    .balign 4
lbl_000133B4:
    # 0x133B4
    .asciz "st152"
    .balign 4
lbl_000133BC:
    # 0x133BC
    .asciz "st153"
    .balign 4
lbl_000133C4:
    # 0x133C4
    .asciz "st154"
    .balign 4
lbl_000133CC:
    # 0x133CC
    .asciz "st155"
    .balign 4
lbl_000133D4:
    # 0x133D4
    .asciz "st156"
    .balign 4
lbl_000133DC:
    # 0x133DC
    .asciz "st157"
    .balign 4
lbl_000133E4:
    # 0x133E4
    .asciz "st158"
    .balign 4
lbl_000133EC:
    # 0x133EC
    .asciz "st159"
    .balign 4
lbl_000133F4:
    # 0x133F4
    .asciz "st160"
    .balign 4
lbl_000133FC:
    # 0x133FC
    .asciz "st161"
    .balign 4
lbl_00013404:
    # 0x13404
    .asciz "st162"
    .balign 4
lbl_0001340C:
    # 0x1340C
    .asciz "st163"
    .balign 4
lbl_00013414:
    # 0x13414
    .asciz "st164"
    .balign 4
lbl_0001341C:
    # 0x1341C
    .asciz "st165"
    .balign 4
lbl_00013424:
    # 0x13424
    .asciz "st166"
    .balign 4
lbl_0001342C:
    # 0x1342C
    .asciz "st167"
    .balign 4
lbl_00013434:
    # 0x13434
    .asciz "st168"
    .balign 4
lbl_0001343C:
    # 0x1343C
    .asciz "st169"
    .balign 4
lbl_00013444:
    # 0x13444
    .asciz "st170"
    .balign 4
lbl_0001344C:
    # 0x1344C
    .asciz "st171"
    .balign 4
lbl_00013454:
    # 0x13454
    .asciz "st172"
    .balign 4
lbl_0001345C:
    # 0x1345C
    .asciz "st173"
    .balign 4
lbl_00013464:
    # 0x13464
    .asciz "st174"
    .balign 4
lbl_0001346C:
    # 0x1346C
    .asciz "st175"
    .balign 4
lbl_00013474:
    # 0x13474
    .asciz "st176"
    .balign 4
lbl_0001347C:
    # 0x1347C
    .asciz "st177"
    .balign 4
lbl_00013484:
    # 0x13484
    .asciz "st178"
    .balign 4
lbl_0001348C:
    # 0x1348C
    .asciz "st179"
    .balign 4
lbl_00013494:
    # 0x13494
    .asciz "st180"
    .balign 4
lbl_0001349C:
    # 0x1349C
    .asciz "st181"
    .balign 4
lbl_000134A4:
    # 0x134A4
    .asciz "st182"
    .balign 4
lbl_000134AC:
    # 0x134AC
    .asciz "st183"
    .balign 4
lbl_000134B4:
    # 0x134B4
    .asciz "st184"
    .balign 4
lbl_000134BC:
    # 0x134BC
    .asciz "st185"
    .balign 4
lbl_000134C4:
    # 0x134C4
    .asciz "st186"
    .balign 4
lbl_000134CC:
    # 0x134CC
    .asciz "st187"
    .balign 4
lbl_000134D4:
    # 0x134D4
    .asciz "st188"
    .balign 4
lbl_000134DC:
    # 0x134DC
    .asciz "st189"
    .balign 4
lbl_000134E4:
    # 0x134E4
    .asciz "st190"
    .balign 4
lbl_000134EC:
    # 0x134EC
    .asciz "st191"
    .balign 4
lbl_000134F4:
    # 0x134F4
    .asciz "st192"
    .balign 4
lbl_000134FC:
    # 0x134FC
    .asciz "st193"
    .balign 4
lbl_00013504:
    # 0x13504
    .asciz "st194"
    .balign 4
lbl_0001350C:
    # 0x1350C
    .asciz "st195"
    .balign 4
lbl_00013514:
    # 0x13514
    .asciz "st196"
    .balign 4
lbl_0001351C:
    # 0x1351C
    .asciz "st197"
    .balign 4
lbl_00013524:
    # 0x13524
    .asciz "st198"
    .balign 4
lbl_0001352C:
    # 0x1352C
    .asciz "st199"
    .balign 4
lbl_00013534:
    # 0x13534
    .asciz "st200"
    .balign 4
lbl_0001353C:
    # 0x1353C
    .asciz "boy_h"
    .balign 4
lbl_00013544:
    # 0x13544
    .asciz "boy_l"
    .balign 4
lbl_0001354C:
    # 0x1354C
    .asciz "gal_h"
    .balign 4
lbl_00013554:
    # 0x13554
    .asciz "gal_l"
    .balign 4
lbl_0001355C:
    # 0x1355C
    .asciz "kid_h"
    .balign 4
lbl_00013564:
    # 0x13564
    .asciz "kid_l"
    .balign 4
lbl_0001356C:
    # 0x1356C
    .asciz "m_race"
    .balign 4
lbl_00013574:
    # 0x13574
    .asciz "m_fight"
lbl_0001357C:
    # 0x1357C
    .asciz "m_pilot"
lbl_00013584:
    # 0x13584
    .asciz "m_bowl"
    .balign 4
lbl_0001358C:
    # 0x1358C
    .asciz "m_golf"
    .balign 4
lbl_00013594:
    # 0x13594
    .asciz "m_bill"
    .balign 4
lbl_0001359C:
    # 0x1359C
    .asciz "test"
    .balign 4
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte lbl_000132C0
    .4byte lbl_00010CD4
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .4byte 0x25730A00
    .asciz ".tpl"
    .balign 4
    .asciz ".gma"
    .balign 4
    .4byte 0x2E2E0000
lbl_000138AC:
    # 0x138AC
    .asciz "%s/%s.tpl"
    .balign 4
lbl_000138B8:
    # 0x138B8
    .asciz "%s/%s.gma"
    .balign 4
    .asciz "Category [%s] Please Load"
    .balign 4
    .asciz "Category [%s] no data\n"
    .balign 4
    .asciz "Category [%s] %d/%d"
    .asciz "name: %s\nrad: %f\n"
    .balign 4
lbl_00013920:
    # 0x13920
    .asciz "Time: %d\n"
    .balign 4
lbl_0001392C:
    # 0x1392C
    .asciz "stage"
    .balign 4
lbl_00013934:
    # 0x13934
    .asciz "minigame"
    .balign 4
    .4byte lbl_00010C60
    .4byte lbl_000132C8
    .4byte lbl_0001392C
    .4byte lbl_00010CD4
    .4byte lbl_00013934
    .4byte lbl_0001359C
lbl_00013958:
    # 0x13958
    .asciz "commend"
lbl_00013960:
    # 0x13960
    .asciz "roll"
    .balign 4
lbl_00013968:
    # 0x13968
    .asciz "pattern"
lbl_00013970:
    # 0x13970
    .asciz "bg_rac"
    .balign 4
lbl_00013978:
    # 0x13978
    .asciz "bg_fig"
    .balign 4
lbl_00013980:
    # 0x13980
    .asciz "bg_pil"
    .balign 4
lbl_00013988:
    # 0x13988
    .asciz "bg_gol"
    .balign 4
lbl_00013990:
    # 0x13990
    .asciz "bg_bow"
    .balign 4
lbl_00013998:
    # 0x13998
    .asciz "bg_bil"
    .balign 4
lbl_000139A0:
    # 0x139A0
    .asciz "bg_mst"
    .balign 4
lbl_000139A8:
    # 0x139A8
    .asciz "bg_ending"
    .balign 4
lbl_000139B4:
    # 0x139B4
    .asciz "st039"
    .balign 4
lbl_000139BC:
    # 0x139BC
    .asciz "st111"
    .balign 4
lbl_000139C4:
    # 0x139C4
    .asciz "st112"
    .balign 4
lbl_000139CC:
    # 0x139CC
    .asciz "st113"
    .balign 4
lbl_000139D4:
    # 0x139D4
    .asciz "st114"
    .balign 4
lbl_000139DC:
    # 0x139DC
    .asciz "st115"
    .balign 4
lbl_000139E4:
    # 0x139E4
    .asciz "st116"
    .balign 4
lbl_000139EC:
    # 0x139EC
    .asciz "st117"
    .balign 4
lbl_000139F4:
    # 0x139F4
    .asciz "st118"
    .balign 4
lbl_000139FC:
    # 0x139FC
    .asciz "st119"
    .balign 4
lbl_00013A04:
    # 0x13A04
    .asciz "st120"
    .balign 4
lbl_00013A0C:
    # 0x13A0C
    .asciz "gor_h"
    .balign 4
lbl_00013A14:
    # 0x13A14
    .asciz "gor_l"
    .balign 4
lbl_00013A1C:
    # 0x13A1C
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00010C60
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013958
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013960
    .4byte 0x00000000
    .4byte lbl_000132C0
    .4byte lbl_00013968
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132CC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132D4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132DC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132E4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132EC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132F4
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000132FC
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013304
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_0001330C
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013970
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013978
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013980
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013988
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013990
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_00013998
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A0
    .4byte 0x00000001
    .4byte lbl_000132C8
    .4byte lbl_000139A8
    .4byte 0x00000002
    .4byte lbl_00010CFC
    .4byte lbl_00010CFC
    .4byte 0x00000002
    .4byte lbl_00010D28
    .4byte lbl_00010D28
    .4byte 0x00000002
    .4byte lbl_00010D54
    .4byte lbl_00010D54
    .4byte 0x00000002
    .4byte lbl_00010D80
    .4byte lbl_00010D80
    .4byte 0x00000002
    .4byte lbl_00010DAC
    .4byte lbl_00010DAC
    .4byte 0x00000002
    .4byte lbl_00010DD8
    .4byte lbl_00010DD8
    .4byte 0x00000002
    .4byte lbl_00010E04
    .4byte lbl_00010E04
    .4byte 0x00000002
    .4byte lbl_00010E30
    .4byte lbl_00010E30
    .4byte 0x00000002
    .4byte lbl_00010E5C
    .4byte lbl_00010E5C
    .4byte 0x00000002
    .4byte lbl_00010E88
    .4byte lbl_00010E88
    .4byte 0x00000002
    .4byte lbl_00010EB4
    .4byte lbl_00010EB4
    .4byte 0x00000002
    .4byte lbl_00010EE0
    .4byte lbl_00010EE0
    .4byte 0x00000002
    .4byte lbl_00010F0C
    .4byte lbl_00010F0C
    .4byte 0x00000002
    .4byte lbl_00010F38
    .4byte lbl_00010F38
    .4byte 0x00000002
    .4byte lbl_00010F64
    .4byte lbl_00010F64
    .4byte 0x00000002
    .4byte lbl_00010F90
    .4byte lbl_00010F90
    .4byte 0x00000002
    .4byte lbl_00010FBC
    .4byte lbl_00010FBC
    .4byte 0x00000002
    .4byte lbl_00010FE8
    .4byte lbl_00010FE8
    .4byte 0x00000002
    .4byte lbl_00011014
    .4byte lbl_00011014
    .4byte 0x00000002
    .4byte lbl_00011040
    .4byte lbl_00011040
    .4byte 0x00000002
    .4byte lbl_0001106C
    .4byte lbl_0001106C
    .4byte 0x00000002
    .4byte lbl_00011098
    .4byte lbl_00011098
    .4byte 0x00000002
    .4byte lbl_000110C4
    .4byte lbl_000110C4
    .4byte 0x00000002
    .4byte lbl_000110F0
    .4byte lbl_000110F0
    .4byte 0x00000002
    .4byte lbl_0001111C
    .4byte lbl_0001111C
    .4byte 0x00000002
    .4byte lbl_00011148
    .4byte lbl_00011148
    .4byte 0x00000002
    .4byte lbl_00011174
    .4byte lbl_00011174
    .4byte 0x00000002
    .4byte lbl_000111A0
    .4byte lbl_000111A0
    .4byte 0x00000002
    .4byte lbl_000111CC
    .4byte lbl_000111CC
    .4byte 0x00000002
    .4byte lbl_000111F8
    .4byte lbl_000111F8
    .4byte 0x00000002
    .4byte lbl_00011224
    .4byte lbl_00011224
    .4byte 0x00000002
    .4byte lbl_00011250
    .4byte lbl_00011250
    .4byte 0x00000002
    .4byte lbl_0001127C
    .4byte lbl_0001127C
    .4byte 0x00000002
    .4byte lbl_000112A8
    .4byte lbl_000112A8
    .4byte 0x00000002
    .4byte lbl_000112D4
    .4byte lbl_000112D4
    .4byte 0x00000002
    .4byte lbl_00011300
    .4byte lbl_00011300
    .4byte 0x00000002
    .4byte lbl_0001132C
    .4byte lbl_0001132C
    .4byte 0x00000002
    .4byte lbl_00011358
    .4byte lbl_00011358
    .4byte 0x00000002
    .4byte lbl_000139B4
    .4byte lbl_000139B4
    .4byte 0x00000002
    .4byte lbl_000113B0
    .4byte lbl_000113B0
    .4byte 0x00000002
    .4byte lbl_000113DC
    .4byte lbl_000113DC
    .4byte 0x00000002
    .4byte lbl_00011408
    .4byte lbl_00011408
    .4byte 0x00000002
    .4byte lbl_00011434
    .4byte lbl_00011434
    .4byte 0x00000002
    .4byte lbl_00011460
    .4byte lbl_00011460
    .4byte 0x00000002
    .4byte lbl_0001148C
    .4byte lbl_0001148C
    .4byte 0x00000002
    .4byte lbl_000114B8
    .4byte lbl_000114B8
    .4byte 0x00000002
    .4byte lbl_000114E4
    .4byte lbl_000114E4
    .4byte 0x00000002
    .4byte lbl_00011510
    .4byte lbl_00011510
    .4byte 0x00000002
    .4byte lbl_00011384
    .4byte lbl_00011384
    .4byte 0x00000002
    .4byte lbl_0001153C
    .4byte lbl_0001153C
    .4byte 0x00000002
    .4byte lbl_00011568
    .4byte lbl_00011568
    .4byte 0x00000002
    .4byte lbl_00011594
    .4byte lbl_00011594
    .4byte 0x00000002
    .4byte lbl_000115C0
    .4byte lbl_000115C0
    .4byte 0x00000002
    .4byte lbl_000115EC
    .4byte lbl_000115EC
    .4byte 0x00000002
    .4byte lbl_00011618
    .4byte lbl_00011618
    .4byte 0x00000002
    .4byte lbl_00011644
    .4byte lbl_00011644
    .4byte 0x00000002
    .4byte lbl_00011670
    .4byte lbl_00011670
    .4byte 0x00000002
    .4byte lbl_0001169C
    .4byte lbl_0001169C
    .4byte 0x00000002
    .4byte lbl_000116C8
    .4byte lbl_000116C8
    .4byte 0x00000002
    .4byte lbl_000116F4
    .4byte lbl_000116F4
    .4byte 0x00000002
    .4byte lbl_00011720
    .4byte lbl_00011720
    .4byte 0x00000002
    .4byte lbl_0001174C
    .4byte lbl_0001174C
    .4byte 0x00000002
    .4byte lbl_00011778
    .4byte lbl_00011778
    .4byte 0x00000002
    .4byte lbl_000117A4
    .4byte lbl_000117A4
    .4byte 0x00000002
    .4byte lbl_000117D0
    .4byte lbl_000117D0
    .4byte 0x00000002
    .4byte lbl_000117FC
    .4byte lbl_000117FC
    .4byte 0x00000002
    .4byte lbl_00011828
    .4byte lbl_00011828
    .4byte 0x00000002
    .4byte lbl_00011854
    .4byte lbl_00011854
    .4byte 0x00000002
    .4byte lbl_00011880
    .4byte lbl_00011880
    .4byte 0x00000002
    .4byte lbl_000118AC
    .4byte lbl_000118AC
    .4byte 0x00000002
    .4byte lbl_000118D8
    .4byte lbl_000118D8
    .4byte 0x00000002
    .4byte lbl_00011904
    .4byte lbl_00011904
    .4byte 0x00000002
    .4byte lbl_00011930
    .4byte lbl_00011930
    .4byte 0x00000002
    .4byte lbl_0001195C
    .4byte lbl_0001195C
    .4byte 0x00000002
    .4byte lbl_00011988
    .4byte lbl_00011988
    .4byte 0x00000002
    .4byte lbl_000119B4
    .4byte lbl_000119B4
    .4byte 0x00000002
    .4byte lbl_000119E0
    .4byte lbl_000119E0
    .4byte 0x00000002
    .4byte lbl_00011A0C
    .4byte lbl_00011A0C
    .4byte 0x00000002
    .4byte lbl_00011A38
    .4byte lbl_00011A38
    .4byte 0x00000002
    .4byte lbl_00011A64
    .4byte lbl_00011A64
    .4byte 0x00000002
    .4byte lbl_00011A90
    .4byte lbl_00011A90
    .4byte 0x00000002
    .4byte lbl_00011ABC
    .4byte lbl_00011ABC
    .4byte 0x00000002
    .4byte lbl_00011AE8
    .4byte lbl_00011AE8
    .4byte 0x00000002
    .4byte lbl_00011B14
    .4byte lbl_00011B14
    .4byte 0x00000002
    .4byte lbl_00011B40
    .4byte lbl_00011B40
    .4byte 0x00000002
    .4byte lbl_00011B6C
    .4byte lbl_00011B6C
    .4byte 0x00000002
    .4byte lbl_00011B98
    .4byte lbl_00011B98
    .4byte 0x00000002
    .4byte lbl_00011BC4
    .4byte lbl_00011BC4
    .4byte 0x00000002
    .4byte lbl_00011BF0
    .4byte lbl_00011BF0
    .4byte 0x00000002
    .4byte lbl_00011C1C
    .4byte lbl_00011C1C
    .4byte 0x00000002
    .4byte lbl_00011C48
    .4byte lbl_00011C48
    .4byte 0x00000002
    .4byte lbl_00011C74
    .4byte lbl_00011C74
    .4byte 0x00000002
    .4byte lbl_00011CA0
    .4byte lbl_00011CA0
    .4byte 0x00000002
    .4byte lbl_00011CCC
    .4byte lbl_00011CCC
    .4byte 0x00000002
    .4byte lbl_00011CF8
    .4byte lbl_00011CF8
    .4byte 0x00000002
    .4byte lbl_00011D24
    .4byte lbl_00011D24
    .4byte 0x00000002
    .4byte lbl_00011D50
    .4byte lbl_00011D50
    .4byte 0x00000002
    .4byte lbl_00011D7C
    .4byte lbl_00011D7C
    .4byte 0x00000002
    .4byte lbl_00011DA8
    .4byte lbl_00011DA8
    .4byte 0x00000002
    .4byte lbl_00011DD4
    .4byte lbl_00011DD4
    .4byte 0x00000002
    .4byte lbl_00011E00
    .4byte lbl_00011E00
    .4byte 0x00000002
    .4byte lbl_00011E2C
    .4byte lbl_00011E2C
    .4byte 0x00000002
    .4byte lbl_00011E58
    .4byte lbl_00011E58
    .4byte 0x00000002
    .4byte lbl_00011E84
    .4byte lbl_00011E84
    .4byte 0x00000002
    .4byte lbl_00011EB0
    .4byte lbl_00011EB0
    .4byte 0x00000002
    .4byte lbl_00011EDC
    .4byte lbl_00011EDC
    .4byte 0x00000002
    .4byte lbl_00011F08
    .4byte lbl_00011F08
    .4byte 0x00000002
    .4byte lbl_00011F34
    .4byte lbl_00011F34
    .4byte 0x00000002
    .4byte lbl_00011F60
    .4byte lbl_00011F60
    .4byte 0x00000002
    .4byte lbl_00011F8C
    .4byte lbl_00011F8C
    .4byte 0x00000002
    .4byte lbl_000139BC
    .4byte lbl_000139BC
    .4byte 0x00000002
    .4byte lbl_000139C4
    .4byte lbl_000139C4
    .4byte 0x00000002
    .4byte lbl_000139CC
    .4byte lbl_000139CC
    .4byte 0x00000002
    .4byte lbl_000139D4
    .4byte lbl_000139D4
    .4byte 0x00000002
    .4byte lbl_000139DC
    .4byte lbl_000139DC
    .4byte 0x00000002
    .4byte lbl_000139E4
    .4byte lbl_000139E4
    .4byte 0x00000002
    .4byte lbl_000139EC
    .4byte lbl_000139EC
    .4byte 0x00000002
    .4byte lbl_000139F4
    .4byte lbl_000139F4
    .4byte 0x00000002
    .4byte lbl_000139FC
    .4byte lbl_000139FC
    .4byte 0x00000002
    .4byte lbl_00013A04
    .4byte lbl_00013A04
    .4byte 0x00000002
    .4byte lbl_00011FB8
    .4byte lbl_00011FB8
    .4byte 0x00000002
    .4byte lbl_00011FE4
    .4byte lbl_00011FE4
    .4byte 0x00000002
    .4byte lbl_00012010
    .4byte lbl_00012010
    .4byte 0x00000002
    .4byte lbl_0001203C
    .4byte lbl_0001203C
    .4byte 0x00000002
    .4byte lbl_00012068
    .4byte lbl_00012068
    .4byte 0x00000002
    .4byte lbl_00012094
    .4byte lbl_00012094
    .4byte 0x00000002
    .4byte lbl_000120C0
    .4byte lbl_000120C0
    .4byte 0x00000002
    .4byte lbl_000120EC
    .4byte lbl_000120EC
    .4byte 0x00000002
    .4byte lbl_00012118
    .4byte lbl_00012118
    .4byte 0x00000002
    .4byte lbl_00012144
    .4byte lbl_00012144
    .4byte 0x00000002
    .4byte lbl_00013314
    .4byte lbl_00013314
    .4byte 0x00000002
    .4byte lbl_0001331C
    .4byte lbl_0001331C
    .4byte 0x00000002
    .4byte lbl_00013324
    .4byte lbl_00013324
    .4byte 0x00000002
    .4byte lbl_00012170
    .4byte lbl_00012170
    .4byte 0x00000002
    .4byte lbl_0001332C
    .4byte lbl_0001332C
    .4byte 0x00000002
    .4byte lbl_00013334
    .4byte lbl_00013334
    .4byte 0x00000002
    .4byte lbl_0001333C
    .4byte lbl_0001333C
    .4byte 0x00000002
    .4byte lbl_00013344
    .4byte lbl_00013344
    .4byte 0x00000002
    .4byte lbl_0001334C
    .4byte lbl_0001334C
    .4byte 0x00000002
    .4byte lbl_00013354
    .4byte lbl_00013354
    .4byte 0x00000002
    .4byte lbl_0001335C
    .4byte lbl_0001335C
    .4byte 0x00000002
    .4byte lbl_00013364
    .4byte lbl_00013364
    .4byte 0x00000002
    .4byte lbl_0001336C
    .4byte lbl_0001336C
    .4byte 0x00000002
    .4byte lbl_00013374
    .4byte lbl_00013374
    .4byte 0x00000002
    .4byte lbl_0001337C
    .4byte lbl_0001337C
    .4byte 0x00000002
    .4byte lbl_00013384
    .4byte lbl_00013384
    .4byte 0x00000002
    .4byte lbl_0001338C
    .4byte lbl_0001338C
    .4byte 0x00000002
    .4byte lbl_00013394
    .4byte lbl_00013394
    .4byte 0x00000002
    .4byte lbl_0001339C
    .4byte lbl_0001339C
    .4byte 0x00000002
    .4byte lbl_000133A4
    .4byte lbl_000133A4
    .4byte 0x00000002
    .4byte lbl_000133AC
    .4byte lbl_000133AC
    .4byte 0x00000002
    .4byte lbl_000133B4
    .4byte lbl_000133B4
    .4byte 0x00000002
    .4byte lbl_000133BC
    .4byte lbl_000133BC
    .4byte 0x00000002
    .4byte lbl_000133C4
    .4byte lbl_000133C4
    .4byte 0x00000002
    .4byte lbl_000133CC
    .4byte lbl_000133CC
    .4byte 0x00000002
    .4byte lbl_000133D4
    .4byte lbl_000133D4
    .4byte 0x00000002
    .4byte lbl_000133DC
    .4byte lbl_000133DC
    .4byte 0x00000002
    .4byte lbl_000133E4
    .4byte lbl_000133E4
    .4byte 0x00000002
    .4byte lbl_000133EC
    .4byte lbl_000133EC
    .4byte 0x00000002
    .4byte lbl_000133F4
    .4byte lbl_000133F4
    .4byte 0x00000002
    .4byte lbl_000133FC
    .4byte lbl_000133FC
    .4byte 0x00000002
    .4byte lbl_00013404
    .4byte lbl_00013404
    .4byte 0x00000002
    .4byte lbl_0001340C
    .4byte lbl_0001340C
    .4byte 0x00000002
    .4byte lbl_00013414
    .4byte lbl_00013414
    .4byte 0x00000002
    .4byte lbl_0001341C
    .4byte lbl_0001341C
    .4byte 0x00000002
    .4byte lbl_00013424
    .4byte lbl_00013424
    .4byte 0x00000002
    .4byte lbl_0001342C
    .4byte lbl_0001342C
    .4byte 0x00000002
    .4byte lbl_00013434
    .4byte lbl_00013434
    .4byte 0x00000002
    .4byte lbl_0001343C
    .4byte lbl_0001343C
    .4byte 0x00000002
    .4byte lbl_00013444
    .4byte lbl_00013444
    .4byte 0x00000002
    .4byte lbl_0001344C
    .4byte lbl_0001344C
    .4byte 0x00000002
    .4byte lbl_00013454
    .4byte lbl_00013454
    .4byte 0x00000002
    .4byte lbl_0001345C
    .4byte lbl_0001345C
    .4byte 0x00000002
    .4byte lbl_00013464
    .4byte lbl_00013464
    .4byte 0x00000002
    .4byte lbl_0001346C
    .4byte lbl_0001346C
    .4byte 0x00000002
    .4byte lbl_00013474
    .4byte lbl_00013474
    .4byte 0x00000002
    .4byte lbl_0001347C
    .4byte lbl_0001347C
    .4byte 0x00000002
    .4byte lbl_00013484
    .4byte lbl_00013484
    .4byte 0x00000002
    .4byte lbl_0001348C
    .4byte lbl_0001348C
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_00013494
    .4byte 0x00000002
    .4byte lbl_0001349C
    .4byte lbl_0001349C
    .4byte 0x00000002
    .4byte lbl_000134A4
    .4byte lbl_000134A4
    .4byte 0x00000002
    .4byte lbl_000134AC
    .4byte lbl_000134AC
    .4byte 0x00000002
    .4byte lbl_000134B4
    .4byte lbl_000134B4
    .4byte 0x00000002
    .4byte lbl_000134BC
    .4byte lbl_000134BC
    .4byte 0x00000002
    .4byte lbl_000134C4
    .4byte lbl_000134C4
    .4byte 0x00000002
    .4byte lbl_000134CC
    .4byte lbl_000134CC
    .4byte 0x00000002
    .4byte lbl_000134D4
    .4byte lbl_000134D4
    .4byte 0x00000002
    .4byte lbl_000134DC
    .4byte lbl_000134DC
    .4byte 0x00000002
    .4byte lbl_00013494
    .4byte lbl_000134E4
    .4byte 0x00000002
    .4byte lbl_000134EC
    .4byte lbl_000134EC
    .4byte 0x00000002
    .4byte lbl_000134F4
    .4byte lbl_000134F4
    .4byte 0x00000002
    .4byte lbl_000134FC
    .4byte lbl_000134FC
    .4byte 0x00000002
    .4byte lbl_00013504
    .4byte lbl_00013504
    .4byte 0x00000002
    .4byte lbl_0001350C
    .4byte lbl_0001350C
    .4byte 0x00000002
    .4byte lbl_00013514
    .4byte lbl_00013514
    .4byte 0x00000002
    .4byte lbl_0001351C
    .4byte lbl_0001351C
    .4byte 0x00000002
    .4byte lbl_00013524
    .4byte lbl_00013524
    .4byte 0x00000002
    .4byte lbl_0001352C
    .4byte lbl_0001352C
    .4byte 0x00000002
    .4byte lbl_00013534
    .4byte lbl_00013534
    .4byte 0x00000003
    .4byte lbl_0001353C
    .4byte lbl_0001353C
    .4byte 0x00000003
    .4byte lbl_00013544
    .4byte lbl_00013544
    .4byte 0x00000003
    .4byte lbl_0001354C
    .4byte lbl_0001354C
    .4byte 0x00000003
    .4byte lbl_00013554
    .4byte lbl_00013554
    .4byte 0x00000003
    .4byte lbl_0001355C
    .4byte lbl_0001355C
    .4byte 0x00000003
    .4byte lbl_00013564
    .4byte lbl_00013564
    .4byte 0x00000003
    .4byte lbl_00013A0C
    .4byte lbl_00013A0C
    .4byte 0x00000003
    .4byte lbl_00013A14
    .4byte lbl_00013A14
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001356C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013574
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001357C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013584
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_0001358C
    .4byte 0x00000004
    .4byte lbl_000132C0
    .4byte lbl_00013594
    .4byte 0x00000005
    .4byte lbl_000132C0
    .4byte lbl_0001359C
    .asciz "[ Category ]"
    .balign 4
    .asciz "A    : Select\n"
    .balign 4
    .asciz "B    : Cancel\n"
    .balign 4
    .4byte 0x5041441E
    .4byte 0x1F3A2043
    .asciz "ategory Select\n"
    .asciz "B    : Category Select\n"
    .4byte 0x5041441D
    .4byte 0x1C3A204D
    .asciz "odel Select"
    .asciz "Z  : "
    .balign 4
    .asciz "Fix Scale"
    .balign 4
    .asciz "Z  : Variable Scale"
    .asciz "    All Disp Mode\n"
    .balign 4
    .asciz "X+A: Normal Mode"
    .balign 4
    .asciz "X+A: All Disp Mode"
    .balign 4
    .4byte 0x252D3873
    .4byte 0x1C000000
    .asciz "%-8s"
    .balign 4
    .4byte 0x1E000000
    .4byte 0x1F000000
    .asciz " no data."
    .balign 4
    .asciz " [%d/%d] %-8s"
    .balign 4
lbl_00014638:
    # 0x14638
    .asciz "rad: %-3.6f     "
    .balign 4
    .asciz "cannot OSAlloc\n"
    .asciz "pattern.tpl"
    .asciz "pattern.gma"
    .asciz "speed: "
    .4byte 0x25640000
    .asciz "%s * %2d\n"
    .balign 4
lbl_0001468C:
    # 0x1468C
    .asciz "ROMFONT TEST\n"
    .balign 4
lbl_0001469C:
    # 0x1469C
    .asciz "code: %04X\n"
lbl_000146A8:
    # 0x146A8
    .asciz "COMPETITION"
lbl_000146B4:
    # 0x146B4
    .asciz "COMPETITION ICON"
    .balign 4
lbl_000146C8:
    # 0x146C8
    .asciz "PRACTICE"
    .balign 4
lbl_000146D4:
    # 0x146D4
    .asciz "RACE REGULAR"
    .balign 4
lbl_000146E4:
    # 0x146E4
    .asciz "RECE BIG"
    .balign 4
lbl_000146F0:
    # 0x146F0
    .asciz "FIGHT"
    .balign 4
lbl_000146F8:
    # 0x146F8
    .asciz "FIGHT ICON"
    .balign 4
lbl_00014704:
    # 0x14704
    .asciz "BANNER"
    .balign 4
lbl_0001470C:
    # 0x1470C
    .asciz "UNDER"
    .balign 4
lbl_00014714:
    # 0x14714
    .4byte lbl_000146A8
    .4byte 0x00C00084
    .4byte 0x00000000
    .4byte lbl_000146B4
    .4byte 0x0026001A
    .4byte 0x00000000
    .4byte lbl_000146C8
    .4byte 0x00C000B2
    .4byte 0x00000000
    .4byte lbl_000146D4
    .4byte 0x00600044
    .4byte 0x00000000
    .4byte lbl_000146E4
    .4byte 0x00C8008C
    .4byte 0x00000000
    .4byte lbl_000146F0
    .4byte 0x00AC0078
    .4byte 0x00000000
    .4byte lbl_000146F8
    .4byte 0x003C002A
    .4byte 0x00000000
    .4byte lbl_00014704
    .4byte 0x00600020
    .4byte 0x00000000
    .4byte lbl_0001470C
    .4byte 0x008C008C
    .4byte 0x00000001
    .asciz "Cannot OSAlloc\n"
    .asciz "/p006/prj006/youske/preview/%dx%d/st%03d.gct"
    .balign 4
    .asciz "Cannot USBopen\n"
    .asciz "PRREND TEST"
    .asciz "[ %3dx%3d ] %s"
    .balign 4
lbl_000147EC:
    # 0x147EC
    .asciz "preview/%dx%d.tpl"
    .balign 4
    .asciz " [ %3d / 200 ]"
    .balign 4
lbl_00014810:
