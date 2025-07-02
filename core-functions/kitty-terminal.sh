install_kitty_terminal() {
  display_header "Installing Kitty terminal"

  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

  local INSTALL_DIR="$HOME/.local/kitty.app"
  local EXEC_FILES_DIR="$HOME/.local/bin"
  local DESKTOP_FILES_DIR="$HOME/.local/share/applications"

  mkdir -p "$EXEC_FILES_DIR" "$DESKTOP_FILES_DIR"
  ln -sf "$INSTALL_DIR"/bin/{kitty,kitten} "$EXEC_FILES_DIR"
  cp "$INSTALL_DIR"/share/applications/kitty{,-open}.desktop "$DESKTOP_FILES_DIR"

  sed -i "s|Icon=kitty|Icon=$INSTALL_DIR/share/icons/hicolor/256x256/apps/kitty.png|g" "$DESKTOP_FILES_DIR"/kitty*.desktop
  sed -i "s|Exec=kitty|Exec=$INSTALL_DIR/bin/kitty|g" "$DESKTOP_FILES_DIR"/kitty*.desktop
}
