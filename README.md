# PenTools
This is a bundle of python and bash penetration testing tools for recon and information gathering. Tools included:

  - Mass DNS lookup 
  - Mass reverse DNS lookup 
  - DNS Enumerator
  - SMTP Username verification
  - Ping sweeper
  - DNS zone transfer information gatherer  
  - more to come!
 

## DNS_lookup.sh
This is just a tool that gets the DNS names for a list of IP address. 
#### Usage
Run the script along with a file that contains IP addresses for the argument.
`./DNS_lookup.sh IPs.txt`
Its will output the IP address with the DNS names next to them. IPs that do not have DNS names will have a blank space next to them.

Sample output:
```
[*] These addresses were found based on IPs.txt

8.8.8.8     google-public-dns-a.google.com.
192.168.1.2
4.4.4.4     alu7750testscr.xyz1.gblx.mgmt.Level3.net.
192.168.1.1
```
## SMTP_VRFY.sh
This script verifies usernames off of an SMTP server using the VRFY command. Please note that the success of this script really depends on the configuration of the SMTP server. Some servers are configured to give positive or negative verification for all usernames.

#### Usage
To use the username verifier simply run the script and enter the IP address of the SMTP server you are checking against for the first argument and a text file containing a list of user names for the second argument.

`./SMTP_VRFY.sh 192.168.1.1 users.txt`

This should output only the usernames that were verified. 

Sample output:
```
root
admin
bob
alice
```
### vrfy.py

This is a python port of 'SMTP_VRFY.sh". Usage and output are the same.



## dns_zone_transfer.sh

This script will find the NS servers for a domain and see if a zone transfer is possible. If it is possible it will return all systems found during the zone transfer.

#### Usage

To use just call the script and with a domain as an argument.

`./dns_zone_transfer.sh megacorpone.com`

Sample output:
```
[*] The following addresses were found

admin.megacorpone.com 38.100.193.83
beta.megacorpone.com 38.100.193.69
fs1.megacorpone.com 38.100.193.82
intranet.megacorpone.com 38.100.193.81
mail.megacorpone.com 38.100.193.84
mail2.megacorpone.com 38.100.193.73
ns1.megacorpone.com 38.100.193.70
ns2.megacorpone.com 38.100.193.80
ns3.megacorpone.com 38.100.193.90
router.megacorpone.com 38.100.193.91
siem.megacorpone.com 38.100.193.89
snmp.megacorpone.com 38.100.193.85
syslog.megacorpone.com 38.100.193.66
test.megacorpone.com 38.100.193.67
vpn.megacorpone.com 38.100.193.77
www.megacorpone.com 38.100.193.76
www2.megacorpone.com 38.100.193.79
```
## forward_DNS.sh

This script will enumerate names names from 'list.txt' on a domain and print out ones that were found with IPs. 'list.txt' must contain common prefixes used by companies. 

\* A starter 'list.txt' is included

#### Usage
Call the script with a domain as the argument.

`./forward_DNS.sh megacorpone.com`

```
[*] These addresses were found based on list.txt

www.megacorpone.com 38.100.193.76
mail.megacorpone.com 38.100.193.84
admin.megacorpone.com 38.100.193.83
router.megacorpone.com 38.100.193.91
www2.megacorpone.com 38.100.193.79
```

## nmap_spam.sh
This script takes nmaping /24s to a new level. It will take a base IP and background multiple nmap scans to increase the speed of scanning. Please note that this is a stupid aggressive script and it will most likely render your internet connection unusable until it is complete.

\*  Needs output to be cleaned up. 

#### Usage
Call the script with an IP base as the argument.

`./nmap_spam.sh 192.168.2`

Sample output:
```
Nmap done: 1 IP address (1 host up) scanned in 9.31 seconds
Nmap scan report for 192.168.2.112
Host is up (0.042s latency).
Not shown: 996 filtered ports
PORT      STATE SERVICE
80/tcp    open  http
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
49155/tcp open  unknown
MAC Address: 00:50:56:AF:6A:D8 

Nmap done: 1 IP address (1 host up) scanned in 8.46 seconds
Nmap scan report for 192.168.2.115
Host is up (0.041s latency).
Not shown: 998 filtered ports
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http
MAC Address: 00:50:56:AF:06:1D 

...
```


## ping_sweep.sh
Simple ping sweeper script. Will ping all IPs on a /24.

#### Usage
Call the script with an IP base as the argument.

`./ping_sweep.sh 192.168.2`

Sample output:
```
[*] Listing live IPs

192.168.2.7
192.168.2.23
192.168.2.43
192.168.2.50
192.168.2.56
192.168.2.64
192.168.2.215
192.168.2.224
```
## reverse_DNS.sh
This script task a will find all DNS names for a IP range and domain.

#### Usage 
Call the script with the arguments IP base, Domain, Range Start, and Range End.

`./reverse_DNS.sh 38.100.193 megacorpone.com 72 91`

Sample output:

```
[*] Listing found addresses

72.193.100.38.in-addr.arpa admin.megacorpone.com.
73.193.100.38.in-addr.arpa mail2.megacorpone.com.
76.193.100.38.in-addr.arpa www.megacorpone.com.
77.193.100.38.in-addr.arpa vpn.megacorpone.com.
80.193.100.38.in-addr.arpa ns2.megacorpone.com.
84.193.100.38.in-addr.arpa mail.megacorpone.com.
85.193.100.38.in-addr.arpa snmp.megacorpone.com.
89.193.100.38.in-addr.arpa siem.megacorpone.com.
90.193.100.38.in-addr.arpa ns3.megacorpone.com.
91.193.100.38.in-addr.arpa router.megacorpone.com.
```
### Version
0.3.1

## TO DO

* Fix and clean up nmap_spammer
* Create grepable output for nmap


License
----

MIT

