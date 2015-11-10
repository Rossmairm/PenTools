#!/bin/bash


if [ -z "$1" ]; then 
	echo "[*] Please enter a valid URL"
	exit 0
fi



for server in $(host -t ns $1|cut -d" " -f4);do

	host -l $1  $server |grep "has address" | cut -d " " -f1,4; 
done


