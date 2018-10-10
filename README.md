# Secrets Management with AWS-KMS, PGP, SOPS and Helm-Secrets

Kubernetes secrets resources are base64 encrypted which is not so secure model.

On the top, to store the secrets yaml file(data at rest) in public repository is not a good idea too.

We can use this method to solve issue of secrets at rest and in transit with the help of below tools.

1. [GNUPG](https://www.gnupg.org/)
2. [AWS-KMS](https://docs.aws.amazon.com/kms/index.html) 
3. [SOPS](https://github.com/mozilla/sops/blob/master/README.rst)
4. [Helm-Secrets](https://github.com/futuresimple/helm-secrets)

# Steps

Follow the below steps in sequential order to encrypt the secerts.

## 01. Setup GPG

Follow the steps as described [here](https://github.com/sandeeplamb/kubernetes-secrets-management/tree/master/gnupg)

## 02. Setup AWS-KMS

Follow the steps as described [here](https://github.com/sandeeplamb/kubernetes-secrets-management/tree/master/aws-kms)

## 03. Setup SOPS

Follow the steps as described [here](https://github.com/sandeeplamb/kubernetes-secrets-management/tree/master/sops)

## 04. Helm-Secrets

Follow the steps as described [here](https://github.com/sandeeplamb/kubernetes-secrets-management/tree/master/helm-secrets)

# Demo

<p align="center">
  <a href="https://asciinema.org/a/d5E8HKf3izLijyxaCADOeBbbJ?speed=2&amp;autoplay=1">
  <img src="https://asciinema.org/a/d5E8HKf3izLijyxaCADOeBbbJ.png" width="585"></image>
  </a>
</p>