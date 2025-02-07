#!/bin/bash
# ub_startup.sh

FILE_LOG="/var/log/startup.log"

echo "-----START PROCESSING" >> $FILE_LOG
echo "DATE=`date`" >> $FILE_LOG
echo "---" >> $FILE_LOG

sudo ifconfig enp0s8 | grep ether >> $FILE_LOG
sudo ifconfig enp0s8 down
sudo ifconfig enp0s8 hw ether 00:00:00:00:10:47
sudo ifconfig enp0s8 up
sudo ifconfig enp0s8 | grep ether >> $FILE_LOG

sudo systemctl restart systemd-networkd

echo "+++++STOP PROCESSING" >> $FILE_LOG
