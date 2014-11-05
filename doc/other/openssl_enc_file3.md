# openssl ファイルの暗号化, smime(hybrid?)

## 秘密鍵, 証明書の作成

```bash
# secret key
S="key_secret.pem"

# csr
csr="csr.pem"

# certification
crt="cert.pem"  
```

秘密鍵, csrの作成

```bash
openssl req \
  -nodes \
  -newkey rsa:2048 \
  -keyout $S \
  -subj /CN="TEST" \
  -out $csr

```

`-nodes`: without pass phrase  

secret keyでcsrに署名してオレオレ証明書を作成。

```bash
openssl x509  \
  -req  \
  -signkey $S \
  -in $csr \
  -out $crt

```

## aa


```bash
openssl req  \
  -new  \
  -x509  \
  -key key.pem  \
  -out cert.pem  \
  -days 999999  \
  -subj /CN="Enc"
```

## 暗号化

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
  $crt

```

復号化

```bash
openssl smime \
  -decrypt \
  -inform DER \
  -in $f_enc \
  -inkey $S \
  -out $f_dec

sha1sum dummy.*
3b71f43ff30f4b15b5cd85dd9e95ebc7e84eb5a3  dummy.org
3b71f43ff30f4b15b5cd85dd9e95ebc7e84eb5a3  dummy.dec
```


<!--

```bash
```

-->



