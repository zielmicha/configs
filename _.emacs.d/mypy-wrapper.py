#!/usr/bin/python2
import sys
import os
import subprocess

filename = os.path.realpath(sys.argv[1])

project_roots = [
    ('~/robocore/src', '~/robocore/src/stubs')
]

choosen_root = None
rel_path = None

for root, mypy_path in project_roots:
    root_abs = os.path.realpath(os.path.expanduser(root))
    if filename.startswith(root_abs):
        mypy_stub_abs = os.path.realpath(os.path.expanduser(mypy_path))
        if filename.startswith(mypy_stub_abs):
            choosen_root = mypy_stub_abs
            rel_path = filename[len(mypy_stub_abs):]
        else:
            choosen_root = root_abs
            rel_path = filename[len(root_abs):]
        break

if not choosen_root:
    sys.exit(0)

mod_name = rel_path[:-3].replace('/', '.').strip('.')

os.environ['MYPYPATH'] = os.path.expanduser(mypy_path) + ':' + choosen_root
sys.exit(subprocess.call(['mypy', '-m', mod_name]))
