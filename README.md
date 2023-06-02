# 備忘録

## 暗号化, セキュリティ

* [openssl - ファイルの暗号化, 共通鍵方式](doc/openssl/openssl_enc_file1.md)
* [openssl - ファイルの暗号化, 公開鍵方式](doc/openssl//openssl_enc_file2.md)
* [openssl - ファイルの暗号化, smime](doc/openssl/openssl_enc_file3.md)
* [openssl 秘密鍵のパスワードを変更する](doc/openssl/openssl_change_passwd.md)
* [gpg - master key, sub key の作成](doc/gpg/gpg_gen_key_01.md)
* [gpg - ファイルの暗号化](doc/gpg/gpg_enc_file.md)
* [gpg - 鍵のimport/export](doc/gpg/gpg_import_key.md)
* [gpg - 鍵サーバに公開鍵をアップロード](doc/gpg/gpg_keyserver.md)
* [gpg - 鍵の削除](doc/gpg/remove.md)
* [gpg - 署名](doc/gpg/sign.md)
* [7z](doc/compress/7z.md)
* [zip](doc/compress/zip.md)
* [rar](doc/compress/rar.md)
* [shred - 完全にファイルを削除する](tech_linux/shred_001.md)
* [dd - 適当なファイルを作成](tech_linux/dd_001.md)
* [乱数/パスワード生成 - rand, passwd](tech_linux/urandom_001.md)
* [vim 暗号化, encrypt](doc/security/vim_encrypt.md)
* [nvim 暗号化, encrypt](doc/security/nvim_encrypt.md)

## web server

* [csrの作成手順 - tag:ssl, csr, openssl](doc/openssl/openssl_csr.md)
* [sslstoreで証明書を購入する手順](doc/openssl/ssl_store_01.md)
* [apache, nginxでhttpsの設定 - tag:ssl, openssl](doc/other/https.md)

## docker

* [limaでArchLinuxを使う](doc/docker/lima.md)
* [lima](doc/docker/lima01.md)
* [rdctl, RancherDesktop](doc/docker/rdctl.md)

## linux

* [openconnect](doc/linux/openconnect.md)
* [時刻同期 - ubuntu, manjaro](doc/linux/timedatectl.md)
* [btrfs - scrub](doc/linux/btrfs_scrub.md)
* [sudoers](doc/linux/sudoers.md)
* [useradd, ユーザの追加](doc/linux/useradd.md)
* [group](doc/linux/group.md)

## shell

* [shellscriptでファイル一覧を取得してループ処理をする, tag:bash](doc/shellscript/list_all_files.md)
* [shellscriptでファイル、ディレクトリが存在するか確認する, tag:file,directory,link](doc/shellscript/check_path.md)

## ssh

* [ssh-agent](doc/ssh/sshagent.md)
* [ssh - ユーザごとに接続ipをコントロールする](doc/ssh/ssh_03.md)

## git

* [git - lfs(large file system)](doc/git/git_lfs.md)
* [git - revert](doc/git/git_revert.md)
* [git - 備忘録](tech_git/git_0001.md)
* [gitlab - gitlabでdeploy tokenを使う](tech_git/git_0003.md)

## ArchLinux

* [ArchLinuxでyayを使う, keyword:aur](doc/archlinux/yay.md)

## AlmaLinux

* [AlmaLinux8.0 - partition作成〜フォーマット](doc/almalinux/almalinux_fdisk.md)
* [AlmaLinux8.0 - ユーザ追加](doc/almalinux/almalinux_add_usr.md)
* [AlmaLinux8.0 - install java17](doc/almalinux/almalinux_java17.md)
* [AlmaLinux8.0 - install tomcat](doc/almalinux/almalinux_tomcat9_setup.md)
* [AlmaLinux8.0 - install php7.4](doc/almalinux/almalinux_php_setup.md)
* [AlmaLinux8.0 - sshd セキュリティ周り](doc/almalinux/almalinux_sshd.md)
* [AlmaLinux8.0 - networkに固定ipの設定をする](doc/almalinux/almalinux_static_ip.md)
* [AlmaLinux8.0 - nginx -  virtual hostごとにファイルを分割する](doc/almalinux/almalinux_nginx_virtualhost.md)
* [AlmaLinux8.0 - nginx - setup](doc/almalinux/almalinux_nginx_setup.md)
* [AlmaLinux8.0 - 特定のプロセスだけsudoを許可したい](doc/almalinux/almalinux_sudo.md)
* [AlmaLinux8.0 - mysql clientのインストール](doc/almalinux/almalinux_mysql.md)
* [AlmaLinux8.0 - tomcat catalina.outで文字化けが発生する](doc/almalinux/almalinux_tomcat9_trouble.md)
* [AlmaLinux8.0 - コマンドの実行結果を英語(LANG=C)にする](doc/almalinux/almalinux_lang.md)

## 監視ツール

* [Linux - 監視コマンド(sar)](tech_linux/linux_005_02.md.md)

## MySql8.0

* [MySQL8.0 - userの権限を設定](doc/mysql/8.0/mysql8_add_user.md)

## python

* [python - venv](doc/python/venv.md)

## find

* [find - rm 大量のファイルを削除](doc/find/find_rm.md)
* [find xxxを除いて検索する - tag:exlude,除外](doc/find/find_exclude.md)
* [find - atime, mtime, ctime](doc/find/find_time.md)
* [find - xargs](doc/find/find_xargs.md)

## その他

* [zstd - tag:圧縮, 解凍, compress](tech/zstd.md)
* [vim - 備忘録](tech/vim_001.md)

## aws

* [aws lambda - pythonデプロイの作成](doc/aws-lambda/lambda01.md)

## azure

* [azure cli - azコマンドでblobを操作する](doc/azure/azure_blob_01.md)

* [古い記事](readme_old.md)
