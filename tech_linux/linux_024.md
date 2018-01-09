#  php72をソースコード + apache24(yum) インストール@CentOS7



# install apache

```
yum install apache

# install apxs 
yum install httpd-devel

# ssl
yum install mod_ssl

systemctl start httpd
```



# install php72 

```bash
$ cd /usr/local/src
$ wget https://www.php.net/distributions/php-7.2.29.tar.gz
$ bash ./configure  '--with-apxs2=/usr/bin/apxs' \
  '--enable-bcmath' '--enable-ctype' '--enable-dom' '--enable-filter' '--enable-hash' '--enable-libxml' '--enable-mbstring' '--enable-session' '--enable-simplexml' '--enable-tokenizer' '--enable-xml' '--enable-xmlreader' '--enable-xmlwriter' '--enable-exif' '--enable-zip' '--without-libzip' '--enable-pdo' '--with-mysql' '--with-pdo-mysql' '--with-pic' '--disable-rpath' '--with-pear' '--with-bz2' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-iconv' '--with-zlib' '--with-layout=GNU' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-shmop' '--enable-calendar' '--with-system-tzdata' '--without-gd' '--disable-dba' '--without-unixODBC'  '--enable-fileinfo' '--enable-json' '--without-pspell' '--disable-wddx' '--with-curl' '--disable-posix' '--with-openssl' '--with-gd' '--with-jpeg-dir' '--with-png-dir' '--with-vpx-dir' '--enable-opcache' --disable-phar \
  --prefix=/usr/local/php72 \
  |  tee log_20200817.log  
```

エラーと対応方法
```bash
configure: error: libxml2 not found. Please check your libxml2 installation.
$ yum install libxml2-devel

checking for pkg-config... /usr/bin/pkg-config
configure: error: Cannot find OpenSSL's <evp.h>
$ yum install openssl-devel

configure: error: Please reinstall the BZip2 distribution
$ yum install bzip2-devel 

checking for cURL 7.10.5 or greater... configure: error: cURL version 7.10.5 or later is required to compile php with cURL support
$ yum install curl-devel

configure: error: jpeglib.h not found.
...
checking whether to enable JIS-mapped Japanese font support in GD... no 
If configure fails try --with-webp-dir=<DIR>
$ yum --enablerepo=epel install libwebp libwebp-devel libwebp-tools(不要かも?)
$ yum --enablerepo=epel install freetype freetype-devel(不要かも?)
$ yum install libpng-devel (不要かも?)
$ yum install libjpeg-devel
```

configure success
```bash
configure: WARNING: unrecognized options: --with-mysql, --enable-gd-native-ttf, --enable-magic-quotes, --enable-ucd-snmp-hack, --with-system-tzdata, --with-vpx-dir
```

 make
```bash
$ make 
Build complete.
Don't forget to run 'make test'.

$ make test
ext/sockets - socket_bind - basic test [ext/sockets/tests/socket_bind.phpt]
SQLite3::open error test [ext/sqlite3/tests/sqlite3_15_open_error.phpt] 

$ make install
Wrote PEAR system config file at: /usr/local/php72/etc/pear.conf
You may want to add: /usr/local/php72/share/pear to your php.ini include_path
Installing PDO headers:           /usr/local/php72/include/php/ext/pdo/
```

バージョン確認
```bash
$ /usr/local/php72/bin/php --version
PHP 7.2.29 (cli) (built: Aug 17 2020 11:32:04) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies 
```


# apache 設定ファイル

設定ファイル
```
/etc/httpd/conf/httpd.conf
/etc/httpd/conf.d/default.conf
```

デフォルトで設定されている `conf.d/*` 配下のファイルを読み込まないようにしておく
```bash
$ cd /etc/httpd/conf.d
$ mv xxx.conf xxx.conf.ignore
```

```vim conf.d/default.conf
<VirtualHost *:80>
    DirectoryIndex index.html index.htm
    <Directory "/var/www/default/">
        Require all granted
    </Directory>
    DocumentRoot /var/www/default/
    ErrorLog logs/virtualhost/virtual-default-error_log
    CustomLog logs/virtualhost/virtual-default-access_log combined env=!no_log
    <IfModule mod_rewrite.c>
        RewriteEngine off
        RewriteCond %{HTTPS} off
        RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R,L]
    </IfModule>
</VirtualHost>

<VirtualHost *:443>
     DirectoryIndex index.html index.hml index.php
    <Directory "/var/www/default/">
         Require all granted
     </Directory>
     DocumentRoot /var/www/default/
     ErrorLog logs/virtualhost/virtual-default-ssl-error_log
     CustomLog logs/virtualhost/virtual-default-ssl-access_log combined env=!no_log
</VirtualHost>
```

```bash
$ cd /etc/httpd/
$ mkdir logs/virtualhost
```

start 
```bash
$ systemctl start httpd
$ systemctl stop httpd
```


