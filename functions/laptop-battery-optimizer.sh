install_laptop_battery_optimizer() {
  echo "[debian-setup] Installing laptop battery optimizer"

  sudo apt update >/dev/null
  sudo apt install -y git >/dev/null

  local SOURCE_DIR="$HOME/auto-cpufreq"

  git clone --quiet https://github.com/AdnanHodzic/auto-cpufreq.git "$SOURCE_DIR"
  sudo "$SOURCE_DIR/auto-cpufreq-installer"

  sudo auto-cpufreq --install

  rm -rf "$SOURCE_DIR"
}
