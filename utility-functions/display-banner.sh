display_banner() {
  local TERM_WIDTH line line_len pad_left

  TERM_WIDTH=$(tput cols)

  while IFS= read -r line; do
    line_len=${#line}
    pad_left=$(((TERM_WIDTH - line_len) / 2))

    printf "%*s%s\n" "$pad_left" "" "$line"
  done <<'_EOF_'

j u a n c o r a x ' s

██████  ███████ ██████  ██  █████  ███    ██       ███████ ███████ ████████ ██    ██ ██████ 
██   ██ ██      ██   ██ ██ ██   ██ ████   ██       ██      ██         ██    ██    ██ ██   ██
██   ██ █████   ██████  ██ ███████ ██ ██  ██ █████ ███████ █████      ██    ██    ██ ██████ 
██   ██ ██      ██   ██ ██ ██   ██ ██  ██ ██            ██ ██         ██    ██    ██ ██     
██████  ███████ ██████  ██ ██   ██ ██   ████       ███████ ███████    ██     ██████  ██     

_EOF_
}
