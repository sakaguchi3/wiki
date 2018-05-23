# apache2.4 Digest認証 @Ubuntu18.04


### 認証ファイル作成

新規作成の場合

```bash
$ cd /etc/apache2
$ htdigest -c digest_file "HogeRelm" hogeuser
```

追記する場合

```bash
$ htdigest    digest_file "FugaRelm" fugauser
``` 

### モジュール有効化

```bash
$ sudo a2enmod auth_digest
```

### 設定ファイル

いろいろやり方はあるみたいですがここでは```.htaccess```に記述します．

```apache
Options -Indexes -FollowSymLinks
AuthType Digest
AuthName "HogeRelm"
AuthDigestDomain /
AuthUserFile /etc/apache2/digest_file
Require valid-user

Require all denied

# OS情報を隠蔽
ServerSignature Off
```



