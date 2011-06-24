# AlmaLinux8.0 - tomcat catalina.outで文字化けが発生する

``` 
cd /opt/tomcat
vim bin/setenv.sh
```

``` 
LANG=C
```

``` 
systemctl restart tomcat
```
