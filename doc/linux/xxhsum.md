# xxhsum, xxHash, 高速ハッシュアルゴリズムxxHashを使う

hash　だけを表示する

```bash
xxhsum <file> | awk '{print $1}'
c78202724c417e44
```

最も高速なハッシュタイプを使う。  
これによると、XXH3が一番高速らしい。

* <https://github.com/Cyan4973/xxHash>

`-H<algo>` でハッシュタイプを指定する。

* <https://manpages.debian.org/testing/xxhash/xxhsum.1.en.html>

```bash
xxhsum -H3 <file> | awk '{print $4}'
6a4e0067d5335359
```
