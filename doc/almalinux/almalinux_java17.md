# AlmaLinux8.0 - install java17

java17インストール
``` 
dnf install java-17-openjdk-devel 
dnf install java-17-openjdk
```
javaがjava8になっているので、17に変更する。
``` 
alternatives --config java 
```
