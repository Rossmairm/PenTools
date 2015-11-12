#/bin/bash


if (-z $1); then 
    echo ""
    echo "[*] Please enter a base ip"
    echo ""
    exit 0
fi
echo ""
echo "[*] Scan Results"
echo ""

for ip in $(seq 0 254);do
    nmap -sS $1.$ip -o Nmap/output$ip.txt &  
done

nmap -sT $1.255

for ip in $(seq 0 254);do
     cat Nmap/output$ip.txt >> output.txt
      rm Nmap/output$ip.txt
   done
