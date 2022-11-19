# Google Cloud Platform project services Terraform module

This Terraform manages Google Cloud project service APIs.

## Usage

```hcl
module "project_services" {
  source  = "nephosolutions/gcp-project/google//modules/project_services"
  version = "~> 6.0.0"

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_service.managed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it. | `bool` | `true` | no |
| <a name="input_disable_on_destroy"></a> [disable\_on\_destroy](#input\_disable\_on\_destroy) | Disable the service when the terraform resource is destroyed. | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google project ID for which you want to enable APIs | `string` | n/a | yes |
| <a name="input_project_services"></a> [project\_services](#input\_project\_services) | A list of Google APIs to activate on this project | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
