#!/bin/bash

# Getting the hostname
my_hostname=`hostname`

# Getting the domain name using hostname utility
domainname=`hostname -d`

# Getting OS name and version
os=`lsb_release -ds`

# Showing IP Addresses assigned to enp0s3 interface
ip=`hostname -I`
# Printing the disk usage
file=`df -h  --total --output=avail -t ext4 |  tail -1`


cat <<EOF
Report for $my_hostname
=============================
Domain Name      : $domainname
Operating System name and version: $os
IP Address: $ip 
Root Filesystem Free Space: $file
============================
EOF
