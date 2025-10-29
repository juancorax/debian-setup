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
  sudo apt install -y python3-pip python3-venv maim xclip

  local SOURCE_DIR="$HOME/transformers_ocr"

  git clone https://github.com/Ajatt-Tools/transformers_ocr.git "$SOURCE_DIR"

  sudo make -C "$SOURCE_DIR" install

  rm -rf "$SOURCE_DIR"
}

install_visual_novel_requirements() {
  display_header "Installing visual novel requirements"

  local APT_PACKAGES=(
    "p7zip-full"
    "unrar"
  )
  local FLATPAK_PACKAGES=(
    "net.davidotek.pupgui2"
    "net.lutris.Lutris"
  )
  local WINE_PREFIXES_DIR="$HOME/visual-novels/wine-prefixes"
  local WINE_PREFIXES=(
    "ffdshow"
    "lavfilters"
    "mciqtz32"
    "proton_ge"
    "quartz_dx"
    "vanilla"
    "wmp10quartz"
    "wmp11"
    "wmp11quartz"
    "xact"
  )

  sudo apt update
  sudo apt install -y "${APT_PACKAGES[@]}"

  flatpak install flathub -y "${FLATPAK_PACKAGES[@]}"

  git clone https://github.com/b-fission/vn_winestuff.git "$WINE_PREFIXES_DIR/vn_winestuff"

  for wine_prefix in "${WINE_PREFIXES[@]}"; do
    mkdir -p "$WINE_PREFIXES_DIR/$wine_prefix"
  done
}
