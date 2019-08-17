# Auth Provider
provider "aws" {
  profile = "default"
  region  = "${var.aws-region}"
}

# KMS
module "kms" {
  source          = "./services/kms"
  kms-description = "${var.kms-description}"
}

# S3 Module
module "s3" {
  source             = "./services/s3/"
  aws-region         = "${var.aws-region}"
  deployment-env     = "${var.deployment-env}"
  bucket-name        = "${var.bucket-name}"
  bucket-description = "${var.bucket-description}"
  kms-id             = "${module.kms.kms-id}"
}

# Terraform
terraform {
  backend "s3" {
    region         = "us-east-2"
    encrypt        = true
    bucket         = "bucket-for-remote-state-storage"
    key            = "key-for-remote-state-storage"
    dynamodb_table = "dynamodb-for-remote-state-lock"
  }
}
