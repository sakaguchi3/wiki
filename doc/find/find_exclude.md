# find xxxを除いて検索する - tag:exlude,除外

`.git`ディレクトリを除外して検索する

```bash
find . ! -path '*.git/*' 
```


## 古いバージョンの場合

古いとこのパターンが使えない場合がある。
その場合は`-prune`を使う。

```bash
find . -path '*.git/*' -prune -o -name '*'  
```

または

```bash
find . -path '*.git/*' -prune -o -print 
```
