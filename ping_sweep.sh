#!/bin/bash

if [ -z "$1" ]; then
       	echo ""
	echo "[*] Please enter a valid base IP"
        echo ""
	exit 0
fi

echo ""
echo "[*] Listing live IPs"
echo ""

for ip in $(seq 0 254); do
ping -c 1 $1.$ip | grep "bytes from" | cut -d " " -f4 | cut -d ":" -f1 >> sweep.txt&

done 

# Printing from text file for clean output
cat sweep.txt
rm sweep.txt
