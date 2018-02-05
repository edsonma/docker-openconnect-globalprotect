#!/bin/bash

echo "tuntap creation"
ip tuntap add vpn0 mode tun user root

echo "Adding nat rules"
su -c "/./iptables.sh"

echo "openconnect starting"
  (echo $VPN_PASSWORD; echo "yes") | /openconnect/./openconnect --protocol=gp $VPN_SERVER -u $VPN_USER --passwd-on-stdin
