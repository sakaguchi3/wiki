# ipv6有効化/無効化

## 有効化

```envale.conf
net.ipv6.conf.all.disable_ipv6 = 0
net.ipv6.conf.default.disable_ipv6 = 0
net.ipv6.conf.lo.disable_ipv6 = 0
```

```bash
sysctl -p enable.conf
```

## 無効化

```disable.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1 ```
```

```bash
sysctl -p disable.conf
```
