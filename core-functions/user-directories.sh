create_user_directories() {
  display_header "Creating user directories"

  sudo apt update
  sudo apt install -y xdg-user-dirs

  xdg-user-dirs-update
}
