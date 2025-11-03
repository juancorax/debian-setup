display_usage() {
  local PROGNAME
  PROGNAME="$(basename "$0")"

  cat <<_EOF_
USAGE:

  $PROGNAME [OPTIONS]

OPTIONS:

  --laptop           Install laptop utilities
  --wifi-driver      Install Realtek RTL8192EU driver
  --ocr              Install Transformers OCR
  --visual-novels    Install visual novel requirements
  --help             Display this help message
_EOF_
}
