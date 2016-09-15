# centos7にMySQL5.6をインストール



# mysql 5.6 のインストール

## 互換ソフトをアンインストール
```bash
$ sudo yum remove mariadb-libs
$ sudo rm -rf /var/lib/mysql/
```

## mysqlリポジトリ追加

```bash
$ sudo yum localinstall http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm
```

インストール可能になっているか調べる
```bash
$ sudo yum repolist all | grep mysql


mysql-connectors-community/x86_64 MySQL Connectors Community      enabled:    42
mysql-connectors-community-source MySQL Connectors Community - So disabled
mysql-tools-community/x86_64      MySQL Tools Community           enabled:    51
mysql-tools-community-source      MySQL Tools Community - Source  disabled
mysql55-community/x86_64          MySQL 5.5 Community Server      disabled
mysql55-community-source          MySQL 5.5 Community Server - So disabled
mysql56-community/x86_64          MySQL 5.6 Community Server      disabled
mysql56-community-source          MySQL 5.6 Community Server - So disabled
mysql57-community/x86_64          MySQL 5.7 Community Server      enabled:   201
mysql57-community-source          MySQL 5.7 Community Server - So disabled
```

## mysql5.6インストール

```bash
$ sudo  yum  install yum-utils
```

5.7を無効にして、5.6を有効にする

```bash
$ sudo  yum-config-manager --disable  mysql57-community
$ sudo yum-config-manager --enable mysql56-community
```

インストールできるバージョンを確認

```bash
user@server:0:%  yum info mysql-community-server
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: ftp.iij.ad.jp
 * epel: ftp.riken.jp
 * extras: ftp.iij.ad.jp
 * updates: ftp.iij.ad.jp
Available Packages
Name        : mysql-community-server
Arch        : x86_64
Version     : 5.6.37
Release     : 2.el6
Size        : 55 M
Repo        : mysql56-community/x86_64
Summary     : A very fast and reliable SQL database server
URL         : http://www.mysql.com/
License     : Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved. Under GPLv2 license as shown in the Description field.
Description : The MySQL(TM) software delivers a very fast, multi-threaded, multi-user,
            : and robust SQL (Structured Query Language) database server. MySQL Server
            : is intended for mission-critical, heavy-load production systems as well
            : as for embedding into mass-deployed software. MySQL is a trademark of
            : Oracle and/or its affiliates
            :
            : The MySQL software has Dual Licensing, which means you can use the MySQL
            : software free of charge under the GNU General Public License
            : (http://www.gnu.org/licenses/). You can also purchase commercial MySQL
            : licenses from Oracle and/or its affiliates if you do not wish to be bound by the terms of
            : the GPL. See the chapter "Licensing and Support" in the manual for
            : further info.
            :
            : The MySQL web site (http://www.mysql.com/) provides the latest news and
            : information about the MySQL software.  Also please see the documentation
            : and the manual for more information.
            :
            : This package includes the MySQL server binary as well as related utilities
            : to run and administer a MySQL server.

```

インストール
```bash
$ sudo yum install mysql-community-server
```

## 起動

```bash
$ sudo systemctl enable mysqld
$ sudo systemctl start mysqld

```




## 参考
https://weblabo.oscasierra.net/installing-mysql56-centos7-yum/