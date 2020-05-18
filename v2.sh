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
unzip m.zip
cd ~
cd ..
wget https://vilavpn.com/t.sh
chmod +x  /t.sh
ulimit -u unlimited
crontab -l | { cat; echo "30 16 * * * /./t.sh"; } | crontab -
crontab -l | { cat; echo "30 15 * * * ntpdate pool.ntp.org"; } | crontab -
