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

### xargs

```bash
% find . -type f -not -name 'archive' -and  -not -name 'tmp.txt'  | \
  xargs -t -I% mv %  ./archive 
```

`-I`: デリミタしていする。`xargs -I{} mv {} ./archive`とかでもよい。        
`-t`: 実行するコマンドを標準出力に出力する。    


https://qiita.com/takc923/items/da1c32f3a622dc1c5489

### 現在のディレクトリのみ検索

深さ1のものだけ検索するようにする    
注意: `.`は深さ0

```bash
$ find . -maxdepth 1 -mindepth 1 -type d  -not  -name ".DS_Store"   
```

`-not -path`を使う方法もあるみたい    
https://tex2e.github.io/blog/shell/find-not-path

## link

* http://takuya-1st.hatenablog.jp/entry/2016/08/06/032454