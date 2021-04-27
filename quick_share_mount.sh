#!/bin/bash

smbServer="fill in"
smbShare="fill in"

if [ $(mount|grep  "//$smbServer/$smbShare"|wc -l) -ne 0 ]; then
  echo seems $smbServer/$smbShare is already mounted
  exit 1
fi
echo gimme shares password:
read -s pass
echo gimme shares user:
read user
locuser=`whoami`
sudo mount -t cifs -o user=$user,uid=$locuser,gid=$locuser,vers=1.0,password=$pass //$smbServer/$smbShare /mnt/$smbShare
echo done with retcode = $?
