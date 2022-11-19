# Google Compute Engine metadata SSH keys Terraform module

This Terraform module maps user:ssk\_key pairs to a string.

## Usage

```hcl
module "metadata_ssh_keys" {
  source  = "nephosolutions/gcp-project/google//modules/metadata/modules/metadata_ssh_keys"
  version = "~> 6.0.0"

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [template_file.mapping](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ssh_users"></a> [ssh\_users](#input\_ssh\_users) | a map of `user:ssk_key` pairs | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mapping"></a> [mapping](#output\_mapping) | string of user:ssh\_key pairs; one per line |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
