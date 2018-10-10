## Variable - KMS-Alias
variable "kms_alias" {
  description   = "AWS-KMS Alias Name"
  default       = "alias/sandeep-kms-mk"
}

## Variable - KMS-Description
variable "kms_description" {
  description   = "Sandeep-KMS-CMK"
  type          = "string"
  default       = "Sandeep-KMS-CMK"
}

## Variable - KMS-Deletion Window
variable "kms_deletion_window_in_days" {
  description = "The duration in days after which the key is deleted after destruction of the resource"
  type        = "string"
  default     = 30
}

## Variable - KMS-Key Policy
variable "kms_key_policy" {
  description = "The policy of the key usage"
  type        = "string"
  default     = ""
}

## Variable Secret-Key
variable "kms_name" {
  description   = "AWS-KMS Key Name"
  default       = "sandeep-kms-mk"
}



## Variable Account-ID
variable "account_id" {
}