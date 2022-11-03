# opensslでファイルの暗号化


## encrypt

```bash
openssl enc -e -aes-256-cbc -pass file:/passwd.txt -salt \
 -in file.txt \
 -out file.txt.enc 
```

## decrypt

```bash
openssl enc -d -aes-256-cbc -pass file:/passwd.txt \
 -in file.txt \
 -out file.txt.dec 
```
  
##  dockerのopensslを使う

```bash
docker run -it --rm -v $(pwd):/w \
  frapsoft/openssl enc -aes-256-cbc -e -salt \
  -in /w/file \
  -out /w/file.enc

docker run -it --rm -v $(pwd):/w \
  frapsoft/openssl enc -aes-256-cbc -d \
  -in /w/file.enc \
  -out /w/file
```

## openssl1.0.2から1.1.0に変えたら古いファイルが復号化できなくなったときの対処法

1.1.0でdigest関数がmd5からsha1に変わったためエラーが起きるようになう。
```bash
openssl enc -d -aes-256-cbc -pass file:/passwd.txt \
 -m md5 \
 -in file.txt \
 -out file.txt.dec 
```
