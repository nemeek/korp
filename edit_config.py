"""
This file assumes the work directory to be root directory of korp-backend
"""
from pathlib import Path
from typing import Tuple


def find_binary_paths() -> Tuple[Path, Path]:
    """
    this function finds CQP_EXECUTABLE and CWB_SCAN_EXECUTABLE paths

    cqp binary is usually here: /usr/local/cwb-X.X.X/bin/cqp
    cwb-scan-corpus binary is usually here: /usr/local/cwb-X.X.X/cwb-scan-corpus

    This function determines the cwb version by searching under /usr/local/ directory
    """
    for p in Path('/usr/local').glob('*'):
        if p.is_dir() and p.name.startswith('cwb-'):
            return p / 'bin' / 'cqp', p / 'bin' / 'cwb-scan-corpus'



cqp_executable_path, cwb_scan_executable_path = find_binary_paths()

config_file_text = Path('config.py.template').read_text()
new_text = config_file_text.replace("CQP_EXECUTABLE = \"\"", f"CQP_EXECUTABLE = \"{cqp_executable_path}\"")
new_text = new_text.replace("CWB_SCAN_EXECUTABLE = \"\"", f"CWB_SCAN_EXECUTABLE = \"{cwb_scan_executable_path}\"")


Path('config.py').write_text(new_text)


