install_apt_packages() {
  echo "[debian-setup] Installing APT packages"

  local PACKAGES=(
    "arandr"                # screen layout
    "bat"                   # replacement for cat
    "chrony"                # synchronize clock
    "curl"                  # kitty
    "exa"                   # replacement for ls
    "fcitx5"                # japanese input
    "fcitx5-mozc"           # japanese input
    "fd-find"               # fzf
    "feh"                   # wallpapers
    "flatpak"               # newer packages
    "git"                   # programming / dotfiles / tmux-plugins
    "libavcodec-extra"      # media codecs
    "locales"               # locale-gen
    "lxappearance"          # gtk theme
    "maim"                  # maimpick
    "mpv"                   # default video player
    "network-manager"       # nm-applet
    "network-manager-gnome" # nm-applet
    "nsxiv"                 # default image viewer
    "pipewire-audio"        # pipewire
    "qt5ct"                 # qt5 theme
    "qt6ct"                 # qt6 theme
    "ripgrep"               # telescope.nvim
    "rofi"                  # app launcher / maimpick
    "stow"                  # dotfiles
    "tmux"                  # programming
    "unzip"                 # extract .zip files
    "vlc"                   # media dependencies
    "webp"                  # maimpick
    "wget"                  # maimpick / neovim
    "xclip"                 # maimpick
    "xdotool"               # maimpick
    "xinit"                 # startx
    "zathura"               # default document viewer
    "zip"                   # create .zip files
    "zsh"                   # replacement for bash
  )
  local SERVICES=(
    "pipewire"       # pipewire
    "pipewire-pulse" # pipewire
    "wireplumber"    # pipewire
  )

  sudo apt update
  sudo apt install -y "${PACKAGES[@]}"

  mkdir -p "$HOME/.local/bin"
  ln -s /usr/bin/batcat "$HOME/.local/bin/bat"
  ln -s /usr/bin/fdfind "$HOME/.local/bin/fd"

  systemctl --user --now enable "${SERVICES[@]}"
}
