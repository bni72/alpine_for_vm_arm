#!/bin/bash
# bd_stats_drop_55_50.sh

$FILE_HTML="/var/www/html/index.html"

STATS=$(iptables -L FORWARD -v -n | grep "DROP" | awk '{print $1, $2, $8, $9}')

echo "<!DOCTYPE html>" > $FILE_HTML
echo "<html lang='en'>" >> $FILE_HTML
echo "<head>" >> $FILE_HTML
echo "<meta charset='utf-8'>" >> $FILE_HTML
echo "<title>Firewall Statistics</title>" >> $FILE_HTML
echo "</head>" >> $FILE_HTML
echo "<body>" >> $FILE_HTML
echo "<h1>Firewall Statistics</h1>" >> $FILE_HTML
echo "<table border='1'>" >> $FILE_HTML
echo "<tr><th>Packets</th><th>Bytes</th><th>Source</th><th>Destination</th></tr>" >> $FILE_HTML

echo "$STATS" | while read line; do
    echo "<tr><td>${line// /</td><td>}</td></tr>" >> $FILE_HTML
done

echo "</table>" >> $FILE_HTML
echo "<p>Last updated: $(date)</p>" >> $FILE_HTML
echo "</body>" >> $FILE_HTML
echo "</html>" >> $FILE_HTML
