install_dev_tools_version_manager() {
  display_header "Installing dev tools version manager"

  curl https://mise.run | sh
}

install_dev_tools() {
  display_header "Installing dev tools"

  local LUA_DEPENDENCIES=(
    "build-essential"
    "linux-headers-$(uname -r)"
  )

  sudo apt update
  sudo apt install -y "${LUA_DEPENDENCIES[@]}"

  eval "$(~/.local/bin/mise activate bash)"
  mise install
}
