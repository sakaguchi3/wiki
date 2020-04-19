# java - keytoolを使ってjks証明書追加方法





## 証明書を追加(ツールを使う)

cacert.jks: すでに前からあるjavaのroot証明書      

例) cacert.jksに `example.jp` を追加する



convert: string -> jks       
command: `java InstallCert {host}:{port}`      

```
$ git  clone https://github.com/escline/InstallCert
$ javac InstallCert.java
$ java InstallCert  example.jp:443
$ ls 
    jssecacerts //これがexample.jpの証明書(format: jks)
```


Add: 'example.jp'-cert to cacert.jks    
* command: 
    * `keytool -v -export -alias {host}-1 file {filename} -keystore jsseccacerts -storepass {pass}`    
    * `keytool -v -import -alias {host}-1 file {filename} -keystore jsseccacerts -storepass {pass}`    
```
// convert: jks -> cer
keytool  -v -export -alias example.jp-1 -file example.jp.cer -keystore jssecacerts -storepass changeit 
// add: (jks, cer) -> jks
keytool  -v -import -alias example.jp-1 -file example.jp.cer -keystore cacert.jks  -storepass changeit  
```


##  証明書を追加(ツールなし)

cer形式でDL
```
$ openssl s_client -connect example.jp:443 -showcerts \
  | openssl x509 -outform PEM > example.jp.cer 
```

firefoxでDL  
証明書を表示(V) > `about:certificate?cert=xx` に飛ぶ > ダウンロード PEM(cert)

追加
```
// add: (jks, cer) -> jks
$ keytool  -v -import -alias example.jp-1 -file example.jp.cer -keystore cacert.jks  -storepass changeit
```  


## jks中身を確認

```bash
$ keytool -list  -keystore trust08.jks
```


## 参考


* https://jp.globalsign.com/support/faq/331.html
    * ca追加方法
* https://go-journey.club/archives/4038
    * ca作成