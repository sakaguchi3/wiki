# Docker composerをインストール@Ubuntu18.04


```bash
sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common
```

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```


```bash
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
```

```bash
sudo apt install -y docker-ce
```


* https://qiita.com/iganari/items/fe4889943f22fd63692a