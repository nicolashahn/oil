#!/bin/bash
#
# Usage:
#   ./proot.sh <function name>

set -o nounset
set -o pipefail
set -o errexit

# permission problems
demo() {
  # Wow this is necessary to avoid segfault!
  # https://github.com/proot-me/PRoot/issues/106
  export PROOT_NO_SECCOMP=1

  # 'whoami' shows unknown UID.
  # --pwd avoids a warning.
  proot --rootfs=_chroot/proot1 --pwd=/ /bin/sh -c 'whoami; ls /'

  #proot --rootfs=_chroot/proot1 /bin/ls --version
}

# Copied from _chroot/alpine1.
prepare() {
  sudo chown --verbose --recursive andy _chroot/proot1
}

"$@"
