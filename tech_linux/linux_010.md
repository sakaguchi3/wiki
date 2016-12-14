# rsync


## rsync
 
速度制限を指定してNASにコピーする
```zsh
rsync --bwlimit=908192  -avr  ./from_dir   //192.168.0.12/public/to_dir
```