# find - rm 大量のファイルを削除

大量のファイルを削除する場合は、コマンドを1行ずつ実行する必要がある。
1行ずつ削除する方法。s
```bash
find . -type f -name '*.txt' -exec rm -r {}  \;
or
find . -type f -name '*.txt' --delete
```

複数の拡張子をを削除する

```bash
find . -type f -name "*.xml" -or -name "*.csv" | xargs rm -f
```

30日以上前のファイルを削除する 
```bash
find . -type f -name '*.xml' -ctime +30 -exec rm -f {} \;
```
