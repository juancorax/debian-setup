install_st_terminal_emulator() {
  display_header "Installing st terminal emulator"

  local SOURCE_DIR="$HOME/st-flexipatch"
  local ST_PATCHES=(
    "ANYSIZE_PATCH"
    "BOLD_IS_NOT_BRIGHT_PATCH"
    "SCROLLBACK_PATCH"
    "XRESOURCES_PATCH"
  )

  git clone https://github.com/bakkeby/st-flexipatch.git "$SOURCE_DIR"

  for patch in "${ST_PATCHES[@]}"; do
    sed -i "s/\($patch\) 0/\1 1/" "$SOURCE_DIR/patches.def.h"
  done

  sudo make -C "$SOURCE_DIR" clean install

  rm -rf "$SOURCE_DIR"

  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 50
}
