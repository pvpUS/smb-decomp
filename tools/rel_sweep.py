#!/usr/bin/env python3
"""Build one REL and score one function against its original -- without lying.

Every run of this project so far has produced FICTIONAL match results, and in
run 5 four separate agents hit the same three traps independently, costing
hours each. This exists so nobody writes a fourth broken harness.

The traps, all of which report a confident wrong answer rather than an error:

  1. `subprocess.run(cmd, shell=True)` on Windows goes through cmd.exe, which
     cannot run a command starting with `/c/msys64/...`. It sets a returncode,
     prints nothing, and raises nothing. A harness that checks `if 'Error' in
     stdout` passes on the empty output, so NO BUILD EVER HAPPENS and the diff
     scores the previous .plf. The tell is a sweep where wildly different
     sources all score identically.
  2. A failed compile leaves the previous .o in place. If that .o was the
     asm-include build, the per-function diff reports a perfect match that is
     fiction.
  3. make's timestamp granularity skips recompiles on rapid successive edits,
     which produces the same stale-object lie during a fast sweep.

So this: argv list (never shell=True), delete the .o and the .rel first, and
refuse to report a score unless the build output actually contains the
`Compiling src/<file>` line for the file under test and rel_fdiff actually
emitted a verdict line.

usage:
  python tools/rel_sweep.py <module> --file src/mini_fight_45.c --label lbl_0000F2C8
  python tools/rel_sweep.py <module> --file src/x.c --label lbl_Y --sweep variants/
  python tools/rel_sweep.py <module> --file src/x.c --label lbl_Y --tree C:/tmp/smbm/mini_fight
  python tools/rel_sweep.py <module> --gate

--sweep takes a directory of candidate bodies, tries each in turn as <file>,
restores the original afterwards, and prints a ranked table.

--gate is the ONLY thing that may be used to claim a match. A per-function diff
of 0 is necessary, not sufficient: it is computed from a build that reuses every
sibling object, and run 6 hit a non-golden REL with `git status` completely clean
because one sibling's stale .o survived make's 1-second granularity. --gate
deletes EVERY object of the module plus the .rel and .plf, rebuilds from that,
and compares the sha1 against supermonkeyball.sha1. Nothing else is a gate.

Trap 4, learned in run 6: --sweep's restore used to be shutil.move of a copy2
backup, so the restored .c carried its ORIGINAL mtime -- older than the last
variant's .o -- and every subsequent build silently linked the last variant.
The restore now stamps mtime and drops the object. The general rule: anything
that copies or restores a .c must stamp its mtime, and any golden gate must
delete objects first.
"""
import argparse
import glob
import hashlib
import os
import re
import shutil
import subprocess
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASH = 'C:/msys64/usr/bin/bash.exe'

# warm dir -> (src/asm stem, build target); see rel_merge_back.MODULES
MODULES = {
    'mini_bowling':   ('mini_bowling',   'mkbe.rel_mini_bowling.rel'),
    'mini_race':      ('mini_race',      'mkbe.rel_mini_race.rel'),
    'mini_fight':     ('mini_fight',     'mkbe.rel_mini_fight.rel'),
    'mini_pilot':     ('mini_pilot',     'mkbe.rel_mini_pilot.rel'),
    'mini_golf':      ('mini_golf',      'mkbe.rel_mini_golf.rel'),
    'mini_billiards': ('mini_billiards', 'mkbe.rel_mini_billiards.rel'),
    'sel_ngc':        ('sel_ngc_rel',    'mkbe.sel_ngc.rel'),
    'option':         ('option',         'mkbe.option.rel'),
    'test_mode':      ('test_mode',      'mkbe.test_mode.rel'),
}

SCRIPT = (
    'export DEVKITPPC=/c/devkitPro/devkitPPC PATH="/mingw64/bin:$PATH" '
    'TMP={tmp} TEMP={tmp}; cd "{tree}"; '
    'make OS=Windows_NT COMPILER_VERSION=1.1 HOSTCC=gcc CC_CHECK=true {target}'
)

FAILED = 9999


class BuildError(Exception):
    pass


def plf_of(target):
    """mkbe.rel_mini_golf.rel -> mkbe.rel_mini_golf.plf

    Only the SUFFIX may change. A plain .replace('.rel', '.plf') also rewrites
    the `mkbe.rel_` prefix the minigames carry, yielding mkbe.plf_mini_golf.plf.
    """
    return re.sub(r'\.rel$', '.plf', target)


def msys(path):
    """C:/tmp/x -> /c/tmp/x"""
    p = path.replace('\\', '/')
    if len(p) > 1 and p[1] == ':':
        p = '/' + p[0].lower() + p[2:]
    return p


