sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
systemctl stop firewalld systemctl disable firewalld systemctl status firewalld
sudo setenforce 0
sudo yum remove firewalld ufw -y
yum install epel-release -y
yum --enablerepo=epel update -y
yum --enablerepo=epel -y install nano wget unzip zip nginx mlocate certbot-nginx telnet htop
curl -Ls https://install.direct/go.sh | sudo bash
cd ~
cd ..
mkdir manager
cd manager
wget https://bitvila.com/v/insutoru/m.zip
yum install unzip 
unzip m.zip
cd ~
cd ..
cd /etc/yum.repos.d/
wget https://vilavpn.com/nginx.repo
yum install nginx -y
cd ~
cd ..
cd etc/nginx/conf.d/
rm -rf default.conf
systemctl enable nginx
cd ~
cd ..
wget https://vilavpn.com/t.sh
chmod +x  /t.sh
ulimit -u unlimited
