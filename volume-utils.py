#! /usr/bin/env python3

import subprocess
from subprocess import PIPE
import json
import sys


inspect_volume_args = ["sudo", "docker", "volume", "inspect", "korp-docker_corpora"]
print(" ".join(inspect_volume_args))
p = subprocess.run(inspect_volume_args, check=True, encoding='utf-8', stdout=PIPE)
docker_output = p.stdout
print(docker_output)

a = json.loads(docker_output)
mount_path = a[0]['Mountpoint']


if sys.argv[1] == 'decompress':
    decompress_args = ["sudo", "tar", "xf", "Dickens-1.0.tar.xz", "-C", mount_path, '--strip', '1']
    print(" ".join(decompress_args))
    p = subprocess.run(decompress_args, check=True, encoding='utf-8')
elif sys.argv[1] == 'clear':
    clear_args = ["sudo", "rm", "-rf", str(Path(mount_path) / "*")]
    print(" ".join(clear_args))
    p = subprocess.run(clear_args, check=True, encoding='utf-8')
