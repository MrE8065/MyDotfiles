#!/bin/bash

# Check if wf-recorder is running and kill it before opening the menu
if pgrep -x "wf-recorder" > /dev/null; then
  pkill -INT -x wf-recorder
  notify-send -h string:wf-recorder:record -t 1000 "🎥 Finished Recording"
fi

image() {
  sleep 0.2 # Delay to close the menu before screenshot
  hyprshot -m region --freeze -o ~/Screenshots/ # Can freeze the screen because of the hyprpicker package
}

video_fullscreen() {
  for i in 3 2 1;do
    notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span font='26px'><i><b>$i</b></i></span>"
    sleep 1
  done

  dateTime=$(date +%d-%m_%Y-%H:%M:%S)
  wf-recorder --bframes 60 --audio=$(pactl get-default-sink).monitor -f $HOME/Videos/$dateTime.mp4 # Adds the system sound to the recording
}

video_zone() {
  notify-send -h string:wf-recorder:record -t 1000 "Screen recorder" "<span font='26px'><i>Select a part to record</i></span>"
  sleep 1.5

  dateTime=$(date +%d-%m_%Y-%H:%M:%S)
  wf-recorder --bframes 60 --audio=$(pactl get-default-sink).monitor -f $HOME/Videos/$dateTime.mp4 -g "$(slurp)" # Adds the system sound to the recording. Use geometry to select an specific area
}

CHOICE=$(echo -e "📸 Screenshot\n🎥 Screen recording (fullscreen)\n🎥 Screen recording (zone)" | wofi -c ~/.config/wofi/capture)

case "$CHOICE" in
  "📸 Screenshot")
    image
    ;;
  "🎥 Screen recording (fullscreen)")
    video_fullscreen
    ;;
  "🎥 Screen recording (zone)")
    video_zone
    ;;
esac
