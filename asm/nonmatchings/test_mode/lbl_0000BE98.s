/* 0000BE98 7C0802A6 */ mflr r0
/* 0000BE9C 90010004 */ stw r0, 4(r1)
/* 0000BEA0 9421FFF8 */ stwu r1, -8(r1)
/* 0000BEA4 4BFF42B9 */ bl draw_normal_game_scene
/* 0000BEA8 8001000C */ lwz r0, 0xc(r1)
/* 0000BEAC 38210008 */ addi r1, r1, 8
/* 0000BEB0 7C0803A6 */ mtlr r0
/* 0000BEB4 4E800020 */ blr 
