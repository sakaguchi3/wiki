# snap 

## setup

install
```bash
yay -S snapd
```

setup
```bash
systemctl enable --now snapd.apparmor.service
systemctl start snapd.socket `
```

## 使い方

install
```bash
snap find firefox
snap install firefox
```

インストール済みのソフト
```bash
snap list
```


<!--
```bash
```

-->