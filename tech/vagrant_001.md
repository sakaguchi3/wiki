# vagrant - 「VT-x is not available」 のエラーが出たときの対処



## 症状

VirtualBoxが起動せず、ログに「VT-x is not available.」が出力されている。

> C:\Users\username\VirualBox VMs\hogefuga\Logs\VBox.log


> VT-x is not available.




## 対策

### BIOSで仮想化機能を有効にする

Advanced > CPU Configuration > Intel(R) VirtualizationTechnology > [Enabled]

[VirtualBoxでCentOS6.4(x64)がインストールできなかった話](https://qiita.com/kmats@github/items/a2396aa5b6f397d447b8)



### VirtualBoxでCPU x64を検出できない

vagrant upしても全然コンソールでは反応がないけど、virtual box自体は起動しているっぽい。
```
This kernel requires an x86-64 CPU, but only detected an i686 CPU.
Unable to boot - please use a kernel appropriate for your CPU.
```
virtual box付属のターミナル画面を起動してみたら、どうやらcpu x64が検出していないようになっていた。

```
$ VBoxManage modifyvm <vmname> --longmode on 
$ VBoxManage modifyvm <vmname> --ostype Debian_64 
```

回避するために、vmのcpuの設定を変更する

https://niku.name/2013/12/29/VirtualBox%E3%81%A764bitCPU%E3%82%92%E6%A4%9C%E5%87%BA%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84%E5%A0%B4%E5%90%88%E3%81%AE%E5%AF%BE%E5%87%A6.html



### 「in `split': invalid byte sequence in UTF-8 (ArgumentError)」のエラーが出る

* WSL: ubuntu18.04 LTS
* vagrant: 2.1.1
* virtual box: 5.2.12

```
$ vagrant.exe up
Bringing machine 'GuestUbuntu' up with 'virtualbox' provider...
==> GuestUbuntu: Checking if box 'laravel/homestead' is up to date...
C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.0.1/plugins/providers/virtualbox/driver/version_5_0.rb:388:in `split': invalid byte sequence in UTF-8 (ArgumentError)
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.0.1/plugins/providers/virtualbox/driver/version_5_0.rb:388:in `read_forwarded_ports'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.0.1/plugins/providers/virtualbox/driver/version_5_0.rb:601:in `block in read_used_ports'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.0.1/plugins/providers/virtualbox/driver/version_5_0.rb:593:in `each'
        from C:/HashiCorp/Vagrant/embedded/gems/gems/vagrant-2.0.1/plugins/providers/virtualbox/driver/version_5_0.rb:593:in `read_used_ports'
 :
```


vagrant上で以下のコマンドを実行して、シェルの文字コードを変更する。
```
$ powershell.exe -Command "chcp 932"
``` 
 
 
## 参考


 https://laboradian.com/what-to-do-if-vagrant-up-fails-in-wsl/