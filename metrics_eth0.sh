#!/bin/bash
# metrics_eth0.sh

ifconfig | grep etho
ifconfig eth0 | grep TX
ifconfig eth0 | grep RX
