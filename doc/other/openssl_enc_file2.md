# openssl ファイルの暗号化, 公開鍵方式


## 鍵の作成

秘密鍵の作成

```bash
KEY_SECRET="private_key.pem"
KEY_PUBLIC="public_key.pem"

openssl genpkey \
  -algorithm RSA \
  -out ${KEY_SECRET} \
  -pkeyopt rsa_keygen_bits:8096
```

公開鍵の作成

```bash
openssl rsa \
  -pubout \
  -in ${KEY_SECRET} \
  -out ${KEY_PUBLIC}
```


## 暗号化&複合

暗号化

```bash
openssl rsautl \
  -encrypt \
  -inkey ${KEY_PUBLIC} \
  -pubin \
  -in file.txt \
  -out file.enc

```

> This command has been deprecated. The openssl-pkeyutl(1) command should be used instead.
> https://www.openssl.org/docs/man3.1/man1/openssl-rsautl.html

現在は rsautl は使うべきではないようです。   
代わりに pkeyutl を使うべきのようです。


復号化

```bash
openssl rsautl \
  -decrypt \
  -inkey ${KEY_SECRET} \
  -in file.enc \
  -out file.dec

shasum -a 224 file.txt file.dec 
52f1bf093f4b7588726035c176c0cdb4376cfea53819f1395ac9e6ec  file.txt
52f1bf093f4b7588726035c176c0cdb4376cfea53819f1395ac9e6ec  file.dec
```


<!--

```bash
```

-->
