configure_apt_repositories() {
  display_header "Configuring APT repositories"

  local CODENAME
  CODENAME="$(lsb_release -cs 2>/dev/null)"

  local COMPONENTS=(
    "main"
    "contrib"
    "non-free"
    "non-free-firmware"
  )

  local SOURCES_LIST
  SOURCES_LIST=$(
    cat <<_EOF_
deb https://deb.debian.org/debian $CODENAME ${COMPONENTS[@]}
deb-src https://deb.debian.org/debian $CODENAME ${COMPONENTS[@]}

deb https://security.debian.org/debian-security $CODENAME-security ${COMPONENTS[@]}
deb-src https://security.debian.org/debian-security $CODENAME-security ${COMPONENTS[@]}

deb https://deb.debian.org/debian $CODENAME-updates ${COMPONENTS[@]}
deb-src https://deb.debian.org/debian $CODENAME-updates ${COMPONENTS[@]}
_EOF_
  )

  echo "$SOURCES_LIST" | sudo tee /etc/apt/sources.list
}
