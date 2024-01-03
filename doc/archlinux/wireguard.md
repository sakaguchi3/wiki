# wireguard

## 設定ファイルを用意

```bash
> nvim /etc/wireguard/wg.conf

[Interface]
PrivateKey = *****
Address = 10.****/32
DNS = 10.***

[Peer]
PublicKey = ****
AllowedIPs = 0.0.0.0/0
Endpoint = ****:***
```

## up/down

```bash
wg-quick up wg
```

```bash
wg-quick down wg
```

## ipv6の無効化が必要な場合

* [ipv6 enable/disable](./ipv6_enable.md)
