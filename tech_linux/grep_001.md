# grep and検索/or検索



## search keyword from file


```bash
$ grep hoge.txt "kensaku-word" 
```

## and検索

```bash
$ cat hoge.txt | grep "neko" | grep "ushi" 
```


## or検索

```bash
$ cat hoge.txt | grep -e neko -e ushi 
```