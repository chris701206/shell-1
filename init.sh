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

查看防火牆
# iptables -L

開啟port
# /sbin/iptables -I INPUT -p tcp --dport 443 -j ACCEPT
# /sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT  

關閉port
# /sbin/iptables -I INPUT -p tcp --dport 80 -j REJECT

记得
service iptables save
service iptables restart
