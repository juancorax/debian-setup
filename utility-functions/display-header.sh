display_header() {
  local term_width input_text input_text_len header total_pad

  term_width=$(tput cols)

  input_text="$1"
  input_text_len=${#input_text}

  header="$input_text"

  total_pad=$((term_width - input_text_len - 2))

  if ((total_pad >= 2)); then
    local pad_left pad_right pad_chars_left pad_chars_right
    local pad_char='='
    local pad_char_color='\033[94m'
    local reset_color='\033[0m'

    pad_left=$((total_pad / 2))
    pad_right=$((total_pad - pad_left))

    pad_chars_left=$(printf '%*s' "$pad_left" '' | tr ' ' "$pad_char")
    pad_chars_right=$(printf '%*s' "$pad_right" '' | tr ' ' "$pad_char")

    header="${pad_char_color}${pad_chars_left}${reset_color} ${input_text} ${pad_char_color}${pad_chars_right}${reset_color}"
  elif ((total_pad >= 0 && total_pad < 2)); then
    header=" $input_text "
  fi

  echo
  echo -e "$header"
  echo
}
