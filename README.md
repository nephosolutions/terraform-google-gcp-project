# Google Cloud Platform project Terraform module

This terraform module provisions a Google Cloud Platform project

## Usage

```hcl
module "gcp-project" {
  source  = "nephosolutions/gcp-project/google"
  version = "0.1.5"

  billing_account = "..."
  organisation_id = "..."
  project_name    = "..."
  region          = "..."
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| billing_account | the billing_account to which the project should be attached to | string | - | yes |
| organisation_id | the id of the organisation in which the project should be created | string | - | yes |
| project_name | the name of the project | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| project_id | the id of the project |
