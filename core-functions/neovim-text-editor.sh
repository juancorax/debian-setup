install_neovim_text_editor() {
  display_header "Installing Neovim text editor"

  local DEPENDENCIES=(
    "build-essential"
    "cmake"
    "curl"
    "gettext"
    "git"
    "ninja-build"
  )

  sudo apt update
  sudo apt install -y "${DEPENDENCIES[@]}"

  local SOURCE_DIR="$HOME/neovim"

  git clone https://github.com/neovim/neovim "$SOURCE_DIR"

  make -C "$SOURCE_DIR" CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make -C "$SOURCE_DIR" install

  rm -rf "$SOURCE_DIR"
}
