#!/bin/bash
# metrics_eth2.sh

FILE_LOG="/var/log/metrics_eth2.log"

echo "-----START PROCESSING" >> $FILE_LOG
echo "DATE=`date`" >> $FILE_LOG
echo "---" >> $FILE_LOG

ifconfig | grep eth2 >> $FILE_LOG
ifconfig eth2 | grep TX >> $FILE_LOG
ifconfig eth2 | grep RX >> $FILE_LOG

echo "+++++STOP PROCESSING" >> $FILE_LOG
