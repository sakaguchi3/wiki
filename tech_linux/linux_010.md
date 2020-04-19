# rsync



## コマンド


```bash
rsync  -auz -e "ssh -i ~/.ssh/my_private_key"   \
  ./hoge.txz user@remote:/home/ec2-user/targetdir \
```

`.ssh/config` を設定している場合

```bash
rsync -auz ./hoge.txz my-aws:/home/ec2-user/targetdir
```


## 速度制限を指定してNASにコピーする
```zsh
rsync --bwlimit=908192  -avr  ./from_dir   //192.168.0.12/public/to_dir
```