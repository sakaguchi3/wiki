# etckeeper - /etc/配下をgitで管理

install

```bash
sudo yum install etckeeper
```

init

```bash
sudo etckeeper init
```

よく使うコマンド

```bash
sudo etckeeper vcs status
sudo etckeeper vcs log
sudo etckeeper commit 'update ssl for supplier'
sudo etckeeper vcs reset --hard HEAD
sudo etckeeper vcs revert HEAD
```

<!--
```bash
```

-->
