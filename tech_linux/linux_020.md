# ubuntu - systemctl


サービスの一覧表示

```bash
$ systemctl list-unit-files --type=service
```

サービスの状態表示
```bash
$ systemctl status ${Unit}
```

自動起動無効化
```bash
systemctl disable ${Unit}
```
自動起動の有効化
```bash
systemctl enable ${Unit}
```

サービス停止
```bash
systemctl stop ${Unit}
```

サービス停止
```bash
systemctl start ${Unit}
```

