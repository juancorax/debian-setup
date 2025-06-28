install_fzf_fuzzy_finder() {
  echo "[debian-setup] Installing fzf fuzzy finder"

  local SOURCE_DIR="$HOME/.fzf"

  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git "$SOURCE_DIR"

  "$SOURCE_DIR/install --key-bindings --completion --no-update-rc" >/dev/null

  rm -rf "$SOURCE_DIR"
}
