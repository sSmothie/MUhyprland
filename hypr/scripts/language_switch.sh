#!/bin/bash

while true; do
  current_locale=$(locale -a | grep "en_US") 
  if [[ "$current_locale" != "$previous_locale" ]]; then
    message="Language switched to: $current_locale"
    notify-send -t "Language Changed Notification" -u critical "$message" 
    previous_locale="$current_locale"
  fi

  sleep 5
done
