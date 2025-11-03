install_auto_cpufreq() {
  display_header "Installing auto-cpufreq"

  sudo apt update
  sudo apt install -y git

  local SOURCE_DIR="$HOME/auto-cpufreq"

  git clone https://github.com/AdnanHodzic/auto-cpufreq.git "$SOURCE_DIR"
  sudo "$SOURCE_DIR"/auto-cpufreq-installer --install

  sudo auto-cpufreq --install

  rm -rf "$SOURCE_DIR"
}

install_brightnessctl() {
  display_header "Installing brightnessctl"

  sudo apt update
  sudo apt install -y brightnessctl

  brightnessctl set 25%
}
