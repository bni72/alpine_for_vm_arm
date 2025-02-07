#!/bin/bash
# ubuntu_autodelete.sh

mkdir /home/bni/ROOT_SCRIPT
cp /home/bni/alpine_for_vm_arm/*.sh /home/bni/ROOT_SCRIPT
chmod +x /home/bni/ROOT_SCRIPT/*.sh
rm -R /home/bni/alpine_for_vm_arm
ls /home/bni -silah
