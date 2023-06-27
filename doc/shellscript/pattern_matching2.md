# shell scriptでパターンマッチング2, tag:pattern,match

codeXXXXX のところだけ抜き出したいとする

```bash
f="aaacode9897987979_9999aa"
echo $f | gawk 'match($0, /(code[0-9]+?)_/, m) {print m[1]}'

code9897987979
```

改行入れるとうまく動かない

```bash
f="aaacode9897987979_9999aa"
echo $f | gawk '
  match($0, /(code[0-9]+?)_/, m) 
  {
    print m[1]
  }
'

aaacode9897987979_9999aa
code9897987979
```
