# aws rds - mysql実行時に `(1114, "The table '/rdsdbdata/tmp/#sqlxxxxxxxxxx' is full")` というエラーが出た

[結論だけ見たい人](#対応方法)

# 調査

pythonの実行履歴を見ると以下のエラーが発生していた
```log
pymysql.err.OperationalError: (1114, "The table '/rdsdbdata/tmp/#sqlXXXX' is full")
```

MySQLのエラーコード `1114` はサイズ不足のときに起きるエラーらしい。
だが、 RDSの容量を確認したが、30GBの余裕があったのでこれが原因ではなさそう。

> tmp_table_size を超えると何故か「The table 'tablename' is full」という表示になる
https://gammasoft.jp/support/frequently-python-error/

> メモリ内のテンポラリテーブルが tmp_table_size バイトより大きくなったとき
https://donbulinux.hatenadiary.org/entry/20150622/1434974958

> MySQL のドキュメントには、｢内部一時テーブルが最初にインメモリーテーブルとして作成されたが、これが大きくなりすぎた場合、MySQL はこれを自動的にディスク上のテーブルに変換します。インメモリー一時テーブルの最大サイズは、tmp_table_size と max_heap_table_size のどちらかの最小値です｣とあります。 ディスク上のテーブルが関係するオペレーションは、インメモリ一時テーブルの場合に比べ非常に時間がかかります。MySQL 5.7 のドキュメントにも類似の記述が確認できます。これらのパラメータのデフォルト値はどちらも 16,777,216 バイトです。
https://aws.amazon.com/jp/blogs/news/best-practices-for-configuring-parameters-for-amazon-rds-for-mysql-part-1-parameters-related-to-performance/

メモリ内のテポラリサイズが割当サイズ(= tmp_table_size)より大きくなったためエラーが発生したらしい。

* `tmp_table_size`を大きくする。
* `--big-tables `オプションを指定して、SQL_BIG_TABLES を使う。
  * インメモリを使わずに、一時テーブルにストレージを使用する
  * ストレージを使うと遅くなるのと、RDSのバーストバランスが枯渇する可能性があるため、これは不採用

このあたりが対応方法らしい。

今回は tmp_table_size で対応予定。
メモリの利用される値は min(tmp_table_size, max_heap_table_size) とのこと。
しばしばtmp_table_sizeだけ設定しがちとのことなので、忘れないように両方設定する。


# 対応方法

## 割当サイズを確認する。(sqlの実行前に) 




どちらもデフォルトの16MB=16777216が割り当てられていた

``mysql
SHOW global VARIABLES LIKE  'max_heap_table_size'
SHOW global VARIABLES LIKE 'tmp_table_size'
``

割当サイズを増やす
(画面から)

