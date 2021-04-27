#!/bin/bash
host=$1

if [[ $host == "" ]]; then
  echo "Exitting - you need to specify hostname/IP address as argument" >&2
  exit 1
fi

debian_v=`ssh root@$host "cat /etc/debian_version"`

if [ $? -ne 0 ]; then
  echo "Exitting - unable to find Debian Version" >&2
  exit 1
fi

url8="https://apt.puppetlabs.com/puppet5-release-jessie.deb"
url9="https://apt.puppetlabs.com/puppet5-release-stretch.deb"

if [[ $debian_v == 8* ]]; then
  url=$url8
fi

if [[ $debian_v == 9* ]]; then
  url=$url9
fi

ssh root@$host "apt-get update && apt-get -y install wget curl pgp ca-certificates; wget $url && dpkg -i puppet5-release-*.deb && rm puppet5-release-*.deb && curl --remote-name --location https://apt.puppetlabs.com/DEB-GPG-KEY-puppet && gpg --keyid-format 0xLONG --with-fingerprint ./DEB-GPG-KEY-puppet && apt-get update && apt-get install puppet-agent && ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet && echo "10.11.1.22  puppet" >> /etc/hosts"
