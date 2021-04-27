#!/bin/bash

listen19999=`netstat -tlnp|grep 19999|wc -l`
listen8080=`netstat -tlnp|grep 8080|wc -l`
listen8443=`netstat -tlnp|grep 8443|wc -l`


if [ $listen19999 -eq 2 ] && [ $listen8080 -ne 2 ] && [ $listen8443 -ne 2 ]; then
  screen -d -m bash -c "ssh -L 8080:localhost:80 -p 19999 localhost -i /root/id-rsa"
  echo "creating loop tunnel on port 80"
  screen -d -m bash -c "ssh -L 8443:localhost:443 -p 19999 localhost -i /root/id-rsa"
  echo "creating loop tunnel on port 443"
fi

