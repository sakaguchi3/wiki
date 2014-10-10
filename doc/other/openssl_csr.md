# openssl csrの作成手順

## 秘密鍵, csrを作成

```bash
d="20230709"
# your domain
h="example.com"
# private key
p="${h}_${d}_secret_nopass.pem"
# csr
c="${h}_${d}.csr"

openssl genrsa 2048 > $p

openssl req \
 -new \
 -key $p \
 -out $c \
 -subj "/C=JP/ST=Tokyo/L=Shibuya-ku/O=your_company Ltd./OU=Security Department/CN=${h}"
```

## 参考

* https://weblabo.oscasierra.net/openssl-gencert-1/
* 便利ツール
  * [FujiSSL toolbox / CSR・秘密鍵作成](https://cryptoreport.fujissl.jp/csrGenerateCommand.php)
