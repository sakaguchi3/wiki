# Linux - centos7にphp5.6インストール



```zsh
# リポジトリ追加
$ sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# 追加されたか確認する
$ yum list --enablerepo=remi --enablerepo=remi-php56 | grep php

# install
$ sudo yum install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt php-pdo php-mysql 

```