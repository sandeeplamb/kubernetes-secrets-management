# SOPS - Secerets OPerationS

[sops](https://github.com/mozilla/sops/blob/master/README.rst) is an editor of encrypted files that supports YAML, JSON and BINARY formats and encrypts with AWS KMS, GCP KMS, Azure Key Vault and PGP.

## Installation

Installation is straight forward. [stable-release](https://github.com/mozilla/sops/releases) contains the binaries and packages of the latest releases.

## Usage

We can encrypt the contents of yaml files using command line or by putting encryption methods in *.sops.yaml* file.

We will use both methods. To use  *.sops.yaml* file, we need to put the contents like below in the file.

### 01. With PGP

Just send the finger-print of generate key as sops switch.

```
[slamba ◯  WHM0005395  04.secrets ] ☘   cat .sops.yaml
creation_rules:
    - pgp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
[slamba ◯  WHM0005395  04.secrets ] ☘   sops --config .sops.yaml -e secrets.yaml
[slamba ◯  WHM0005395  04.secrets ] ☘   sops -p 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA -e secrets.yaml
db:
    username: ENC[AES256_GCM,data:AXC1IQ==,iv:UugQCSqKzgykFGYriG6xBpCMdCGm05gzmmTanNzpjsM=,tag:AESpPftZWiWsX2wD2IZFow==,type:str]
    password: ENC[AES256_GCM,data:HxVjRGElN/f9I/kO,iv:D8Qf8vZumDsCP7G3rqFGrK50cyWHw0wl3EkhagB05xM=,tag:rspQhEr73/WWgTOWC91ToQ==,type:str]
sops:
    kms: []
    gcp_kms: []
    azure_kv: []
    lastmodified: '2018-10-10T13:28:54Z'
    mac: ENC[AES256_GCM,data:tboA0BqxuO//ZJJKpeY7XDD0wfPQ3OWzmIzByeA5NuQ76auhrbICDsVUxtgq2mI3r6QTnbJRCJuSYlEXD1eSv+aXh27VX59vdNfR1vJC2HMxSxCcE/0nWv1r6R6Z4CII+4y/5SQlrZQQFHHtojtbB65ZnvXBsms35kqyAT4NN84=,iv:0CrHrYoMY07VzKTUEl+ubx/B5N/IYHakV/SHoXRM2MI=,tag:/BYCuFjAXCHnXzUBsSJqIQ==,type:str]
    pgp:
    -   created_at: '2018-10-10T13:28:53Z'
        enc: |
            -----BEGIN PGP MESSAGE-----

            hQIMA6/mXsBCSO0EAQ//TKCSj4B+jNUi54GN9wwYR8bORKPT3WEAa1hjMPAICgEe
            LzVk9h/R5R4uXGJyt4QR0bQqFNochXekmNn3SKhhqZl0PcQClNWaK9CX9WLKbdgA
            dnxulSpHJ6o9e/hu9OBwIUIJlWeyygfoswvUm1nADdIMOlyK9WfIdYaCnznWph/B
            7tshhCJQz43LzW6S3dNDFbmgW/0+cNXb6tb1VIwRfiNyWz39xvqsCvcSCBKN21cc
            wyJpKaCrtnGtRVD9eoAYgVXC/xJN36k+wWzayoDJrKdF9BxJ3AvMI7J+XGsRBchu
            BPvLdfem4Qkn4YQRln0zyMzj4SJCCTIDHQyEigGZuCGZWkePBdFtn5m9yUWcA2WC
            EOjwNyOnKHp7tpDnTcMjetQcZLAgixtTMtEdaU+onBUvQTa866LMxwPSe59Iuudn
            tUO9GLHfkOW1JOdWU0dP5VqEmpX9CmycttSSWNQxLL2MHPU4IJo4lqzde9IgSegM
            cfuy2tP5G0Nh4nw5vH2AY4ZdDuR6LcovIjOWHR5Pcz6AT6bpjRNelOi5X8WDPvQq
            dv/tlYXXYsC+JC8n5Am9fyAg4dL7Kh16uVD4P5rix94VRldNippVtG0Ua8qON0hw
            VvnjI+pP3A60Vz1rHrJRUZJW/EWkkOsYJWDy2zTBi2p+QKzVJRui2iQEJYqoSeDS
            XgEs+j3Y1AWdW8O5XVZiBZBNfsysh/7xriVDEm3E8+Uxk+Q071pWNKkkmdItTbsq
            BIjnNxexumZxhjGfVPZ62YjPeUJIVlE6rQhiPIYPWyHvkrGa8h4t15+yrB+g/9Y=
            =L3qc
            -----END PGP MESSAGE-----
        fp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
    unencrypted_suffix: _unencrypted
    version: 3.1.1
```

### 02. With AWS-KMS

Send the kms switch in the sops command.

```
[slamba ◯  WHM0005395  04.secrets ] ☘   cat .sops.yaml
creation_rules:
    - kms: arn:aws:kms:us-east-1:1232131232:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
[slamba ◯  WHM0005395  04.secrets ] ☘   sops --config .sops.yaml -e secrets.yaml
[slamba ◯  WHM0005395  04.secrets ] ☘   sops -k "arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9" -e secrets.yaml
db:
    username: ENC[AES256_GCM,data:5Xo1rw==,iv:uurBXJ7mv7klXxQpVKV6dO+hYdM8ZiAQSDeUh7PvFDo=,tag:vgtp/hVON54SEeXMFEYnXg==,type:str]
    password: ENC[AES256_GCM,data:JLfup2IoRbT6xugt,iv:b/TMNdzCr1ab8YY1oxRjs9n9IQne76zis+GivbjRhDI=,tag:pLCHSM50V3CM3CyHZEecig==,type:str]
sops:
    kms:
    -   arn: arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
        created_at: '2018-10-10T10:37:55Z'
        enc: AQICAHgFQQu27pmT5Jr7HsHiZaO8I7pMHxp/c2RuORv7sFB9bAEiRiNyZBbt0MAC81SJ3KdWAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMoiPYxvvTfah5YuvAAgEQgDvEXpDPtO0DZm2Ln0ALqk8Iw94RpD8TaPWiuwg5qnAFe9+k322A/RG4nfiPlcOG2Tcpt2ah8dWIjQ7WEw==
    gcp_kms: []
    azure_kv: []
    lastmodified: '2018-10-10T10:37:57Z'
    mac: ENC[AES256_GCM,data:CK7leM2x/22PfMihKcDW3snVPCRqu/KjD7LBpHIXxVG+G16bzYDlEDM9zANQU7H+gx3ujz0PtkijYhcHtgMh2OO6sXmRs+kNZ7QjNfRg0507yT78uVC9UYywwoKiXaGWQAzKZbd34MjI8Lv5Pv7x1ne1CQToblB5SA/F1AhbAeY=,iv:x1XtHum0ig/yPpwZs/2Preozvo81fFcEThgyUxXk9uE=,tag:d167MMxQEHA0I9Q4T0wADw==,type:str]
    pgp:
    -   created_at: '2018-10-10T10:37:55Z'
        enc: |
            -----BEGIN PGP MESSAGE-----

            hQIMA6/mXsBCSO0EAQ//eE0CcxXdwUzA/EajimEwuxnPeju9ZUxp6CisKAAGqwO7
            sKw3MysTof5sNlqoTxywTB1MdB2kwtj1dbbvNfBpRKJCqG6WTQJu+8RwdIRNLnnQ
            u7Hbxcqpuw+xsq2wf6Uc7cLdigOJD3r+09akxqK1LlU4RJbYjWPoYEe/T/p24BB8
            maunx2Q2KaTla7N2rEYIpREhFOyhf5LUczMWuVcHjhDyfxOMTJdYXj3A4ztC/yun
            2kJgtOe3V50+i69eW9o8VgMt4gm6iifa1DsjqtxWfGmhAt5lTEjxXu2rnAX5R3nq
            Gy+TD8lQPAfwn+c6Vo7WrK2Q/PjoQov0LdN3WaOZmjMHS4/Z4cOx3VfOr8RsRUuq
            ogvlFfQ3pxKTWKjjBnO+UQjUkayzduFzCU9/pwYVV0Ns3HcT/3iJ4v5kXxgO1wT6
            TC7U/BEiOm3uCxM47sd+Uyswm/Ct2nQsra+GGypTpi1RlE5X04ILcu2TyzXcOUtA
            DUFHJqYnzG05dXM7If3FwZcHYFmGvhFsVCRQBf6aIfbe3UifxPYWciFyKsVjo9mJ
            VjFCo13QgxXhSyESTXxf9e7iuGOhSkq810TyP6lWZwkvwirllGrkleKTo3A/oZIl
            af4NbPdp/FW8UH3kaoPbzvTrbY0fVZQzG7ZczZeYagqYdF3FJEgo1L9H9cfL9jrS
            XgEdGb3teEym3N3MoMMUvSoZhLV+eB0AjDIvEFiVhb1eiEOXvjZPkJSDZoLWTjsR
            frQnpNjCm1wsluIryHVgkkvPRA80BbwEabO1E9oQyIkBK1gYnmPxTejeF5yklig=
            =fBxR
            -----END PGP MESSAGE-----
        fp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
    unencrypted_suffix: _unencrypted
    version: 3.1.1
```


### 03. With PGP and AWS-KMS


```
[slamba ◯  WHM0005395  04.secrets ] ☘  cat .sops.yaml
creation_rules:
    - kms: arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
      pgp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
[slamba ◯  WHM0005395  04.secrets ] ☘  sops -p 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA -k "arn:aws:kms:us-east-1:123213123223:key/c-156105b-c9a0-5ec-8777-07b2ebe419e9" -e secrets.yaml
db:
    username: ENC[AES256_GCM,data:RyA8OA==,iv:OBvkyILCjyTsD3GjvqgcB5hd0f+rO0r+gQx8eoNkdf8=,tag:0v84Z+BJarJwCG4PNU+FZA==,type:str]
    password: ENC[AES256_GCM,data:R2C3RFQwqqkd5TMz,iv:yrT4I3ymq/1srp1tAIBtIbwubN/LvL1Drl6fc3aD4l0=,tag:UtW9TFTHFwgzNPiRC10uNA==,type:str]
sops:
    kms:
    -   arn: arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
        created_at: '2018-10-10T13:35:00Z'
        enc: AQICAHgFQQu27pmT5Jr7HsHiZaO8I7pMHxp/c2RuORv7sFB9bAEzBYfMNLCgQUr/bDKjn49GAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQML69PUwVV91j5lK30AgEQgDviNapa1+K275TpEmo1o++YMBPmXGXp9FnusPvdi1g59PA+2PlaILC9e2rZ7uPQl/wm9CaTEt6typw7hA==
    gcp_kms: []
    azure_kv: []
    lastmodified: '2018-10-10T13:35:02Z'
    mac: ENC[AES256_GCM,data:cnKzUC5oE+cpQ1z+eFKJlg56oLrSwcsBjHpRIRDGyWicV60AL7e9vM0rqzdey8zD2bS/PeInIWc5RemDTtgPGh2E1Cs2B52Oj9Z2dow6WznhKRgaYKeZ/i0QpGjwrbPGkW9B5Titaw7uiapwIt+bw85cqRx/xl4WDmpjzTM1qMo=,iv:Wd1/ls+WaGvuIo6OVRvCrO2AAjdFRSDp7lii6emkCOU=,tag:clfBqDMcVdhS0hxe1w50Xg==,type:str]
    pgp:
    -   created_at: '2018-10-10T13:35:00Z'
        enc: |
            -----BEGIN PGP MESSAGE-----

            hQIMA6/mXsBCSO0EAQ//XOOMi10jJZql6wtZd4JSb1WLdOmZhDYqB+El08Bq29cX
            1G9Nlb9bqYyV7vmUbdP7YZysUJTlTJGUPQZEeg0sGl2To+oF32oKHHo6MCHN2ze0
            gIKxCydEYBmzsrdi56XMv2RIrHcryaY2p10L4KqxMGcyN8E95bgxxifjGcQqs0z7
            Waopx4nq1tMVTqyHizFl5gnozIs0FZ3x9A3xUeDjm29zIHguVDLfKF7LT4W3ZCKZ
            97hwIbMrFfUWEjlGAuzQRRFbR8Jhsc2+u4YkSAcq6Vo6zireDSZwRSo7EQfnZkd2
            +vrInQ0/nLwNeKh2eK9PIVb8lWmL1rJ+UKq+x1KT67e0H1SEf72QDqVQ+PbG7+c6
            qfwDc5QWUci89dP6QFeB3aLPRJIxUS2r7F5iow9Q37Uc3niPg5MBJAHJUViPDiT8
            2yEF4wefBllGtSvNz4vYdqH8wSjdpCVbw0vfOM8NJ0Mowlbyo68Gt+2A/AUndFmj
            2g4kh1q55KP6tSWJ20mBvro9D/W03SEWOzObWeZy0t3yJqrB6Dp5F1ZAOgGkJNW2
            G1fjKcd9kBl1R7UC3czJcXUiIlf+Hf6B1ze/8dV+61ei5VN8NWM1LOtgd1LB1HdV
            J71tC990Wu44F0SXia2b+9OysrGjejuyCYGo5msUCBXg9+B+EOzqusGzy6yeQZfS
            XgGxqP9c7F9SyXqZIip4mophqOPahvfVA6QRYfgTFFoyoS3cjmax3/nmcSq+17+u
            XcgCZGNPD2VguWHyVANAUfKcsvAJGpychxw/ExxMmSLgNG++boknZOuuatooknE=
            =RWXX
            -----END PGP MESSAGE-----
        fp: 8EB6D0DB5DE68EA685CE8A95FF6DCEF76B4AFCDA
    unencrypted_suffix: _unencrypted
    version: 3.1.1      

```