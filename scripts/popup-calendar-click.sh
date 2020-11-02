#! /bin/sh
#
# popup-calendar.sh
# Copyright (C) 2020 Pedro Pablo <ppablocruzcobas@gmail.com>
#
# Distributed under terms of the MIT license.
BAR_HEIGHT=26  # polybar height
BORDER_SIZE=2  # border size from your wm settings
YAD_WIDTH=222  # 222 is minimum possible value
YAD_HEIGHT=193 # 193 is minimum possible value

if [ "$(xdotool getwindowfocus getwindowname)" = "Calendar" ]; then
    exit 0
fi

eval "$(xdotool getmouselocation --shell)"
eval "$(xdotool getdisplaygeometry --shell)"

# X
if [ "$((X + YAD_WIDTH / 2 + BORDER_SIZE))" -gt "$WIDTH" ]; then #Right side
    : $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE - 30))
elif [ "$((X - YAD_WIDTH / 2 - BORDER_SIZE))" -lt 0 ]; then #Left side
    : $((pos_x = BORDER_SIZE))
else #Center
    : $((pos_x = X - YAD_WIDTH / 2))
fi

# Y
if [ "$Y" -gt "$((HEIGHT / 2))" ]; then #Bottom
    : $((pos_y = HEIGHT - YAD_HEIGHT - BAR_HEIGHT - BORDER_SIZE))
else #Top
    : $((pos_y = BAR_HEIGHT + BORDER_SIZE))
fi

yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
    --width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
    --title="Calendar" --borders=0 >/dev/null &
