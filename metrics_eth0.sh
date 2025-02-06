#!/bin/bash
# metrics_eth0.sh

FILE_LOG="/var/log/metrics_eth0.log"

echo "-----START PROCESSING" >> $FILE_LOG
echo "DATE=`date`" >> $FILE_LOG
echo "---" >> $FILE_LOG

ifconfig | grep eth0 >> $FILE_LOG
ifconfig eth0 | grep TX >> $FILE_LOG
ifconfig eth0 | grep RX >> $FILE_LOG

echo "+++++STOP PROCESSING" >> $FILE_LOG
