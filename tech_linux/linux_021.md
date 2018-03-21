# diff




### ディレクトリ配下のファイルを検索

```linux
diff -r dir1 dir2
```


### ファイル名だけ表示

```linux
diff  -q -r dir1 dir2
```


### 改行コードを無視する

```linux
diff --strip-trailing-cr file1 file2
```