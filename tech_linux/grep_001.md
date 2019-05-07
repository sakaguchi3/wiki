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


## 正規表現の記号として解釈させないで検索する

`+`や`*`を正規表現の記号として解釈させない
```bash
$ cat hogehoge.txt| grep -F 'HOGE_KEY=+[japan]' > s3_f_reserved.txt
```




## 一致したら、(head|tail)の文字列を返す



一致する場合、headの方を返す

```
$ cat  hogehoge.txt | sed -e 's/DDDDDD_KEY.*//'
```


一致する場合、tailの方を返す

```
$ cat  hogehoge.txt | sed -e 's/.*DDDDDD_KEY//'
```



