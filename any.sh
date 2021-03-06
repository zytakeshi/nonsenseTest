iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

iptables -A FORWARD -o vpns0 -j ACCEPT
iptables -A FORWARD -i vpns0 -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

yum install epel-release -y
yum install ocserv freeradius-client freeradius-utils unzip -y
cd /etc/
unzip -o ocserv.zip
unzip -o radiusclient.zip

#firewall
firewall-cmd --permanent --zone=public --add-port=445/tcp
firewall-cmd --permanent --zone=public --add-port=445/udp
firewall-cmd --permanent --add-masquerade
firewall-cmd --permanent --direct --passthrough ipv4 -t nat -A POSTROUTING -o eth0 -j MASQUERADE
firewall-cmd --reload


firewall-cmd --permanent --zone=home --add-port=445/tcp
firewall-cmd --permanent --zone=home --add-port=445/udp
firewall-cmd --reload

alternative

wget http://repo.iotti.biz/CentOS/7/noarch/lux-release-7-1.noarch.rpm
rpm -Uvh lux-release-7-1.noarch.rpm
yum install freeradius-client -y



iptables -I FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -I FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -I FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -I FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -I FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -I FORWARD -m string --algo bm --string "announce" -j DROP
iptables -I FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -I FORWARD -s 192.168.1.0/24 -p tcp -m tcp --sport 1024:65535 --dport 8080 -j ACCEPT
iptables -I FORWARD -s 192.168.1.0/24 -p tcp -m tcp --sport 1024:65535 --dport 2086 -j ACCEPT
iptables -I FORWARD -s 192.168.1.0/24 -p tcp -m tcp --sport 1024:65535 --dport 2087 -j ACCEPT
iptables -I FORWARD -s 192.168.1.0/24 -p tcp -m tcp --sport 1024:65535 --dport 2095 -j ACCEPT
iptables -I FORWARD -s 192.168.1.0/24 -p tcp -m tcp --sport 1024:65535 --dport 1024:65535 -j REJECT --reject-with icmp-port-unreachable
iptables -I FORWARD -s 192.168.1.0/24 -p udp -m udp --sport 1024:65535 --dport 1024:65535 -j REJECT --reject-with icmp-port-unreachable
