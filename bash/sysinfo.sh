#!/bin/bash

# Getting the hostname
echo "Hostname:     `hostname`"
# Getting the domain name using hostname utility
echo "Domain Name: `hostname -d`"

# Getting OS name and version
echo "Operating System name and version: `lsb_release -drs`"

# Showing IP Addresses assigned to enp0s3 interface
echo "IP Addresses: `ip -br addr show enp0s3`"
# Printing the disk usage
echo "Root Filesystem Status: `df -h -t ext4`"
