# Apache - 秘密鍵/CSRの作成手順


秘密鍵の作成

```bash
linuxuser@server::0:% openssl genrsa -rand /dev/random -des3 -out sec.pem 2048
2048 semi-random bytes loaded
Generating RSA private key, 2048 bit long modulus
....................................................................................+++
..............+++
e is xxxxx (xxxxx)
```

秘密鍵のpasswd解除
```bash
linuxuser@server::% openssl rsa -in sec_example.com.pem -out sec_example.com_nopass.pem
Enter pass phrase for sec_example.com.pem:
writing RSA key
```

csr作成
```bash
linuxuser@server::% openssl req -new -key sec.pem -out csr -sha512
Enter pass phrase for sec.pem:
-----
Country Name (2 letter code) [AU]:JP  (←大文字じゃないとだめなので注意★★★)
State or Province Name (full name) [Some-State]:Fukuoka prefecture
Locality Name (eg, city) []:Fukuoka city
Organization Name (eg, company) [Internet Widgits Pty Ltd]:oreore company
Organizational Unit Name (eg, section) []:PKI Support
Common Name (e.g. server FQDN or YOUR name) []:example.com
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

csr/private-keyの中身を確認する
```bash
# CSRの中身を確認する
linuxuser@server::% openssl req -noout -text -in csr_example.com.pem
# private keyの中身を確認する
linuxuser@server::% openssl rsa -text -noout -in sec_example.com_nopass.pem
```

整合性チェック
```bash
openssl x509 -issuer_hash -noout -in [証明書]
openssl x509 -subject_hash -noout -in [中間証明書]
--
linuxuser@sever:% openssl x509 -issuer_hash -noout -in example.com.crt
xxxxxxx
linuxuser@sever:% openssl x509 -subject_hash -noout -in ca-bundle.ca
xxxxxxx
```

## detail

* https://qiita.com/cs_sonar/items/c7398edbe02d5f4de01b
* https://www.einspki.jp/support/manual_s/apache_csr/
* https://blog.freedom-man.com/openssl-command/

