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

--sweep takes a directory of candidate bodies, tries each in turn as <file>,
restores the original afterwards, and prints a ranked table. It exits nonzero
if every variant scored the same -- that is trap 1's signature, not a result.
"""
import argparse
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
    'TMP={tmp} TEMP={tmp}; cd {tree}; '
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


def build(tree, target, tmp, watch_file):
    """Build, and prove it actually compiled watch_file. Returns the log."""
    for junk in (os.path.join(tree, target),
                 os.path.join(tree, plf_of(target)),
                 os.path.join(tree, watch_file + '.o')):
        try:
            os.remove(junk)
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
    stem = watch_file.replace('\\', '/').split('/')[-1]
    if not re.search(r'Compiling\s+\S*' + re.escape(stem), log):
        raise BuildError(
            '%s was never recompiled (trap 2/3: stale object). Any diff now '
            'describes the PREVIOUS build.' % watch_file)
    if not os.path.exists(os.path.join(tree, target)):
        raise BuildError('build finished but %s does not exist' % target)
    return log


def score(tree, stem, target, label):
    """Diff count for one function, or FAILED if rel_fdiff gave no verdict."""
    env = dict(os.environ, FDIFF_MODULE=stem)
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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('module', choices=sorted(MODULES))
    ap.add_argument('--file', required=True, help='the .c under test, repo-relative')
    ap.add_argument('--label', required=True, help='function to score')
    ap.add_argument('--tree', help='defaults to C:/tmp/smbm/<module>')
    ap.add_argument('--tmp', help='defaults to C:/tmp/tmp_<module>')
    ap.add_argument('--sweep', help='directory of candidate bodies to try')
    args = ap.parse_args()

    stem, target = MODULES[args.module]
    tree = args.tree or 'C:/tmp/smbm/%s' % args.module
    tmp = args.tmp or 'C:/tmp/tmp_%s' % args.module
    target_c = os.path.join(tree, args.file)

    if not args.sweep:
        try:
            build(tree, target, tmp, args.file)
        except BuildError as e:
            print('NO RESULT -- %s' % e)
            return 2
        n, out = score(tree, stem, target, args.label)
        print(out.strip())
        print('\n%s: %s' % (args.label, 'MATCH' if n == 0 else '%d diffs' % n))
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
            try:
                build(tree, target, tmp, args.file)
                n, _ = score(tree, stem, target, args.label)
            except BuildError as e:
                n = FAILED
                print('  %-40s BUILD FAILED: %s' % (v, str(e).split('\n')[0]))
            results.append((n, v))
            if n != FAILED:
                print('  %-40s %s' % (v, 'MATCH' if n == 0 else '%d' % n))
    finally:
        shutil.move(backup, target_c)

    print('\n=== ranked ===')
    for n, v in sorted(results):
        print('  %-6s %s' % ('MATCH' if n == 0 else (n if n != FAILED else 'FAIL'), v))

    real = [n for n, _ in results if n != FAILED]
    if len(real) > 1 and len(set(real)) == 1:
        print('\n!! every variant scored %d. Different sources cannot produce '
              'identical output -- the builds are not happening. See trap 1.'
              % real[0])
        return 2
    return 0 if any(n == 0 for n, _ in results) else 1


if __name__ == '__main__':
    sys.exit(main())
