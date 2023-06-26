# python scriptでパターンマッチング, tag:pattern,match

codeXXXXX のところだけ抜き出したいとする

```python
import re

def f1():
    s="aaacode9897987979_9999aa"
    ms =re.findall(r'(code[0-9]+)', s)
    for m in ms:
        print(m)

```

実行結果

```bash
code9897987979
```
