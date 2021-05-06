: "${lbu:=/opt/LiveBootUtils}"
. "$lbu/scripts/common.func"

: "${dist_url:=https://www.nvidia.com/object/unix.html}"
: "${nv_arch:=Linux-x86_64}"

installed_ver() {
  readlink "$DESTDIR/opt/nvidia" | sed -e "s/^NVIDIA-${nv_arch}-//"
}

latest_ver() {
  sed -Ene '/Latest Production Branch Version: <a /{s/.*Latest Production Branch Version: <a[^>]*>//;s/<.*//;p;q}' "$(dl_file "$dist_url")"
}

latest_url() {
  echo "http://us.download.nvidia.com/XFree86/${nv_arch}/$(latest_ver)/NVIDIA-${nv_arch}-$(latest_ver).run"
}
