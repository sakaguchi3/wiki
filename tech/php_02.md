# Fulephp 実行環境の設定

### ルール

* 環境変数
    * production: 本番用環境
    * development: vagrant環境
    * staging: お客さん用テスト環境
    * test: 自社内テスト環境
        
### Virtualhost

```bash
$ cd /etc/apache2/conf/extra
$ vim piyo.example.com_vhosts.conf
```
環境に合わせてFUEL_ENVにセットする値を変更する。
```apache
<VirtualHost *:80>
    SetEnv FUEL_ENV staging
</VirtualHost>
```


```bash
$ sudo systemctr restart httpd
```

### 設定ファイル

* FuelPHPで用意されている、FUEL_ENV一覧 
    * STAGING
    * PRODUCTION
    * DEVELOPMENT
    * TEST
* directory
    * /fuelphp/fuel/app/config/development
    * /fuelphp/fuel/app/config/production
    * /fuelphp/fuel/app/config/staging
    * /fuelphp/fuel/app/config/test
