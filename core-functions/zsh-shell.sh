change_shell_to_zsh() {
  display_header "Changing the default shell to Zsh"

  chsh -s "$(command -v zsh)"
}

install_zsh_plugins() {
  display_header "Installing Zsh plugins"

  local PLUGINS_DIR="$HOME/.zsh"

  git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGINS_DIR/zsh-syntax-highlighting"
}
