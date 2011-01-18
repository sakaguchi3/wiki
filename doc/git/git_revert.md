# git - revert

`git revert <hash_id>`

## merge commitをrevertする

![](/doc/git/git_04/graph_01.jpg)

エラーメッセージ．マージ元のブランチが2つあるのでどちらに戻すか指定する必要がある．
```bash
git revert branch
error: Commit xxxx is a merge but no -m option was given.
fatal: revert failed
```

git showでmerge元の確認

```bash
git show branch 
Merge: xxx yyy
```

#### xxx(左側ブランチ)に戻すには 1, yyy(右側ブランチ)に戻すには2

左側
```bash
git revert branch -m 1
```

右側
```bash
git revert branch -m 2
```



  


