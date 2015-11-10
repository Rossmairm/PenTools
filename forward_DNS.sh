#!/bin/bash

if [ -z "$1" ]; then 
	echo "[*] Please enter a valid URL"
	exit 0
fi


for name in $(cat list.txt);do
	host $name.$1 | grep "has address" | cut -d" " -f1,4 | sort -u
done

