# find


### 中身確認

```bash
$ find . -type f  -name '201903*'  | xargs grep 'xxxxx'
```



### csv, xmlを削除する

```bash
$ find . -type f -name "*.xml" -or -name "*.csv" | xargs rm -f
```


### 30日以上前のファイルを削除する

```bash
$find . -type f -name '*.xml' -ctime +30 -exec rm -f {} \;
# or
$find . -type f -name '*.xml' -ctime +30 | xargs rm -f | tee -a log/rm.log
```
