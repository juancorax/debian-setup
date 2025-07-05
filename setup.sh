#!/usr/bin/env bash

set -euo pipefail

source ./utility-functions/display-banner.sh
source ./utility-functions/display-header.sh

source ./core-functions/apt-packages.sh
source ./core-functions/apt-repositories.sh
source ./core-functions/awesome-window-manager.sh
source ./core-functions/configuration-files.sh
source ./core-functions/flatpak-packages.sh
source ./core-functions/fzf-fuzzy-finder.sh
source ./core-functions/japanese-language.sh
source ./core-functions/kitty-terminal.sh
source ./core-functions/laptop-battery-optimizer.sh
source ./core-functions/neovim-editor.sh
source ./core-functions/picom-compositor.sh
source ./core-functions/rtl8192eu-driver.sh
source ./core-functions/tmux-plugins.sh
source ./core-functions/zsh-shell.sh

setup() {
  clear

  display_banner

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

  install_transformers_ocr
}

setup "$@"
