# Google Cloud Platform project services Terraform module

This Terraform manages Google Cloud project service APIs.

## Usage

```hcl
module "project_services" {
  source  = "nephosolutions/gcp-project/google//modules//project_services"
  version = "~> 5.0.0"

  project_id = "..."
  project_services = [
    "...",
    "..."
  ]
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
| disable\_dependent\_services | If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it. | `bool` | `true` | no |
| disable\_on\_destroy | Disable the service when the terraform resource is destroyed. | `bool` | `true` | no |
| project\_id | The Google project ID for which you want to enable APIs | `any` | n/a | yes |
| project\_services | A list of Google APIs to activate on this project | `list(string)` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
