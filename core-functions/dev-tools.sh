install_dev_tools() {
  display_header "Installing dev tools"

  sudo apt update
  sudo apt install -y build-essential curl

  curl https://mise.run | sh

  eval "$(~/.local/bin/mise activate bash)"
  mise install
}
