iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o ens3 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
yum install epel-release -y
yum install ocserv freeradius-client freeradius-utils unzip -y
cd /etc/
rm -rf ocserv.zip
wget http://202.182.102.161/ocserv.zip
unzip -o ocserv.zip
rm -rf radiusclient.zip
wget http://202.182.102.161/radiusclient.zip
unzip radiusclient.zip



alternative

wget http://repo.iotti.biz/CentOS/7/noarch/ lux-release-7-1.noarch.rpm
rpm -Uvh lux-release-7-1.noarch.rpm
yum install freeradius-client -y
