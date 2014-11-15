# find - xargs

## ファイルを移動する

```bash
target_extension="*.txt"

find ./ -name "${target_extension}" | xargs -I% mv % /backup/
```

## rename

`seikyu → seikyu_`にリネームする

```bash
find ./ -type f | sed 'p;s/seikyu/seikyu_/' | xargs -n2 mv
```

## 圧縮

```bash
target_extension="*.txt"

find . -type -f -name "${target_extension}" | xargs -I{} zstd {}
```
