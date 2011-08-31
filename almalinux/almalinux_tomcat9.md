# AlmaLinux8.0 - install tomcat


``` 
groupadd tomcat
useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
```

```
tar -zxvf apache-tomcat-*.tar.gz -C /opt/tomcat --strip-components=1
chown -R tomcat: /opt/tomcat
sh -c 'chmod +x /opt/tomcat/bin/*.sh'
```

```
nano /etc/systemd/system/tomcat.service
```

```
[Unit]
Description=Tomcat webs servlet container
After=network.target
[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/jre"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
[Install]
WantedBy=multi-user.target
```

```
sudo systemctl enable --now tomcat
```



参考
https://www.how2shout.com/linux/install-apache-tomcat-on-almalinux-8/
https://idroot.us/install-apache-tomcat-almalinux-8/
