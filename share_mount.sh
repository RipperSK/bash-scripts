#!/bin/bash

if [ $(mount|grep  "//192.168.0.8/homes"|wc -l) -ne 0 ]; then
  echo seems shares are already mounted
  exit 1
fi

echo gimme shares user:
read user
localUser=$(whoami)
echo gimme shares server:
read server
echo gimme share directories(separated by space):
read shareDirs
echo gimme shares password:
read -s pass

for i in $shareDirs;do 
  sudo mount -t cifs -o user=$user,uid=$localUser,gid=$localUser,vers=1.0,password=$pass //$server/$i /mnt/$i
done
echo all done retcode = $?
