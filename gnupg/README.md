# GNUPG

[gnupg](https://www.gnupg.org/) allows you to encrypt and sign your data and communications based on OpenPGP standard.

To start using it we need to install and create a key.

## Installation 

```
[slamba ◯  WHM0005395  04.secrets ] ☘   brew install gpg
[slamba ◯  WHM0005395  04.secrets ] ☘   gpg --version
gpg (GnuPG) 2.2.10
```

## Create gpg key

```
[slamba ◯  WHM0005395  04.secrets ] ☘   gpg --full-generate-key
[slamba ◯  WHM0005395  04.secrets ] ☘   gpg --list-secret-keys
/Users/slamba/.gnupg/pubring.kbx
--------------------------------
sec   rsa4096 2018-10-09 [SC]
      8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
uid           [ultimate] Sandeep Lamba (Game-On-Baby) <sandeeplamb@gmail.com>
ssb   rsa4096 2018-10-09 [E]
```