#!/bin/bash

INTEL_BACKLIGHT="/sys/class/backlight/intel_backlight"
BRIGHTNESS="$INTEL_BACKLIGHT""/brightness"
MAX_BRIGHTNESS="$INTEL_BACKLIGHT""/max_brightness"
ACTUAL_BRIGHTNESS="$INTEL_BACKLIGHT""/actual_brightness"

LENGTH=${#1}

arg=$1

if [ "${arg:0:1}" == "+" ]; then
	echo $[`cat $ACTUAL_BRIGHTNESS` + ${arg:1:$[LENGTH-1]}] > "$BRIGHTNESS" 
elif [ ${arg:0:1} == '-' ]; then
	echo $[`cat $ACTUAL_BRIGHTNESS` - ${arg:1:$[LENGTH-1]}] > "$BRIGHTNESS" 
else
	echo $arg > $BRIGHTNESS
fi
