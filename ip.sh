iptables -I INPUT -s	0.0.0.0	 -p tcp --dport 26580 -j ACCEPT
iptables -I INPUT -s	127.0.0.1	 -p tcp --dport 26580 -j ACCEPT
iptables -I INPUT -s   42.157.160.112  -p tcp --dport 26580 -j ACCEPT
iptables -I INPUT -s	45.155.225.252 -p tcp --dport 26580 -j ACCEPT
iptables -A INPUT -p tcp --dport 26580 -j DROP
iptables -A INPUT -p tcp --dport 26580 -j DROP
echo 'OK'
