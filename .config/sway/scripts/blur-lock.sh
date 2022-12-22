#!/usr/bin/env bash

#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout  300 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

# Take a screenshot and apply blur to it
PICTURE=/tmp/swaylock.png
BLUR="5x4"
grim $PICTURE
convert $PICTURE -blur $BLUR $PICTURE

# lock the screen with blured picture
swaylock -i $PICTURE
rm $PICTURE

# Kills last background task so idle timer doesn't keep running
kill %%
