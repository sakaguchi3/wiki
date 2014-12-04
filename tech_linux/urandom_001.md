# 乱数/パスワード生成 

## linux

#### urandomを使う

fold -w [桁数] <br/>
head -n [個数]

```bash
cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 2 

jh9JE21qLJx0TPz0
ok2oRRlNGtCf93FM
```

```bash
LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | fold -w 20 | head -n1

9ftXmBBO193iXPx1yRcv
```

`[前半は数字][後半はアルファベット]` という具合に形式を指定したい

```bash
p1=$(cat /dev/urandom| LC_ALL=C  tr -dc '0-9'| fold -w 15 | head -n 1)
p2=$(cat /dev/urandom| LC_ALL=C  tr -dc 'a-z'| fold -w 15 | head -n 1)
echo "$p1$p2"

812709639979279zcsvngpkdsdlccf
```

#### gpgを使う

```bash
gpg --gen-random --armor 0 24

u6FzZ2oqWnyZtBXU74gKxa6+f/n/xSua
```

#### opensslを使う

```bash
openssl rand -base64 15
ts9fxr0Mev69GMPQU4An

openssl rand -hex 15   
900b20a5bd38ce26225d4ec94b71cc
```

## mac

```bash
cat /dev/urandom | LC_CTYPE=C tr -dc "[:alnum:]" | fold -w 24 | head -n 20
```