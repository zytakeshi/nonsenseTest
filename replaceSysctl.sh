cd /etc/
rm -rf sysctl.conf
wget https://raw.githubusercontent.com/zytakeshi/nonsenseTest/master/sysctl.conf
sysctl -p
ulimit -u unlimited
ulimit -n 65536
sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
systemctl stop firewalld systemctl disable firewalld systemctl status firewalld
sudo setenforce 0
sed -i '/^\*\ *soft\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
sed -i '/^\*\ *hard\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
echo '* soft nofile 65536' >>/etc/security/limits.conf
echo '* hard nofile 65536' >>/etc/security/limits.conf
