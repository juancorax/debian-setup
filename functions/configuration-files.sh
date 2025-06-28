add_configuration_files() {
  echo "[debian-setup] Adding configuration files"

  local STOW_DIR="$HOME/dotfiles"
  local TARGET_DIR="$HOME"

  git clone --quiet https://github.com/juancorax/dotfiles.git "$STOW_DIR"

  for package_directory in "$STOW_DIR"/*/; do
    package_name=$(basename "$package_directory")
    stow -d "$STOW_DIR" -t "$TARGET_DIR" "$package_name"
  done
}
