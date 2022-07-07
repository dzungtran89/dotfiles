#!/usr/bin/env bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

sketchybar --set $NAME icon.color=0xff2d2a2e

while [[ ${CHARGING} != "" ]]; do
    sketchybar --set $NAME label="$BATT_PERCENT%"
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
    sleep .5
    sketchybar --set $NAME icon=""
done
