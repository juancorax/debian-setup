install_fzf_fuzzy_finder() {
  display_header "Installing fzf fuzzy finder"

  local SOURCE_DIR="$HOME/.fzf"

  git clone --depth 1 https://github.com/junegunn/fzf.git "$SOURCE_DIR"

  "$SOURCE_DIR"/install --key-bindings --completion --no-update-rc

  rm -rf "$SOURCE_DIR"
}
