# zip

require 7z command.

<!--
--------------------------------------------------
-->

## generate passwd

```bash
file_org="abc.txt"

LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | fold -w 50 | head -n1 > pass.txt
pass=$(cat pass.txt)
```

<!--
--------------------------------------------------
-->

## zip encrypt with aes256

encrypt

```bash
7z a -mem=AES256 -tzip -ssw -p$pass ${file_org}.zip ${file_org}
```

check

```bash
7z l -lst ${file_org}.zip

...
Type = zip

...
Method = AES-256 Deflate
Characteristics = NTFS WzAES : Encrypt

```

decrypt

```bash
7z e -p$pass ${file_org}.zip
```

<!--
--------------------------------------------------
-->

## zip encrypt with ZipECrypto

encrypt

```bash
7z a -tzip -ssw -p$pass ${file_org}.zip ${file_org}
```

check

```bash
7z l -lst ${file_org}.zip

...
Method = ZipCrypto Deflate
```

decrypt

```bash
7z e -p$pass ${file_org}.zip
```
