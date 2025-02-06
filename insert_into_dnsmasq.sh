#!/bin/bash
# insert_into_dnsmasq.sh

FILE_DNSMASQ="/etc/dnsmasq.conf"

echo " " >> $FILE_DNSMASQ
echo "interface=eth1" >> $FILE_DNSMASQ
echo "dhcp-range=192.168.50.100,192.168.50.200,infinite" >> $FILE_DNSMASQ
echo "dhcp-option=option:router,192.168.50.1" >> $FILE_DNSMASQ
echo "dhcp-option=option:dns-server,8.8.8.8" >> $FILE_DNSMASQ
echo "log-queries" >> $FILE_DNSMASQ
echo "log-dhcp" >> $FILE_DNSMASQ
