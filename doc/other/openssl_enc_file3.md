# openssl ファイルの暗号化, smime(hybrid?)

## 秘密鍵, 証明書の作成

```bash
# secret key
secret1="key_secret.pem"
# 証明書
cert1="cert.pem"  
```

```bash
openssl req \
  -x509  \
  -nodes \
  -newkey rsa:2048 \
  -subj /CN="Enc" \
  -days 999999  \
  -keyout "$secret1" \
  -out "$cert1"

```

## 暗号化

ダミーファイル作成

```bash
fallocate -l 1M dummy.org
or
mkfile -n 1m dummy.org
```

```bash
f_org=dummy.org
f_enc=dummy.enc
f_dec=dummy.dec
```

暗号化

```bash
openssl smime \
  -encrypt -aes256 \
  -binary \
  -outform DER \
  -in $f_org \
  -out $f_enc \
  $cert1

```

復号化

```bash
openssl smime \
  -decrypt \
  -inform DER \
  -in $f_enc \
  -inkey \$secret1 \
  -out $f_dec

sha1sum dummy.*
3b71f43ff30f4b15b5cd85dd9e95ebc7e84eb5a3  dummy.org
3b71f43ff30f4b15b5cd85dd9e95ebc7e84eb5a3  dummy.dec
```


<!--

```bash
```

-->



