#!/usr/bin/env bash

sketchybar --add       event              window_focus                                                                                          \
           --add       event              monocle                                                                                               \
                                                                                                                                                \
           --add       item               system.yabai q                                                                                        \
           --set       system.yabai       script="$PLUGIN_DIR/yabai.sh"                                                                         \
                                          icon.font="$FONT:Bold:12.0"                                                                           \
                                          label.drawing=off                                                                                     \
                                          width=30                                                                                              \
                                          align=center                                                                                          \
                                          updates=on                                                                                            \
           --subscribe system.yabai       window_focus monocle mouse.clicked                                                                    \
                                                                                                                                                \
           --clone     system.label       label_template                                                                                        \
           --set       system.label       label=sys                                                                                             \
                                          position=q                                                                                            \
                                          drawing=on                                                                                            \
                                          background.padding_right=3                                                                            \
                                          script="$PLUGIN_DIR/window_title.sh"                                                                  \
                                          label.font="Helvetica Neue:Bold:12.0"                                                                 \
           --subscribe system.label       front_app_switched                                                                                    \
                                                                                                                                                \
           --add       item               system.mic e                                                                                          \
           --set       system.mic         update_freq=100                                                                                       \
                                          label.drawing=off                                                                                     \
                                          script="$PLUGIN_DIR/mic.sh"                                                                           \
                                          click_script="$PLUGIN_DIR/mic_click.sh"                                                               \
