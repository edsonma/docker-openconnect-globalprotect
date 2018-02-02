#!/bin/bash

iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1434 -j DNAT --to-destination 10.0.0.205:1434
iptables -t nat -A POSTROUTING -p tcp -m tcp --dport 1434 -j MASQUERADE
