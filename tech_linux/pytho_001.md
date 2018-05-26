# pythonのバージョンを切り替える - pyenv @ubuntu18.04

phpenvをインストール

```bash
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
```

パスを通す

```bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

pyenvからインストール

```bash
$ pyenv install 3.6.0
```

現在のバージョンチェック

```bash
$ pyenv version
$ python --version
```

利用可能なバージョンチェック

```bash
$ pyenv versions
$ ls ~/.pyenv/version
```

バージョン変更

```bash
$ pyenv shell 3.6.2 #shell内でのみ変更
$ pyenv local 3.6.2 #現在のディレクトリ配下？で有効
$ pyenv global 3.6.2  #システム全体で変更
```


* https://www.yoheim.net/blog.php?q=20170204



