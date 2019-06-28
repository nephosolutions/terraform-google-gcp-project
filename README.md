# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project

## Usage

```hcl
provider "google" {
  version = "~> 2.0"
}

provider "random" {
  version = "~> 2.0"
}

module "gcp_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "~> 1.1.0"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api\_services | list of Google APIs to activate on this project | list | `<list>` | no |
| billing\_account | the billing_account to which the project should be attached to | string | n/a | yes |
| default\_region | The region used by default to create new resources | string | `""` | no |
| default\_zone | The zone within a region used by default to create new resources | string | `""` | no |
| organisation\_id | the id of the organisation in which the project should be created | string | n/a | yes |
| project\_name | the name of the project | string | n/a | yes |
| ssh\_users | a map of user:ssk_key pairs | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | the id of the project |
| project\_services | a list of enabled project services |
