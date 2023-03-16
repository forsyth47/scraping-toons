#!/bin/sh

#printf "Enter the link: "
#read link
link=$1
url=$(curl -s $link | grep "https://bayfiles.com/.*" | grep -o "360p.*" | cut -d\" -f4)
for u in $url; do
    #echo "Downloading $u..."
    while true; do
	    curl -s $u | grep "https://.*.bayfiles.com.*" | tac | rev | cut -d\" -f2 | rev | sed -n 2p && break
    	sleep 1
    done
done
