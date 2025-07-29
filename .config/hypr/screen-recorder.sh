pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span font='26px'><i><b>3</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "<span font='26px'><i><b>2</b></i></span>"

sleep 1

notify-send -h string:wf-recorder:record -t 950 "Recording in:" "<span font='26px'><i><b>1</b></i></span>"

sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
wf-recorder --bframes 60 --audio=$(pactl get-default-sink).monitor -f $HOME/Videos/$dateTime.mp4
