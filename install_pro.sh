#!/bin/bash
# install_pro.sh

apk add mc
apk add dnsmasq
apk add busybox-extras
apk add curl
apk add wget
apk add iptables
apk add nginx

# Make folder for scripts ROOT_SCRIPT
cd /root
mkdir ROOT_SCRIPT ; cp /root/alpine_for_vm_arm/*.sh /root/ROOT_SCRIPT ; chmod +x /root/ROOT_SCRIPT/*.sh
