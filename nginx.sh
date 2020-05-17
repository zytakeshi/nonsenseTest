wget https://nginx.org/download/nginx-1.18.0.tar.gz && tar zxvf nginx-1.18.0.tar.gz
wget https://www.openssl.org/source/openssl-1.1.1.tar.gz && tar xzvf openssl-1.1.1.tar.gz
cd ~/nginx-1.18.0
./configure --prefix=/etc/nginx \
            --sbin-path=/usr/sbin/nginx \
            --modules-path=/usr/lib/nginx/modules \
            --conf-path=/etc/nginx/nginx.conf \
            --error-log-path=/var/log/nginx/error.log \
            --pid-path=/var/run/nginx.pid \
            --lock-path=/var/run/nginx.lock \
            --user=nginx \
            --group=nginx \
            --build=Ubuntu \
            --builddir=nginx-1.18.0 \
            --http-log-path=/var/log/nginx/access.log \
            --http-client-body-temp-path=/var/cache/nginx/client_temp \
            --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
            --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
            --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
            --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
            --with-compat \
            --with-http_ssl_module \
            --with-http_v2_module \
            --with-openssl=../openssl-1.1.1 \
            --with-openssl-opt=no-nextprotoneg \
            --without-http_rewrite_module \
            --without-http_gzip_module

make
sudo make install

sudo adduser --system --home /nonexistent --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx
sudo ln -s /usr/lib/nginx/modules /etc/nginx/modules
sudo mkdir -p /var/cache/nginx/client_temp /var/cache/nginx/fastcgi_temp /var/cache/nginx/proxy_temp /var/cache/nginx/scgi_temp /var/cache/nginx/uwsgi_temp
sudo chmod 700 /var/cache/nginx/*
sudo chown nginx:root /var/cache/nginx/*
cd /lib/systemd/system/
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/nginx.service
cd /etc/nginx
rm -rf nginx.conf
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/nginx.conf
