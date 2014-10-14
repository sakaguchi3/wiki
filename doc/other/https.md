# apache, nginxでhttpsの設定

## apache/nginxの設定

以下の証明書を用意する

- 中間証明書,複数
- サーバ証明書

## nginxの設定例

中間証明書とサーバ証明書を結合して一つのファイルを作成。  
`example.com_20230709_fullchain.cer`

```nginx
    ssl                  on;
    ssl_certificate      /etc/nginx/tls/example.com_20230709_fullchain.cer;
    ssl_certificate_key  /etc/nginx/tls/example.com_20230709_sec_nopass.pem;
```

設定に問題がないかを確認する

```bash
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
    SSLCertificateFile      /etc/pki/tls/example.com_20230709.cer.
    # Intermediate certification
    SSLCertificateChainFile /etc/pki/tls/example.com_20230709_chain.pem
    # private key
    SSLCertificateKeyFile   /etc/pki/tls/example.com_20230709_sec_nopass.pem
```

設定反映

```bash
# test
apachectl configtest

# relaod
apachectl graceful

# もしrelaodで反映されない場合はrestart
apachectl restart
```
