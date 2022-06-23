#! /bin/bash

# Checking if lxd is installed
if ! [ -x "$(command -v lxd)" ]; then
    echo 'lxd is not installed. Installing it now!' >&2
    sudo apt-get --yes install lxd
fi

#  run lxd init --auto if no lxdbr0 interface exists
if  ip address show lxdbr0 1>/dev/null; then
    echo "lxdbr0 interface found"
else
    echo "No lxdbr0 interface. Setting it up"
    sudo lxd init --auto
fi

# launch a container running Ubuntu 20.04
if sudo lxc list | grep COMP2101-S22; then
    echo "Container already launched"
else
    sudo lxc launch ubuntu:20.04 COMP2101-S22
    sudo lxc start COMP2101-S22
fi

#  add or update the entry in /etc/hosts for hostname
ip=`sudo lxc list -c n4 | grep COMP2101-S22 | awk '{print $4}'`
if ! [ -x '$(grep -q "COMP2101-S22" /etc/hosts)' ]; then
    sudo echo "$ip COMP2101-S22" >> /etc/hosts
    echo "Added container hostname to hostfile"
fi


# Checking if apache2 is installed
sudo lxc exec COMP2101-S22 -- sh -c 'if ! [ -x "$(command -v apache2)" ]; then
  echo "apache is not installed. Installing it now!" >&2;
  sudo sudo apt-get update && apt-get -y install apache2;
fi
'

# Fetch default web page
curl -sf --output /dev/null http://COMP2101-S22 && echo "Success.
Fetched homepage. Apache is up and running" || echo "Failed to get homepage. Apache may not be running."
