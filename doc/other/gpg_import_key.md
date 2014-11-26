# gpg 鍵のimport/export

## export

秘密鍵のexport

```bash
gpg -K
   1212AAAA....

K="1212AAAA"
```


```bash
gpg -a -o secret.asc --export-secret-keys $K
```

master key / sub key を分けている人。  
subkeyのみexport。

```bash
gpg -a -o secret.asc --export-secret-subkey $K
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

```bash
gpg --import <key>
```
