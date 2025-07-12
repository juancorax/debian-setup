install_dev_tools_version_manager() {
  display_header "Installing dev tools version manager"

  curl https://mise.run | sh
}

install_dev_tools() {
  display_header "Installing dev tools"

  local PHP_DEPENDENCIES=(
    "autoconf"
    "bison"
    "build-essential"
    "curl"
    "default-libmysqlclient-dev"
    "gettext"
    "git"
    "libcurl4-openssl-dev"
    "libedit-dev"
    "libgd-dev"
    "libicu-dev"
    "libjpeg-dev"
    "libonig-dev"
    "libpng-dev"
    "libpq-dev"
    "libreadline-dev"
    "libsqlite3-dev"
    "libssl-dev"
    "libxml2-dev"
    "libzip-dev"
    "openssl"
    "pkg-config"
    "re2c"
    "zlib1g-dev"
  )

  sudo apt update
  sudo apt install -y "${PHP_DEPENDENCIES[@]}"

  eval "$(~/.local/bin/mise activate bash)"
  mise install
}
