add_flathub_repository_to_flatpak() {
  echo "[debian-setup] Adding Flathub repository to Flatpak"

  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

install_flatpak_packages() {
  echo "[debian-setup] Installing Flatpak packages"

  local FLATPAK_PACKAGES=(
    "com.brave.Browser"           # default web browser
    "com.github.tchx84.Flatseal"  # manage flatpak permissions
    "org.keepassxc.KeePassXC"     # accounts
    "org.qbittorrent.qBittorrent" # bittorrent client
  )

  flatpak install flathub -y "${FLATPAK_PACKAGES[@]}" >/dev/null
}
