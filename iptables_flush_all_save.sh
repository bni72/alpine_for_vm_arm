#!/bin/bash
# iptables_flush_all_save.sh

iptables -F

service iptables save
rc-service iptables restart
