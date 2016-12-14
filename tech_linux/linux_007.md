# [linux] ユーザの追加削除

## ユーザ追加
``` 
sudo adduser hogehoge
```

### ユーザ削除
ホームディレクトリも削除。
```
sudo deluser hogehoge -r
```


### sudo権限を持つグループに追加

wheel: centosのデフォルトだと，sudo権限を持つグループ

```shell
$ sudo gpasswd  wheel -a hogehoge
```