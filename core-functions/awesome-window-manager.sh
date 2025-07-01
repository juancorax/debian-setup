install_awesome_window_manager() {
  display_header "Installing Awesome window manager"

  sudo apt update
  sudo apt install -y gir1.2-rsvg-2.0 git libxcb-xfixes0-dev
  sudo apt build-dep -y awesome

  local SOURCE_DIR="$HOME/awesome"

  git clone https://github.com/awesomewm/awesome "$SOURCE_DIR"

  make -C "$SOURCE_DIR" package

  sudo apt install -y "$SOURCE_DIR"/build/*.deb

  rm -rf "$SOURCE_DIR"
}
