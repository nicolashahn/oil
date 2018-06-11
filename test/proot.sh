#!/bin/bash
#
# Usage:
#   ./proot.sh <function name>

set -o nounset
set -o pipefail
set -o errexit

# permission problems
demo() {
  proot --rootfs=_chroot/proot1 /bin/ls --version
}

prepare() {
  sudo chown --verbose --recursive andy _chroot/proot1
}

"$@"
