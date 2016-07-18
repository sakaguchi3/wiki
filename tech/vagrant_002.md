# vagrant - boxファイルのexport/import

### boxファイルのexport

```bash
$vagrant package 
```

package.box ってファイルが出来上がる．  
Vagrantfileは作成されない． 


### boxファイルのimport

```
$vagrant box add vg2 package.box
$vagrant box list   # 追加されているか確認する
$vagrant init vg2   # Vagrantfileが作成される
$vagrant up
```



### 削除

```bash
vagrant box remove vg2
```

### 参考
http://vdeep.net/vagrant-package
