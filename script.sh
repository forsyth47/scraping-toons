#!/bin/sh

#printf "Enter the link: "
#read link
quality=480p
#available qulities (360p/480p) for shinchan atleast (! dont forget to add p after 360/480 !)
link=$1
url=$(curl -s $link | grep "https://bayfiles.com/.*" | grep -o "$quality.*" | cut -d\" -f4)
for u in $url; do
    #echo "Downloading $u..."
    while true; do output=$(curl -s "$u"); [ -n "$output" ] && break; sleep 0.5; done; echo "$output" | grep "https://.*.bayfiles.com.*" | tac | rev | cut -d\" -f2 | rev | sed -n 2p
done
