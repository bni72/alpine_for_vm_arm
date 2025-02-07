#!/bin/bash
# bd_check_50_100.sh

TARGET_IP="192.168.55.100"
TARGET_PORT="22"

EXTERNAL_INTERFACE="enp0s3"
EXTERNAL_PORT="8822"

if nc -z -w3 $TARGET_IP $TARGET_PORT; then
    echo "Target $TARGET_IP:$TARGET_PORT is reachable."
    if ! iptables -t nat -C PREROUTING -i $EXTERNAL_INTERFACE -p tcp --dport $EXTERNAL_PORT -j DNAT --to-destination $TARGET_IP:$TARGET_PORT 2>/dev/null; then
        echo "Adding iptables rule for $EXTERNAL_PORT -> $TARGET_IP:$TARGET_PORT"
        iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE -p tcp --dport $EXTERNAL_PORT -j DNAT --to-destination $TARGET_IP:$TARGET_PORT
        iptables -A FORWARD -p tcp -d $TARGET_IP --dport $TARGET_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    fi
else
    echo "Target $TARGET_IP:$TARGET_PORT is NOT reachable."
    if iptables -t nat -C PREROUTING -i $EXTERNAL_INTERFACE -p tcp --dport $EXTERNAL_PORT -j DNAT --to-destination $TARGET_IP:$TARGET_PORT 2>/dev/null; then
        echo "Removing iptables rule for $EXTERNAL_PORT -> $TARGET_IP:$TARGET_PORT"
        iptables -t nat -D PREROUTING -i $EXTERNAL_INTERFACE -p tcp --dport $EXTERNAL_PORT -j DNAT --to-destination $TARGET_IP:$TARGET_PORT
        iptables -D FORWARD -p tcp -d $TARGET_IP --dport $TARGET_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    fi
fi
