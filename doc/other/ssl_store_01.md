# ssl sotreで証明書を取得する手順


# メール認証
## ドメイン設定
whois 情報で連絡が取れるアドレスに変更する。
## dns認証
証明書発行時にcredentialが送られてくるので、txtレコードに設定する。  
この場合dsnさえ設定できれば大丈夫。  
whoisは設定しなくても大丈夫。

# 秘密鍵を作成
```bash
openssl genrsa 2048 > fqdn_sec_20220808.pem
<your_password>
```

# apache/nginx再起動時にパスワードを聞かれたくない場合はnopassの秘密鍵を作成する
```
openssl rsa \
 -in  fqdn_sec_20220808.pem \
 -out fqdn_sec_nopass_20220808.pem
 
Enter pass phrase for fqdn_sec_20220808.pem:
<your_password>
```

## csr作成
```
openssl req -new -sha512 \
 -key fqdn_sec_nopass_20220808.pem \
 -out fqdn_csr_20220808.pem 

Country Name (2 letter code) [XX]:
<country | (ex)JP>

State or Province Name (full name) []:
<State |(ex)Tokyo>

Locality Name (eg, city) [Default City]:
<localname | (ex)Shinjuku-ku>

Organization Name (eg, company) [Default Company Ltd]:
<Your company | Hoge inc.>

Organizational Unit Name (eg, section) []:
<unit name | (ex)ssl sales>

Common Name (eg, your name or your server's hostname) []:
<fqdn>
 
Email Address []:
<何も入力しなくても良い>

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
<何も入力しなくても良い>

An optional company name []: 
<何も入力しなくても良い>
```

# ssl storeで証明書の購入

* カートに証明書を入れる
* 入金
* 購入
* アクティベート
* コモンネームにfqdnを入れる
* メール認証にチェック
* `fqdn_csr_20220808.pem`のファイルの中身を貼って貼り付ける
* 技術者、担当者の情報を入力する

![](./ssl_store_01/j2.png)


### メール認証の場合
* 証明書送信先でさっき登録した whois に登録されているメアドを選択
![](./ssl_store_01/i1.png)
* whoisメアドに確認メールが飛んでくるので、問題がなければ承認URLをクリックする
* 30分くらいすると証明書が送られてくる

### dns認証の場合
* whoisメアドじゃなくても良くて、適当に受信できるアドレスを入力する
* 認証に必要なcredentialが送られてくるので、txtレコードに設定する。
* ssl storeのバッチがtxtレコードをチェックすると、証明書が送られてくる


# apache/ncinxの設定

送られてきた証明書には以下のものが含まれる。
* 中間証明書(複数)
* サーバ証明書

## nginxの設定例
中間証明書とサーバ証明書を結合して一つのファイルを作成。  
`fqdn_20221102_fullchain.pem`

```nginx
    ssl                  on;
    ssl_certificate      /etc/nginx/tls/fqdn_20221102_fullchain.pem;
    ssl_certificate_key  /etc/nginx/tls/fqdn_20221102_sec_nopass.pem;
```

設定に問題がないかを確認する   

```
ntinx -t
```

設定再読み込み

```bash
 service nginx reload
```

## apacheの設定例
中間証明書とサーバ証明書を結合する必要なし。  
```nginx
    # certification
    SSLCertificateFile      /etc/pki/tls/fqdn_20221102_cert.pem
    # Intermediate certification
    SSLCertificateChainFile /etc/pki/tls/fqdn_20221102_chain.pem
    # private key
    SSLCertificateKeyFile   /etc/pki/tls/fqdn_20221102_sec_nopass.pem
```

設定に問題がないかを確認する  
```
apachectl configtest
```

再読み込み  
```bash
apachectl graceful
```

再読み込みで反映されない場合は再起動   
```bash
apachectl restart
```
