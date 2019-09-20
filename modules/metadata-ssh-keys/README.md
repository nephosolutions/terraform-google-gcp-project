# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Storage bucket. The real bucket name is suffixed with the google project_id.

## Usage

```hcl
module "metadata_ssh_keys" {
  source  = "nephosolutions/gcp-project/google//modules//metadata-ssh-keys"
  version = "~> 1.1.0"

  ssh_users = {
    foo = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLm..."
    bar = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLn..."
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ssh\_users | a map of user:ssk_key pairs | map(string) | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mapping | string of user:ssh_key pairs; one per line |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
