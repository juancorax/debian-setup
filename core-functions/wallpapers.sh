add_wallpapers() {
  display_header "Adding wallpapers"

  local SOURCE_DIR="$HOME/japan-wallpapers"

  git clone --depth 1 https://github.com/juancorax/japan-wallpapers.git "$SOURCE_DIR"

  mv "$SOURCE_DIR/wallpapers" "$HOME"

  rm -rf "$SOURCE_DIR"
}
