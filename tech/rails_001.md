# Rails - 環境変数


### 環境変数の種類

* test
* development
* production


### データベース構築（マイグレーション）

```bash
$rake db:create RAILS_ENV=production
$rake db:migrate RAILS_ENV=production
```

### redmineで実行中のRAILS_ENVを確認する

```bash
$ ruby bin/about
```