def assert_c_definition(target_c, stem, label):
    """Refuse to score a label the file under test does not define in C.

    Trap 5, found by mini_fight in run 7: point --file at a file that does not
    contain --label and this prints a clean `MATCH (0 diffs)`. The label's real
    asm stub sits untouched in some other file and trivially matches itself, so
    the verdict is about that stub, not about the file you named. A forward
    declaration does not count -- that is exactly what fooled it.
    """
    try:
        with open(target_c, encoding='utf-8', errors='replace') as f:
            txt = f.read()
    except OSError as e:
        raise BuildError('cannot read %s: %s' % (target_c, e))

    inc = 'nonmatchings/%s/%s.s' % (stem, label)
    if inc in txt:
        raise BuildError(
            '%s still #includes %s, so %s is an ASM STUB here and any MATCH is '
            'trivial.' % (target_c, inc, label))

    m = re.search(r'(\w[\w \t*]*?)\b%s\s*\([^;{]*\)\s*\{' % re.escape(label), txt)
    if not m:
        raise BuildError(
            '%s does not DEFINE %s -- a forward declaration does not count. '
            'Scoring would report on whichever other file holds the stub, and '
            'that reports MATCH (trap 5).' % (target_c, label))
    if re.search(r'\basm\b', m.group(1)):
        raise BuildError('%s defines %s as an `asm` function; a MATCH is trivial.'
                         % (target_c, label))


def module_objects(tree, stem):
    """Every object make could link for this module."""
    return (glob.glob(os.path.join(tree, 'src', '%s*.c.o' % stem)) +
            glob.glob(os.path.join(tree, 'asm', '%s*.s.o' % stem)))


def build(tree, target, tmp, watch_file, stem=None):
    """Build, and prove it actually compiled watch_file. Returns the log.

    With `stem`, drops every object of the module rather than just the one
    under test -- slow, but the only honest basis for a golden-hash claim.
    """
    junk = [os.path.join(tree, target), os.path.join(tree, plf_of(target))]
    junk += (module_objects(tree, stem) if stem
             else [os.path.join(tree, watch_file + '.o')])
    for j in junk:
        try:
            os.remove(j)
        except FileNotFoundError:
            pass

    r = subprocess.run(
        [BASH, '-lc', SCRIPT.format(tmp=tmp, tree=msys(tree), target=target)],
        cwd=tree, capture_output=True, text=True)
    log = (r.stdout or '') + (r.stderr or '')

    if not log.strip():
        raise BuildError(
            'build produced NO OUTPUT (rc %d). This is trap 1: the command '
            'never ran. Never use shell=True on Windows.' % r.returncode)
    if re.search(r'^#\s+Error|Errors caused tool to abort', log, re.M):
        tail = '\n'.join(log.strip().split('\n')[-12:])
        raise BuildError('compile error:\n' + tail)
    if watch_file:
        base = watch_file.replace('\\', '/').split('/')[-1]
        if not re.search(r'Compiling\s+\S*' + re.escape(base), log):
            raise BuildError(
                '%s was never recompiled (trap 2/3: stale object). Any diff now '
                'describes the PREVIOUS build.' % watch_file)
    if not os.path.exists(os.path.join(tree, target)):
        raise BuildError('build finished but %s does not exist' % target)
    return log


def score(tree, stem, target, label):
    """Diff count for one function, or FAILED if rel_fdiff gave no verdict."""
    env = dict(os.environ, FDIFF_MODULE=stem, FDIFF_REPO=tree)
    plf = plf_of(target)
    r = subprocess.run([sys.executable, os.path.join(REPO, 'tools', 'rel_fdiff.py'),
                        plf, label],
                       cwd=tree, capture_output=True, text=True, env=env)
    out = (r.stdout or '') + (r.stderr or '')
    if 'MATCH' in out:
        return 0, out
    m = re.search(r'(\d+)\s*diff', out)
    if m:
        return int(m.group(1)), out
    return FAILED, out + '\n(no MATCH/DIFF verdict -- treat as no result)'


