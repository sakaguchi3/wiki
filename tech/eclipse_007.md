# eclipse memo

## maven内でtomcat maven pluginを設定

```xml
<plugins>
  <!-- snip -->
  <plugin>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.2</version>
    <configuration>
      <path>/logserver</path>
      <server>tomcat-localhost</server>
      <url>http://localhost:8080/manager/text</url>
    </configuration>
  </plugin>
</plugins>
```

* https://qiita.com/gishi_yama/items/32d811cbb10d50912fc3
* https://sugumura.hatenablog.com/entry/2013/07/10/003155  

## eclipse tomcatのlog保存先

```
workspace/.metadata.plugins/org.eclipse.wst.server.core/tmp0/logs 
```