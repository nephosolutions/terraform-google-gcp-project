# Google Cloud Platform project services Terraform module

This Terraform provisions a Google Cloud project.

## Usage

```hcl
module "project_services" {
  source  = "nephosolutions/gcp-project/google//modules/project"
  version = "~> 6.0.0"

  billing_account     = "..."
  org_id              = "..."
  project_labels      = {}
  project_name        = "..."
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.44.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.in_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project.top_level](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [random_id.project](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_pet.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the 'default' network automatically. | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | the billing\_account to which the project should be attached to | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. | `string` | `null` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the organization this project belongs to. | `string` | n/a | yes |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Map of key vale pairs to set as project labels | `map(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | the name of the project | `string` | n/a | yes |
| <a name="input_skip_delete"></a> [skip\_delete](#input\_skip\_delete) | If true, the Terraform resource can be deleted without deleting the Project via the Google API. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_number"></a> [number](#output\_number) | The numeric identifier of the project. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The Google Cloud Platform project ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
