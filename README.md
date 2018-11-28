# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project

## Usage

```hcl
module "gcp_project" {
  source  = "nephosolutions/gcp-project/google"
  version = "0.2.0"

  billing_account = "..."
  organisation_id = "..."
  project_name    = "..."
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| api\_services | list of Google APIs to activate on this project | list | `<list>` | no |
| billing\_account | the billing_account to which the project should be attached to | string | - | yes |
| default\_region | The region used by default to create new resources | string | `` | no |
| default\_zone | The zone within a region used by default to create new resources | string | `` | no |
| organisation\_id | the id of the organisation in which the project should be created | string | - | yes |
| project\_name | the name of the project | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| project\_id | the id of the project |
| project\_services | a list of enabled project services |