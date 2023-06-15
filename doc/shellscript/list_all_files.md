# shellscriptでファイル一覧を取得してループ処理をする

## ファイル一覧表示

```bash
files=~/*

for f in ${files[@]} ; do
 echo "$f"
done        
```

これでも大丈夫っぽい

```bash
for f in $files ; do
 echo "$f"
done        
```

## ファイル名だけを取得する

```bash
for f in ${files[@]} ; do
 filename="${f##*/}"
done
```

or

```bash
for f in ${files[@]} ; do
 filename=$(basenaem $f)
 dir=$(dirname $f)
done
```

## 拡張位だけ取得

```bash
for f in ${files[@]} ; do
 echo "${f##*.}"
done
```

## 拡張子を変更

.csv => .tsv に変更する

```bash
for f in ${files[@]} ; do
 mv "$f" "${f/.csv/.tsv}"
done
```

<!--
```bash

```

-->
