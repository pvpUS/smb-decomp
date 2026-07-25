/* 0000027C 7C0802A6 */ mflr r0
/* 00000280 90010004 */ stw r0, 4(r1)
/* 00000284 9421FFF8 */ stwu r1, -8(r1)
/* 00000288 4BFFFF49 */ bl event_finish_all
/* 0000028C 4BFFFF45 */ bl free_all_bitmap_groups_except_com
/* 00000290 4BFFFF41 */ bl u_free_minigame_graphics
/* 00000294 4BFFFF3D */ bl SoundGroupFree
/* 00000298 8001000C */ lwz r0, 0xc(r1)
/* 0000029C 38210008 */ addi r1, r1, 8
/* 000002A0 7C0803A6 */ mtlr r0
/* 000002A4 4E800020 */ blr 
