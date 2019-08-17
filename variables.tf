# Auth
variable "aws-region" {
  default = "us-east-2"
}

# ENV
variable "deployment-env" {
  default = "prod"
}

# S3
variable "bucket-name" {
  default = "s3-unique-name-used-for-harbor-install"
}

variable "bucket-description" {
  default = "Harbor Image Storage"
}

# KMS
variable "kms-description" {
  default = "Harbor Storage S3 Key"
}
