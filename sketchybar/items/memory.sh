#!/usr/bin/env sh

sketchybar --add item topmem left     \
    --set topmem icon.padding_left=15 \
    update_freq=15                    \
    script="$PLUGIN_DIR/topmem.sh"
