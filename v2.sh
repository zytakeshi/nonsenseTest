sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
systemctl stop firewalld systemctl disable firewalld systemctl status firewalld
sudo setenforce 0
sed -i '/^\*\ *soft\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
sed -i '/^\*\ *hard\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
echo '* soft nofile 65536' >>/etc/security/limits.conf
echo '* hard nofile 65536' >>/etc/security/limits.conf
sudo yum remove firewalld ufw -y
yum update -y
yum install epel-release -y
yum --enablerepo=epel update -y
yum --enablerepo=epel -y install nano wget unzip zip mlocate telnet htop unzip
yum group install "Development Tools" -y
dnf groupinstall "Development Tools" -y
curl -O https://dl.eff.org/certbot-auto
mv certbot-auto /usr/local/bin/certbot-auto
chmod 0755 /usr/local/bin/certbot-auto
curl -Ls https://install.direct/go.sh | sudo bash
cd ~
cd ..
mkdir manager
cd manager
wget https://bitvila.com/v/insutoru/m.zip
cd ~
cd ..
wget https://vilavpn.com/t.sh
chmod +x  /t.sh
ulimit -u unlimited
ulimit -n 65536
crontab -l | { cat; echo "30 16 * * * /./t.sh"; } | crontab -
crontab -l | { cat; echo "30 15 * * * ntpdate pool.ntp.org"; } | crontab -
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/ban_iptables.sh && chmod +x ban_iptables.sh && ./ban_iptables.sh banall
wget https://nginx.org/download/nginx-1.18.0.tar.gz && tar zxvf nginx-1.18.0.tar.gz
wget https://www.openssl.org/source/openssl-1.1.1.tar.gz && tar xzvf openssl-1.1.1.tar.gz
cd /nginx-1.18.0
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

sudo adduser --system --no-create-home --user-group  nginx
sudo ln -s /usr/lib/nginx/modules /etc/nginx/modules
sudo mkdir -p /var/cache/nginx/client_temp /var/cache/nginx/fastcgi_temp /var/cache/nginx/proxy_temp /var/cache/nginx/scgi_temp /var/cache/nginx/uwsgi_temp
sudo chmod 700 /var/cache/nginx/*
sudo chown nginx:root /var/cache/nginx/*
cd /lib/systemd/system/
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/nginx.service
cd /etc/nginx
rm -rf nginx.conf
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/nginx.conf
cd ~
cd ..
cd etc/nginx/
mkdir conf.d
cd conf.d
rm -rf default.conf
systemctl enable nginx
cd /etc/
rm -rf sysctl.conf
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/sysctl.conf
sysctl -p
sed -e '$i sysctl -p\n' /etc/rc.local
echo 'done'
