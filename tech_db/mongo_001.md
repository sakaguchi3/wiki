# mongodb - mongodb入門


## テーブル構造

DB > collection > document > field

#### RDBとの比較

|RDB| MongoDB|
|:----:|:----:|
|db|db|
|table| __collection__ |
|row| **document** |
|column| **field** |
|index|index|
|primary key| **_id** |

データベース操作

|MySQL| 	MongoDB|
|:-----:|:-----:|
|SHOW DATABASES;| 	show dbs|
|USE testdb;| 	use testdb|
|CREATE DATABASE testdb;| 	useコマンドで自動生成|
|DROP DATABASE testdb;| 	use testdb <br>db.dropDatabase()|
|index| 	index|
|DESC testdb; |	なし|

https://qiita.com/yuji0602/items/c55e2cb75376fd565b4e

## command


#### 接続


```bash
# shell上で実行
$ mongo
```

リモートのmongodbサーバに接続する場合

```bash
mongo --host mongodb.localdomain
```


#### DB作成/削除

作成

```mongodb
use ushidb
```

確認

```mongodb
show dbs
db.stats()
```

削除

```mongodb
db.dropDatabase()
```




#### コレクション作成/削除

作成

```mongodb
db.createCollection('hogeCollection')
```

一覧
```mongodb
show collections
```

削除

```mongodb
db.hogeCollection.drop()
```





#### データ挿入/削除

挿入

```mongodb
db.hogeCollection.insert({name: "Ushiyama", age:"99"})
``` 

確認

```mongodb
db.hogeCollection.find()
```

```mongodb
db.hogeCollection.find({id : "hogekey"});
```


更新

```mongodb
db.hogeCollection.update({name: "Ushiyama"}, {age:"52"})
```

削除

```mongodb
db.hogeCollection.remove({})
```