# --------------------------------------------------------------------------
# ALIGNED scoring.  Run 8 found four separate ways that ranking a sweep on the
# RAW count hands you the wrong winner; run 9 found that FIVE agents had each
# written their own aligned sweeper to work around it (asweep.py, asw9.py,
# pasweep.py, h.py, ...).  This is that, in the tool.
#
#   mini_fight lbl_0000EA10  the MATCHING variant scored raw 116 against a
#                            non-match at 63 -- ranked 53 places worse, and
#                            thrown away.  Re-ranking recovered 121 insn.
#   mini_golf  lbl_000240C0  winning variant raw 319, aligned 0.
#   test_mode  lbl_0000F7BC  best variant raw 75, bottom of every sweep.
#
# A raw count compares word i against word i, so ONE inserted instruction
# shifts the whole tail and a 3-instruction miss reads as 197.
#
# But do NOT read the aligned number as proof of proximity either (run 9,
# mini_golf lbl_0000FBC8): three structurally WRONG variants scored 4 while the
# variant whose instructions match exactly scored 9.  Rank on aligned, then
# READ THE TOP FEW with tools/rel_regions.py.
# --------------------------------------------------------------------------
_RF = None


def _fdiff_module(tree, stem):
    """rel_fdiff exec'd in-process, bound to `tree`'s asm and this stem."""
    global _RF
    os.environ['FDIFF_MODULE'] = stem
    os.environ['FDIFF_REPO'] = tree
    path = os.path.join(REPO, 'tools', 'rel_fdiff.py')
    src = open(path).read().replace('\nmain()', '')
    rf = type(sys)('rf')
    rf.__dict__['__file__'] = path
    exec(compile(src, 'rel_fdiff', 'exec'), rf.__dict__)
    _RF = rf
    return rf


def nz_at(w, i, n):
    """Mask only the branch displacements the LINKER relocates.

    Must stay identical to rel_ascore.nz_at and rel_regions.nz_at.  The old
    rule masked every b/bc/bl, which made a control variant that only changed a
    branch target -- or which function is called -- score identical to
    baseline.  Four agents' controls failed that way in run 9, and each read
    the result as "mwcc canonicalises this axis".  An intra-function branch is
    PC-relative and self-consistent, so keep it and compare it.
    """
    op = w >> 26
    if op == 16:
        d = w & 0x0000FFFC
        if d & 0x8000:
            d -= 0x10000
    elif op == 18:
        d = w & 0x03FFFFFC
        if d & 0x02000000:
            d -= 0x04000000
    else:
        return w
    if w & 2:
        return w & 0xFC000003
    tgt = i + d // 4
    if 0 <= tgt < n and not (w & 1):
        return w
    return w & 0xFC000003


def ascore(tree, stem, target, label):
    """(aligned, raw, regions, span) for one function; FAILED on no result."""
    import difflib
    rf = _RF or _fdiff_module(tree, stem)
    plf = os.path.join(tree, plf_of(target))
    try:
        text = rf.load_text(plf)
        addrs = rf.load_map(os.path.splitext(plf)[0] + '.map')
        rows = rf.load_asm(label)
    except (OSError, SystemExit, ValueError) as e:
        return FAILED, FAILED, 0, '(%s)' % e
    if label not in addrs:
        return FAILED, FAILED, 0, '(not in map)'
    n = len(rows)
    base = addrs[label]
    exp = [r[1] for r in rows]
    got = [int.from_bytes(text[base + 4 * i:base + 4 * i + 4], 'big')
           for i in range(n)]
    e = [nz_at(x, i, n) for i, x in enumerate(exp)]
    g = [nz_at(x, i, n) for i, x in enumerate(got)]
    raw = sum(1 for x, y in zip(e, g) if x != y)
    sm = difflib.SequenceMatcher(None, e, g, autojunk=False)
    ops = [o for o in sm.get_opcodes() if o[0] != 'equal']
    tot = sum(max(i2 - i1, j2 - j1) for _, i1, i2, j1, j2 in ops)
    # RUN 10 (mini_fight): difflib latches onto an off-diagonal matching block
    # when the words repeat -- as real asm does -- and then pays insert+delete
    # for everything around it.  A pure register renaming with raw 101 reported
    # ALIGNED 387, and this sweep ranked the correct variant LAST three times.
    # When the lengths are equal, the identity alignment costs exactly `raw`, so
    # the true edit cost can never exceed it.  See rel_ascore.score for the full
    # note; the two must stay in agreement.
    if len(e) == len(g) and raw < tot:
        tot = raw
        ops, i, n = [], 0, len(e)
        while i < n:
            if e[i] != g[i]:
                j = i
                while j < n and e[j] != g[j]:
                    j += 1
                ops.append(('replace', i, j, i, j))
                i = j
            else:
                i += 1
    if ops:
        lo = min(o[1] for o in ops)
        hi = max(o[2] for o in ops)
        span = 'span %d-%d of %d' % (lo, hi, n)
    else:
        span = ''
    return tot, raw, len(ops), span


