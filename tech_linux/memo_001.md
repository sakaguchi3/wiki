# 技術系 - memo


### linux command

```bash
systemctl restart httpd

iptables --list
uwf
sudo iptables -I INPUT   -p tcp -m tcp --dport 443 -j ACCEPT
sudo iptables -L --line-number
sudo systemctl restart iptables
sudo systemctl iptables save
sudo vim /etc/sysconfig/iptables-config
ps aux| grep firewalld
sudo iptables -L --line-numbers
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --add-port=443/tcp --zone=public --permanent
sudo firewall-cmd --get-services
sudo firewall-cmd --get-services
sudo firewall-cmd --list-all

sudo semanage port -l | grep 443
  
sudo chown apache:apache certs/cert_example.com_nopass.pem
sudo chown apache:apache  private/sec_example.com_nopass.pem

sudo tar czf hoge.tgz  fuga --exclude "tmp/*"
```

docker
```bash
docker-compose --verbose -f docker-compose.development.yml
docker-compose --verbose -f docker-compose.development.yml stop
docker-compose --verbose -f docker-compose.development.yml rm
docker volume ls 
docker volume rm $(docker volume ls -qf dangling=true)
```



### php72をソースからインストールしたときのメモ

configure
```bash
bash ./configure   '--enable-bcmath' '--enable-ctype' '--enable-dom' '--enable-filter' '--enable-hash' '--enable-libxml' '--enable-mbstring' '--enable-session' '--enable-simplexml' '--enable-tokenizer' '--enable-xml' '--enable-xmlreader' '--enable-xmlwriter' '--enable-exif' '--enable-zip' '--without-libzip' '--enable-pdo' '--with-mysql' '--with-pdo-mysql' '--with-pic' '--disable-rpath' '--with-pear' '--with-bz2' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-iconv' '--with-zlib' '--with-layout=GNU' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-shmop' '--enable-calendar' '--with-system-tzdata' '--without-gd' '--disable-dba' '--without-unixODBC'  '--enable-fileinfo' '--enable-json' '--without-pspell' '--disable-wddx' '--with-curl' '--disable-posix' '--with-openssl' '--with-gd' '--with-jpeg-dir' '--with-png-dir' '--with-vpx-dir' '--enable-opcache' --disable-phar   --prefix=/usr/local/php72 \

sudo make test
sudo make
```


configure時のエラー
```bash
configure: error: no acceptable C compiler found in $PATH
yum install gcc

configure: error: libxml2 not found. Please check your libxml2 installation.
yum install libxml2-devel

configure: error: Cannot find OpenSSL's <evp.h>
$ yum install openssl-devel

configure: error: Please reinstall the BZip2 distribution
$ yum install bzip2-devel 

configure: error: Please reinstall the libcurl distribution -
    easy.h should be in <curl-dir>/include/curl/
$ yum insatll curl-devel

# configure: error: mcrypt.h not found. Please reinstall libmcrypt.
#$ yum install libmcrypt-devel --enablerepo=epel

yum install 
libjpeg-turbo-devel

sudo yum install libjpeg-turbo-devel
sudo yum install libpng-devel
```

version
```
/usr/local/php72/bin/php -v
PHP 7.2.29 (cli) (built: May 24 2020 20:53:29) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies  
```


### curl

digest認証が必要な場合

```bash
curl \
     -H "Accept: application/json" \
     -u  username_xxxxx:pass_xxxxxxx    \
     https://auth.example.com/uaa/oauth/token \
     -d grant_type=client_credentials \
     --verbose \
```

```bash

curl \
    -v -H \
    "Authorization:bearer secret_token_xxxxxx" \
    "https://api.example.com/db2/client/seg?safe_url=https://hogefuga.com/kanagawa/D1405/B327/99914000813/&"   \  
```

```bash
curl https://api.example.com:8010/server/api/update?apikey=secretkey_xxxxxx -X POST \
     -F 'id=23'  \
     -F 'userid=michael' \
     -F 'time=2020/07/11 01:37:34'

curl https://api.example.com:8010/server/api/update?apikey=secretkey_xxxxxx -X POST \
    \ -d '{"id":123, "userid":"michael", "time":"2020/07/11 01:37:34"}'      
```

```bash
curl -sS 'https://example.com/hogeapi' \
    | jq
curl https://example.com/hogeapi -k -X POST    
```
