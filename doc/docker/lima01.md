# lima

yml作成

```bash
cd ~/{lima directory}
vim archlinux.yml
```

```vim
arch: "x86_64"
# This example requires Lima v0.7.0 or later
images:
# Try to use yyyyMMdd.REV image if available. Note that yyyyMMdd.REV will be removed after several months.
- location: "https://geo.mirror.pkgbuild.com/images/v20230415.143207/Arch-Linux-x86_64-cloudimg-20230415.143207.qcow2"
  arch: "x86_64"
  digest: "sha256:ff733ead933d25f168c690ad0fe6b66cb8187d88191c8dc6e88ec50687539265"
- location: "https://github.com/mcginty/arch-boxes-arm/releases/download/v20220323/Arch-Linux-aarch64-cloudimg-20220323.0.qcow2"
  arch: "aarch64"
  digest: "sha512:27524910bf41cb9b3223c8749c6e67fd2f2fdb8b70d40648708e64d6b03c0b4a01b3c5e72d51fefd3e0c3f58487dbb400a79ca378cde2da341a3a19873612be8"
# Fallback to the latest release image.
# Hint: run `limactl prune` to invalidate the cache
- location: "https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2"
  arch: "x86_64"

mounts:
- location: "~"
- location: "/tmp/lima"
  writable: true
firmware:
  legacyBIOS: true
```

RD(rancher desktop)起動

```bash
rdctl start
```

コンテナ(lima)を起動

```bash
limactl start archlinux 
```

コンテナにログイン

```bash
limactl shell archlinux
```

コンテナを停止

```bash
limactl stop archlinux
```

RDの停止

```bash
rdctl shutdown
```

## 参考

* [https://zenn.dev/sasasin/articles/46540925aecc4e](https://zenn.dev/sasasin/articles/46540925aecc4e)

