# Helm-Secrets

[Helm Secrets](https://github.com/futuresimple/helm-secrets) is a plugin for Helm which uses encrypted values to feed into the application.

This plugin a wrapper for [sops](https://github.com/mozilla/sops/blob/master/README.rst).

It supports multiple encryption methods and can chain them as failover.

## Installation

```
[slamba ◯  WHM0005395  04.secrets ] ☘   helm plugin install https://github.com/futuresimple/helm-secrets
==> Downloading https://homebrew.bintray.com/bottles/sops-3.1.1.high_sierra.bott
==> Downloading from https://akamai.bintray.com/bc/bcc7b594c94c55f3a6e6abd7a0128
######################################################################## 100.0%
==> Pouring sops-3.1.1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/sops/3.1.1: 5 files, 19.7MB

* Helm-secrets wrapper for helm binary: /usr/local/bin/helm-wrapper
Installed plugin: secrets
```

## Usage

### 01. Create .sops.yaml file

Create the hidden *.sops.yaml* file in directory with *secret.yaml* file and update the contents as below.

We can use both PGP and AWS-KMS for encryption or only PGP or only AWS-KMS. All depends on use-case.

```
[slamba ◯  WHM0005395  04.secrets ] ☘   cat .sops.yaml
creation_rules:
    - kms: arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
    - pgp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
```

### 02. Create secrets.yaml file

Secret file will be a yaml file containing the secrets in YAML format. For example as below

```
[slamba ◯  WHM0005395  04.secrets ] ☘   cat secrets.yaml
db:
    username: root
    password: rootpassword
```

### 03. Encrypt Secrets

Now encrypt the secrets.yaml using *helm secrets* command.

```
[slamba ◯  WHM0005395  04.secrets ] ☘   helm secrets enc secrets.yaml
Encrypting secrets.yaml
Encrypted ./secrets.yaml
[slamba ◯  WHM0005395  04.secrets ] ☘   cat secrets.yaml
db:
    username: ENC[AES256_GCM,data:MC9Djw==,iv:JY4txqwbKUBEdgaoDxGp4jZohO+7sxjQLcAaMQnydXI=,tag:mVrEBD8gHOSvhUe4PL1XIQ==,type:str]
    password: ENC[AES256_GCM,data:THn3BP4ithKSIfRz,iv:O9so38gqidMsP2i7aD4ngSO6r40TqdlsYIaayLBuXBU=,tag:7JYbLR7LkOGeUqEdpD/JFw==,type:str]
sops:
    kms:
    -   arn: arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
        created_at: '2018-10-10T13:08:35Z'
        enc: AQICAHgFQQu27pmT5Jr7HsHiZaO8I7pMHxp/c2RuORv7sFB9bAFxVpg/wOw9M9nucDMh4iMBAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMV4R4akJStXtrsbRCAgEQgDtuEFa6DGh8n4eFvoRhuXN9eODZIIePsIw/aLFUenvULC6GMwWD2q15uQgTX1g8C/cs2+p5JiUn06IKHQ==
    gcp_kms: []
    azure_kv: []
    lastmodified: '2018-10-10T13:08:37Z'
    mac: ENC[AES256_GCM,data:KoC/bvBRojf9bGxwOwBOT3+rR3LKaBn3rA3CD5GKgahLc5dBsJ/h4ZEKpN3q8dNjeaMVLulSHF2maAe5vvwlINlcR/xlUpSzpTHEK0tLWryuOGYMSFBji9jKRd6tIh+iCQpyvmDQsBpha+D3p5QNhvHtSJSxQnYULTBS+42IbO4=,iv:HoVBm5he29CR7a1pl9nELixROarBEBvtBRUM7fA+eRs=,tag:PLarFZPATUJ5QG4GAAwvkA==,type:str]
    pgp:
    -   created_at: '2018-10-10T13:08:35Z'
        enc: |
            -----BEGIN PGP MESSAGE-----

            hQIMA6/mXsBCSO0EAQ/6A7h4D/WZUjuUhFx8hfxBzOY/s6ESp4A0lCOaWE0U0BOe
            GXP555yZ6WgwXDcKoHbgzJnA+BQXsd13dQvR/nIZB586glsSF919o8qvS3X1GRva
            tDYILpK981Mr5zJLUX0m5FB5lv1RtsZlxqjM4tbLZ4bfyYBkGwsIqTk7qjHEEAky
            hDyHLN+2ey9kkVnz3QalMfaOVtczHQG0d84FrRDugjVGfNdzM5ehVc98PImZYZT8
            U7nml6vyqQNUVN238vS/oak6F/efvZ34kfNnAoP58du4XFfawnSiIeiZ1AvcgEPJ
            foUAZvQsXVGQLc4Ng5BYI+3mwP5s+4ztcR3aVb7tWfswSH+QqC/o/9as+kSmxwps
            nywjBx9kUmzr/+3N0YXlNHfDxcB5HQMsKWy/WsTSGTU7e+eO+bmUUgfq4920MlmQ
            io41ghHsf9fNPmcoSEIP5hfJ4rWWIkjnTfIDDt1lfgt6V2ncWcbpIrF5AxjNVRdC
            Esgc+4Oo8rxum/sc+kxrM8tPtO88kuqgz/5Jas6pprsKBJmyxlBHHFwXCzWv+ZRL
            qGNb6014D8zVRXMguvaB4BvvYXdTP6/fLIPGHoc7vasWJO61sBsCIw2fag5SWQFY
            OMkNR2Ix6L+ti5lXYIm1ddi1+ObAmdZBwqp/taUF7SsoRQmMjm3dlGGnfI5NCsHS
            XgHtzrguIQjJPrY4KnJvBz7Xm5HWweCakCEieeZvF8PJCwWl9XkXc+unNGcLiGmk
            InAsg8A+ssVhK1eFMyQy6EprRVEa9ly14gPhj2HYizI0NUQcpzwIqQP/nUlP4MA=
            =GK5o
            -----END PGP MESSAGE-----
        fp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
    unencrypted_suffix: _unencrypted
    version: 3.1.1
```

### 04. Decrypt Secrets

Decrypting the secrets is also trivial task. Just run the below command and new YAML will be generated with *.dec* extension in same directory.

e.g. *secrets.yaml.dec* in this case.

```
[slamba ◯  WHM0005395  test ] ☘   helm secrets dec secrets.yaml
Decrypting secrets.yaml
[slamba ◯  WHM0005395  test ] ☘   cat secrets.yaml.dec
db:
    username: root
    password: rootpassword
```