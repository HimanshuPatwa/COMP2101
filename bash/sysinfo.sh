#!/bin/bash

# Getting the hostname
echo "Hostname:     `hostname`"
# Getting the domain name using hostname utility
echo "Domain Name: `hostname -d`"

# Getting OS name and version
echo "Operating System name and version: `lsb_release -ds`"

# Showing IP Addresses assigned to the system
echo "IP Addresses: `hostname -i`"
# Printing the disk usage
echo -e "Root Filesystem Status:\n`df -h -t ext4`"

