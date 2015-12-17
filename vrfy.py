#!/usr/bin/python

import socket
import sys

if len(sys.argv) !=3:
    print  "[*] Usage: vrfy.py <IP> <User list>"
    sys.exit(0)

else:
    s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    connect=s.connect((sys.argv[1], 25)) #connets to socket
    banner=s.recv(1024)
    print banner #prints banner
    f1=open('./'+ sys.argv[2], 'r')#reads input file
    f2=open('./user_results.txt', 'w+') #opens files for writing

    for ln in iter(f1.readline, ''): #runs the VRFY chack and outputs it to a file
        s.send('VRFY ' + ln +'\r\n')
        result =s.recv(1024)
        f2.writelines(result)
        print result

s.close()

