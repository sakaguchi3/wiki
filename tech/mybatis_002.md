# mybatis - 設定ファイル


## configファイル系

### sql-map-config.xml

```xml
    <properties resource="config.properties" />
     
	<environments default="hogedb">
		<environment id="hogedb">
			<transactionManager type="JDBC" />
			<dataSource type="POOLED">
				<property name="driver" value="com.mysql.jdbc.Driver" />
				<property name="url" value="${database.hogedb.URL}" />
				<property name="username" value="${database.UID}" />
				<property name="password" value="${database.PWD}" />
				<property name="poolMaximumActiveConnections" value="10" />
				<property name="poolMaximumIdleConnections" value="2" />
				<property name="poolPingEnabled" value="true" />
				<property name="poolPingQuery" value="SELECT 1 " />
			</dataSource>
		</environment>
		<environment id="fugadb">
			<transactionManager type="JDBC" />
			<dataSource type="POOLED">
				<property name="driver" value="com.mysql.jdbc.Driver" />
				<property name="url" value="${database.fugadb.URL}" />
				<property name="username" value="${database.UID}" />
				<property name="password" value="${database.PWD}" />
				<property name="poolMaximumActiveConnections" value="10" />
				<property name="poolMaximumIdleConnections" value="2" />
				<property name="poolPingEnabled" value="true" />
				<property name="poolPingQuery" value="SELECT 1 " />
			</dataSource>
		</environment>
	</environments>

```


### config.properties file


```properties
database.hogedb.URL=jdbc:mysql://hogeserver.localdomain/hogedb?useUnicode=true&characterEncoding=utf-8
database.fugadb.URL=jdbc:mysql://fugaserver.localdomain/fugadb?useUnicode=true&characterEncoding=utf-8
database.UID=hogeuser
database.PWD=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
```


## Java側

### 使い方


```Java
	void exec() throws IOException {
		SqlSessionFactory factory = getSqlSessionFactory("hogedb");

		try (SqlSession session = factory.openSession(); ) {
		    // INSERT/UPDATE/DELETE/SELECT
		    session.commit();
		}
	}

	private SqlSessionFactory getSqlSessionFactory(String dbname) throws IOException {
		try (InputStream in = Resources.getResourceAsStream("sql-map-config.xml") {
			return new SqlSessionFactoryBuilder().build(in, dbname);
		} 
	}	
```


### MyBatis Generator

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE generatorConfiguration PUBLIC
  "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
  "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd" >

<generatorConfiguration >
  
  <classPathEntry 
	location="C:/[mavenの場所]/mysql/mysql-connector-java/5.1.25/mysql-connector-java-5.1.25.jar" /> 	
  
  <context id="context1" >
  
    <!-- DB接続情報 -->    
    <jdbcConnection
      driverClass="com.mysql.jdbc.Driver"
      connectionURL="jdbc:mysql://localhost/hogedb"
      userId="hogeuser"
      password="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" />
    
    <!-- Model/DTO保存場所 -->
    <javaModelGenerator
      targetPackage="com.example.db.model"
      targetProject="hoge_project" />
    
    <!-- Mapper(xml)保存場所 -->
    <sqlMapGenerator
      targetPackage="com.example.db.mapper"
      targetProject="hoge_project" />
    
    <!-- Mapper(java)保存場所 -->
    <javaClientGenerator
      targetPackage="com.example.db.client"
      targetProject="hoge_project"
      type="XMLMAPPER" />
    
    <!-- generateしたいテーブルを記述する -->
    <table schema="hogedb" tableName="t_hoge_table" />
    <table schema="hogedb" tableName="t_fuga_table" />
    
  </context>
</generatorConfiguration>
```