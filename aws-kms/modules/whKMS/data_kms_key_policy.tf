data "template_file" "kms_key_policy" {
    template        = "${file("${path.root}/modules/whKMS/templates/kms_key_policy.json.tpl")}"

    vars {
    account_id      = "${var.account_id}"
  }

}