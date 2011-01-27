#  git - git lfs (large file system)



# lfsの対象にするファイルの追加

pdfをlfsに追加
```git
git lfs track '*.pdf'
```

これをやると、`.gitattribute`というファイルが作成され、そこにtracking対象が追加される。

```git
cat .gitattributes 
*.pdf filter=lfs diff=lfs merge=lfs -text1
```

# lfs管理を調べる

```git
$git lfs track

Listing tracked patterns
    *.pdf (.gitattributes)
Listing excluded patterns
```


# lfs管理ファイルをチームで共有

```git
git add .gitattrubutes
git commit . -m'git-lfs add *.pdf'
git push origin
```


# trackに追加したものを削除する

```git 
git lfs untrack '*.pdf'

$git lfs untrack '*.pdf'
Untracking "*.pdf"
$cat .gitattributes 
# 空になっている
```

