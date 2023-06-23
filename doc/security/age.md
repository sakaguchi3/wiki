# age ファイル暗号化

## 鍵の作成

```bash
age-keygen -o key1.txt
> Public key: age********
```

### TIPS

暗号化のたびに公開鍵を指定するのがめんどくさいので、
暗号に使う公開鍵をファイルに纏めておく。

秘密鍵

```bash
## 追記しておく
cat key1.txt >> ~/.config/age/keys.txt
```

公開鍵

```bash
nvim ~/.config/age/recipient.txt

# key1
age********
# key2
age********
# key3
...
```

環境変数にセットしておく

```bash
nvim ~/.profile

AGE_SECRET_KEYS="${HOME}/.config/age/keys.txt"
AGE_PUBLIC_KEYS="${HOME}/.config/age/recipients.txt"
```

## 暗号化

```bash
dd if=/dev/urandom of=dummy.org bs=10M count=1
```

```bash
age -R $AGE_PUBLIC_KEYS -o dummy.age dummy.org
```

## 復号化

```bash
age -d -i $AGE_SECRET_KEYS -o dummy.dec dummy.age
```

```bash
xxhsum dummy.dec dummy.org
```

<!--
```bash
```
-->

## site

<https://github.com/FiloSottile/age?tab=readme-ov-file>
