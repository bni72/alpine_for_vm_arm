#!/bin/bash
# bd_stats_drop_55_50.sh

WEB_PAGE="/var/www/html/firewall_stats.html"

STATS=$(iptables -L FORWARD -v -n | grep "192.168.55.0/24" | awk '{print $1, $2, $8, $9}')

echo "<html>
<head><title>Firewall Statistics</title></head>
<body>
<h1>Firewall Statistics</h1>
<table border='1'>
<tr><th>Packets</th><th>Bytes</th><th>Source</th><th>Destination</th></tr>
" > $WEB_PAGE

echo "$STATS" | while read line; do
    echo "<tr><td>${line// /</td><td>}</td></tr>" >> $WEB_PAGE
done

echo "
</table>
<p>Last updated: $(date)</p>
</body>
</html>
" >> $WEB_PAGE
