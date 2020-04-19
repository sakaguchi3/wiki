# php72をソースコードからインストール@CentOS7

## install php

```
$ cd /usr/local/src
$ wget https://www.php.net/distributions/php-7.2.29.tar.gz

$ bash ./configure  '--with-apxs2=/usr/local/apache2.2/bin/apxs' \
  '--enable-bcmath' '--enable-ctype' '--enable-dom' '--enable-filter' '--enable-hash' '--enable-libxml' '--enable-mbstring' '--enable-session' '--enable-simplexml' '--enable-tokenizer' '--enable-xml' '--enable-xmlreader' '--enable-xmlwriter' '--enable-exif' '--enable-zip' '--without-libzip' '--enable-pdo' '--with-mysql' '--with-pdo-mysql' '--with-pic' '--disable-rpath' '--with-pear' '--with-bz2' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-iconv' '--with-zlib' '--with-layout=GNU' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-shmop' '--enable-calendar' '--with-system-tzdata' '--without-gd' '--disable-dba' '--without-unixODBC'  '--enable-fileinfo' '--enable-json' '--without-pspell' '--disable-wddx' '--with-curl' '--disable-posix' '--with-openssl' '--with-gd' '--with-jpeg-dir' '--with-png-dir' '--with-vpx-dir' '--enable-opcache' --disable-phar \
  --prefix=/usr/local/php72 \
  |  tee log_20200412_configure.log     

$ make
$ make install

$ ls /usr/local/apache2.2/modules/*php*
-rwxr-xr-x. 1 root   root   42M Apr 11 10:23 /usr/local/apache2.2/modules/libphp7.so*

$ ls /usr/local/php72
drwxr-xr-x. 2 root root 4.0K Apr 11 10:23 bin/
drwxr-xr-x. 2 root root   36 Apr 11 10:59 etc/
drwxr-xr-x. 3 root root   16 Apr 11 10:23 include/
drwxr-xr-x. 3 root root   16 Apr 11 10:23 lib/
drwxr-xr-x. 4 root root   27 Apr 11 10:23 share/
drwxr-xr-x. 4 root root   26 Apr 11 10:23 var/
```


## install mecab 

参考: https://qiita.com/YuukiMiyoshi/items/00b9878a1fa32b859a43

```
$ cd /usr/local/src
$ sudo wget 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE'  -O mecab-0.996.tar.gz          
$ bash ./configure
$ sudo make
$ sudo make install

$locate mecab| head -n 30
/usr/local/bin/mecab
/usr/local/bin/mecab-config
```

`--prefix=` でinstall先を変更可能
```
# configure(コンパイルのための設定)を実行し、コンパイルしてインストール
./configure --prefix=/opt/mecab --with-charset=utf8 --enable-utf8-only
```


## install php-mecab 

```
$ cd /usr/local/src
$ git clone https://github.com/rsky/php-mecab 
$ sudo /usr/local/php72/bin/phpize //configureが作成される
$ sudo bash ./configure  \
  --with-mecab=/usr/local/bin/mecab-config \
  --with-php-config=/usr/local/php72/bin/php-config \
  | tee log_configure_0411.log  

$ make
$ sudo make install
Installing shared extensions:     /usr/local/php72/lib/php/20170718/ 

$ ls /usr/local/php72/lib/php/20170718
-rwxr-xr-x. 1 root root 174K Apr 11 10:39 mecab.so*
-rwxr-xr-x. 1 root root 1.9M Apr 11 10:23 opcache.so*
```

## install mecab dictionary

install ipadic
```bash
bash ./configure --with-mecab-config=/usr/local/bin/mecab-config
```

install neologd    
```
wget 'https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM' -O mecab-ipadic-2.7.0-20070801.tar.gz
cd /usr/local/src/mecab-ipadic-neologd/bin
bash ./install-mecab-ipadic-neologd -n -y -p /home/mydir/neologd

sudo mv /home/moydir/neologd  /usr/local/lib/mecab/dic/mecab-ipadic-neologd
```

PHP側の設定
```
# fuel/app/config/env.php

// mecab dictionary
'mekabu_dic_path' => '/usr/local/lib/mecab/dic/mecab-ipadic-neologd', 
```

https://qiita.com/YuukiMiyoshi/items/00b9878a1fa32b859a43



## edit php.ini

https://qiita.com/yusukeito58/items/36aeb7f6376e7b9b9d7e

```
$ cp /usr/local/src/php-7.2.29/php.ini-production  /usr/local/php72/etc/php.ini
$ vim php.ini
extension=mecab.so // 追記

$ /usr/local/php72/bin/php -m | grep mecab 
mecab  // って表示されればok
```



## check result 

```
$ ls /usr/local/apache2.2/modules/libphp7.so
-rwxr-xr-x. 1 root   root   42M Apr 11 10:23 libphp7.so*

$ /usr/local/php72/bin/php  -v
PHP 7.2.29 (cli) (built: Apr 11 2020 10:13:04) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies

$ /usr/local/php72/bin/php -m | grep mecab
mecab


$ /usr/local/bin/php -v
PHP 5.6.30 (cli) (built: Apr  3 2017 15:29:56)
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies 
```


