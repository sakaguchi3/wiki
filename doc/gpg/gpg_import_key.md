# gpg 鍵のimport/export

## export

秘密鍵のexport

```bash
gpg -K
   1212AAAA....

K="1212AAAA"
```

ascii形式でexport

```bash
gpg -a -o secret.asc --export-secret-keys $K
```

binaryでexport

```bash
gpg -o secret.bin --export-secret-keys $K
```

master key / sub key を分けている人。  
subkeyのみexport。

```bash
gpg -a -o secret.asc --export-secret-subkey $K
```

binary

```bash
gpg -o secret.bin --export-secret-subkey $K
```

master keyを含める。

```bash
gpg -a -o secret.asc --export-secret-keys $K
```

公開鍵のみexport

```bash
gpg -a -o pub.asc --export
```

## import

公開鍵

```bash
gpg --import <key>
```

秘密鍵

```bash
gpg --import <key>
```

このままだとunknownになるのでtrustedに変更する

```bash
gpg -K --with-keygrip --with-subkey-fingerprint
sec   ed25519 2023-05-11 [C]
      C932...
uid           [unknown] name <a@example.cm>
ssb   ed25519 2023-05-11 [S]
      C9999
      ...
```

```bash
gpg --edit-key C932

gpg> trust
Your decision? 5

gpg> quit 
```

```bash
gpg -K --with-keygrip --with-subkey-fingerprint
sec   ed25519 2023-05-11 [C]
      C932...
uid           [ultimate] name <a@example.cm>
ssb   ed25519 2023-05-11 [S]
      C9999
      ...
```


<!--
```bash
```
-->
