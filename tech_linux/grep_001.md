# grep and検索/or検索


## and検索

```bash
cat hoge.txt | grep "neko" | grep "ushi" 
```


## or検索

```bash
cat hoge.txt | grep -e neko -e ushi 
```