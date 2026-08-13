# test_mode data segment A -- an ANCHOR ONLY.  The 8 bytes at 0xFED0 are
# the SIGNED int->float magic and are now emitted by the merged
# src/test_mode_27.c.  This file defines nothing but the label, so its
# .rodata is zero-size and lbl_0000FED0 lands at the start of that hole.
# asm/nonmatchings/test_mode/lbl_000010C4.s still loads from it.
.include "macros.inc"

# RUN 35: lbl_0000FED0 is now an anchor `.set` in asm/test_mode.s;
# this segment contributes nothing to any section and is inert.
.section .rodata
.balign 8
