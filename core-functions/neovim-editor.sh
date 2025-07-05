install_neovim_editor() {
  display_header "Installing Neovim editor"

  local NEOVIM_TARBALL SHA256_CHECKSUMS NEOVIM_DIR NEOVIM_SHA256_CHECKSUM

  local NEOVIM_TARBALL_URL=https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
  local SHA256_CHECKSUMS_URL=https://github.com/neovim/neovim/releases/download/stable/shasum.txt

  wget -P "$HOME" "$NEOVIM_TARBALL_URL" "$SHA256_CHECKSUMS_URL"

  NEOVIM_TARBALL="$HOME/$(basename "$NEOVIM_TARBALL_URL")"
  SHA256_CHECKSUMS="$HOME/$(basename "$SHA256_CHECKSUMS_URL")"
  NEOVIM_DIR="$HOME/$(basename -s ".tar.gz" "$NEOVIM_TARBALL_URL")"

  NEOVIM_SHA256_CHECKSUM=$(sha256sum "$NEOVIM_TARBALL" | awk '{print $1}')

  if grep -q "$NEOVIM_SHA256_CHECKSUM" "$SHA256_CHECKSUMS"; then
    local EXEC_FILES_DIR="$HOME/.local/bin"

    tar xzf "$NEOVIM_TARBALL" -C "$HOME"

    mkdir -p "$EXEC_FILES_DIR"
    ln -sf "$NEOVIM_DIR/bin/nvim" "$EXEC_FILES_DIR"
  fi

  rm -rf "$NEOVIM_TARBALL" "$SHA256_CHECKSUMS"
}
