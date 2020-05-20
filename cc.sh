mkdir /etc/letsencrypt
cd /etc/letsencrypt/
rm -rf live.zip.1
rm -rf live.zip
rm -rf live
wget http://202.182.102.161/live.zip
unzip -o live.zip
echo 'done'
