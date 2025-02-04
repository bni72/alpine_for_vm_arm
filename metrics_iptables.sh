#!/bin/bash

FILE_HTML="/var/babin-den/index.html"

echo "<!DOCTYPE html>" > $FILE_HTML
echo "<html lang='en'>" >> $FILE_HTML
echo "<head>" >> $FILE_HTML
echo "<meta charset='utf-8'>" >> $FILE_HTML
echo "<title>Page babinden</title>" >> $FILE_HTML
echo "<link rel='stylesheet' href='style.css'>" >> $FILE_HTML
echo "<script src='script.js'></script>" >> $FILE_HTML
echo "</head>" >> $FILE_HTML
echo "<body>" >> $FILE_HTML
echo "<p>"`iptables -L -v | grep DROP`"</p>" >> $FILE_HTML
echo "</body>" >> $FILE_HTML
echo "</html>" >> $FILE_HTML