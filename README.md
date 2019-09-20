# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project

## Usage

```hcl
module "gcp_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "~> 3.0.0"

  billing_account = "..."
  organisation_id = "..."
  project_name    = "..."

  ssh_users = {
    foo = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLm..."
    bar = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLn..."
  }
}
```

__Attention:__ Enabled Google project API services won't get disabled, if removed from the configuration.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api\_services | list of Google APIs to activate on this project | list(string) | `[]` | no |
| auto\_create\_network | Create the 'default' network automatically. | string | `"true"` | no |
| billing\_account | the billing_account to which the project should be attached to | string | n/a | yes |
| default\_region | The region used by default to create new resources | string | `""` | no |
| default\_zone | The zone within a region used by default to create new resources | string | `""` | no |
| enable\_oslogin | Use Cloud OS Login API to manage OS login configuration for Google account users | string | `"false"` | no |
| folder\_id | The numeric ID of the folder this project should be created under. | string | `""` | no |
| org\_id | The numeric ID of the organization this project belongs to. | string | n/a | yes |
| project\_name | the name of the project | string | n/a | yes |
| skip\_delete | If true, the Terraform resource can be deleted without deleting the Project via the Google API. | string | `"false"` | no |
| ssh\_users | a map of user:ssk_key pairs | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | the id of the project |
| project\_services | a list of enabled project services |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
