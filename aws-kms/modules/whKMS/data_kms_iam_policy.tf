data "aws_iam_policy_document" "kmsIAMPolicy" {
  statement {
    sid = "AllowUseOfTheKey"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]

    resources = ["${aws_kms_key.kmsMK.arn}"]
  }
}