install_awesome_window_manager() {
  echo "[debian-setup] Installing Awesome window manager"

  sudo apt update >/dev/null
  sudo apt install -y gir1.2-rsvg-2.0 git >/dev/null
  sudo apt build-dep -y awesome >/dev/null

  local SOURCE_DIR="$HOME/awesome"

  git clone --quiet https://github.com/awesomewm/awesome "$SOURCE_DIR"

  make -C "$SOURCE_DIR" package >/dev/null

  sudo apt install -y "$SOURCE_DIR/build/*.deb" >/dev/null

  rm -rf "$SOURCE_DIR"
}
