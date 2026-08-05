#!/usr/bin/env python3
"""rel_probe.py -- compile ONE .c with mwcc and disassemble it. No link.

The method change run 9 said was worth keeping.  option's `micro/mk.sh` and
sel_ngc's `run9/fprobe.py` were built independently for the same reason: a full
`make` round-trip is ~4s and answers "does this variant match?", while what you
usually want is "what does mwcc DO with X?" -- independent of any function, in
about a second.  option proved a whole class of functions source-unreachable
with a 20-line micro-benchmark this way, and sel_ngc found three idioms.

  Use it for: does a `u8 *` base sink or hoist?  does this declaration order
  change the frame?  does this header emit .rodata?  is `((T*)(b+K))[i]` really
  the same as the pointer form?  Write ten 15-line probes, not ten variants of
  a 200-instruction body.

**CAVEAT that cost sel_ngc time: a `.plf`-based probe is WRONG on a truncated
body** -- it disassembles past the function end into the next one.  This tool
reads the OBJECT, whose .text is exactly what your file emitted, so it does not
have that failure mode.  Do not "improve" it into reading the .plf.

The flags come from the Makefile (MWCC_CFLAGS + REL_FLAGS + MWCC_CPPFLAGS with
`$(dir $^)` = src/) so a probe compiles the way a real module object does.
option's scratch copy used `-i src -i include -I- -i libraries`, which is NOT
the module's include line; if a probe ever disagrees with a real build, check
this first.

**Give your probe the module's FULL include preamble, not just `global.h`.**
With only `global.h` every probe dies with `illegal function definition` pointing
at your own code, which reads exactly like a syntax error in the probe rather
than a missing header (mini_bowling, run 10, lost a sweep to this). Copy the
`#include` block from any `src/<stem>*.c` — those are what rel_split generated
for this module.

usage:
  python tools/rel_probe.py <module> probe.c [probe2.c ...]
  python tools/rel_probe.py <module> --frame probe.c [...]   # one-line summary
  python tools/rel_probe.py <module> --sections probe.c      # what did it emit?
  python tools/rel_probe.py <module> --func myfn probe.c     # just that symbol

--frame prints frame size, saved-register block, r1-relative address-taken
slots and instruction count -- the four things a frame-shaped near-miss turns
on.  --sections is the cheap way to catch an include that emits .rodata
(`<math.h>` costs 16 bytes for an inline sqrt even unused, and that alone loses
a golden hash).
"""
import argparse
import os
import re
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

OBJDUMP = 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe'

MODULES = ('mini_bowling', 'mini_race', 'mini_fight', 'mini_pilot', 'mini_golf',
           'mini_billiards', 'sel_ngc', 'option', 'test_mode')

# Makefile:47  MWCC_CFLAGS
CFLAGS = ['-c', '-sym', 'on', '-O4,p', '-inline', 'auto', '-nodefaults',
          '-proc', 'gekko', '-fp', 'hard', '-Cpp_exceptions', 'off',
          '-enum', 'int', '-warn', 'pragmas', '-pragma', 'cats off']
# Makefile:62  REL_FLAGS -- REL objects must not use the small data sections.
# Leaving these off changes the codegen for every module global.
RELFLAGS = ['-sdata', '0', '-sdata2', '0', '-g']
# Makefile:49  MWCC_CPPFLAGS, with $(dir $^) = src/ for a src/*.c prerequisite
CPPFLAGS = ['-i', 'src', '-i', 'data', '-i', 'src/', '-I-', '-i', 'include']


def compile_one(tree, tmp, cfile, obj):
    mwcc = os.path.join(tree, 'mwcc_compiler', '1.1', 'mwcceppc.exe')
    if not os.path.exists(mwcc):
        sys.exit('no mwcc at %s -- pass --tree' % mwcc)
    env = dict(os.environ, TMP=tmp, TEMP=tmp)
    os.makedirs(tmp, exist_ok=True)
    try:
        os.remove(obj)
    except FileNotFoundError:
        pass
    r = subprocess.run([mwcc] + CFLAGS + RELFLAGS + CPPFLAGS +
                       ['-o', obj, cfile],
                       cwd=tree, capture_output=True, text=True, env=env)
    log = (r.stdout or '') + (r.stderr or '')
    # mwcc prints warnings and still succeeds; the object's existence is the
    # only honest test.  (And it prints a banner even when it dies, so matching
    # on output is not enough -- same shape as rel_sweep's trap 2.)
    if not os.path.exists(obj):
        return None, log
    return obj, log


