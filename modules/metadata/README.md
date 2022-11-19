# Google Compute Engine metadata Terraform module

This Terraform module manages Google Compute Engine metadata

## Usage

```hcl
module "metadata" {
  source  = "nephosolutions/gcp-project/google//modules/metadata"
  version = "~> 6.0.0"

  project_id = "my-project-id"

  enable_guest_attributes = "FALSE"
  enable_os_inventory     = "FALSE"
  enable_os_config        = "FALSE"
  enable_os_login         = "TRUE"
  enable_os_login_2fa     = "TRUE"

  google_compute_default_region = "europe-west1"
  google_compute_default_zone   = "europe-west1-b"

  vm_dns_setting = "ZonalOnly"
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_metadata_ssh_keys"></a> [metadata\_ssh\_keys](#module\_metadata\_ssh\_keys) | ./modules/metadata_ssh_keys | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_project_metadata_item.disable_legacy_endpoints](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.enable_guest_attributes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.enable_os_inventory](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.enable_osconfig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.enable_oslogin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.enable_oslogin_2fa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.google_compute_default_region](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.google_compute_default_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.ssh_keys](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_compute_project_metadata_item.vm_dns_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_guest_attributes"></a> [enable\_guest\_attributes](#input\_enable\_guest\_attributes) | Enable setting [guest attributes](https://cloud.google.com/compute/docs/metadata/manage-guest-attributes) for the project. | `bool` | `false` | no |
| <a name="input_enable_os_config"></a> [enable\_os\_config](#input\_enable\_os\_config) | n/a | `bool` | `false` | no |
| <a name="input_enable_os_inventory"></a> [enable\_os\_inventory](#input\_enable\_os\_inventory) | Enables or disables [OS inventory](https://cloud.google.com/compute/docs/instances/view-os-details) for the project. | `bool` | `false` | no |
| <a name="input_enable_os_login"></a> [enable\_os\_login](#input\_enable\_os\_login) | Enables or disables SSH key management on the project. | `bool` | `false` | no |
| <a name="input_enable_os_login_2fa"></a> [enable\_os\_login\_2fa](#input\_enable\_os\_login\_2fa) | Enable 2-step verification for OS Login. | `bool` | `false` | no |
| <a name="input_google_compute_default_region"></a> [google\_compute\_default\_region](#input\_google\_compute\_default\_region) | The region used by default to create new resources | `string` | n/a | yes |
| <a name="input_google_compute_default_zone"></a> [google\_compute\_default\_zone](#input\_google\_compute\_default\_zone) | The zone within a region used by default to create new resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google project ID for which you want to enable APIs | `string` | n/a | yes |
| <a name="input_ssh_users"></a> [ssh\_users](#input\_ssh\_users) | A map of user:ssk\_key pairs | `map(string)` | `{}` | no |
| <a name="input_vm_dns_setting"></a> [vm\_dns\_setting](#input\_vm\_dns\_setting) | Enable zonal DNS and global DNS for the VMs in your project. | `string` | `"ZonalOnly"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
