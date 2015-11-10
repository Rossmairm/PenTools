#!/bin/bash

if [ -z "$1" ]; then 
	echo ""
	echo "[*] Please enter a valid URL"
	echo ""
	exit 0
fi

echo ""
echo "[*] These addresses were found based on list.txt"	
echo ""

for name in $(cat list.txt);do
	host $name.$1 | grep "has address" | cut -d" " -f1,4 | sort -u
done

