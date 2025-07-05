enable_japanese_locale() {
  display_header "Enabling Japanese locale"

  sudo sed -i 's/^#[[:blank:]]*\(ja_JP.UTF-8[[:blank:]]*UTF-8\)/\1/' /etc/locale.gen
  sudo locale-gen

  flatpak config --system --set languages 'en;ja'
  flatpak config --user --set languages 'en;ja'
  flatpak update -y
}

install_transformers_ocr() {
  display_header "Installing Transformers OCR"

  sudo apt update
  sudo apt install -y python3-pip maim xclip

  local SOURCE_DIR="$HOME/transformers_ocr"

  git clone https://github.com/Ajatt-Tools/transformers_ocr.git "$SOURCE_DIR"

  sudo make -C "$SOURCE_DIR" install

  rm -rf "$SOURCE_DIR"
}