def disasm(obj, func=None):
    r = subprocess.run([OBJDUMP, '-d', '--no-show-raw-insn',
                        '--section=.text', obj], capture_output=True, text=True)
    out = r.stdout
    blocks = {}
    cur = None
    for ln in out.splitlines():
        m = re.match(r'^[0-9a-f]+ <(.+)>:', ln)
        if m:
            cur = m.group(1)
            blocks[cur] = []
            continue
        if cur and re.match(r'^\s*[0-9a-f]+:', ln):
            blocks[cur].append(ln.rstrip())
    if func:
        blocks = {k: v for k, v in blocks.items() if k == func}
    return blocks


def frame_of(body):
    """The four numbers a frame-shaped near-miss turns on."""
    txt = '\n'.join(body)
    fr = re.search(r'stwu\s+r1,-(\d+)\(r1\)', txt)
    sm = re.search(r'stmw\s+r(\d+),(\d+)\(r1\)', txt)
    ar = sorted(set(int(m) for m in re.findall(r'addi\s+r\d+,r1,(\d+)', txt)))
    frame = int(fr.group(1)) if fr else 0
    if sm:
        saved = 'r%s@0x%X (%d regs)' % (sm.group(1), int(sm.group(2)),
                                        32 - int(sm.group(1)))
        top = int(sm.group(2))
    else:
        saved = 'no stmw'
        top = frame
    return ('frame 0x%X  saved %-22s addi-r1 %-18s locals 0x%X  insn %d'
            % (frame, saved, '[' + ','.join('0x%X' % a for a in ar) + ']',
               top - (ar[0] if ar else 0), len(body)))


def sections(obj):
    r = subprocess.run([OBJDUMP, '-h', obj], capture_output=True, text=True)
    out = []
    for m in re.finditer(r'^\s*\d+\s+(\.\S+)\s+([0-9a-f]+)', r.stdout, re.M):
        name, size = m.group(1), int(m.group(2), 16)
        if size and not name.startswith(('.debug', '.rela', '.line', '.stab',
                                         '.comment')):
            out.append('%s 0x%x' % (name, size))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('files', nargs='+')
    ap.add_argument('--tree', help='defaults to the tree containing THIS tools/ dir')
    ap.add_argument('--tmp', help='defaults to C:/tmp/tmp_<module>')
    ap.add_argument('--frame', action='store_true',
                    help='one summary line per function instead of the '
                         'disassembly')
    ap.add_argument('--sections', action='store_true',
                    help='list the object\'s sections -- catches an include '
                         'that emitted .rodata')
    ap.add_argument('--func', help='only this symbol')
    a = ap.parse_args()

    # Same fix as rel_sweep: resolve from THIS FILE so a worker worktree probes
    # itself, not its parent.  (mini_bowling, run 12.)
    tree = a.tree or REPO
    tmp = a.tmp or 'C:/tmp/tmp_%s' % a.module
    # ...and give the object a UNIQUE name.  It used to be a fixed
    # '<tmp>/rel_probe.o', so two agents probing one module raced on one file
    # and could each score the other's compile -- a fictional-match mode.
    obj = os.path.join(tmp, 'rel_probe_%d.o' % os.getpid())

    rc = 0
    for cfile in a.files:
        src = cfile if os.path.isabs(cfile) else os.path.abspath(cfile)
        name = os.path.basename(src)
        ok, log = compile_one(tree, tmp, src, obj)
        if not ok:
            tail = '\n'.join(l for l in log.strip().splitlines()
                             if l.strip())[-400:]
            print('%-28s COMPILE FAILED\n%s' % (name, tail))
            rc = 1
            continue
        if a.sections:
            print('%-28s %s' % (name, ', '.join(sections(obj)) or '(none)'))
            continue
        blocks = disasm(obj, a.func)
        if not blocks:
            print('%-28s no .text%s' % (name,
                                        ' matching --func' if a.func else ''))
            # RUN 19: exit 2, NOT 1. This file COMPILED -- it just defines no
            # such function. Sharing exit 1 with the real COMPILE FAILED above
            # made rel_pcmp print FAIL(compile) for every sibling file in a
            # probe directory, which is a mechanical manufacturer of the "this
            # draft does not compile" claim that is 0-for-9 across three runs.
            # A real compile failure anywhere in the run still wins.
            if rc == 0:
                rc = 2
            continue
        if a.frame:
            for fn, body in blocks.items():
                print('%-28s %-22s %s' % (name, fn, frame_of(body)))
        else:
            for fn, body in blocks.items():
                print('==== %s  %s  (%d insn)' % (name, fn, len(body)))
                print('\n'.join(body))
    return rc


if __name__ == '__main__':
    sys.exit(main())
