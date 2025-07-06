display_header() {
  local TERM_WIDTH INPUT_TEXT INPUT_TEXT_LEN header TOTAL_PAD

  TERM_WIDTH=$(tput cols)

  INPUT_TEXT="$1"
  INPUT_TEXT_LEN=${#INPUT_TEXT}

  header="$INPUT_TEXT"

  TOTAL_PAD=$((TERM_WIDTH - INPUT_TEXT_LEN - 2))

  if ((TOTAL_PAD >= 2)); then
    local PAD_LEFT PAD_RIGHT PAD_CHARS_LEFT PAD_CHARS_RIGHT
    local PAD_CHAR='='
    local PAD_CHAR_COLOR='\033[94m'
    local RESET_COLOR='\033[0m'

    PAD_LEFT=$((TOTAL_PAD / 2))
    PAD_RIGHT=$((TOTAL_PAD - PAD_LEFT))

    PAD_CHARS_LEFT=$(printf '%*s' "$PAD_LEFT" '' | tr ' ' "$PAD_CHAR")
    PAD_CHARS_RIGHT=$(printf '%*s' "$PAD_RIGHT" '' | tr ' ' "$PAD_CHAR")

    header="${PAD_CHAR_COLOR}${PAD_CHARS_LEFT}${RESET_COLOR} ${INPUT_TEXT} ${PAD_CHAR_COLOR}${PAD_CHARS_RIGHT}${RESET_COLOR}"
  elif ((TOTAL_PAD >= 0 && TOTAL_PAD < 2)); then
    header=" $INPUT_TEXT "
  fi

  echo
  echo -e "$header"
  echo
}
