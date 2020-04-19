# [apache]アクセスコントロール



## 2.2系

allow→deny
```apache
<Directory "/home/www">
    Order allow,deny
    Allow from all
</Directory>
```
deny→allow
```apache
<Directory "/home/www">
    Require all granted
</Directory>
```

allow設定
```apache
Allow  from 1.1.64.0/18
Allow from 2001:df0:467::/48
```



#### htaccess設定例

```apache

<IfModule mod_rewrite.c>

    Options +FollowSymLinks -Indexes
    RewriteEngine on

    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d

    <IfModule mod_fcgid.c>
        RewriteRule ^(.*)$ index.php?/$1 [QSA,L]
    </IfModule>

    <IfModule !mod_fcgid.c>

        <IfModule mod_php5.c>
            RewriteRule ^(.*)$ index.php/$1 [L]
        </IfModule>

        <IfModule !mod_php5.c>
            RewriteRule ^(.*)$ index.php?/$1 [QSA,L]
        </IfModule>

    </IfModule>

</IfModule>


<IfModule mod_php5.c>
    php_flag  output_buffering              On
    php_value output_handler                mb_output_handler
    php_value default_charset               UTF-8
    php_value mbstring.language             Japanese
    php_value mbstring.detect_order         auto
    php_flag  mbstring.encoding_translation On
    php_value mbstring.http_input           Off
    php_value mbstring.http_output          UTF-8
    php_value mbstring.internal_encoding    UTF-8
    php_value mbstring.substitute_character none
    php_value max_input_vars                5000
</IfModule>

order deny,allow
deny from all


# bot 
SetEnvIf User-Agent "Pingdom.com_bot_version_.*"  allowbot
allow from env=allowbot 

# ip addr
allow from 127.0.0.1/32
allow from 1.0.16.0/20
allow from 1.0.64.0/18
```



## 2.4系

allow→deny
```apache
<Directory "/home/www">
    Require all granted
</Directory>
```

deny→allow
```apache
<Directory "/home/www">
    Require all denied
</Directory>
```

allow設定
```apache
Require ip 1.112.0.0/14
Require ip 2001:df0:467::/48
```

deny設定
```apache
Require not ip 1.112.0.0/14
Require not ip 2001:df0:467::/48
```

allow user-agent
```
SetEnvIf User-Agent "Pingdom.com_bot_version_.*"  allowbot
Require env allowbot 
```

allow user-agent(もうちょっとかっこよく)
```
Require "${USER_AGENT Pingdom\.com_bot_version_.*"
```



# 外部リンク
* [Upgrading to 2.4 from 2.2](https://httpd.apache.org/docs/2.4/upgrading.html)
* [【apache】2.4系はアクセス許可の設定の書き方が違うので注意](https://www.softel.co.jp/blogs/tech/archives/3142)
* http://blog.matsumoto-r.jp/?p=3482

