mkdir /etc/letsencrypt
cd /etc/letsencrypt/
rm -rf live.zip
wget http://202.182.102.161/live.zip
unzip -o live.zip
echo 'done'
