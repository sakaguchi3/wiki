# shellscriptでファイル、ディレクトリの存在するかを確認, tag:file,directory,link

```bash
if [ ! -f ~/path ]; then
    echo "ファイルではない"
fi
```

```bash
if [ ! -d ~/path ]; then
    echo "ディレクトリではない"
fi
```

```bash
if [ ! -e ~/path ]; then
    echo "パスが存在しない"
fi
```

```bash
if [ ! -L ~/path ]; then
    echo "シンボリックではない"
fi
```

<!--
```bash

```

-->
