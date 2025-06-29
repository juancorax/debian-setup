enable_japanese_locale() {
  echo "[debian-setup] Enabling Japanese locale"

  sudo sed -i 's/^#[[:blank:]]*\(ja_JP.UTF-8[[:blank:]]*UTF-8\)/\1/' /etc/locale.gen
  sudo locale-gen

  flatpak config --system --set languages 'en;ja'
  flatpak config --user --set languages 'en;ja'
  flatpak update -y
}
