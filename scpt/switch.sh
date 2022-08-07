#!/bin/sh

lang=$(setxkbmap -query | awk 'NR==3 {print $2}')

langs="us ru pt"
vars="colemak"
count=1
for language in $langs 
do
	count=`expr $count + 1`
	[ $count -gt $(echo $langs | wc -w) ] && count=1
  	[ $lang = $language ] && break
done

nlang=$(echo $langs | awk -v count="$count" '{print $count}') 
nvar=$(echo $vars | awk -v count="$count" '{print $count}') 
setxkbmap $nlang -variant $nvar >> /dev/null
