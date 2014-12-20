# 乱数/パスワード生成 

## linux

fold -w [桁数] <br/>
head -n [個数]

```bash
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 2 

jh9JE21qLJx0TPz0
ok2oRRlNGtCf93FM
```

`[前半は数字][後半はアルファベット]` という具合に形式を指定したい

```bash
 p1=$(cat /dev/urandom| tr -dc '0-9'| fold -w 15 | head -n 1)
 p2=$(cat /dev/urandom| tr -dc 'a-z'| fold -w 15 | head -n 1)
 echo "$p1$p2"

812709639979279zcsvngpkdsdlccf
```

## mac

```bash
cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 24 | head -n 20
```