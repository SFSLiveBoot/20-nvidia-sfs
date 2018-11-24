: "${lbu:=/opt/LiveBootUtils}"
. "$lbu/scripts/common.func"

: "${dist_url:=https://www.nvidia.com/object/unix.html}"
: "${nv_arch:=Linux-x86_64}"

installed_ver() {
  readlink "$DESTDIR/opt/nvidia" | sed -e "s/^NVIDIA-${nv_arch}-//"
}

latest_ver() {
  grep "Latest Long Lived Branch Version" "$(dl_file "$dist_url")" | grep -Eo '[0-9]+\.[0-9]+' | head -1 
}

latest_url() {
  echo "http://us.download.nvidia.com/XFree86/${nv_arch}/$(latest_ver)/NVIDIA-${nv_arch}-$(latest_ver).run"
}
