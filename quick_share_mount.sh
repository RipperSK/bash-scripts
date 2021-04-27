#!/bin/bash

if [ $(mount|grep  "//192.168.0.8/homes"|wc -l) -ne 0 ]; then
  echo seems shares are already mounted
  exit 1
fi
echo gimme shares password:
read -s pass
echo gimme shares user:
read user
locuser=`whoami`
sudo mount -t cifs -o user=$user,uid=$locuser,gid=$locuser,vers=1.0,password=$pass //192.168.0.8/homes /mnt/homes
sudo mount -t cifs -o user=$user,uid=$locuser,gid=$locuser,vers=1.0,password=$pass //192.168.0.8/jis /mnt/jis
sudo mount -t cifs -o user=$user,uid=$locuser,gid=$locuser,vers=1.0,password=$pass //192.168.0.8/prekladka /mnt/prekladka
echo all done retcode = $?
