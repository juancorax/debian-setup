add_flathub_repository_to_flatpak() {
  display_header "Adding Flathub repository to Flatpak"

  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

install_flatpak_packages() {
  display_header "Installing Flatpak packages"

  local FLATPAK_PACKAGES=(
    "com.github.tchx84.Flatseal"                      # manage flatpak permissions
    "io.github.ungoogled_software.ungoogled_chromium" # default web browser
    "org.keepassxc.KeePassXC"                         # accounts
    "org.qbittorrent.qBittorrent"                     # bittorrent client
  )

  flatpak install flathub -y "${FLATPAK_PACKAGES[@]}"
}
