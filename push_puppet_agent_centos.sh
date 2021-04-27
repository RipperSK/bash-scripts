#!/bin/bash
host=$1

if [[ $host == "" ]]; then
  echo "Exitting - you need to specify hostname/IP address as argument" >&2
  exit 1
fi

release=`ssh root@$host "cat /etc/redhat-release"|awk '{print $(NF-1)}'`

if [ $? -ne 0 ]; then
  echo "Exitting - unable to find Centos release" >&2
  exit 1
fi

url6="https://yum.puppetlabs.com/puppet5/puppet5-release-el-6.noarch.rpm"
url7="https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm"

if [[ $release == 6* ]]; then
  url=$url6
fi

if [[ $release == 7* ]]; then
  url=$url7
fi

ssh root@$host "rpm -Uvh $url && yum -y install puppet" 
ssh root@$host 'echo "10.11.1.22  puppet" >> /etc/hosts'
