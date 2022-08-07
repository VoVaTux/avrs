#!/bin/sh

for dev in /sys/class/power_supply/BAT?
do
	bat=$(cat "$dev"/capacity)
	status=$(cat "$dev"/status)
	if [ "$bat" -lt 10 ] 
	then
	        icon=""
	elif [ "$bat" -ge 10 ] && [ "$bat" -lt 40 ] 
	then
	        icon=""
	elif [ "$bat" -ge 40 ] && [ "$bat" -lt 60 ] 
	then
	        icon=""
	elif [ "$bat" -ge 60 ] && [ "$bat" -le 90 ] 
	then
	       	icon=""
	elif [ "$bat" -gt 90 ]
	then 
		icon=""
	else
		icon=""
	fi

	echo "$icon " "$status" "$bat"%
done

