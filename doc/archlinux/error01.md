# Arhcでアップデートしたら `Validating source files with sha256sums...` エラーが出たときの対処法

アップデートしたらエラーが出る
```bash
yay -Syu
==> Validating source files with sha256sums...
    nkf-2.1.5.tar.gz ... FAILED
==> ERROR: One or more files did not pass the validity check!
 -> error making: nkf-exit status 1
 -> Failed to install the following packages. Manual intervention is required:

```

キャッシュクリア
```bash
yay -Scc

```

アップデード
```bash
yay -Syu
```



<!--
```bash
```

-->