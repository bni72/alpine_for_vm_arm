#!/bin/bash
# metrics_eth0.sh

ifconfig | grep eth0
ifconfig eth0 | grep TX
ifconfig eth0 | grep RX
