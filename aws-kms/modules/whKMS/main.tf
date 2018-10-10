############################################################################
######## AWS-Provider-and-Module-Definition-Only-Below-This ################
############################################################################

### 01.Create the AWS KMS
resource "aws_kms_key" "kmsMK" {
    description             = "${var.kms_description}"
    deletion_window_in_days = "${var.kms_deletion_window_in_days}"
    policy                  = "${data.template_file.kms_key_policy.rendered}"
    is_enabled              = true
    enable_key_rotation     = true

    tags {
        Name                = "Sandeep-kms-MK"
        Created_By          = "Sandeep"
        ManagedBy           = "Terraform"
    }
}

### 02.Create the AWS-KMS Alias
resource "aws_kms_alias" "kmsMK" {
    name                    = "${var.kms_alias}"
    target_key_id           = "${aws_kms_key.kmsMK.key_id}"
}

### 03.Create the AWS-KMS IAM Policy
resource "aws_iam_policy" "kmsIAMKeyPolicy" {
  name        = "kmsiam_key_policy"
  path        = "/"
  description = ""
  policy      = "${data.aws_iam_policy_document.kmsIAMPolicy.json}"
}


############################################################################
####################### End ################################################