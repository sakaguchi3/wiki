# openconnect

接続

```bash
openconnect --authgroup <group> -u <user> <host>

<C-c>: 終了
```

接続してプロセスをバクグラウンドで実行

```bash
openconnect -b --authgroup <group> -u <user> <host>
```

終了

```bash
kill -SIGINT <pid>
```

または

```bash
killall openconnect
```
