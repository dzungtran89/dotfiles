#!/usr/bin/env bash

sketchybar --add       event              window_focus                                                                                          \
           --add       event              monocle                                                                                               \
                                                                                                                                                \
           --clone     system.label       label_template                                                                                        \
           --set       system.label       label=sys                                                                                             \
                                          position=center                                                                                            \
                                          drawing=on                                                                                            \
                                          script="$PLUGIN_DIR/window_title.sh"                                                                  \
                                          label.font="Helvetica Neue:Bold:12.0"                                                                 \
                                          width=10 \
           --subscribe system.label       front_app_switched                                                                                    \
                                               \                                                                                                 \
           --add       item               system.yabai \
           --set       system.yabai       script="$PLUGIN_DIR/yabai.sh"                                                                         \
                                          position=q \
                                          icon.font="$FONT:Bold:12.0"                                                                           \
                                          label.drawing=off                                                                                     \
                                          updates=on                                                                                            \
           --subscribe system.yabai       window_focus monocle mouse.clicked                                                                    \
           \
           --add       item               system.mic q                                                                                          \
           --set       system.mic         update_freq=100                                                                                       \
                                          label.drawing=off                                                                                     \
                                          width=10 \
                                          script="$PLUGIN_DIR/mic.sh"                                                                           \
                                          click_script="$PLUGIN_DIR/mic_click.sh"                                                               \
