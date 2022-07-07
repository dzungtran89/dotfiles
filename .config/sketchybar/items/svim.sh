#!/usr/bin/env sh
  
sketchybar --add item svim.mode q                                                \
           --set svim.mode popup.align=left                                      \
                           icon=                                                \
                           label="[!]"                                           \
                           label.padding_right=10                                \
                           icon.font="$FONT:Bold:15.0"                           \
                           label.font="$FONT:Bold:12.0"                          \
                           icon.color=$ICON_COLOR                                \
                           script="sketchybar --set svim.mode popup.drawing=off" \
                                                                                 \
           --subscribe svim.mode front_app_switched window_focus                 \
           --add item svim.cmdline popup.svim.mode                               \
           --set svim.cmdline icon="Command: "
