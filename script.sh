#!/bin/sh

link=$1
quality=360p
echo "Set Quality in script. Current set quality is: " $quality
#available qulities (360p/480p) for shinchan atleast (! dont forget to add p after 360/480 !)

pwd=$(pwd)
mkdir ToonsDownloaded-$quality
cd ToonsDownloaded-$quality

url=$(curl -s $link | grep "https://bayfiles.com/.*" | grep -o "$quality.*" | cut -d\" -f4)
for u in $url; do
    #echo "Downloading $u..."
    code=$(echo $u | cut -d\/ -f4)
    links=$(while true; do output=$(curl -s "$u"); [ -n "$output" ] && break; sleep 0.5; done; echo "$output" | grep "https://.*.bayfiles.com.*" | tac | rev | cut -d\" -f2 | rev | grep -E 'https?://.*\.mp4(\b|$)')
    for link in $links; do
    	if [ $(echo $link | cut -d\/ -f4) == $code ]; then
        	#while true; do output=$(curl "$link"); [ -n "$output" ] && break; sleep 0.5; done; echo "$output"
		while true; do wget $link -O $(echo $link | rev | cut -d\/ -f1 | rev) && break; sleep 1; done > /dev/null
		#echo $link
    	fi
    done
done

cd $pwd
