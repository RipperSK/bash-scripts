#!/bin/bash

scriptname=$0
logfile=$scriptname.log
datenow=`date +%F_%H:%M`
dir=`pwd`
jump="fill in"

if [ -z ./id-rsa ]; then
  echo "$datenow ERROR: You need id-rsa private key file placed in the same dir as this script." >> $logfile
  exit 1
fi

echo "$datenow INFO: Tunneling to remote http  port 80 to localhost port 8080" >> $logfile
ssh $jump -l root -p 80 -i ./id-rsa -tt "ssh -p 19999 localhost -i id-rsa"
#retcode=$?
#echo "$datenow INFO: SSH establish return code is $retcode" >> $logfile
