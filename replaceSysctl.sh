cd /etc/
rm -rf sysctl.conf
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/sysctl.conf
sysctl -p
