# nfs - CentOS7


### server

daemon
```bash
systemctl start rpcbind nfs-server
systemctl restart rpcbind nfs-server

# 自動起動ON
systemctl enable rpcbind nfs-server
```



exporst. nfsのアクセス設定. 
```
vim /etc/exports
 
# read only 
/dir/nfs_dir 172.82.0.80/24(ro,no_root_squash)
```

firewall
```
firewall-cmd --list-services --zone=public  --permanent   
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --remove-service=nfs  --zone=public  --permanent
firewall-cmd --reload
```




### client

soft
```regexp
yum install rpcbind nfs-utils
```

mount 
```bash
mount -t nfs -v nfs-host.localdomain:/dir/nfs_dir1  /mnt/nfs_server_nfs_dir1
```

fstab
```bash
vim /ets/fstab

nfs-host.localdomain:/dir/nfs_dir1  /mnt/nfs_server_nfs_dir1   nfs    defaults,ro 0 0
```