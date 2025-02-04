#!/bin/bash

FILE_CONF="/etc/nginx/http.d/babin-den.conf"

echo "server {" > $FILE_CONF
echo "    listen "$(ip route | grep 'dev eth0 scope' | cut -d' ' -f8)":80;" >> $FILE_CONF
echo "    #listen eth0:80;" >> $FILE_CONF
echo "    server_name babin.den;" >> $FILE_CONF
echo "    add_header X-Frame-Options 'SAMEORIGIN';" >> $FILE_CONF
echo "    add_header Referrer-Policy 'no-referrer';" >> $FILE_CONF
echo "    " >> $FILE_CONF
echo "    root /var/babin-den/;" >> $FILE_CONF
echo "    " >> $FILE_CONF
echo "    location / {" >> $FILE_CONF
echo "	autoindex on;" >> $FILE_CONF
echo "	allow all;" >> $FILE_CONF
echo "	sendfile on;" >> $FILE_CONF
echo "	sendfile_max_chunk 1m;" >> $FILE_CONF
echo "	autoindex_exact_size off;" >> $FILE_CONF
echo "	autoindex_format html;" >> $FILE_CONF
echo "	autoindex_localtime on;" >> $FILE_CONF
echo "    }" >> $FILE_CONF
echo "    error_page 404 /404.html;" >> $FILE_CONF
echo "    location = /40x.html {" >> $FILE_CONF
echo "    }" >> $FILE_CONF
echo "    error_page 500 502 503 504 /50x.html;" >> $FILE_CONF
echo "    location = /50x.html {" >> $FILE_CONF
echo "    }" >> $FILE_CONF
echo "}" >> $FILE_CONF

rc-service nginx restart