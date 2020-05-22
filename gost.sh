wget -N --no-check-certificate https://github.com/ginuerzh/gost/releases/download/v2.11.0/gost-linux-amd64-2.11.0.gz && gzip -d gost-linux-amd64-2.11.0.gz
mv gost-linux-amd64-2.11.0 gost
chmod +x gost
nohup ./gost -D -L "ws://:8080?path=/ws&rbuf=4096&wbuf=4096&compression=false" &
