{
  "Version": "2012-10-17",
  "Id": "kms-key-policy",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "arn:aws:iam::12321312321321:user/sandeep.lamba.cli",
          "arn:aws:iam::12321312321321:user/sandeep.lamba.gui"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}