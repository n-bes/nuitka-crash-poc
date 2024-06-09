# -*- coding: utf-8 -*-

import sys
import os
import subprocess

exit_code = subprocess.call(
    ['/usr/bin/python3', '-W', 'ignore', '/usr/local/lib/python3.10/dist-packages/nuitka/build/inline_copy/bin/scons.py', '-f', '/usr/local/lib/python3.10/dist-packages/nuitka/build/Backend.scons', '--jobs', '14', '--warn=no-deprecated', '--no-site-dir', '--debug=stacktrace', 'source_dir=.', 'nuitka_python=false', 'debug_mode=true', 'debugger_mode=false', 'python_debug=false', 'module_mode=true', 'full_compat=false', 'experimental=', 'trace_mode=false', 'file_reference_mode=runtime', 'module_count=2', 'debian_python=true', 'python_sysflag_utf8=true', 'result_exe=/code/module.cpython-310-aarch64-linux-gnu.so', 'nuitka_src=/usr/local/lib/python3.10/dist-packages/nuitka/build', 'python_version=3.10', 'python_prefix=/usr', 'no_deployment=', 'show_scons=true', 'unstripped_mode=true', 'target_arch=aarch64'],
    env={'HOME': '/root', 'LDFLAGS': '-fsanitize=hwaddress -fuse-ld=lld -g', 'CCFLAGS': '-fsanitize=hwaddress -fuse-ld=lld -g', 'PATH': '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin', 'CFLAGS': '-fsanitize=hwaddress -fuse-ld=lld -g', 'DEBIAN_FRONTEND': 'noninteractive', 'PWD': '/code', 'CC': 'clang', 'LC_CTYPE': 'C.UTF-8', 'NUITKA_BINARY_NAME': '/usr/local/lib/python3.10/dist-packages/nuitka/__main__.py', 'NUITKA_PACKAGE_HOME': '/usr/local/lib/python3.10/dist-packages', 'NUITKA_SYS_PREFIX': '/usr', 'NUITKA_SITE_FILENAME': '/usr/lib/python3.10/site.py', 'PYTHONHASHSEED': '0', 'NUITKA_REEXECUTION': '1', 'NUITKA_PYTHON_EXE_PATH': '/usr/bin/python3', 'NUITKA_PACKAGE_DIR': '/usr/local/lib/python3.10/dist-packages/nuitka', '_NUITKA_BUILD_DEFINITIONS_CATALOG': '_NUITKA_BUILD_DEFINITIONS_CATALOG', 'NUITKA_QUIET': '0'},
    shell=False
)