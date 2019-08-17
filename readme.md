## About
This repo is used in conjunction with the [Harbor Helm](https://github.com/engineertdog/helm-harbor) repo. This repository creates the KMS key for an S3 bucket that is used to store the Harbor images. Apply this Terraform config before trying to install the Harbor helm chart.

## Outputs
- outputfiles/kms/kms-id.yaml
    - Provides the KMS ARN required for the [Harbor Helm](https://github.com/engineertdog/helm-harbor) repo

## Setup
If you want to keep remote storage, then you will need to setup the `terraform` block in `main.tf` with details for an existing S3 bucket. You will need to set the path for the key (such as `mydemoapp/key`), and you will need to have a DynamoDB table setup. You can view an example configuration at the [Terraform Remote State](https://github.com/engineertdog/terraform-remote-state) repo.

Set the following values in `variables.tf`
- aws-region
- deployment-env
- bucket-name
- bucket-description
- kms-description

Lastly, you can change the name of the resources in `services/s3/s3.tf` and `services/kms/kms.tf`. Just make sure that you change the references to them as well. The only reference is in `services/kms/outputs.tf`, to the KMS resource.