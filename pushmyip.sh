#!/bin/bash
remoteHost="fill me"
remotePort="fill me"
wanIP=$(curl -s ipinfo.io/ip)
fileName=wanIP-$(date +%F-%H-%M).txt
host=$(hostname -f)
echo $host WAN IP is $wanIP > ~/$fileName
scp -P $remotePort -i ~/.ssh/id_rsa ./$fileName $remoteHost:./wanIPs/ 
rm $fileName
