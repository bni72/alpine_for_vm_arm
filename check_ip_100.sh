#!/bin/bash
# check_ip_100.sh

iptables -t nat -A PREROUTING -p tcp -d 10.0.2.0/24 --dport 8822 -j DNAT --to-destination 192.168.55.100:22
iptables -t nat -A POSTROUTING -p tcp -d 192.168.55.100 --dport 22 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -d 192.168.55.1 --dport 22 -j DNAT --to-destination 10.0.2.0/24:8822
iptables -t nat -A POSTROUTING -p tcp -d 192.168.55.1 --dport 22 -j MASQUERADE

service iptables save
rc-service iptables restart
