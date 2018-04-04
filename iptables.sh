#!/bin/bash

iptables -t nat -A PREROUTING -p tcp -m tcp --dport $SERVICE_PORT -j DNAT --to-destination $SERVICE_IP:$SERVICE_PORT
iptables -t nat -A POSTROUTING -p tcp -m tcp --dport $SERVICE_PORT -j MASQUERADE
