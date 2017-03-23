# Linux - cronの設定

## 設定方法


##### 編集コマンド
``` 
crontab -e
```

##### バックアップ(実行前にかならずやりましょう)
```
crontab -l > crontab_YYYYMMDD.txt 
```

##### 記述ルール
week: (0:sun, 1:mon, ..., 6:sat, 7:sun)  

```
minute hour day month week ls >/dev/null 2>&1
```


## 設定例

3分おきに実行する
```cron
*/3 * * * * ls > /dev/null 2>&1
```

09:00から13:59まで実行
```cron
* 09-13 * * * ls > /dev/null 2>&1
```


## ファイルの保存されている場所

一般ユーザの場合．   
root権限じゃないと閲覧できない．   
直接編集するのは辞めましょう．   
```
 /var/spool/cron/user_hogehoge
```

apacheとかbindとかインストールした際に、自動的にシステムが作成するやつ(?)だと思う…      
/var/log配下のloglotateとかしてくれるやつがこの辺に記述してある．   
```
/etc/crontab
/etc/cron.d
/etc/cron.daily/
/etc/cron.weekly/
/etc/cron.hourly/
/etc/cron.monthly/
```



## 参考

* https://www.server-memo.net/tips/crontab.html