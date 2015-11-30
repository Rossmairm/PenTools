#!/usr/bin/python

import socket
import sys

if len(sys.argv) !=3:
    print  "[*] Usage: vrfy.py <IP> <User list>"
    sys.exit(0)

else:
    socket(socket.AF_INET, socket.SOCK_STREAM)
    connect=s.connect((sys.argv[1], 25))
    banner=s.recv(1024)
    print banner 
    f1=open('./'+ sys.argv[2], 'r')
   
    for ln in iter(f1.readline, ''):
        s.send('VRFY '+ln +'\r\n') 
        result =s.recv(1024)
        print result
s.close()

