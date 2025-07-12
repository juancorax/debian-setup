install_laptop_battery_optimizer() {
  display_header "Installing laptop battery optimizer"

  sudo apt update
  sudo apt install -y git

  local SOURCE_DIR="$HOME/auto-cpufreq"

  git clone https://github.com/AdnanHodzic/auto-cpufreq.git "$SOURCE_DIR"
  sudo "$SOURCE_DIR"/auto-cpufreq-installer --install

  sudo auto-cpufreq --install

  rm -rf "$SOURCE_DIR"
}
