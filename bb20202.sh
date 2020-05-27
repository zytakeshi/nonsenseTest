mkdir /etc/letsencrypt/live
cd /etc/letsencrypt/live
rm -rf bb20202.zip
wget http://202.182.102.161/bb20202.zip
unzip -o bb20202.zip
echo 'done'
