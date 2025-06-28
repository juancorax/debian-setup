install_tmux_plugins() {
  echo "[debian-setup] Installing Tmux plugins"

  git clone --quiet https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  "$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null
}
