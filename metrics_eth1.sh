#!/bin/bash
# metrics_eth1.sh

ifconfig | grep eth1
ifconfig eth1 | grep TX
ifconfig eth1 | grep RX
