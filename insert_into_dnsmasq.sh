#!/bin/bash
#insert_into_dnsmasq.sh

echo “
interface=eth1
dhcp-range=192.168.50.100,192.168.50.200,infinite
dhcp-option=option:router,192.168.50.1
dhcp-option=option:dns-server,8.8.8.8
log-queries
log-dhcp
“ >> /etc/dnsmasq.conf
