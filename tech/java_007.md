# java - 証明書指定方法



## tomcat の起動パラメータで指定

* root証明書のパスワード指定: `-Djavax.net.ssl.trustStorePassword={pass}`
* ファイル指定: ` -Djavax.net.ssl.trustStore={filepath}`    
    * oracle jdkの場合 `Java\jdk1.8.0_171\jre\lib\security\cacerts`
    * open jdkだと空になっていたので自作する必要があるかも

```
 -Djavax.net.ssl.trustStorePassword=changeit
 -Djavax.net.ssl.trustStore=T:\lib\Java\jdk1.8.0_171\jre\lib\security\cacerts
``` 

