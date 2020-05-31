# Google Compute Engine metadata Terraform module

This Terraform module manages Google Compute Engine metadata

## Usage

```hcl
module "metadata" {
  source  = "nephosolutions/gcp-project/google//modules//metadata"
  version = "~> 5.0.0"

  metadata = {
    foo = "foobar"
    bar = "foobar"
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
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| metadata | n/a | `map(string)` | n/a | yes |
| project\_id | The Google project ID for which you want to enable APIs | `any` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
