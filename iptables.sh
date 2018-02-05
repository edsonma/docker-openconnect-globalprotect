#!/bin/bash

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1434 -j DNAT --to-destination $SERVICE_IP:$SERVICE_PORT
iptables -t nat -A POSTROUTING -p tcp -m tcp --dport 1434 -j MASQUERADE
