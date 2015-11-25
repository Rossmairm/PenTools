#!/bin/bash

if [ -z "$2" ]; then
    echo ""
    echo "[*] Please enter a valid URL"
    echo ""
    exit 0
fi



for user in $(cat $2);do
    echo VRFY $user | nc -nv -w 1 $1 25 2>/dev/null|grep ^"250"
done
