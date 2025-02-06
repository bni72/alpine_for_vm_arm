#!/bin/bash
# startup.sh

FILE_LOG="/var/log/startup.log"

echo "-----START PROCESSING" >> $FILE_LOG
echo "DATE=`date`" >> $FILE_LOG
echo "---" >> $FILE_LOG

ifconfig eth0 | grep eth0 >> $FILE_LOG
ifconfig eth0 down
ifconfig eth0 hw ether 00:00:00:00:10:47
ifconfig eth0 up
ifconfig eth0 | grep eth0 >> $FILE_LOG

rc-service networking restart

echo "+++++STOP PROCESSING" >> $FILE_LOG
