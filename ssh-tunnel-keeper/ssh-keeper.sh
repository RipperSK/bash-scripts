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
if [ `expr $(date -d 'now' +%s) - $(date -r /root/keep-alive +%s)` -gt 70 ]; then
  echo "$datenow INFO: Tunnel keep alive file is too old" >> $logfile
  echo "$datenow INFO: Tunnel keep alive file is `expr $(date -d 'now' +%s) - $(date -r ../keep-alive +%s)` seconds ols"  >> $logfile
  echo "$datenow WARN: Assuming that tunnel is no longer active. Opening new tunnel on 19999 TCP port" >> $logfile
  screen -d -m bash -c "ssh -R 19999:localhost:22  $jump -p 80 -i $dir/id-rsa"
  retcode=$?
  echo "$datenow INFO: Tunnel establish return code is $retcode" >> $logfile
else
  echo "$datenow INFO: Tunnel was checked and is established" >> $logfile
fi
