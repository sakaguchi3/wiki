# openssl ファイルの暗号化, 共通鍵

## 鍵として乱数ファイルを使う

鍵ファイルの作成

```bash
openssl rand 214 > key 
```

環境変数

```bash
forg='file.txt'
fenc='file.enc'
fdec='file.txt.dec'
```

暗号

```bash
key="key"
```

```bash
echo 'hello' > ${forg} 

openssl enc \
  -e -aes256 \
  -in ${forg} -out ${forg}.enc \
  -pass file:${key}
```

標準入力するやり方でもできる

```bash
openssl enc \
  -e -aes256 \
  -in ${forg} -out ${forg}.enc \
  -pass fd:0 < ./ ${key}
```


複合

```bash
openssl enc \
  -d -aes256  \
  -in ${forg}.enc -out ${forg}.dec \
  -pass file:${key}

sha256sum file*   
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt.dec
```

## パスワードを使って暗号化

暗号

```bash
openssl enc \
  -e -aes256  \
  -in ${forg} -out ${forg}.enc

enter aes-256-cbc decryption password:
8cUnZmE7fc7d5wtRF4lp
```

複合

```bash
openssl enc \
  -d -aes256  \
  -in ${forg}.enc -out ${forg}.dec

enter aes-256-cbc decryption password:
8cUnZmE7fc7d5wtRF4lp

shasum file.txt file.txt.dec 
4e1243bd22c66e76c2ba9eddc1f91394e57f9f83  file.txt
4e1243bd22c66e76c2ba9eddc1f91394e57f9f83  file.txt.dec
```

## ファイルからパスワードを読み込む

暗号化

```bash
LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom| fold -w 20 | head -n1 > passwd.txt
cat passwd.txt 
8cUnZmE7fc7d5wtRF4lp

openssl enc \
  -e -aes256  \
  -in ${forg} -out ${org}.enc \
  -pass file:passwd.txt -salt 
```

復号化

```bash
openssl enc \
  -d -aes256  \
  -in ${forg}.enc -out ${forg}.dec \
  -pass file:passwd.txt 

sha256sum file.txt file.txt.dec 
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt.dec
```

## iv, keyを直接指定する

```bash
key=$(hexdump -vn16 -e'4/4 "%08X" 1 "\n"' /dev/urandom)
iv=$(hexdump -vn16 -e'4/4 "%08X" 1 "\n"' /dev/urandom)
```

暗号化

```bash
openssl enc \
  -e -aes256 \
  -iv $iv -K $key \
  -in ${forg} -out ${forg}.enc
```

復号化

```bash
openssl enc \
  -d  -aes256 \
  -iv $iv -K $key \
  -in ${forg}.enc -out ${forg}.dec 
```

## dockerのopensslを使う

```bash
docker run -it --rm -v $(pwd):/w \
  frapsoft/openssl enc -e -aes256  \
  -in /w/file \
  -out /w/file.enc

docker run -it --rm -v $(pwd):/w \
  frapsoft/openssl enc -d -aes256 \
  -in /w/file.enc \
  -out /w/file.dec
```

## openssl1.0.2から1.1.0に変えたら古いファイルが復号化できなくなったときの対処法

1.1.0でdigest関数がmd5からsha1に変わったためエラーが起きるようになう。

```bash
openssl enc -d -aes256 -pbkdf2 -pass file:/passwd.txt \
 -m md5 \
 -in ${forg} \
 -out ${fdec} 
```

