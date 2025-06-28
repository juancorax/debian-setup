#!/usr/bin/env bash

set -euo PIPEFAIL

source ./functions/apt-packages.sh
source ./functions/apt-repositories.sh
source ./functions/awesome-window-manager.sh
source ./functions/configuration-files.sh
source ./functions/flatpak-packages.sh
source ./functions/fzf-fuzzy-finder.sh
source ./functions/japanese-language.sh
source ./functions/kitty-terminal.sh
source ./functions/laptop-battery-optimizer.sh
source ./functions/neovim-editor.sh
source ./functions/picom-compositor.sh
source ./functions/rtl8192eu-driver.sh
source ./functions/tmux-plugins.sh
source ./functions/zsh-shell.sh

setup() {
  clear

  configure_apt_repositories

  if [[ "$1" == "laptop" ]]; then
    install_laptop_battery_optimizer
  else
    install_rtl8192eu_driver
  fi

  install_apt_packages
  add_flathub_repository_to_flatpak
  install_flatpak_packages

  enable_japanese_locale

  add_configuration_files

  install_awesome_window_manager
  install_picom_compositor

  change_shell_to_zsh
  install_zsh_plugins

  install_kitty_terminal
  install_tmux_plugins
  install_fzf_fuzzy_finder
  install_neovim_editor
}

setup "$@"
