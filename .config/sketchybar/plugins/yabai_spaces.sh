#!/usr/bin/env bash

# icon=("􀃉" "􀃋" "􀃍" "􀃏" "􀃑" "􀃓" "􀃕" "􀃗" "􀃙" "􀃛" "􀕒" "􀕓" "􀕔" "􀕕" "􀕖") #0 to 14
# highlight_colors=("" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e")

args=()
DISPLAYS="$(yabai -m query --displays | jq -rc '.[] | .index | @sh')"
NAMES=""
COUNT=0

icon() {
  case $1 in
    web)
      echo "􀼺"
      ;;
    code)
      echo "􀤙"
      ;;
    productivity)
      echo "􀈎"
      ;;
    communication)
      echo "􀌳"
      ;;
    reference)
      echo "􀓕"
      ;;
    utility)
      echo "􀙗"
      ;;
    media)
      echo "􀽎"
      ;;
    misc)
      echo "􀺽"
      ;;
    *)
      echo "􀕵"
      ;;
  esac
}

for display in $DISPLAYS; do
  SPACES="$(yabai -m query --spaces --display $display | jq -rc '.[] | [.index, .windows[0], .label] | @sh')"

  args+=(--clone spaces_${display}.label space_label_template after
    --set spaces_${display}.label
    label=spc
    label.width=20
    label.align=center
    associated_display=${display}
    position=left
    drawing=on)

  # Read the current spaces from the yabai query
  while read -r index window yabai_name visible; do
    COUNT=$((COUNT + 1))
    NAME="$(echo "${yabai_name}" | tr -d "'")"
    ICON=$(icon $NAME)

    if [ "${window}" = "null" ]; then
      label="$ICON"
    else
      label="$ICON°"
    fi

    if [ "$NAME" = "" ] || [ "$NAME" = " " ]; then
      NAME="${index}"
    fi

    NAMES="$NAMES $NAME"
    args+=(--clone "$NAME" space_template before
      --set "$NAME"
      icon="$ICON"
      icon.highlight_color=0xff9dd274 associated_space=$COUNT
      associated_display=${display}
      drawing=on
    )
  done <<<"$SPACES"

  args+=(--add bracket spaces_${display} spaces_${display}.label $NAMES)

  # Reorder them and stick them onto sketchybar
  args+=(--reorder $NAMES)
  sketchybar -m ${args[@]} &>/dev/null

done
