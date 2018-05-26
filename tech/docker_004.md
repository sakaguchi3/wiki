# Dockerでredis clustor構築


必要なライブラリ取得

```bash
$ git clone https://github.com/cpapidas/docker-compose-redis-cluster.git
$ cd docker-compose-redis-cluster
```

```bash  
$ docker-compose build
```

```bash
/usr/local/lib/python2.7/dist-packages/requests/__init__.py:80: RequestsDependencyWarning: urllib3 (1.9.1) or chardet (2.3.0) doesn't match a supported version!
  RequestsDependencyWarning)
Traceback (most recent call last):
  File "/usr/bin/pip", line 9, in <module>
    load_entry_point('pip==1.5.6', 'console_scripts', 'pip')()
  File "/usr/local/lib/python2.7/dist-packages/pkg_resources/__init__.py", line 480, in load_entry_point
    return get_distribution(dist).load_entry_point(group, name)
  File "/usr/local/lib/python2.7/dist-packages/pkg_resources/__init__.py", line 2691, in load_entry_point
    return ep.load()
  File "/usr/local/lib/python2.7/dist-packages/pkg_resources/__init__.py", line 2322, in load
    return self.resolve()
  File "/usr/local/lib/python2.7/dist-packages/pkg_resources/__init__.py", line 2328, in resolve
    module = __import__(self.module_name, fromlist=['__name__'], level=0)
  File "/usr/lib/python2.7/dist-packages/pip/__init__.py", line 74, in <module>
    from pip.vcs import git, mercurial, subversion, bazaar  # noqa
  File "/usr/lib/python2.7/dist-packages/pip/vcs/mercurial.py", line 9, in <module>
    from pip.download import path_to_url
  File "/usr/lib/python2.7/dist-packages/pip/download.py", line 22, in <module>
    import requests, six
  File "/usr/local/lib/python2.7/dist-packages/requests/__init__.py", line 90, in <module>
    from urllib3.exceptions import DependencyWarning
ImportError: cannot import name DependencyWarning
```

エラーが出たときは以下を実行

```bash
$ pip install requests
$ pip3 install requests
```
https://stackoverflow.com/questions/50202238/requestsdependencywarning-urllib3-1-9-1-or-chardet-2-3-0-doesnt-match-a-su

docker起動
```bash
$ docker-compose up 
or 
$ docker-compose up -d
```

```bash
$ redis-cli -h redis.example.com -p 7000 
```

```bash
$ docker stop 
```



### link

以下のサイト通りの手順でやった

* https://github.com/cpapidas/docker-compose-redis-cluster

参考

* http://techlog.mvrck.co.jp/entry/redis-cluster-with-docker/
* https://redis.io/topics/cluster-tutorial#creating-the-cluster