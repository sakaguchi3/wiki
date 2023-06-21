# clibpaord, コピペ

## mac

```bash
echo 'xxx' | pbcopy
pbpaste
```

## Linux

クリップボードの種類

* primary
  * マウスで選択したときに即座に保存される
  * `C-Insert` と同じ
  * `S-Insert` でペースト
* secondary
* clipboard 
  * `C-c`と同じ
  * windowsのコピーと同じ
  * `S-v` でペースト

コピー
```bash
# primary
xsel -ip
# clipboard
xsel -ib
```

ペースト
```bash
# primary
xsel -op
# clipboard
xsel -ob
```

クリア
```bash
# primary
xsel -cp
# clipboard
xsel -cb
```
