#!/bin/bash

if [ -z "$1" ]; then
        echo "[*] Please enter a valid base IP"
        exit 0
fi

for ip in $(seq 0 254); do
ping -c 1 $1.$ip | grep "bytes from" | cut -d " " -f4 | cut -d ":" -f1 >> sweep.txt&

done 
cat sweep.txt
rm sweep.txt
