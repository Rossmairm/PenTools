#!/bin/bash 

if [ -z "$4" ]; then 
	echo "[*] Please enter a valid input"
	echo "[*] Correct format:  'IP base' 'Domain' 'Range Start' 'Range End'"
	echo "[*] Example:          127.0.0   google      1             255"	
	exit 0
fi

for ip in $(seq $3 $4);do
	host $1.$ip | grep $2 | cut -d" " -f1,5 
done

