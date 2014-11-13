# rar

## compress & encrypt

```bash
file_org="abc.txt"

# generate password
LC_ALL=C tr -dc '[:alnum:]' < /dev/urandom | fold -w 128 | head -n1 > pass.txt
pass=$(cat pass.txt)
```

```bash
rar a -hp"${pass}" ${file_org}.7z ${file_org}
```

`-hp<password>`: header encryption

## list archive contents

```bash
rar l -p$pass ${file_org}.7z
```

## extract

```bash
unrar e -p $pass ${file_org}.rar 
```

<!--
```bash
```

-->
