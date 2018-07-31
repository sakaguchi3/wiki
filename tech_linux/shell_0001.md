# shellスクリプト


### ディレクトリの存在をチェック

```bash
if [ -d ${HOME}/.zsh.d.local/ ] ; then
    ls ${HOME}/.zsh.d.local/
fi
```

### ファイルの存在をチェック


```bash
if [ -e ${HOME}/.zsh.d.local/zshenv.sh ] ; then
	ls ${HOME}/.zsh.d.local/zshenv.sh 
fi
```


### ワイルドカードでファイルを取得


```bash
	for f in ${HOME}/.zsh.d.local/*.sh ; do
		ls $f
	done;
```

### 変数の存在をチェック

```bash
	if [ -n $var_value ]; then
		echo "OK: $var_value"
	fi
```


### 引数関連

 ```$@``` :全引数を取得 
```bash
#!/bin/bash

App="/gvim/gvim.exe"
"$App" $@
```