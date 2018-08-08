#!/bin/bash
yum install -y epel-release net-tools wget htop unzip tmux ntsysv
yum update -y

##ssh no DNS
sed -i -e 's/#UseDNS yes/UseDNS no/i' /etc/ssh/sshd_config
sed -i -e 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/i' /etc/ssh/sshd_config


##stop firewall
systemctl stop firewalld
systemctl disable firewalld

##stop SMTP
systemctl stop postfix
systemctl disable postfix


##disable IPV6
sed -i -e 's/rhgb quiet/rhgb quiet ipv6.disbale=1/i' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg


##SFTP LOG
sed -i -e 's/sftp-server/sftp-server -l INFO/i' /etc/ssh/sshd_config
systemctl restart sshd


yum install iptables-services

修改
/etc/sysconfig/iptables

记得
service iptables restart

限制读取80port
# -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT 先注解
最下面设定
-A IN_public_allow -p tcp -m tcp -s 你的IP --dport 80 -m conntrack --ctstate NEW -j ACCEPT

