#!/usr/bin/env bash

function handle {
  if [[ ${1:0:10} == "focusedmon" ]]; then
    if [[ ${1:12:4} == "DP-1" ]]; then
      hyprctl keyword general:gaps_out 16
      hyprctl keyword general:gaps_in 6
    else
      hyprctl keyword general:gaps_out 30
      hyprctl keyword general:gaps_in 12
    fi
  fi
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
