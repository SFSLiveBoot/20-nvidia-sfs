#!/bin/sh

providerlist="$(xrandr --listproviders)"

case "$providerlist" in *name:NVIDIA-0*)
  case "$providerlist" in *name:modesetting*)
    for id in $(echo "$providerlist" | awk '/name:modesetting/{print $2}' | cut -f1 -d:);do
      (set -x; xrandr --setprovideroutputsource $id NVIDIA-0)
    done
  ;; esac
;; esac
