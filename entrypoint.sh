#!/bin/bash

echo "tuntap creation"
ip tuntap add vpn0 mode tun user root

echo "Adding redirect ports"
echo $REDIRECT_PORTS | tr : '\n' | while read redirect_port; do
    iptables -t nat -A PREROUTING -p tcp -m tcp --dport $redirect_port -j DNAT --to-destination $REDIRECT_IP:$redirect_port
    iptables -t nat -A POSTROUTING -p tcp -m tcp --dport $redirect_port -j MASQUERADE
done

echo "Adding nat rules"
iptables -t nat -A PREROUTING -p tcp -m tcp --dport $SERVICE_PORT -j DNAT --to-destination $SERVICE_IP:$SERVICE_PORT
iptables -t nat -A POSTROUTING -p tcp -m tcp --dport $SERVICE_PORT -j MASQUERADE

echo "openconnect starting"
(echo $VPN_PASSWORD; echo "yes") | /openconnect/./openconnect --protocol=gp $VPN_SERVER -u $VPN_USER --passwd-on-stdin
