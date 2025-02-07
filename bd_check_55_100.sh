#!/bin/bash
# bd_check_55_100.sh

T_IP="192.168.55.100"
T_PORT="22"

D_INTERFACE="enp0s3"
D_PORT="8822"

if nc -z -w3 $T_IP $T_PORT; then
    echo "Target $T_IP:$T_PORT is YES"
    if ! iptables -t nat -C PREROUTING -i $D_INTERFACE -p tcp --dport $D_PORT -j DNAT --to-destination $T_IP:$T_PORT 2>/dev/null; then
        echo "Adding iptables rules for $D_PORT -> $T_IP:$T_PORT"
        iptables -t nat -A PREROUTING -i $D_INTERFACE -p tcp --dport $D_PORT -j DNAT --to-destination $T_IP:$T_PORT
        iptables -A FORWARD -p tcp -d $T_IP --dport $T_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    fi
else
    echo "Target $T_IP:$T_PORT is NOT"
    if iptables -t nat -C PREROUTING -i $D_INTERFACE -p tcp --dport $D_PORT -j DNAT --to-destination $T_IP:$T_PORT 2>/dev/null; then
        echo "Removing iptables rules for $D_PORT -> $T_IP:$T_PORT"
        iptables -t nat -D PREROUTING -i $D_INTERFACE -p tcp --dport $D_PORT -j DNAT --to-destination $T_IP:$T_PORT
        iptables -D FORWARD -p tcp -d $T_IP --dport $T_PORT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    fi
fi
