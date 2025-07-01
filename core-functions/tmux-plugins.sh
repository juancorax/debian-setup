install_tmux_plugins() {
  display_header "Installing Tmux plugins"

  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
}
