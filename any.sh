iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o ens3 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ens3 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
yum install epel-release -y
yum install ocserv freeradius-client freeradius-utils-y
