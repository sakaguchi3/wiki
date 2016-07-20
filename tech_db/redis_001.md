# redis - redis入門


### 型

* String 
* List
* Set
* Sorted Set
* Hash


### 接続


```bash
$ redis-cli -h vagrant.localdomain
```

### データ登録/取得

登録/取得

```redis
ushi.localdomain:6379> set foo bar
OK
ushi.localdomain:6379> get foo
"bar"
```

キーが存在しないときのみ登録

```redis
SETNX foo 'bar'   => (integer) 1    // 新規登録
SETNX foo 'baz'   => (integer) 0    // 登録済みのため何もしない
```

削除
```redis
ushi.localdomain:6379> del foo
(integer) 1
```

### DBを切り替える


```redis
ushi.localdomain:6379> select 1
OK
ushi.localdomain:6379[1]>
```

## Stringの操作

### keyを検索する

keyを検索

```redis
ushi.localdomain:6379> keys na*
1) "name"
```

全件keyを検索

```redis
ushi.localdomain:6379> keys *
1) "email"
2) "name"
3) "abc"
4) "score"
```

### インクリメント

```redis
ushi.localdomain:6379> incr count
(integer) 2
ushi.localdomain:6379> get count
"2"
```

### 寿命を設定する

```expire [key]``` :寿命を設定する  
```ttl [key]``` :寿命を確認する

```redis
ushi.localdomain:6379> set foo bar
ushi.localdomain:6379> expire foo 13
ushi.localdomain:6379> ttl foo
```

## List操作

リストに(右|左)から追加する

```redis
RPUSH abc 'charlie'
LPUSH abc 'x-ray'
```

長さ取得

```redis
LLEN abc
```

(左|右)からpopする

```redis
LPOP abc
RPOP abc
```

List内の範囲指定して取得

```redis
LRANGE abc [開始index] [終了index]
```


## set操作

要素追加
```redis
ushi.localdomain:6379> sadd abc a
(integer) 1
ushi.localdomain:6379> sadd  abc b
(integer) 1
ushi.localdomain:6379> sadd abc a
(integer) 0 //重複のため追加されない
```

削除

```redis
srem abc a
```

含まれているか確認する

```redis
sismember abc a
```

メンバー一覧を取得

```redis
ushi.localdomain:6379> smembers abc
1) "b"
2) "c"
```

UNION

```redion
ushi.localdomain:6379> sadd groupA "a"
ushi.localdomain:6379> sadd groupA "b"

ushi.localdomain:6379> sadd groupB "b"
ushi.localdomain:6379> sadd groupB "c"

ushi.localdomain:6379> sunion groupA groupB
1) "b"
2) "a"
3) "c"

ushi.localdomain:6379> sinter groupA groupB
1) "b"

ushi.localdomain:6379> sdiff groupA groupB
1) "a"
```

## Sorted Set

(略)


## データ永続化

### RDB(スナップショット)

全件dump．バックアップ～障害までのデータは損失してしまう．   

```Redis
save
```

### AOF(Append Only File)

実行されたコマンドをファイルに保存する．
同期処理なのでパフォーマンスがクッソ低下する．   


## link

* https://qiita.com/sawada_masahiko/items/1f60936c421ecab8dfbf
* https://www.slideshare.net/yujiotani16/redis-76504393
* [Redisチートシート(導入編)](https://qiita.com/morrr/items/271548776938e7ddc0ec)

* 保存に関して
    * https://www.techscore.com/blog/2013/05/08/redis-persistence/

あとで読む
* https://qiita.com/rubytomato@github/items/d66d932959d596876ab5
* https://qiita.com/gold-kou/items/966d9a0332f4e110c4f8
* https://qiita.com/motohacy/items/3f21f53cfe85b5577792
* https://redis-documentasion-japanese.readthedocs.io/ja/latest/topics/data-types-intro.html
* https://loner.jp/redis-command-01
* http://mayo.hatenablog.com/entry/2013/10/15/074237
* https://www.yukisako.xyz/entry/2015-05-10-021400
* https://oshou.github.io/Redis%E5%85%A5%E9%96%80/
* http://ccs-tech-blog.blogspot.com/2017/05/redis.html
