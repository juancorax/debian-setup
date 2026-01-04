install_dev_tools() {
  display_header "Installing dev tools"

  curl https://mise.run | sh

  eval "$(~/.local/bin/mise activate bash)"
  mise install
}
