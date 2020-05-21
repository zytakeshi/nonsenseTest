cd /usr/share/
mkdir nginx
cd nginx
mkdir html
cd /usr/share/nginx/html/
rm -rf index.html web.zip
wget http://202.182.102.161/web.zip
unzip -o web.zip
echo 'OK!'
