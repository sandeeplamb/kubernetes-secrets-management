output "kms_arn" {
  value = "${aws_iam_policy.kmsIAMKeyPolicy.arn}"
}

output "kms_key_arn" {
  value = "${aws_kms_key.kmsMK.arn}"
}