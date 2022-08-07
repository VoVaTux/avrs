#/bin/sh

layout=$(setxkbmap -query | awk  'NR==3 {print $2}')
variant=$(setxkbmap -query | awk  'NR==4 {print $2}')

[ $layout != "" ] && echo $layout $variant || echo $layout
