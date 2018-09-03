# HBase - ubuntu18.04へのHBaseインストール



## インストール


#### HBaseのインストール  
以下からDLする．今回は2.xをDLした．  

* http://www.apache.org/dyn/closer.cgi/hbase/

```bash
$cd /usr/local/lib/
$sudo curl -LO https://www-us.apache.org/dist/hbase/2.1.3/hbase-2.1.3-bin.tar.gz
$sudo tar xzvf hbase-2.1.3-bin.tar.gz
$sudo ln -s hbase-2.1.3/ hbase
```

#### JAVAインストール
  
以下からDLする．  

* https://jdk.java.net/java-se-ri/8

```bash
$cd /usr/local/lib
$sudo tar xzf  java-se-8u40-ri.tgz
$sudo ln -s  java-se-8u40-ri/ java8

```


#### 環境設定

~/.profileに以下を追加する

```bash
 export HBASE_HOME=/usr/local/lib/hbase
 export PATH="$HBASE_HOME/bin:$PATH"
 export JAVA_HOME=/usr/local/lib/java8
 export PATH="$JAVA_HOME/bin:$PATH"
```


```$HBASE_HOME/conf/hbase-env.sh```にjavaのpathを記述する

```xml
 export JAVA_HOME=/usr/local/lib/java8
```

```$HBASE_HOME/conf/hbase-site.xml```を設定する

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:///opt/hbase</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/opt/zookeeper</value>
  </property>
</configuration>
```



## link

* [HBaseのインストールと実行方法（スタンドアロンモード）](https://www.task-notes.com/entry/20160211/1455179303)




