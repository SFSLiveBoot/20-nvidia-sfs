#!/bin/sh

set -e
. "$(dirname "$0")/.common.sh"

test -z "$debian_pkgs" ||
  "$lbu/scripts/apt-sfs.sh" "$DESTDIR" $debian_pkgs
