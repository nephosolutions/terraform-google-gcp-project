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
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.90 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.44.1 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.44.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_project_service_identity.project_service_identities](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_project_service_identity) | resource |
| [google_project_iam_member.project_service_identity_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.project_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_compute_default_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it. | `bool` | `true` | no |
| <a name="input_disable_on_destroy"></a> [disable\_on\_destroy](#input\_disable\_on\_destroy) | Disable the service when the terraform resource is destroyed. | `bool` | `true` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google project ID for which you want to enable APIs | `string` | n/a | yes |
| <a name="input_project_service_identities"></a> [project\_service\_identities](#input\_project\_service\_identities) | List of service identities to create for the project and grant IAM roles. | <pre>list(object({<br>    api   = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project_services"></a> [project\_services](#input\_project\_services) | A list of Google APIs to activate on this project | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
