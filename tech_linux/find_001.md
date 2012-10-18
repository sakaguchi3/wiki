# find - マッチするものをリネームしたい



```bash
find ./ -name '*.txt' | xargs -I% mv % /backup/
```

# rename

`seikyu → seikyu_`にリネームする

```bash
$ find ./ -type f | sed 'p;s/seikyu/seikyu_/' | xargs -n2 mv
```