OBJDUMP = 'C:/devkitPro/devkitPPC/bin/powerpc-eabi-objdump.exe'


def section_audit(tree, stem):
    """Non-.text sections in each of the module's objects.

    sel_ngc, run 7: rel_fdiff locates a function by symbol, so a per-function
    MATCH survives things that wreck the module layout -- an extra out-of-line
    copy of a helper declared plain `static` instead of `static inline`, or an
    unexpected .rodata. Both pass the per-function gate while the REL hashes
    non-golden, with nothing to point at.

    Run 6's rule makes this readable: a pure-C object that reads pool constants
    EXTERNALLY emits no .rodata at all, so .rodata on a converted object means
    either a real int->float conversion (which needs a carve) or something
    unintended -- `#include <math.h>` alone emits 16 bytes for an inline sqrt's
    0.5 and 3.0, and that cost sel_ngc a golden hash.
    """
    rows = []
    for obj in sorted(module_objects(tree, stem)):
        r = subprocess.run([OBJDUMP, '-h', obj], capture_output=True, text=True)
        secs = []
        for m in re.finditer(r'^\s*\d+\s+(\.\S+)\s+([0-9a-f]+)', r.stdout, re.M):
            name, size = m.group(1), int(m.group(2), 16)
            if size and name not in ('.text', '.comment', '.debug_info'):
                if not name.startswith(('.debug', '.rela', '.line', '.stab')):
                    secs.append('%s 0x%x' % (name, size))
        if secs:
            rows.append((os.path.basename(obj), secs))
    return rows


def golden_sha1(target):
    """The expected hash for one artifact, from the repo's manifest."""
    with open(os.path.join(REPO, 'supermonkeyball.sha1')) as f:
        for line in f:
            parts = line.split()
            if len(parts) == 2 and parts[1] == target:
                return parts[0]
    return None


