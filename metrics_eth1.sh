#!/bin/bash
# metrics_eth1.sh

FILE_LOG="/var/log/metrics_eth1.log"

echo "-----START PROCESSING" >> $FILE_LOG
echo "DATE=`date`" >> $FILE_LOG
echo "---" >> $FILE_LOG

ifconfig | grep eth1 >> $FILE_LOG
ifconfig eth1 | grep TX >> $FILE_LOG
ifconfig eth1 | grep RX >> $FILE_LOG

echo "+++++STOP PROCESSING" >> $FILE_LOG
