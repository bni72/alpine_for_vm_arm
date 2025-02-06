#!/bin/bash
# autodelete.sh

mkdir /root/ROOT_SCRIPT
cp /root/alpine_for_vm_arm/*.sh /root/ROOT_SCRIPT
chmod +x /root/ROOT_SCRIPT/*.sh
cd /root
rm -R /root/alpine_for_vm_arm
ls /root -silah
