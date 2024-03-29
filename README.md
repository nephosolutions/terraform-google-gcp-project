# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project.
It ships the following submodules:

* [audit_config](modules/audit_config)
* [iam_bindings](modules/iam_bindings)
* [iam_memberships](modules/iam_memberships)
* [metadata](modules/metadata)
* [metadata_ssh_keys](modules/metadata/modules/metadata_ssh_keys)
* [project](modules/project)
* [project_services](modules/project_services)

## Usage

```hcl
module "gcp_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "~> 6.0.0"

  billing_account = "..."
  default_region  = "europe-west1"
  default_zone    = "europe-west1-b"
  labels          = {}
  org_id          = "..."
  project_name    = "My GCP Project"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.44.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_audit_config"></a> [audit\_config](#module\_audit\_config) | ./modules/audit_config | n/a |
| <a name="module_iam_memberships"></a> [iam\_memberships](#module\_iam\_memberships) | ./modules/iam_memberships | n/a |
| <a name="module_metadata"></a> [metadata](#module\_metadata) | ./modules/metadata | n/a |
| <a name="module_project"></a> [project](#module\_project) | ./modules/project | n/a |
| <a name="module_project_services"></a> [project\_services](#module\_project\_services) | ./modules/project_services | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_binding.basic_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [random_id.project_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the 'default' network automatically. | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | the billing\_account to which the project should be attached to | `string` | n/a | yes |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | The zone within a region used by default to create new resources | `string` | n/a | yes |
| <a name="input_disable_dependent_project_services"></a> [disable\_dependent\_project\_services](#input\_disable\_dependent\_project\_services) | If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it. | `bool` | `true` | no |
| <a name="input_disable_project_services_on_destroy"></a> [disable\_project\_services\_on\_destroy](#input\_disable\_project\_services\_on\_destroy) | Disable the service when the terraform resource is destroyed. | `bool` | `true` | no |
| <a name="input_editors"></a> [editors](#input\_editors) | Identities that will be granted the basic role `editor` on the project | `list(string)` | `[]` | no |
| <a name="input_enable_guest_attributes"></a> [enable\_guest\_attributes](#input\_enable\_guest\_attributes) | Enable setting [guest attributes](https://cloud.google.com/compute/docs/metadata/manage-guest-attributes) for the project. | `bool` | `false` | no |
| <a name="input_enable_os_config"></a> [enable\_os\_config](#input\_enable\_os\_config) | n/a | `bool` | `false` | no |
| <a name="input_enable_os_inventory"></a> [enable\_os\_inventory](#input\_enable\_os\_inventory) | Enables or disables [OS inventory](https://cloud.google.com/compute/docs/instances/view-os-details) for the project. | `bool` | `false` | no |
| <a name="input_enable_os_login"></a> [enable\_os\_login](#input\_enable\_os\_login) | Enables or disables SSH key management on the project. | `bool` | `false` | no |
| <a name="input_enable_os_login_2fa"></a> [enable\_os\_login\_2fa](#input\_enable\_os\_login\_2fa) | Enable 2-step verification for OS Login. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. | `string` | `null` | no |
| <a name="input_iam_audit_config"></a> [iam\_audit\_config](#input\_iam\_audit\_config) | Map of service APIs which will be enabled for audit logging, with a map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google\_folder\_iam\_audit\_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config) | <pre>map(map(object({<br>    exempted_members = list(string)<br>  })))</pre> | `{}` | no |
| <a name="input_iam_memberships"></a> [iam\_memberships](#input\_iam\_memberships) | Updates the IAM policy to grant a role to a list of members. | `map(list(string))` | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of key vale pairs to set as project labels | `map(string)` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The numeric ID of the organization this project belongs to. | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | Identities that will be granted the basic role `owner` on the project | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | A globally unique identifier for the project. Changing this forces a new project to be created. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The display name of the project. | `string` | n/a | yes |
| <a name="input_project_service_identities"></a> [project\_service\_identities](#input\_project\_service\_identities) | List of service identities to create for the project and grant IAM roles. | <pre>list(object({<br>    api   = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project_services"></a> [project\_services](#input\_project\_services) | A list of Google APIs to activate on this project | `list(string)` | `[]` | no |
| <a name="input_random_project_id"></a> [random\_project\_id](#input\_random\_project\_id) | Whether to use a random suffix for the `project_id`. Changing this forces a new project to be created. | `bool` | `true` | no |
| <a name="input_random_project_id_byte_length"></a> [random\_project\_id\_byte\_length](#input\_random\_project\_id\_byte\_length) | The number of random bytes to produce. The minimum value is 1, which produces eight bits of randomness. | `number` | `4` | no |
| <a name="input_skip_delete"></a> [skip\_delete](#input\_skip\_delete) | If true, the Terraform resource can be deleted without deleting the Project via the Google API. | `bool` | `false` | no |
| <a name="input_ssh_users"></a> [ssh\_users](#input\_ssh\_users) | A map of user:ssk\_key pairs | `map(string)` | `{}` | no |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Identities that will be granted the basic role `viewer` on the project | `list(string)` | `[]` | no |
| <a name="input_vm_dns_setting"></a> [vm\_dns\_setting](#input\_vm\_dns\_setting) | Enable zonal DNS and global DNS for the VMs in your project. | `string` | `"ZonalOnly"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The Google Cloud Platform project ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
