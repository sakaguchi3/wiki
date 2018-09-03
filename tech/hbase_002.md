# HBase - 入門


## 起動/終了

HBase起動

```bash
$sudo start-hbase.sh
```

hbase shell起動

```bash
$ hbase shell
2019-03-10 07:13:35,499 WARN  [main] util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
HBase Shell
Use "help" to get list of supported commands.
Use "exit" to quit this interactive shell.
For Reference, please visit: http://hbase.apache.org/2.0/book.html#shell
Version 2.1.3, rda5ec9e4c06c537213883cca8f3cc9a7c19daf67, Mon Feb 11 15:45:33 CST 2019
Took 0.0042 seconds
hbase(main):001:0> exit
$ 
```

HBase停止

```bash
$sudo stop-hbase.sh
stopping hbase...................
```

## link

* [HBaseのインストールと実行方法](https://www.task-notes.com/entry/20160211/1455179303)