# Locals
locals {
  kms-id = "${aws_kms_key.mydemo-harbor-s3-kms.arn}"
}

locals {
  kms-file = <<EOF
kms-id: ${local.kms-id}
EOF
}


# Outputs
output "kms-id" {
  value = "${local.kms-id}"
}

# Create output files
resource "local_file" "kms-id" {
  content  = "${local.kms-file}"
  filename = "./output-files/kms/kms.yaml"
}
