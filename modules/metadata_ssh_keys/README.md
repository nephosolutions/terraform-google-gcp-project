# Google Compute Engine metadata SSH keys Terraform module

This Terraform module maps user:ssk\_key pairs to a string.

## Usage

```hcl
module "metadata_ssh_keys" {
  source  = "nephosolutions/gcp-project/google//modules//metadata_ssh_keys"
  version = "~> 5.0.0"

  ssh_users = {
    foo = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLm..."
    bar = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLn..."
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |

## Providers

| Name | Version |
|------|---------|
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ssh\_users | a map of `user:ssk_key` pairs | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| mapping | string of user:ssh\_key pairs; one per line |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
