install_rtl8192eu_driver() {
  display_header "Installing Realtek RTL8192EU driver"

  local DEPENDENCIES=(
    "build-essential"
    "dkms"
    "git"
    "linux-headers-generic"
  )
  local SOURCE_DIR="$HOME/rtl8192eu-linux"

  sudo apt update
  sudo apt install -y "${DEPENDENCIES[@]}"

  git clone https://github.com/clnhub/rtl8192eu-linux.git "$SOURCE_DIR"
  "$SOURCE_DIR/install_wifi.sh"

  rm -rf "$SOURCE_DIR"
}
