# gpg - master key, sub key の作成

## master keyの作成

```bash
❯ gpg --expert --full-gen-key
gpg (GnuPG) 2.2.41; Copyright (C) 2022 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
   (9) ECC and ECC
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (13) Existing key
  (14) Existing key from card
Your selection? 11

Possible actions for a ECDSA/EdDSA key: Sign Certify Authenticate 
Current allowed actions: Sign Certify 

   (S) Toggle the sign capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? s

Possible actions for a ECDSA/EdDSA key: Sign Certify Authenticate 
Current allowed actions: Certify 

   (S) Toggle the sign capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? q
Please select which elliptic curve you want:
   (1) Curve 25519
   (3) NIST P-256
   (4) NIST P-384
   (5) NIST P-521
   (6) Brainpool P-256
   (7) Brainpool P-384
   (8) Brainpool P-512
   (9) secp256k1

Your selection? 1
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y

GnuPG needs to construct a user ID to identify your key.

Real name: your name
Email address: a@example.com
Comment: 
You selected this USER-ID:
    "your name <a@example.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: directory '/home/<username>.linux/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/<username>.linux/.gnupg/openpgp-revocs.d/02D21BFA1F68F4043D8082BEAB1D71E796186DE3.rev'
public and secret key created and signed.

pub   ed25519 2023-05-13 [C]
      02D21BFA1F68F4043D8082BEAB1D71E796186DE3
uid                      your name <a@example.com>
```

## sub keyの作成

```bash
K=02D21BFA1F68F4043D8082BEAB1D71E796186DE3
```

署名用の鍵を作成

```bash
gpg --expert --edit-key $k

gpg> addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
  (14) Existing key from card
Your selection? 11

Possible actions for a ECDSA/EdDSA key: Sign Authenticate 
Current allowed actions: Sign 

   (S) Toggle the sign capability
   (A) Toggle the authenticate capability
   (Q) Finished

Your selection? Q
Please select which elliptic curve you want:
   (1) Curve 25519
   (3) NIST P-256
   (4) NIST P-384
   (5) NIST P-521
   (6) Brainpool P-256
   (7) Brainpool P-384
   (8) Brainpool P-512
   (9) secp256k1
Your selection? 1
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  ed25519/AB1D71E796186DE3
     created: 2023-05-13  expires: never       usage: C   
     trust: ultimate      validity: ultimate
ssb  ed25519/D1EBB36719764434
     created: 2023-05-13  expires: never       usage: S   
[ultimate] (1). your name <a@example.com>
```

暗号用の鍵を作成

```bash
gpg> addkey
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
  (14) Existing key from card
Your selection? 12
Please select which elliptic curve you want:
   (1) Curve 25519
   (3) NIST P-256
   (4) NIST P-384
   (5) NIST P-521
   (6) Brainpool P-256
   (7) Brainpool P-384
   (8) Brainpool P-512
   (9) secp256k1
Your selection? 1
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.

sec  ed25519/AB1D71E796186DE3
     created: 2023-05-13  expires: never       usage: C   
     trust: ultimate      validity: ultimate
ssb  ed25519/D1EBB36719764434
     created: 2023-05-13  expires: never       usage: S   
ssb  cv25519/1F2F50275C78DF38
     created: 2023-05-13  expires: never       usage: E   
[ultimate] (1). your name <a@example.com>

gpg> save
```

確認

```bash
gpg -K --with-subkey-fingerprints
/home/<username>.linux/.gnupg/pubring.kbx
----------------------------------
sec   ed25519 2023-05-13 [C]
      02D21BFA1F68F4043D8082BEAB1D71E796186DE3
uid           [ultimate] your name <a@example.com>
ssb   ed25519 2023-05-13 [S]
      78DB3B02CF6D81992EE66746D1EBB36719764434
ssb   cv25519 2023-05-13 [E]
      82A7F77BF08AD86C330838E91F2F50275C78DF38
```

## 秘密鍵のバックアップ & 秘密鍵の削除

鍵のエクスポート

```bash
K=02D21BFA1F68F4043D8082BEAB1D71E796186DE3

gpg -a -o master.asc --export-secret-keys $K
gpg -a -o sub.asc --export-secret-subkeys $K
```

秘密鍵を削除すると失効証明書を作成できないので、 予め発行しておく。

```bash
gpg -o revoke.asc --gen-revoke $K

sec  ed25519/AB1D71E796186DE3 2023-05-13 your name <a@example.com>

Create a revocation certificate for this key? (y/N) y
Please select the reason for the revocation:
  0 = No reason specified
  1 = Key has been compromised
  2 = Key is superseded
  3 = Key is no longer used
  Q = Cancel
(Probably you want to select 1 here)
Your decision? 0
Enter an optional description; end it with an empty line:
> 
Reason for revocation: No reason specified
(No description given)
Is this okay? (y/N) y
```

```bash
❯ ll
total 12
 master.asc
 revoke.asc
 sub.asc
```

秘密鍵を削除する。
削除するときには`~/.gnupg/private-key-v1.d/<Keygrip>.key`というファイルが作られているので、このファイルを直接削除する。

```bash
❯ gpg -K --with-keygrip
sec   ed25519 2023-05-13 [C]
      02D21BFA1F68F4043D8082BEAB1D71E796186DE3
      Keygrip = 926F02177E5962792C2778D8AD6B2DEACF157C36
uid           [ultimate] your name <a@example.com>
ssb   ed25519 2023-05-13 [S]
ssb   cv25519 2023-05-13 [E]

❯ rm ~/.gnupg/private-keys-v1.d/926F02177E5962792C2778D8AD6B2DEACF157C36.key

❯ gpg -K
sec#  ed25519 2023-05-13 [C]
      02D21BFA1F68F4043D8082BEAB1D71E796186DE3
uid           [ultimate] your name <a@example.com>
ssb   ed25519 2023-05-13 [S]
ssb   cv25519 2023-05-13 [E]
```

`#` がついているので、秘密鍵が削除されていることが確認できる。

## 参考

* [GPGで主鍵と副鍵を作成する - Carpe Diem](https://christina04.hatenablog.com/entry/create-gpg-master-key-and-subkey)
* [【令和最新版】PGP鍵の作り方から管理方法、Git Commitへの署名まで](https://qiita.com/shun-shobon/items/a944416bebb6207016fb)
