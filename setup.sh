#!/usr/bin/env bash

set -euo pipefail

source ./utility-functions/display-banner.sh
source ./utility-functions/display-header.sh
source ./utility-functions/display-usage.sh

source ./core-functions/apt-packages.sh
source ./core-functions/apt-repositories.sh
source ./core-functions/awesome-window-manager.sh
source ./core-functions/configuration-files.sh
source ./core-functions/dev-tools-version-manager.sh
source ./core-functions/flatpak-packages.sh
source ./core-functions/fzf-fuzzy-finder.sh
source ./core-functions/japanese-language.sh
source ./core-functions/laptop-battery-optimizer.sh
source ./core-functions/picom-compositor.sh
source ./core-functions/rtl8192eu-driver.sh
source ./core-functions/st-terminal-emulator.sh
source ./core-functions/tmux-plugins.sh
source ./core-functions/user-directories.sh
source ./core-functions/zsh-shell.sh

setup() {
  local laptop=
  local wifi_driver=
  local ocr=
  local visual_novels=

  while (($# > 0)); do
    case "$1" in
    --laptop)
      laptop=1
      ;;

    --wifi-driver)
      wifi_driver=1
      ;;

    --ocr)
      ocr=1
      ;;

    --visual-novels)
      visual_novels=1
      ;;

    --help)
      display_usage
      exit
      ;;

    *)
      display_usage >&2
      exit 1
      ;;
    esac

    shift
  done

  clear

  display_banner

  configure_apt_repositories

  install_apt_packages
  add_flathub_repository_to_flatpak
  install_flatpak_packages

  enable_japanese_locale

  create_user_directories

  add_configuration_files

  install_awesome_window_manager
  install_picom_compositor

  change_shell_to_zsh
  install_zsh_plugins

  install_st_terminal_emulator
  install_tmux_plugins
  install_fzf_fuzzy_finder

  install_dev_tools_version_manager
  install_dev_tools

  [[ -n "$laptop" ]] && install_laptop_battery_optimizer
  [[ -n "$wifi_driver" ]] && install_rtl8192eu_driver
  [[ -n "$ocr" ]] && install_transformers_ocr
  [[ -n "$visual_novels" ]] && install_visual_novel_requirements
}

setup "$@"
