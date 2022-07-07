#!/usr/bin/env sh

sketchybar --add item disk.label right                                                 \
    --set disk.label label.font="$FONT:Bold:8.0"                                                    \
    label=DISK                                                                                      \
    y_offset=6                                                                                      \
    width=0                                                                                         \
                                                                                                    \
    --add item disk.percent right                                                                   \
    --set disk.percent label.font="$FONT:Bold:12.0"                                                 \
    y_offset=-4                                                                                     \
    update_freq=1800                                                                                \
    label=$(df -lh | grep /dev/disk1s1 | awk '{print $5}')                                          \
    lazy=on                                                                                         \
    \
    --add item ram.label right                                                                      \
    --set ram.label label.font="$FONT:Bold:8.0"                                                     \
    label=RAM                                                                                       \
    y_offset=6                                                                                      \
    width=0                                                                                         \
                                                                                                    \
    --add item ram.percent right                                                                    \
    --set ram.percent label.font="$FONT:Bold:12.0"                                                  \
    y_offset=-4                                                                                     \
    update_freq=5                                                                                   \
    label=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5"%"}') \
    lazy=on                                                                                         \
    \
    --add       item               cpu.separator right                                              \
    --set       cpu.separator      icon.drawing=off                                                 \
    label.drawing=off                                                                               \
    background.padding_left=0                                                                       \
    background.padding_right=0                                                                      \
                                                                                                    \
    --add       item               cpu.topproc right                                                \
    --set       cpu.topproc        label.font="$FONT:Bold:8"                                        \
    label=CPU                                                                                       \
    icon.drawing=off                                                                                \
    width=0                                                                                         \
    y_offset=6                                                                                      \
    update_freq=5                                                                                   \
    script="$PLUGIN_DIR/topproc.sh"                                                                 \
    lazy=on                                                                                         \
    \
    --add       item               cpu.percent right                                                \
    --set       cpu.percent        label.font="$FONT:Bold:12"                                       \
    label=CPU                                                                                       \
    y_offset=-4                                                                                     \
    width=40                                                                                        \
    icon.drawing=off                                                                                \
    update_freq=3                                                                                   \
    lazy=on                                                                                         \
                                                                                                    \
    --add       graph              cpu.user right 100                                               \
    --set       cpu.user           graph.color=0xffe1e3e4                                           \
    update_freq=3                                                                                   \
    width=0                                                                                         \
    label.drawing=off                                                                               \
    icon.drawing=off                                                                                \
    background.height=23                                                                            \
    background.color=0x00000000                                                                     \
    background.border_color=0x00000000                                                              \
    script="$PLUGIN_DIR/cpu.sh"                                                                     \
    lazy=on                                                                                         \
    \
    --add       graph              cpu.sys right 100                                                \
    --set       cpu.sys            graph.color=0xff9dd274                                           \
    label.drawing=off                                                                               \
    icon.drawing=off                                                                                \
    background.height=23                                                                            \
    background.color=0x00000000                                                                     \
    background.border_color=0x00000000                                                              \
                                                                                                    \
    --clone     cpu.label          label_template                                                   \
    --set       cpu.label          label=CPU                                                        \
    position=right                                                                                  \
    drawing=on                                                                                      \
    \
    --add       bracket            cpu                                                              \
    cpu.separator                                                                                   \
    cpu.topproc                                                                                     \
    cpu.percent                                                                                     \
    cpu.user                                                                                        \
    cpu.sys                                                                                         \
    cpu.label                                                                                       \
    disk.label                                                                                      \
    disk.percent                                                                                    \
    ram.label                                                                                       \
    ram.percent                                                                                     \
    \
    --set       cpu                background.drawing=on
