# AWS-KMS using Terraform

This Terraform module will create the AWS-KMS key that we will use to encrypt the secret resource file of Kubernetes.

We can do the same thing from AWS-GUI but terraform will help in automating such tasks.

## AWS-KMS Master-Key Creation

Please change the account_id in *main.tf* file.

Also change *kms_key_policy.json.tpl* file with correct details.

## Terraform Creation

Use below commands to create the AWS-KMS Key

```
[slamba ◯  WHM0005395  terraform ] ☘   terraform init
[slamba ◯  WHM0005395  terraform ] ☘   terraform plan --var-file=terraform.tfvars
[slamba ◯  WHM0005395  terraform ] ☘   terraform apply --var-file=terraform.tfvars
```

## Terraform Output

```
[slamba ◯  WHM0005395  terraform ] ☘   terraform output -module=whKMS
kms_arn = arn:aws:iam::123213123223:policy/kmsiam_key_policy
kms_key_arn = arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9
```

## AWS-KMS Master-Key information

Check the details of newly created master key and note down the *KeyArn* or if you already have a KMS key check correct key arn.

We will use the *KeyArn* for encrypting the secrets using the newly created key.

```
[slamba ◯  WHM0005395  terraform ] ☘   aws kms list-keys
{
    "Keys": [
        {
            "KeyArn": "arn:aws:kms:us-east-1:123213123223:key/1714de93-eb0b-4b87-b5b1-0cf30f063bf0",
            "KeyId": "1714de93-eb0b-4b87-b5b1-0cf30f063bf0"
        },
        {
            "KeyArn": "arn:aws:kms:us-east-1:123213123223:key/c156105b-c9a0-45ec-8777-07b2ebe419e9",
            "KeyId": "c156105b-c9a0-45ec-8777-07b2ebe419e9"
        }
    ]
}
```