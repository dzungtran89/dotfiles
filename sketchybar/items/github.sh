#!/usr/bin/env sh

sketchybar --add       event              git_push                                 \
                                                                                   \
           --add       item       github.label                           \
           --set       github.label       associated_space=1                       \
                                          icon=                                \
                                          position=left                            \
                                          drawing=on                               \
                                                                                   \
           --add       item               github.bell left                         \
           --set       github.bell        associated_space=1                       \
                                          update_freq=180                          \
                                          icon.font="$FONT:Bold:15.0"              \
                                          icon=􀋙                                   \
                                          script="$PLUGIN_DIR/gitNotifications.sh" \
                                          click_script="sketchybar --set github.bell popup.drawing=toggle" \
                                                                                   \
           --add       item               github.commits left                      \
           --set       github.commits     associated_space=1                       \
                                          update_freq=1000                         \
                                          icon.color=0xaaffffff                    \
                                          icon.highlight_color=0xff9dd274          \
                                          icon.font="$FONT:Bold:16.0"              \
                                          icon=􀂓                                   \
                                          click_script="open https://github.com"   \
                                          script="$PLUGIN_DIR/githubIndicator.sh"  \
           --subscribe github.commits     git_push                                 \
                                                                                   \
           --add       bracket            github                                   \
                                          github.label                             \
                                          github.bell                              \
                                          github.commits                           \
                                                                                   \
           --set       github             background.drawing=on

           # --add       item               packages left                            \
           # --set       packages           update_freq=86400                        \
           #                                script="$PLUGIN_DIR/package_monitor.sh"  \
           #                                label=$LOADING                           \
           #                                icon=􀐛                                   \
           #                                associated_space=1                       \
           # --subscribe packages           brew_upgrade mouse.clicked               \
           #                                                                         \
