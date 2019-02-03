# php - FuelPHPのログが出力されない


## 現象


```/var/log/apache/error.log```

```apache
INFO - 2017-09-20 00:51:35 --> Fuel\Core\Request::execute - Setting main Request
ERROR - 2017-09-20 00:51:35 --> Error - The webserver doesn't have write access to the path to store the session data files. in /usr/local/hoge-system/xxxx/fuel/core/classes/session/file.php on line 341
INFO - 2017-09-20 01:01:22 --> Fuel\Core\Request::__construct - Creating a new main Request with URI = ""
```

apacheのlogを確認すると上が表示された．  
ログ出力先にFuelPHPの書き込み権限がないので起きている現象っぽい．  

```bash
sudo chmod 777 /usr/local/hoge-system/xxxx/fuel/app/logs
```
権限変更したらlog出力できるようになった

