# redis - ubuntu18.04にredisをインストールしたときのメモ


### インストール


```bash
sudo apt install redis
```



### セットアップ


リモートから接続するように設定する．

```bash
sudo vim /etc/redis/redis.conf
```

```redis
#  bind 127.0.0.1 ::1

# protected-mode yes
protected-mode no
```

設定を反映する

```bash
sudo service redis-server restart
```




### link

* https://symfoware.blog.fc2.com/blog-entry-2175.html
