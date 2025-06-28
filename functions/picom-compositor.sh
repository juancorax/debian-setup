install_picom_compositor() {
  echo "[debian-setup] Installing picom compositor"

  local DEPENDENCIES=(
    "git"
    "libconfig-dev"
    "libdbus-1-dev"
    "libegl-dev"
    "libepoxy-dev"
    "libev-dev"
    "libgl-dev"
    "libpcre2-dev"
    "libpixman-1-dev"
    "libx11-xcb-dev"
    "libxcb-composite0-dev"
    "libxcb-damage0-dev"
    "libxcb-glx0-dev"
    "libxcb-image0-dev"
    "libxcb-present-dev"
    "libxcb-randr0-dev"
    "libxcb-render-util0-dev"
    "libxcb-render0-dev"
    "libxcb-shape0-dev"
    "libxcb-util-dev"
    "libxcb-xfixes0-dev"
    "libxcb1-dev"
    "meson"
    "ninja-build"
    "uthash-dev"
  )

  sudo apt update >/dev/null
  sudo apt install -y "${DEPENDENCIES[@]}" >/dev/null

  local SOURCE_DIR="$HOME/picom"
  local BUILD_DIR="$SOURCE_DIR/build"

  git clone --quiet https://github.com/yshui/picom.git "$SOURCE_DIR"

  meson setup --buildtype=release "$BUILD_DIR" "$SOURCE_DIR" >/dev/null
  ninja -C "$BUILD_DIR" >/dev/null

  sudo ninja -C "$BUILD_DIR" install >/dev/null

  rm -rf "$SOURCE_DIR"
}
