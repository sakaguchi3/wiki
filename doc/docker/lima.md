# limaでarhcを使う

## install

`https://github.com/lima-vm/lima/blob/master/examples/archlinux.yaml`  
ここからほしいコンテナをダウンロードする。
今回はarchをダウンロードする。

```bash
limactl start ./archlinux.yaml
```

コンテナ一覧を確認

```bash
limactl ls

NAME             STATUS     SSH            VMTYPE    ARCH      CPUS    MEMORY    DISK      DIR
archlinux        Stopped    127.0.0.1:0    qemu      x86_64    4       4GiB      100GiB    ~/.lima/archlinux
```

## start/stop

start

```bash
limactl start archlinux
```

shutdown

```bash
limactl stop archlinux
```

## コンテナにログイン

login

```bash
limactl shell archlinux
```

<!--
```bash
```

-->