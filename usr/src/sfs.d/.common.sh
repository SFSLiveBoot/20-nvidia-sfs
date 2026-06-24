: "${lbu:=/opt/LiveBootUtils}"
. "$lbu/scripts/common.func"

: "${nv_arch:=Linux-x86_64}"
: "${dl_base:=https://download.nvidia.com/XFree86/${nv_arch}}"
: "${latest_ver_url:=${dl_base}/latest.txt}"

: "${debian_pkgs:=nvidia-suspend-common}"

installed_ver() {
  readlink "$DESTDIR/usr/lib/nvidia/current" | sed -e "s/^NVIDIA-${nv_arch}-//"
}

latest_ver() {
  test -n "$latest_ver" || {
    if test -n "$major_ver" ;then
      latest_ver="$(grep -o '<a href[^>]*>[^/<]*/' "$(dl_file "$dl_base/")" | cut -f2 -d'>' | cut -f1 -d/ | sort -V | grep "^$major_ver\." | tail -1)"
    else
      latest_ver="$(cut -f1 -d" " "$(dl_file "$latest_ver_url")")"
    fi
  }
  echo "$latest_ver"
}

latest_url() {
  : "${latest_url:=http://us.download.nvidia.com/XFree86/${nv_arch}/$(latest_ver)/NVIDIA-${nv_arch}-$(latest_ver).run}"
  echo "$latest_url"
}
