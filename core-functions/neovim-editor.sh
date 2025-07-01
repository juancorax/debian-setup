install_neovim_editor() {
  display_header "Installing Neovim editor"

  local NEOVIM_TARBALL_URL=https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
  local SHA256_CHECKSUMS_URL=https://github.com/neovim/neovim/releases/download/stable/shasum.txt

  wget -P "$HOME" "$NEOVIM_TARBALL_URL" "$SHA256_CHECKSUMS_URL"

  local NEOVIM_TARBALL
  NEOVIM_TARBALL="$HOME/$(basename "$NEOVIM_TARBALL_URL")"
  local SHA256_CHECKSUMS
  SHA256_CHECKSUMS="$HOME/$(basename "$SHA256_CHECKSUMS_URL")"
  local NEOVIM_DIR
  NEOVIM_DIR="$HOME/$(basename -s ".tar.gz" "$NEOVIM_TARBALL_URL")"

  local NEOVIM_SHA256_CHECKSUM
  NEOVIM_SHA256_CHECKSUM=$(sha256sum "$NEOVIM_TARBALL" | awk '{print $1}')

  if grep -q "$NEOVIM_SHA256_CHECKSUM" "$SHA256_CHECKSUMS"; then
    tar xzf "$NEOVIM_TARBALL" -C "$HOME"

    ln -sf "$NEOVIM_DIR/bin/nvim" "$HOME/.local/bin/"
  fi

  rm -rf "$NEOVIM_TARBALL" "$SHA256_CHECKSUMS"
}
