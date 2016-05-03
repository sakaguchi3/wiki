# find



# rename

`seikyu` -> `seikyu_`にリネームする

```bash
$ find ./ -type f | sed 'p;s/seikyu/seikyu_/' | xargs -n2 mv
```