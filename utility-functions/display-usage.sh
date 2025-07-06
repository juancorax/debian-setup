display_usage() {
  PROGNAME="$(basename "$0")"

  cat <<_EOF_
USAGE:

  $PROGNAME [OPTIONS]

OPTIONS:

  --laptop         Install laptop battery optimizer
  --wifi-driver    Install Realtek RTL8192EU driver
  --help           Display this help message
_EOF_
}