def gate(tree, stem, target, tmp):
    """Full rebuild from DELETED objects, then compare against the manifest."""
    want = golden_sha1(target)
    if want is None:
        print('no manifest entry for %s -- cannot gate' % target)
        return 2
    n = len(module_objects(tree, stem))
    print('deleting %d module object(s) and rebuilding %s from scratch...'
          % (n, target))
    try:
        build(tree, target, tmp, None, stem=stem)
    except BuildError as e:
        print('NO RESULT -- %s' % e)
        return 2
    with open(os.path.join(tree, target), 'rb') as f:
        got = hashlib.sha1(f.read()).hexdigest()
    if got == want:
        print('GOLDEN  %s  %s' % (got, target))
        return 0
    print('NOT GOLDEN\n  got  %s\n  want %s' % (got, want))
    rows = section_audit(tree, stem)
    if rows:
        print('\nobjects carrying non-.text sections -- a converted pure-C object\n'
              'reading its pool externally should have NONE:')
        for name, secs in rows:
            print('  %-34s %s' % (name, ', '.join(secs)))
        print('Expect only the module stub and any carve-hole owner here. An\n'
              'unexpected .rodata is usually an int->float conversion needing a\n'
              'carve, or an #include that emitted constants (math.h emits 16\n'
              'bytes for an inline sqrt even if unused).')
    return 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('--file', help='the .c under test, repo-relative')
    ap.add_argument('--label', help='function to score')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--tmp', help='defaults to C:/tmp/tmp_<module>')
    ap.add_argument('--sweep', help='directory of candidate bodies to try')
    ap.add_argument('--install-best', action='store_true',
                    help='leave the best-scoring variant in place afterwards '
                         'instead of restoring the pre-sweep file')
    ap.add_argument('--gate', action='store_true',
                    help='rebuild with ALL module objects deleted and check the '
                         'golden sha1; the only valid proof of a match')
    args = ap.parse_args()

    stem, target = MODULES[args.module]
    tree = args.tree or 'C:/tmp/smbm/%s' % args.module
    tmp = args.tmp or 'C:/tmp/tmp_%s' % args.module

    if args.gate:
        return gate(tree, stem, target, tmp)
    if not (args.file and args.label):
        ap.error('--file and --label are required unless --gate is given')
    target_c = os.path.join(tree, args.file)

    if not args.sweep:
        try:
            assert_c_definition(target_c, stem, args.label)
            build(tree, target, tmp, args.file)
        except BuildError as e:
            print('NO RESULT -- %s' % e)
            return 2
        n, out = score(tree, stem, target, args.label)
        print(out.strip())
        al, raw, regs, span = ascore(tree, stem, target, args.label)
        if al is not FAILED and al != FAILED:
            print('\n%s: RAW %d   ALIGNED %d   (%d edit region%s)  %s'
                  % (args.label, raw, al, regs, '' if regs == 1 else 's', span))
            if al:
                print('Read the regions before grinding: '
                      'python tools/rel_regions.py %s %s %s'
                      % (args.module, plf_of(target), args.label))
        else:
            print('\n%s: %s' % (args.label,
                                'MATCH' if n == 0 else '%d diffs (raw)' % n))
        return 0 if n == 0 else 1

    variants = sorted(f for f in os.listdir(args.sweep) if f.endswith('.c'))
    if not variants:
        sys.exit('no .c variants in %s' % args.sweep)
    backup = target_c + '.sweepbak'
    shutil.copy2(target_c, backup)
    results = []
    try:
        for v in variants:
            shutil.copy2(os.path.join(args.sweep, v), target_c)
            raw, regs, span = FAILED, 0, ''
            try:
                assert_c_definition(target_c, stem, args.label)
                build(tree, target, tmp, args.file)
                # RANK ON ALIGNED, not raw (see ascore above).  The raw number
                # is still printed so old reports remain comparable, but it is
                # never what sorts the table.
                n, raw, regs, span = ascore(tree, stem, target, args.label)
            except BuildError as e:
                n = FAILED
                print('  %-40s BUILD FAILED: %s' % (v, str(e).split('\n')[0]))
            results.append((n, v, raw, regs, span))
            if n != FAILED:
                print('  %-40s %-5s  (raw %d, %d region%s) %s'
                      % (v, 'MATCH' if n == 0 else n, raw, regs,
                         '' if regs == 1 else 's', span))
    finally:
        # Trap 4.  shutil.move of a copy2 backup restores the ORIGINAL mtime,
        # which is older than the last variant's .o, so make skips the recompile
        # and every later build links that variant instead of the file on disk.
        best = min(results)[1] if results and min(results)[0] != FAILED else None
        if args.install_best and best:
            shutil.copyfile(os.path.join(args.sweep, best), target_c)
        else:
            shutil.copyfile(backup, target_c)
        os.utime(target_c, None)
        os.remove(backup)
        try:
            os.remove(target_c + '.o')
        except FileNotFoundError:
            pass

    print('\n=== ranked (ALIGNED) ===')
    for n, v, raw, regs, span in sorted(results):
        print('  %-6s %-40s raw %-5s %s'
              % ('MATCH' if n == 0 else (n if n != FAILED else 'FAIL'), v,
                 raw if raw != FAILED else '-', span))
    print('An aligned score is not proof of proximity -- run 9 had three '
          'structurally WRONG\nvariants at 4 and the exactly-right one at 9. '
          'Read the top few:\n  python tools/rel_regions.py %s %s %s'
          % (args.module, plf_of(target), args.label))

    # An all-identical column USED to exit 2 as trap 1's signature. It is a false
    # alarm: build() already refuses to score a file it cannot see `Compiling` for,
    # so trap 1 is closed by construction, and canonical variant sets legitimately
    # score alike -- in run 6 this fired 3-6 times per agent, including on a set
    # where all 12 permutations MATCHed. Advisory only now; gate on --gate.
    real = [r[0] for r in results if r[0] != FAILED]
    if len(real) > 1 and len(set(real)) == 1 and real[0] != 0:
        print('\n(note: every variant scored %d. Usually means mwcc canonicalises '
              'these spellings. To prove the builds are real, add a deliberately '
              'wrong control variant and confirm it scores differently.)' % real[0])
    # Trap 6, run 7 (mini_bowling): the sweep RESTORES the pre-sweep content when
    # it finishes, so a winning variant is discarded and the file on disk is the
    # asm stub again. Its first "9 matches" gate ran with one file silently
    # reverted. Never let that be silent.
    if best is None:
        pass
    elif args.install_best:
        print('\ninstalled the best variant: %s -> %s' % (best, args.file))
    else:
        win = os.path.join(args.sweep, best).replace('\\', '/')
        dst = target_c.replace('\\', '/')
        print('\n!! %s HAS BEEN RESTORED to its pre-sweep content -- the winning\n'
              '   variant is NOT installed. Install it before gating:\n'
              "     cp '%s' '%s' && rm -f '%s.o'\n"
              '   or re-run with --install-best.' % (args.file, win, dst, dst))

    if not any(r[0] == 0 for r in results):
        return 1
    print('\na MATCH here is NOT a match. Confirm with: '
          'python tools/rel_sweep.py %s --gate' % args.module)
    return 0


if __name__ == '__main__':
    sys.exit(main())
