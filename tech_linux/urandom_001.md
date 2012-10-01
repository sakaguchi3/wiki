# 乱数/パスワード生成 | rand, passwd 



## urandom | 適当なパスワードの生成

```bash
cat /dev/random | base64 | fold -w [桁数] | head -n [生成する個数]
```

``` 
cat /dev/random | base64 | fold -w 32 | head -n 50
```

使える文字を指定する
```bash
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 2 | sort | uniq
```

#### エラーが起きる場合はこっちでやってみる
```bash
cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 24 | head -n 20
```

## base64作成 

```bash
openssl rand -base64 31
```

web safe にする

```bash
openssl rand -base64 31 |  tr -- '+/=' '-_ '
``` 

