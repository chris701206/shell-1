__安装php的shell script__
```sh
#!/bin/bash
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sed -i -e '9c enabled=1' /etc/yum.repos.d/remi-php72.repo
yum install -y php
```
