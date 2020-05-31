# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project.
It ships the following submodules:

* [metadata](modules/metadata)
* [metadata_ssh_keys](modules/metadata_ssh_keys)
* [project_services](modules/project_services)

## Usage

```hcl
module "gcp_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "~> 5.0.0"

  billing_account = "..."
  organisation_id = "..."
  project_name    = "..."

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
| google | >= 2.10 |
| random | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| google | >= 2.10 |
| random | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_network | Create the 'default' network automatically. | `bool` | `true` | no |
| billing\_account | the billing\_account to which the project should be attached to | `any` | n/a | yes |
| default\_region | The region used by default to create new resources | `any` | n/a | yes |
| default\_zone | The zone within a region used by default to create new resources | `any` | n/a | yes |
| enable\_oslogin | Use Cloud OS Login API to manage OS login configuration for Google account users | `bool` | `false` | no |
| folder\_id | The numeric ID of the folder this project should be created under. | `string` | `""` | no |
| iam\_bindings | Updates the IAM policy to grant a role to a list of members. Authoritative for a given role. Other roles within the IAM policy for the project are preserved. | `map(list(string))` | `{}` | no |
| org\_id | The numeric ID of the organization this project belongs to. | `any` | n/a | yes |
| project\_name | the name of the project | `any` | n/a | yes |
| project\_services | A list of Google APIs to activate on this project | `list(string)` | `[]` | no |
| skip\_delete | If true, the Terraform resource can be deleted without deleting the Project via the Google API. | `bool` | `false` | no |
| ssh\_users | a map of user:ssk\_key pairs | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | the id of the project |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
