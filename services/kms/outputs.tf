locals {
  kms-id = "${aws_kms_key.mydemo-harbor-s3-kms.arn}"
}

output "kms-id" {
  value = "${local.kms-id}"
}

# Create output files
resource "local_file" "kms-id" {
  content  = "${local.kms-id}"
  filename = "./output-files/kms/kms-id.yaml"
}
