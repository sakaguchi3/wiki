# HBase - 入門


### 起動/終了

HBase起動

```bash
$ sudo start-hbase.sh
```

hbase shell起動

```bash
$ hbase shell
```

HBase停止

```bash
$ sudo stop-hbase.sh
stopping hbase...................
```


### テーブル作成/削除

テーブル作成

```hbase
 create 'City', {NAME=>'ID'}, {NAME=>'Name'}, {NAME=>'CountryCode'}, {NAME=>'Population'}
```

テーブル一覧表示

```hbase
list
```

テーブル削除

```hbase
disable 'City'
drop 'City'
```

### テーブル無効/有効

```hbase
disable 'City'
enable 'City'
```

### データ挿入

データ挿入

```hbase
put 'City', '1', 'ID', '1'
put 'City', '1', 'Name', 'Kabul'
put 'City', '1', 'CountryCode', 'AFG'
put 'City', '1', 'Population', '1780000'
put 'City', '2', 'ID', '2'
put 'City', '2', 'Name', 'Qandahar'
put 'City', '2', 'CountryCode', 'AFG'
put 'City', '2', 'Population', '237500'
put 'City', '3', 'ID', '3'
put 'City', '3', 'Name', 'Herat'
put 'City', '3', 'CountryCode', 'AFG'
put 'City', '3', 'Population', '186800'
```

### データ表示

全検索

```hbase
scan 'City'
```

範囲指定検索．検索範囲 Row:[1, 3)

```hbase
scan 'City', {STARTROW => '1', STOPROW => '3'}
```

Row指定検索 全列

```hbase
get 'City', '2'
```

Row指定検索 列指定

```hbase
get 'City', '2', {COLUMN => 'Name'}
```

time stanp指定検索

```hbase
 scan "City", {FILTER => "TimestampsFilter(1552855806673)"}
 ```
### データ更新

putで更新

```hbase
put 'City', '2', 'Name', 'Tokyo'
```

インクリメント

```hbase
// long値のデータを追加
put 'City', '1', 'ID:cnt', "\x00\x00\x00\x00\x00\x00\x00\x01"
// インクリメント
incr 'City', '1', 'ID:cnt', 10
```

### データ削除

列指定削除

```hbase
delete 'City', '2', 'Name'
```

行削除

```hbase
deleteall 'City', '2'
```

全データ削除

```hbase
```

### 列構造変更

テーブル構造表示？

```hbase
 describe 'City'
 ```
 
列追加
 
```hbase
disable 'City'
alter 'City', {NAME=>'District'}
enable 'City' 
```

列削除

```hbase
disable 'City'
alter 'City', {NAME=>'District', METHOD=>'delete'}
enable 'City'
```

全データ削除

```hbase
truncate 'City'
```

### link

* [HBase 基礎文法最速マスター ](http://d.hatena.ne.jp/Takao/20100204/1265212226)
* [HBase Shell](http://www.ne.jp/asahi/hishidama/home/tech/apache/hbase/shell.html)