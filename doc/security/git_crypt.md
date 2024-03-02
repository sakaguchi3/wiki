# git-crypt

## init

```bash
git crypt init
```

## 鍵の登録

gpg
```bash
gpg -K --with-keygrip --with-subkey-fingerprint --with-secret  | less

sec#  ed25519 2019-07-11 [C]
      XXXX
      Keygrip = YYYY
uid           [ultimate] _ <mail@excite.com>
```

登録
```bash
k=XXX

git crypt add-gpg-user $k
```

## 暗号化対象の登録

```bash
nvim .gitattributes
```

```bash
# diffしたい場合
dir/** filter=git-crypt diff=git-crypt
# diffしたくない場合
dir/** filter=git-crypt 
```

## site
* <https://github.com/AGWA/git-crypt>

<!--
```bash
```
a

-->