# openssl ファイルの暗号化, 共通鍵

## 鍵として乱数ファイルを使う

鍵ファイルの作成

```bash
openssl rand 214 > key 
```

暗号

```bash
echo 'hello' > file.txt 

openssl enc \
  -e -aes256 -pbkdf2 \
  -in file.txt -out file.txt.enc \
  -kfile key
```

複合

```bash
openssl aes-256-cbc \
  -d -pbkdf2 \
  -in file.txt.enc -out file.txt.dec \
  -kfile key

sha256sum file*   
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt.dec
```



## パスワードを使って暗号化

暗号

```bash
openssl enc \
  -e -aes256 -pbkdf2 \
  -in file.txt -out file.txt.enc 

enter aes-256-cbc decryption password:
8cUnZmE7fc7d5wtRF4lp
```

複合

```bash
openssl aes-256-cbc \
  -d -pbkdf2 \
  -in file.txt.enc -out file2.txt.dec 

enter aes-256-cbc decryption password:
8cUnZmE7fc7d5wtRF4lp

shasum file.txt file2.txt.dec 
4e1243bd22c66e76c2ba9eddc1f91394e57f9f83  file.txt
4e1243bd22c66e76c2ba9eddc1f91394e57f9f83  file2.txt.dec
```


## ファイルからパスワードを読み込む

暗号化

```bash
LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom| fold -w 20 | head -n1 > passwd.txt
cat passwd.txt 
8cUnZmE7fc7d5wtRF4lp

openssl enc \
  -e -aes256 -pbkdf2 \
  -in file.txt -out file.txt.enc \
  -pass file:passwd.txt -salt 
```

復号化

```bash
openssl aes-256-cbc \
  -d  -pbkdf2 \
  -in file.txt.enc -out file.txt.dec \
  -pass file:passwd.txt 

sha256sum file.txt file.txt.dec 
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt
f2ca1bb6c7e907d06dafe4687e579fce76b37e4e93b7605022da52e6ccc26fd2  file.txt.dec
```

  
## dockerのopensslを使う

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

