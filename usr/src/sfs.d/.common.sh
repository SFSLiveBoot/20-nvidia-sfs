: "${lbu:=/opt/LiveBootUtils}"
. "$lbu/scripts/common.func"

: "${dist_url:=https://www.nvidia.com/object/unix.html}"
: "${nv_arch:=Linux-x86_64}"

installed_ver() {
  readlink "$DESTDIR/usr/lib/nvidia/current" | sed -e "s/^NVIDIA-${nv_arch}-//"
}

latest_ver() {
  grep -Eo 'Latest Production[^0-9]*?<a [^>]*>[^<]+</a>' "$(dl_file "$dist_url")" | grep -o '<a [^>]*>.*</a>' | cut -f2 -d'>' | cut -f1 -d'<' | head -1 | tr -d '[[:space:]]'
}

latest_url() {
  echo "http://us.download.nvidia.com/XFree86/${nv_arch}/$(latest_ver)/NVIDIA-${nv_arch}-$(latest_ver).run"
}
