# gitでauthor, comitterを指定してcommitする

authorを変更

```bash
git commit --amend --author "a <a@localhost>"
```

comitterを変更

```bash
git -c user.email='a@localhost' commit --amend

```

<!--
```bash
```

-->