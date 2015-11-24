#!/bin/bash

if [ -z "$1" ]; then 
	echo ""
	echo "[*] Please enter a valid file"
	echo ""
	exit 0
fi

echo ""
echo "[*] These addresses were found based on $1"	
echo ""

for IP in $(cat $1);do
    
    host $IP | grep "domain name" | cut -d " " -f5  > temp.txt 
    info=`cat temp.txt`
    echo "$IP"  "   " "$info"
    rm temp.txt
done

